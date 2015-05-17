# AuroraTree
For creating tech trees for the game Aurora 4X

# Usage
First either convert from the access database (SteveFire,mdb included with the game) to a mysql database, or import the database dump provided.
You can convert with mdbtools using mdbconvert.sh provided (from https://stackoverflow.com/a/25222407/469653), and edit to only do the tables you need (ResearchField, TechSystem, and TechType), or just pipe the provided sql file into a database.

Make sure both mdbconvert.sh and tree.pl have the correct database settings (name, username, password)

Once your database is up, run: 
perl tree.pl

to create the .dot file. Then using the graphviz package, you can create your trees using whatever method you prefer.
The usual form:
dot -Tpng -o graph.png graph.dot

Can replace "dot" with neato, circo, twopi, or sfdp for different styles of tree, but will lose some functionality (like colored groups)
Can also replace -Tpng with -Tjpg or -Tpdf for other output formats.

If you want to not include the trans-newtonian tech link (for cleanliness), you can change the flag at the top of the tree.pl file to be $dropNewton=1; instead of 0. 

A more complicated example:
circo -Goverlap=compress -Gsplines="curved" -Gscale=0.03 -Tjpg -o examples/circo.jpg graph.dot

For a full list of graph/style options, see: www.graphviz.org/doc/info/attrs.html
