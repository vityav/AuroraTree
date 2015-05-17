#!/usr/bin/perl

use strict;
use DBI;

my $SQLUser="root";
my $SQLPass="pass";
my $dropNewton=0; #Drop trans-newtonian link for space?

my $dbh = DBI->connect(
  "dbi:mysql:dbname=stevefire",
  $SQLUser,
  $SQLPass,
  { RaiseError => 1 },
 ) or die $DBI::errstr;

my $sth = $dbh->prepare( "SELECT ResearchFieldID,FieldName from ResearchField;");
$sth->execute();


my %HoA ={};
my @colors=("blue","red","green","chocolate","turquoise","plum","indigo","firebrick");
my @fields=();
my $dotfile="graph.dot";
open(DOT,">$dotfile");
print DOT "strict digraph G {\n
nodesep=0.01; \n
overlap=scale; \n
rankdir=LR;\n
node [shape=record,width=.1,height=.1];\n";

#Populate HoA
for (my $rfid=1; $rfid<=$sth->rows(); $rfid++){

my($ignore,$fieldname)=$sth->fetchrow();
$fields[$rfid-1]=$fieldname;

my $sth2 = $dbh->prepare( "select ts.TechSystemID, ts.Name, ts.Prerequisite1, ts.Prerequisite2, ts.TechTypeID, tt.FieldID, rf.FieldName from TechSystem ts join TechType tt on ts.TechTypeID=tt.TechTypeID join ResearchField rf on tt.FieldID=rf.ResearchFieldID where tt.FieldID=$rfid;");
$sth2->execute();

for(my $i=0;$i<$sth2->rows();$i++){
 my ($id, $name, $req1, $req2, $tsttid, $ttfid,$rfname ) = $sth2->fetchrow();
 $HoA{$id} = [$name, $req1, $req2, $ttfid];
}

}

for (my $rfid=1; $rfid<=$sth->rows(); $rfid++){
print DOT "subgraph cluster_$rfid {\n
color=$colors[$rfid-1]; \n
style=filled;\n
rank=same;\n
label=<<b>\"$fields[$rfid-1]\"</b>>;\n
fontsize=30;\n
node [style=filled,color=white];\n";


my $reqid=0;
for my $value (keys %HoA){
 if($HoA{$value}[3]==$rfid){
 if($HoA{$value}[1]>0)
 {
  print DOT "\"$HoA{$HoA{$value}[1]}[0]\" -> \"$HoA{$value}[0]\";\n";
 }
 if($HoA{$value}[2]>0)
 {
  print DOT "\"$HoA{$HoA{$value}[2]}[0]\" -> \"$HoA{$value}[0]\" ;\n";
 }
}
}
print DOT "}\n";
}

print DOT "}\n";
close(DOT);

if($dropNewton){
`sed -i '/Newtonian/d' $dotfile`;
}

