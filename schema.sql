-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

-- That file uses encoding UTF-8

CREATE TABLE `AlienClass`
 (
	`AlienClassID`			int, 
	`AlienRaceID`			int, 
	`ActualClassID`			int, 
	`ViewRaceID`			int, 
	`ClassName`			varchar (100), 
	`TCS`			int, 
	`ThermalSignature`			float, 
	`ShieldStrength`			int, 
	`ShieldRecharge`			float, 
	`ArmourStrength`			int, 
	`MaxSpeed`			int, 
	`JumpDistance`			int, 
	`ECMStrength`			int, 
	`Notes`			varchar (510), 
	`ShipCount`			int, 
	`FirstDetected`			float, 
	`AverageDamage`			int
);

-- CREATE INDEXES ...
ALTER TABLE `AlienClass` ADD INDEX `AlienClass_ActualClassID_idx` (`ActualClassID`);
ALTER TABLE `AlienClass` ADD UNIQUE INDEX `AlienClass_AlienClassID_idx` (`AlienClassID`);
ALTER TABLE `AlienClass` ADD INDEX `AlienClass_AlienRaceID_idx` (`AlienRaceID`);
ALTER TABLE `AlienClass` ADD PRIMARY KEY (`AlienClassID`);
ALTER TABLE `AlienClass` ADD INDEX `AlienClass_ViewRaceID_idx` (`ViewRaceID`);

CREATE TABLE `AlienClassSensor`
 (
	`AlienClassWeapon`			int, 
	`GameID`			int, 
	`AlienClassID`			int, 
	`Strength`			float, 
	`Resolution`			float
);

-- CREATE INDEXES ...
ALTER TABLE `AlienClassSensor` ADD INDEX `AlienClassSensor_AlienClassID_idx` (`AlienClassID`);
ALTER TABLE `AlienClassSensor` ADD INDEX `AlienClassSensor_GameID_idx` (`GameID`);
ALTER TABLE `AlienClassSensor` ADD PRIMARY KEY (`AlienClassWeapon`);

CREATE TABLE `AlienClassSummary`
 (
	`ShipClassID`			int, 
	`ViewRaceID`			int, 
	`Summary`			text (255)
);

-- CREATE INDEXES ...
ALTER TABLE `AlienClassSummary` ADD INDEX `AlienClassSummary_ClassID_idx` (`ShipClassID`);
ALTER TABLE `AlienClassSummary` ADD PRIMARY KEY (`ShipClassID`, `ViewRaceID`);
ALTER TABLE `AlienClassSummary` ADD INDEX `AlienClassSummary_ViewRaceID_idx` (`ViewRaceID`);

CREATE TABLE `AlienClassWeapon`
 (
	`AlienClassWeapon`			int, 
	`GameID`			int, 
	`AlienClassID`			int, 
	`WeaponComponentID`			int, 
	`Amount`			int, 
	`Range`			float, 
	`RangeModifier`			int, 
	`Power`			int, 
	`RateFire`			int
);

-- CREATE INDEXES ...
ALTER TABLE `AlienClassWeapon` ADD INDEX `AlienClassWeapon_AlienClassID_idx` (`AlienClassID`);
ALTER TABLE `AlienClassWeapon` ADD INDEX `AlienClassWeapon_GameID_idx` (`GameID`);
ALTER TABLE `AlienClassWeapon` ADD PRIMARY KEY (`AlienClassWeapon`);

CREATE TABLE `AlienRace`
 (
	`AlienRaceID`			int, 
	`ViewRaceID`			int, 
	`GameID`			int, 
	`AlienRaceName`			varchar (100), 
	`FixedRelationship`			int, 
	`ClassThemeID`			int, 
	`FirstDetected`			float, 
	`ContactStatus`			int, 
	`Abbrev`			varchar (10), 
	`CommStatus`			int, 
	`CommModifier`			int, 
	`CommEstablished`			float, 
	`PoliticalModifier`			float, 
	`TradeTreaty`			char NOT NULL, 
	`TechTreaty`			char NOT NULL, 
	`GeoTreaty`			char NOT NULL, 
	`GravTreaty`			char NOT NULL, 
	`RealClassNames`			int
);

-- CREATE INDEXES ...
ALTER TABLE `AlienRace` ADD INDEX `AlienRace_AlienRaceID_idx` (`AlienRaceID`);
ALTER TABLE `AlienRace` ADD INDEX `AlienRace_EmpireID_idx` (`ViewRaceID`);
ALTER TABLE `AlienRace` ADD UNIQUE INDEX `AlienRace_GameID_idx` (`GameID`);
ALTER TABLE `AlienRace` ADD PRIMARY KEY (`AlienRaceID`, `ViewRaceID`);

CREATE TABLE `AlienRaceSpecies`
 (
	`AlienRaceSpeciesID`			int, 
	`AlienRaceID`			int, 
	`SpeciesID`			int, 
	`DetectRaceID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `AlienRaceSpecies` ADD UNIQUE INDEX `AlienRaceSpecies_AlienRaceID_idx` (`AlienRaceID`);
ALTER TABLE `AlienRaceSpecies` ADD UNIQUE INDEX `AlienRaceSpecies_AlienRaceSpeciesID_idx` (`AlienRaceSpeciesID`);
ALTER TABLE `AlienRaceSpecies` ADD UNIQUE INDEX `AlienRaceSpecies_DetectRaceID_idx` (`DetectRaceID`);
ALTER TABLE `AlienRaceSpecies` ADD UNIQUE INDEX `AlienRaceSpecies_KnownSpeciesID_idx` (`SpeciesID`);
ALTER TABLE `AlienRaceSpecies` ADD PRIMARY KEY (`AlienRaceSpeciesID`);

CREATE TABLE `AlienShip`
 (
	`AlienShipID`			int, 
	`ViewRaceID`			int, 
	`ShipID`			int, 
	`AlienClassID`			int, 
	`Name`			varchar (100), 
	`Speed`			int, 
	`LastX`			float, 
	`LastY`			float, 
	`LastSysID`			int, 
	`LastContactTime`			float, 
	`FirstDetected`			float, 
	`Destroyed`			char NOT NULL, 
	`DamageTaken`			int, 
	`GameTimeDamaged`			float
);

-- CREATE INDEXES ...
ALTER TABLE `AlienShip` ADD INDEX `AlienShip_AlienClassID_idx` (`AlienClassID`);
ALTER TABLE `AlienShip` ADD INDEX `AlienShip_AlienShipID_idx` (`AlienShipID`);
ALTER TABLE `AlienShip` ADD INDEX `AlienShip_LastSysID_idx` (`LastSysID`);
ALTER TABLE `AlienShip` ADD PRIMARY KEY (`AlienShipID`);
ALTER TABLE `AlienShip` ADD INDEX `AlienShip_ShipID_idx` (`ShipID`);
ALTER TABLE `AlienShip` ADD INDEX `AlienShip_ViewRaceID_idx` (`ViewRaceID`);

CREATE TABLE `AlienSystem`
 (
	`AlienSystemID`			int, 
	`SystemID`			int, 
	`AlienRaceID`			int, 
	`DetectRaceID`			int, 
	`GameID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `AlienSystem` ADD UNIQUE INDEX `AlienSystem_AlienRaceID_idx` (`AlienRaceID`);
ALTER TABLE `AlienSystem` ADD INDEX `AlienSystem_AlienSystemID_idx` (`AlienSystemID`);
ALTER TABLE `AlienSystem` ADD UNIQUE INDEX `AlienSystem_DetectRaceID_idx` (`DetectRaceID`);
ALTER TABLE `AlienSystem` ADD UNIQUE INDEX `AlienSystem_GameID_idx` (`GameID`);
ALTER TABLE `AlienSystem` ADD PRIMARY KEY (`AlienSystemID`);
ALTER TABLE `AlienSystem` ADD INDEX `AlienSystem_SystemID_idx` (`SystemID`);

CREATE TABLE `Anomalies`
 (
	`AnomalyID`			int, 
	`SystemBodyID`			int, 
	`AnomalyTypeID`			int, 
	`ResearchField`			int, 
	`ResearchBonus`			float, 
	`Description`			varchar (510)
);

-- CREATE INDEXES ...
ALTER TABLE `Anomalies` ADD INDEX `Anomalies_AnomalyID_idx` (`AnomalyID`);
ALTER TABLE `Anomalies` ADD INDEX `Anomalies_AnomalyTypeID_idx` (`AnomalyTypeID`);
ALTER TABLE `Anomalies` ADD PRIMARY KEY (`AnomalyID`);
ALTER TABLE `Anomalies` ADD INDEX `Anomalies_SystemBodyID_idx` (`SystemBodyID`);

CREATE TABLE `App`
 (
	`Use1024`			char NOT NULL, 
	`SoundOn`			char NOT NULL, 
	`Reduced`			char NOT NULL, 
	`MusicOn`			char NOT NULL, 
	`NoZeroStatus`			int, 
	`BattleColour`			int, 
	`AWRColour`			int, 
	`ModColour`			int, 
	`AllSensors`			char NOT NULL, 
	`MinSupply`			int, 
	`OxygenChance`			int, 
	`DisableF9ShowMin`			int
);

-- CREATE INDEXES ...

CREATE TABLE `ArmourDamage`
 (
	`ShipID`			int, 
	`ArmourColumn`			int, 
	`Damage`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ArmourDamage` ADD PRIMARY KEY (`ShipID`, `ArmourColumn`);
ALTER TABLE `ArmourDamage` ADD INDEX `ArmourDamage_ShipID_idx` (`ShipID`);

CREATE TABLE `AssignmentTypeFilter`
 (
	`AssignmentTypeID`			int, 
	`LeaderType`			int, 
	`Description`			varchar (100), 
	`DisplayOrder`			int, 
	`Ship`			char NOT NULL, 
	`Team`			char NOT NULL, 
	`Population`			char NOT NULL, 
	`Sector`			char NOT NULL, 
	`Ground`			char NOT NULL, 
	`Staff`			char NOT NULL, 
	`Fighter`			char NOT NULL, 
	`Armed`			char NOT NULL, 
	`Freighters`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `AssignmentTypeFilter` ADD INDEX `AssignmentTypeFilter_AssignmentTypeID_idx` (`AssignmentTypeID`);
ALTER TABLE `AssignmentTypeFilter` ADD PRIMARY KEY (`AssignmentTypeID`);

CREATE TABLE `BannedBodies`
 (
	`BannedBodyID`			int, 
	`EmpireID`			int, 
	`SystemID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `BannedBodies` ADD INDEX `BannedBodies_BannedBodyID_idx` (`BannedBodyID`);
ALTER TABLE `BannedBodies` ADD INDEX `BannedBodies_EmpireID_idx` (`EmpireID`);
ALTER TABLE `BannedBodies` ADD PRIMARY KEY (`BannedBodyID`, `EmpireID`);
ALTER TABLE `BannedBodies` ADD INDEX `BannedBodies_SystemID_idx` (`SystemID`);

CREATE TABLE `BannedSystems`
 (
	`BannedSystemID`			int, 
	`EmpireID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `BannedSystems` ADD INDEX `BannedSystems_BannedSystemID_idx` (`BannedSystemID`);
ALTER TABLE `BannedSystems` ADD INDEX `BannedSystems_EmpireID_idx` (`EmpireID`);
ALTER TABLE `BannedSystems` ADD PRIMARY KEY (`BannedSystemID`, `EmpireID`);

CREATE TABLE `CargoType`
 (
	`CargoTypeID`			int, 
	`LoadActionID`			int, 
	`UnloadActionID`			int, 
	`Description`			varchar (100), 
	`CargoPoints`			int, 
	`StoredTable`			varchar (100), 
	`StoredField`			varchar (100), 
	`StoredID`			varchar (100), 
	`InstallationID`			int, 
	`Mineral`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `CargoType` ADD INDEX `CargoType_CargoTypeID_idx` (`CargoTypeID`);
ALTER TABLE `CargoType` ADD INDEX `CargoType_LoadActionID_idx` (`UnloadActionID`);
ALTER TABLE `CargoType` ADD INDEX `CargoType_MoveActionID_idx` (`LoadActionID`);
ALTER TABLE `CargoType` ADD PRIMARY KEY (`CargoTypeID`);

CREATE TABLE `CIWSFired`
 (
	`ShipID`			int, 
	`ComponentID`			int, 
	`Fired`			int, 
	`GameID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `CIWSFired` ADD UNIQUE INDEX `CIWSFired_ComponentID_idx` (`ComponentID`);
ALTER TABLE `CIWSFired` ADD UNIQUE INDEX `CIWSFired_GameID_idx` (`GameID`);
ALTER TABLE `CIWSFired` ADD PRIMARY KEY (`ShipID`, `ComponentID`);
ALTER TABLE `CIWSFired` ADD UNIQUE INDEX `CIWSFired_ShipID_idx` (`ShipID`);

CREATE TABLE `ClassComponent`
 (
	`ClassComponentID`			int, 
	`ClassID`			int, 
	`ComponentID`			int, 
	`NumComponent`			float, 
	`ChanceToHit`			int, 
	`ElectronicCTH`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ClassComponent` ADD INDEX `ClassComponent_ClassComponentID_idx` (`ClassComponentID`);
ALTER TABLE `ClassComponent` ADD INDEX `ClassComponent_ClassID_idx` (`ClassID`);
ALTER TABLE `ClassComponent` ADD INDEX `ClassComponent_ComponentID_idx` (`ComponentID`);
ALTER TABLE `ClassComponent` ADD INDEX `ClassComponent_NumComponent_idx` (`NumComponent`);
ALTER TABLE `ClassComponent` ADD PRIMARY KEY (`ClassComponentID`);

CREATE TABLE `ClassMaterials`
 (
	`ClassMaterials`			int, 
	`ClassID`			int, 
	`MaterialID`			int, 
	`Amount`			float
);

-- CREATE INDEXES ...
ALTER TABLE `ClassMaterials` ADD INDEX `ClassMaterials_ClassID_idx` (`ClassID`);
ALTER TABLE `ClassMaterials` ADD UNIQUE INDEX `ClassMaterials_MaterialID_idx` (`MaterialID`);
ALTER TABLE `ClassMaterials` ADD PRIMARY KEY (`ClassMaterials`);

CREATE TABLE `ClassOrdnance`
 (
	`ClassOrdnanceID`			int, 
	`ShipClassID`			int, 
	`MissileID`			int, 
	`Amount`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ClassOrdnance` ADD INDEX `ClassOrdnance_ClassOrdnanceID_idx` (`ClassOrdnanceID`);
ALTER TABLE `ClassOrdnance` ADD UNIQUE INDEX `ClassOrdnance_Number_idx` (`Amount`);
ALTER TABLE `ClassOrdnance` ADD INDEX `ClassOrdnance_OrdnanceID1_idx` (`MissileID`);
ALTER TABLE `ClassOrdnance` ADD PRIMARY KEY (`ClassOrdnanceID`);
ALTER TABLE `ClassOrdnance` ADD INDEX `ClassOrdnance_ShipClassID_idx` (`ShipClassID`);

CREATE TABLE `CmdrTraits`
 (
	`CmdrID`			int, 
	`TraitID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `CmdrTraits` ADD INDEX `CmdrTraits_CmdrID_idx` (`CmdrID`);
ALTER TABLE `CmdrTraits` ADD PRIMARY KEY (`CmdrID`, `TraitID`);
ALTER TABLE `CmdrTraits` ADD INDEX `CmdrTraits_TraitID_idx` (`TraitID`);

CREATE TABLE `CombatText`
 (
	`CombatFileID`			int, 
	`RaceID`			int, 
	`CombatText`			int
);

-- CREATE INDEXES ...
ALTER TABLE `CombatText` ADD INDEX `CombatText_CombatFileID_idx` (`CombatFileID`);
ALTER TABLE `CombatText` ADD PRIMARY KEY (`CombatFileID`);
ALTER TABLE `CombatText` ADD INDEX `CombatText_RaceID_idx` (`RaceID`);

CREATE TABLE `Commander`
 (
	`CommanderID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`SpeciesID`			int, 
	`Name`			varchar (100), 
	`ResearchBonus`			float, 
	`ResSpecID`			int, 
	`AdminRating`			int, 
	`CommanderType`			int, 
	`RoyaltyID`			int, 
	`Title`			varchar (60), 
	`RankID`			int, 
	`PromotionScore`			int, 
	`PopPromotionScore`			int, 
	`GameTimePromoted`			float, 
	`GameTimeAssigned`			float, 
	`DoNotRelieve`			int, 
	`CommandType`			int, 
	`CommandID`			int, 
	`StaffPosition`			int, 
	`PlanetaryLocationID`			int, 
	`TransportShipID`			int, 
	`TeamID`			int, 
	`PickupAvailable`			int, 
	`Seniority`			int, 
	`Retired`			char NOT NULL, 
	`FreezeRank`			char NOT NULL, 
	`LifepodID`			int, 
	`Orders`			text (255), 
	`Notes`			text (255), 
	`HomeworldID`			int, 
	`InitiativeBonus`			int, 
	`Trainingbonus`			int, 
	`Education`			varchar (100), 
	`POWRaceID`			int, 
	`CareerStart`			float, 
	`PoliticalBonus`			float, 
	`SurveyBonus`			float, 
	`ShipbuildingBonus`			float, 
	`FighterCombatBonus`			float, 
	`FactoryProductionBonus`			float, 
	`WealthCreationBonus`			float, 
	`MiningBonus`			float, 
	`DeckCrewBonus`			float, 
	`PopGrowthBonus`			float, 
	`TerraBonus`			float, 
	`GroundCombatBonus`			float, 
	`GUTrainSpeedBonus`			float, 
	`MoraleBonus`			float, 
	`XenoBonus`			float, 
	`DiplomacyBonus`			float, 
	`OperationsBonus`			float, 
	`CommunicationsBonus`			float, 
	`IntelligenceBonus`			float, 
	`LogisticsBonus`			float, 
	`SpyBonus`			float, 
	`Deceased`			char NOT NULL, 
	`Loyalty`			int, 
	`HealthRisk`			int, 
	`Female`			char NOT NULL, 
	`KillTonnageCommercial`			int, 
	`KillTonnageMilitary`			int
);

-- CREATE INDEXES ...
ALTER TABLE `Commander` ADD INDEX `Commander_CommanderID_idx` (`CommanderID`);
ALTER TABLE `Commander` ADD INDEX `Commander_GameID_idx` (`GameID`);
ALTER TABLE `Commander` ADD INDEX `Commander_HomeworldID_idx` (`HomeworldID`);
ALTER TABLE `Commander` ADD INDEX `Commander_LifePodID_idx` (`LifepodID`);
ALTER TABLE `Commander` ADD UNIQUE INDEX `Commander_POWRaceID_idx` (`POWRaceID`);
ALTER TABLE `Commander` ADD PRIMARY KEY (`CommanderID`);
ALTER TABLE `Commander` ADD INDEX `Commander_RaceID_idx` (`RaceID`);
ALTER TABLE `Commander` ADD INDEX `Commander_RankID_idx` (`RankID`);
ALTER TABLE `Commander` ADD INDEX `Commander_SpeciesID_idx` (`SpeciesID`);
ALTER TABLE `Commander` ADD INDEX `Commander_TransportShipID_idx` (`TransportShipID`);

CREATE TABLE `CommanderBonus`
 (
	`BonusID`			int, 
	`Description`			varchar (100), 
	`FieldName`			varchar (100), 
	`Percentage`			char NOT NULL, 
	`Naval`			char NOT NULL, 
	`Ground`			char NOT NULL, 
	`Civilian`			char NOT NULL, 
	`Scientist`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `CommanderBonus` ADD INDEX `CommanderBonus_ID_idx` (`BonusID`);

CREATE TABLE `CommanderHistory`
 (
	`CmdrHistoryID`			int, 
	`CommanderID`			int, 
	`HistoryText`			varchar (510), 
	`GameTime`			float
);

-- CREATE INDEXES ...
ALTER TABLE `CommanderHistory` ADD UNIQUE INDEX `CommanderHistory_CmdrHistoryID_idx` (`CmdrHistoryID`);
ALTER TABLE `CommanderHistory` ADD INDEX `CommanderHistory_CommanderID_idx` (`CommanderID`);
ALTER TABLE `CommanderHistory` ADD PRIMARY KEY (`CmdrHistoryID`);

CREATE TABLE `CompanyNames`
 (
	`ID`			int, 
	`CompanySuffix`			varchar (510), 
	`CompanyType`			int
);

-- CREATE INDEXES ...
ALTER TABLE `CompanyNames` ADD PRIMARY KEY (`ID`);

CREATE TABLE `ComponentType`
 (
	`ComponentTypeID`			int, 
	`TypeDescription`			varchar (100), 
	`EmptySpaceModifier`			float, 
	`RatingDescription`			varchar (100), 
	`ClassDisplayOrder`			int, 
	`ClassDisplayType`			int, 
	`RepairPriority`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ComponentType` ADD INDEX `ComponentType_ComponentRatingID_idx` (`ComponentTypeID`);
ALTER TABLE `ComponentType` ADD PRIMARY KEY (`ComponentTypeID`);

CREATE TABLE `Composition`
 (
	`CompositionID`			int, 
	`Description`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `Composition` ADD INDEX `Composition_BodyCompositionID_idx` (`CompositionID`);
ALTER TABLE `Composition` ADD PRIMARY KEY (`CompositionID`);

CREATE TABLE `Condition`
 (
	`ConditionID`			int, 
	`Description`			varchar (100), 
	`DisplayOrder`			int
);

-- CREATE INDEXES ...
ALTER TABLE `Condition` ADD INDEX `Condition_ConditionID_idx` (`ConditionID`);
ALTER TABLE `Condition` ADD PRIMARY KEY (`ConditionID`);

CREATE TABLE `ConditionalOrders`
 (
	`SpecialOrderID`			int, 
	`Description`			varchar (100), 
	`DisplayOrder`			int, 
	`MoveActionID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ConditionalOrders` ADD INDEX `ConditionalOrders_MoveActionID_idx` (`MoveActionID`);
ALTER TABLE `ConditionalOrders` ADD PRIMARY KEY (`SpecialOrderID`);
ALTER TABLE `ConditionalOrders` ADD INDEX `ConditionalOrders_SpecialOrderID_idx` (`SpecialOrderID`);

CREATE TABLE `CurrentDesigns`
 (
	`EmpireID`			int, 
	`SmallFreighterID`			int, 
	`LargeFreighterID`			int, 
	`SmallColonyID`			int, 
	`LargeColonyID`			int, 
	`GeosurveyID`			int, 
	`GravsurveyID`			int, 
	`TerraformerID`			int, 
	`SalvagerID`			int, 
	`JGCSID`			int, 
	`CombatTransportID`			int, 
	`HarvesterID`			int, 
	`BeamDDID`			int, 
	`BeamJDDID`			int, 
	`BeamCAID`			int, 
	`BeamJCAID`			int, 
	`BeamBCID`			int, 
	`BeamJBCID`			int, 
	`BeamDEID`			int, 
	`BeamJDEID`			int, 
	`BeamCLEID`			int, 
	`BeamJCLEID`			int, 
	`MissileDDID`			int, 
	`MissileJDDID`			int, 
	`MissileCAID`			int, 
	`MissileJCAID`			int, 
	`MissileBCID`			int, 
	`MissileJBCID`			int, 
	`MissileDEID`			int, 
	`MissileJDEID`			int, 
	`MissileCLEID`			int, 
	`MissileJCLEID`			int, 
	`ScoutID`			int, 
	`FastAttackID`			int, 
	`AntiFACDD`			int, 
	`AntiFACDDJump`			int, 
	`AntiFighterDD`			int, 
	`AntiFighterDDJump`			int, 
	`BeamDefenceBaseID`			int, 
	`MissileDefenceBaseID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `CurrentDesigns` ADD UNIQUE INDEX `CurrentDesigns_BeamDefenceBaseID_idx` (`BeamDefenceBaseID`);
ALTER TABLE `CurrentDesigns` ADD UNIQUE INDEX `CurrentDesigns_EmpireID_idx` (`EmpireID`);
ALTER TABLE `CurrentDesigns` ADD UNIQUE INDEX `CurrentDesigns_FAstAttackID_idx` (`FastAttackID`);
ALTER TABLE `CurrentDesigns` ADD UNIQUE INDEX `CurrentDesigns_MissileDefenceBaseID_idx` (`MissileDefenceBaseID`);
ALTER TABLE `CurrentDesigns` ADD PRIMARY KEY (`EmpireID`);
ALTER TABLE `CurrentDesigns` ADD UNIQUE INDEX `CurrentDesigns_SalvagerID_idx` (`SalvagerID`);

CREATE TABLE `DamagedComponent`
 (
	`ShipID`			int, 
	`ComponentID`			int, 
	`Number`			int
);

-- CREATE INDEXES ...
ALTER TABLE `DamagedComponent` ADD INDEX `DamagedComponent_ComponentID_idx` (`ComponentID`);
ALTER TABLE `DamagedComponent` ADD UNIQUE INDEX `DamagedComponent_Number_idx` (`Number`);
ALTER TABLE `DamagedComponent` ADD PRIMARY KEY (`ShipID`, `ComponentID`);
ALTER TABLE `DamagedComponent` ADD INDEX `DamagedComponent_ShipID_idx` (`ShipID`);

CREATE TABLE `DamageTemplate`
 (
	`TemplateID`			int, 
	`DamageType`			int, 
	`DamageAmount`			int, 
	`Damage1`			int, 
	`Damage2`			int, 
	`Damage3`			int, 
	`Damage4`			int, 
	`Damage5`			int, 
	`Damage6`			int, 
	`Damage7`			int, 
	`Damage8`			int, 
	`Damage9`			int, 
	`Damage10`			int, 
	`Damage11`			int, 
	`Damage12`			int, 
	`Damage13`			int, 
	`Damage14`			int, 
	`Damage15`			int, 
	`Damage16`			int, 
	`Damage17`			int, 
	`Damage18`			int, 
	`Damage19`			int, 
	`Damage20`			int
);

-- CREATE INDEXES ...
ALTER TABLE `DamageTemplate` ADD PRIMARY KEY (`TemplateID`);
ALTER TABLE `DamageTemplate` ADD INDEX `DamageTemplate_TemplateID_idx` (`TemplateID`);

CREATE TABLE `DCQueue`
 (
	`DCQueueID`			int, 
	`ShipID`			int, 
	`TechSystemID`			int, 
	`RepairOrder`			int
);

-- CREATE INDEXES ...
ALTER TABLE `DCQueue` ADD INDEX `DCQueue_ComponentID_idx` (`TechSystemID`);
ALTER TABLE `DCQueue` ADD INDEX `DCQueue_DCQueueID_idx` (`DCQueueID`);
ALTER TABLE `DCQueue` ADD PRIMARY KEY (`DCQueueID`);
ALTER TABLE `DCQueue` ADD INDEX `DCQueue_ShipID_idx` (`ShipID`);

CREATE TABLE `DesignPhilosophy`
 (
	`EmpireID`			int, 
	`GameID`			int, 
	`UpdateType`			varchar (100), 
	`ActiveAM`			int, 
	`ActiveAntiFAC`			int, 
	`ActiveAntiFighter`			int, 
	`ActiveLarge`			int, 
	`ActiveResolution`			int, 
	`ActiveSmall`			int, 
	`ActiveTiny`			int, 
	`AMMFC`			int, 
	`AntiFACFC`			int, 
	`AntiFighterFC`			int, 
	`BCJumpDriveID`			int, 
	`BestCHS`			int, 
	`BeamFCRange`			int, 
	`BeamFCSpeed`			int, 
	`BeamPreferenceID`			int, 
	`CAJumpDriveID`			int, 
	`CaptorMineID`			int, 
	`CarronadeID`			int, 
	`CIWSID`			int, 
	`CloakID`			int, 
	`CommEngineID`			int, 
	`CommercialEngines`			int, 
	`DDJumpDriveID`			int, 
	`ECM`			int, 
	`ECCM`			int, 
	`EMID1`			int, 
	`EMID2`			int, 
	`EMID3`			int, 
	`EMID6`			int, 
	`EngineID`			int, 
	`EngineSize`			int, 
	`FACEngineID`			int, 
	`FACLauncherID`			int, 
	`FACMFC`			int, 
	`FACMissileID`			int, 
	`GaussID`			int, 
	`JumpDriveID`			int, 
	`LargeLaserID`			int, 
	`LargeLauncherID`			int, 
	`LargeMFC`			int, 
	`LargestMagazineID`			int, 
	`LauncherID`			int, 
	`LauncherSize`			int, 
	`LRMissileID`			int, 
	`MesonID`			int, 
	`MineLauncherID`			int, 
	`MineLauncherSize`			int, 
	`MineMissileID`			int, 
	`NumSalvos`			int, 
	`PDLaserID`			int, 
	`PDLauncherID`			int, 
	`PDMesonID`			int, 
	`PDMissileID`			int, 
	`PDPreference`			int, 
	`PDWeaponID`			int, 
	`RailgunID`			int, 
	`ReactorID`			int, 
	`ReactorPower`			float, 
	`ReactorSize`			float, 
	`ScoutEngineID`			int, 
	`ShieldID`			int, 
	`StandardMFC`			int, 
	`StandardMissileID`			int, 
	`ThermalID1`			int, 
	`ThermalID2`			int, 
	`ThermalID3`			int, 
	`ThermalID6`			int, 
	`TorpID`			int, 
	`WarshipArmour`			int, 
	`WarshipEngineering`			int, 
	`WarshipEngines`			int, 
	`WarshipHullSize`			int
);

-- CREATE INDEXES ...
ALTER TABLE `DesignPhilosophy` ADD INDEX `DesignPhilosophy_CloakID_idx` (`CloakID`);
ALTER TABLE `DesignPhilosophy` ADD UNIQUE INDEX `DesignPhilosophy_CommEngineID_idx` (`CommEngineID`);
ALTER TABLE `DesignPhilosophy` ADD UNIQUE INDEX `DesignPhilosophy_EmpireID_idx` (`EmpireID`);
ALTER TABLE `DesignPhilosophy` ADD UNIQUE INDEX `DesignPhilosophy_FACEngineID_idx` (`EngineSize`);
ALTER TABLE `DesignPhilosophy` ADD INDEX `DesignPhilosophy_FACEngineID1_idx` (`FACEngineID`);
ALTER TABLE `DesignPhilosophy` ADD INDEX `DesignPhilosophy_GameID_idx` (`GameID`);
ALTER TABLE `DesignPhilosophy` ADD INDEX `DesignPhilosophy_MineLauncherID_idx` (`MineLauncherID`);
ALTER TABLE `DesignPhilosophy` ADD UNIQUE INDEX `DesignPhilosophy_PDLauncherID_idx` (`PDLauncherID`);
ALTER TABLE `DesignPhilosophy` ADD PRIMARY KEY (`EmpireID`);

CREATE TABLE `DesignPhilosophyUpdate`
 (
	`UpdateTypeID`			int, 
	`UpdateType`			varchar (100), 
	`ActiveAM`			char NOT NULL, 
	`ActiveAntiFAC`			char NOT NULL, 
	`ActiveAntiFighter`			char NOT NULL, 
	`ActiveLarge`			char NOT NULL, 
	`ActiveSmall`			char NOT NULL, 
	`ActiveTiny`			char NOT NULL, 
	`AMMFC`			char NOT NULL, 
	`AntiFACFC`			char NOT NULL, 
	`AntiFighterFC`			char NOT NULL, 
	`BCJumpDriveID`			char NOT NULL, 
	`BestCHS`			char NOT NULL, 
	`BeamFCRange`			char NOT NULL, 
	`BeamFCSpeed`			char NOT NULL, 
	`CAJumpDriveID`			char NOT NULL, 
	`CaptorMineID`			char NOT NULL, 
	`CarronadeID`			char NOT NULL, 
	`CIWSID`			char NOT NULL, 
	`CloakID`			char NOT NULL, 
	`CommEngineID`			char NOT NULL, 
	`DDJumpDriveID`			char NOT NULL, 
	`ECM`			char NOT NULL, 
	`ECCM`			char NOT NULL, 
	`EMID1`			char NOT NULL, 
	`EMID2`			char NOT NULL, 
	`EMID3`			char NOT NULL, 
	`EMID6`			char NOT NULL, 
	`EngineID`			char NOT NULL, 
	`FACEngineID`			char NOT NULL, 
	`FACLauncherID`			char NOT NULL, 
	`FACMFC`			char NOT NULL, 
	`FACMissileID`			char NOT NULL, 
	`GaussID`			char NOT NULL, 
	`JumpDriveID`			char NOT NULL, 
	`LargeLaserID`			char NOT NULL, 
	`LargeLauncherID`			char NOT NULL, 
	`LargeMFC`			char NOT NULL, 
	`LargestMagazineID`			char NOT NULL, 
	`LauncherID`			char NOT NULL, 
	`LRMissileID`			char NOT NULL, 
	`MesonID`			char NOT NULL, 
	`MineLauncherID`			char NOT NULL, 
	`PDLaserID`			char NOT NULL, 
	`PDLauncherID`			char NOT NULL, 
	`PDMesonID`			char NOT NULL, 
	`PDMissileID`			char NOT NULL, 
	`PDWeaponID`			char NOT NULL, 
	`RailgunID`			char NOT NULL, 
	`ReactorID`			char NOT NULL, 
	`ReactorPower`			char NOT NULL, 
	`ScoutEngineID`			char NOT NULL, 
	`ShieldID`			char NOT NULL, 
	`StandardMFC`			char NOT NULL, 
	`StandardMissileID`			char NOT NULL, 
	`ThermalID1`			char NOT NULL, 
	`ThermalID2`			char NOT NULL, 
	`ThermalID3`			char NOT NULL, 
	`ThermalID6`			char NOT NULL, 
	`TorpID`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `DesignPhilosophyUpdate` ADD INDEX `DesignPhilosophyUpdate_EmpireID_idx` (`UpdateTypeID`);
ALTER TABLE `DesignPhilosophyUpdate` ADD PRIMARY KEY (`UpdateTypeID`);

CREATE TABLE `Division`
 (
	`DivisionID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`SpeciesID`			int, 
	`DivisionTypeID`			int, 
	`Priority`			int, 
	`DivisionName`			varchar (200), 
	`HideSubUnits`			char NOT NULL, 
	`ParentHQ`			int, 
	`CombatPrepped`			int, 
	`BoardingCombat`			char NOT NULL, 
	`MaintenanceCost`			int, 
	`LocationID`			int, 
	`LocationTypeID`			int, 
	`CurrentMorale`			float, 
	`Readiness`			float, 
	`ReplacementOrder`			int
);

-- CREATE INDEXES ...
ALTER TABLE `Division` ADD INDEX `Division_LocationID_idx` (`LocationID`);
ALTER TABLE `Division` ADD INDEX `Division_LocationTypeID_idx` (`LocationTypeID`);
ALTER TABLE `Division` ADD PRIMARY KEY (`DivisionID`);
ALTER TABLE `Division` ADD INDEX `Division_RaceID_idx` (`RaceID`);
ALTER TABLE `Division` ADD INDEX `Division_RegimentID_idx` (`DivisionID`);
ALTER TABLE `Division` ADD INDEX `Division_RegimentTypeID_idx` (`DivisionTypeID`);

CREATE TABLE `DivisionType`
 (
	`DivisionTypeID`			int, 
	`DivisionTypeName`			varchar (80), 
	`TechSystemID`			int, 
	`Size`			int, 
	`BuildCost`			int, 
	`TypeAbbrev`			varchar (20), 
	`AttackStrength`			float, 
	`DefenceStrength`			float, 
	`PDCCombatModifier`			int, 
	`CmdrOrder`			int, 
	`ReplOrder`			int, 
	`CannotBuild`			char NOT NULL, 
	`CadreType`			varchar (20), 
	`LoadModifier`			float, 
	`SubjugatedOnly`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `DivisionType` ADD PRIMARY KEY (`DivisionTypeID`);
ALTER TABLE `DivisionType` ADD INDEX `DivisionType_RegimentTypeID_idx` (`DivisionTypeID`);

CREATE TABLE `ECCMAssignment`
 (
	`ECCMAssignmentID`			int, 
	`ShipID`			int, 
	`ECCMID`			int, 
	`ECCMNum`			int, 
	`FCTypeID`			int, 
	`FCNum`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ECCMAssignment` ADD INDEX `ECCMAssignment_FCNum_idx` (`FCNum`);
ALTER TABLE `ECCMAssignment` ADD INDEX `ECCMAssignment_FCTypeID_idx` (`FCTypeID`);
ALTER TABLE `ECCMAssignment` ADD PRIMARY KEY (`ECCMAssignmentID`);
ALTER TABLE `ECCMAssignment` ADD INDEX `ECCMAssignment_ShipID_idx` (`ShipID`);
ALTER TABLE `ECCMAssignment` ADD INDEX `ECCMAssignment_WeaponAssignmentID_idx` (`ECCMAssignmentID`);
ALTER TABLE `ECCMAssignment` ADD INDEX `ECCMAssignment_WeaponID_idx` (`ECCMID`);
ALTER TABLE `ECCMAssignment` ADD INDEX `ECCMAssignment_WeaponNum_idx` (`ECCMNum`);

CREATE TABLE `EmpireTitles`
 (
	`EmpireTitleID`			int, 
	`Title`			varchar (100), 
	`Prefix`			char NOT NULL, 
	`Suffix`			char NOT NULL, 
	`MaxChance`			int
);

-- CREATE INDEXES ...
ALTER TABLE `EmpireTitles` ADD INDEX `EmpireTitles_EmpireTitleID_idx` (`EmpireTitleID`);
ALTER TABLE `EmpireTitles` ADD PRIMARY KEY (`EmpireTitleID`);

CREATE TABLE `EventType`
 (
	`EventTypeID`			int, 
	`Description`			varchar (48), 
	`CombatDisplay`			int, 
	`DamageDisplay`			int, 
	`AttackEvent`			char NOT NULL, 
	`NoInterrupt`			char NOT NULL, 
	`NoNPRInterrupt`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `EventType` ADD INDEX `EventType_EventTypeID_idx` (`EventTypeID`);
ALTER TABLE `EventType` ADD PRIMARY KEY (`EventTypeID`);

CREATE TABLE `ExtremePlanets`
 (
	`TableID`			int, 
	`MaxChance`			int, 
	`TypeID`			int, 
	`TrojanID`			int, 
	`DoublePlanet`			char NOT NULL, 
	`Rogue`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `ExtremePlanets` ADD INDEX `ExtremePlanets_DoubleID_idx` (`DoublePlanet`);
ALTER TABLE `ExtremePlanets` ADD INDEX `ExtremePlanets_PlanetaryTypeID_idx` (`TableID`);
ALTER TABLE `ExtremePlanets` ADD PRIMARY KEY (`TableID`);
ALTER TABLE `ExtremePlanets` ADD INDEX `ExtremePlanets_SecondPlanetID_idx` (`TrojanID`);

CREATE TABLE `FGNicknames`
 (
	`NicknameID`			int, 
	`Nickname`			varchar (44)
);

-- CREATE INDEXES ...
ALTER TABLE `FGNicknames` ADD PRIMARY KEY (`NicknameID`);

CREATE TABLE `FireControlAssignment`
 (
	`FCAID`			int, 
	`ShipID`			int, 
	`RaceID`			int, 
	`GameID`			int, 
	`FCTypeID`			int, 
	`FCNum`			int, 
	`APDamageMod`			float, 
	`TargetID`			int, 
	`TargetType`			int, 
	`OpenFire`			char NOT NULL, 
	`NPR`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `FireControlAssignment` ADD INDEX `FireControlAssignment_FCAID_idx` (`FCAID`);
ALTER TABLE `FireControlAssignment` ADD INDEX `FireControlAssignment_FCNum_idx` (`FCNum`);
ALTER TABLE `FireControlAssignment` ADD INDEX `FireControlAssignment_FCTypeID_idx` (`FCTypeID`);
ALTER TABLE `FireControlAssignment` ADD INDEX `FireControlAssignment_GameID_idx` (`GameID`);
ALTER TABLE `FireControlAssignment` ADD PRIMARY KEY (`FCAID`);
ALTER TABLE `FireControlAssignment` ADD INDEX `FireControlAssignment_RaceID_idx` (`RaceID`);
ALTER TABLE `FireControlAssignment` ADD INDEX `FireControlAssignment_ShipID_idx` (`ShipID`);
ALTER TABLE `FireControlAssignment` ADD INDEX `FireControlAssignment_TargetID_idx` (`TargetID`);

CREATE TABLE `FireControlPDMode`
 (
	`FCAID`			int, 
	`ShipID`			int, 
	`RaceID`			int, 
	`GameID`			int, 
	`FCTypeID`			int, 
	`FCNum`			int, 
	`APDamageMod`			float, 
	`OpenFire`			char NOT NULL, 
	`MaxRange`			int, 
	`PDModeType`			int, 
	`FiredThisPhase`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `FireControlPDMode` ADD INDEX `FireControlPDMode_FCAID_idx` (`FCAID`);
ALTER TABLE `FireControlPDMode` ADD INDEX `FireControlPDMode_FCNum_idx` (`FCNum`);
ALTER TABLE `FireControlPDMode` ADD INDEX `FireControlPDMode_FCTypeID_idx` (`FCTypeID`);
ALTER TABLE `FireControlPDMode` ADD INDEX `FireControlPDMode_GameID_idx` (`GameID`);
ALTER TABLE `FireControlPDMode` ADD PRIMARY KEY (`FCAID`);
ALTER TABLE `FireControlPDMode` ADD INDEX `FireControlPDMode_RaceID_idx` (`RaceID`);
ALTER TABLE `FireControlPDMode` ADD INDEX `FireControlPDMode_ShipID_idx` (`ShipID`);

CREATE TABLE `FireResult`
 (
	`FireResultID`			int, 
	`TargetShipID`			int, 
	`TargetType`			int, 
	`DamageCaused`			int, 
	`WeaponText`			varchar (200), 
	`AttackRaceID`			int, 
	`AttackShipID`			int, 
	`DefendRaceID`			int, 
	`SystemID`			int, 
	`IgnoreShields`			char NOT NULL, 
	`IgnoreArmour`			char NOT NULL, 
	`ElectronicOnly`			char NOT NULL, 
	`WeaponID`			int, 
	`Radiation`			int
);

-- CREATE INDEXES ...
ALTER TABLE `FireResult` ADD INDEX `FireResult_AttackRaceID_idx` (`AttackRaceID`);
ALTER TABLE `FireResult` ADD INDEX `FireResult_DefendRaceID_idx` (`DefendRaceID`);
ALTER TABLE `FireResult` ADD PRIMARY KEY (`FireResultID`);
ALTER TABLE `FireResult` ADD INDEX `FireResult_SystemID_idx` (`SystemID`);
ALTER TABLE `FireResult` ADD INDEX `FireResult_TargetID_idx` (`TargetShipID`);
ALTER TABLE `FireResult` ADD INDEX `FireResult_TargetTypeID_idx` (`TargetType`);
ALTER TABLE `FireResult` ADD INDEX `FireResult_WeaponResultID_idx` (`FireResultID`);

CREATE TABLE `Fleet`
 (
	`FleetID`			int, 
	`GameID`			int, 
	`FleetName`			varchar (100), 
	`Initiative`			int, 
	`RaceID`			int, 
	`SystemID`			int, 
	`Independent`			char NOT NULL, 
	`TaskForceID`			int, 
	`HomeHiveID`			int, 
	`TradeLocation`			int, 
	`TaskProgress`			float, 
	`OrbitDistance`			int, 
	`OrbitBearing`			float, 
	`OrbitBodyID`			int, 
	`NPRFleetType`			int, 
	`NPRHomeGuard`			char NOT NULL, 
	`NPRJumpCapable`			char NOT NULL, 
	`TFTraining`			char NOT NULL, 
	`HigherFleetID`			int, 
	`SpecialOrderID`			int, 
	`SpecialOrderID2`			int, 
	`Speed`			int, 
	`MaxNebulaSpeed`			int, 
	`InHyper`			char NOT NULL, 
	`Xcor`			float, 
	`Ycor`			float, 
	`LastXcor`			float, 
	`LastYcor`			float, 
	`LastMoveTime`			float, 
	`IncrementStartX`			float, 
	`IncrementStartY`			float, 
	`EntryJPID`			int, 
	`CycleMoves`			int, 
	`Condition0`			int, 
	`Condition1`			int, 
	`ConditionOrder0`			int, 
	`ConditionOrder1`			int, 
	`JustDivided`			int, 
	`ProtectFleetID`			int, 
	`AxisContactID`			int, 
	`Distance`			int, 
	`OffsetBearing`			int, 
	`ExtraGalacticTime`			int
);

-- CREATE INDEXES ...
ALTER TABLE `Fleet` ADD UNIQUE INDEX `Fleet_FleetID_idx` (`FleetID`);
ALTER TABLE `Fleet` ADD INDEX `Fleet_GameID_idx` (`GameID`);
ALTER TABLE `Fleet` ADD UNIQUE INDEX `Fleet_HigherCommandID_idx` (`TaskForceID`);
ALTER TABLE `Fleet` ADD UNIQUE INDEX `Fleet_HigherFleetID_idx` (`HigherFleetID`);
ALTER TABLE `Fleet` ADD PRIMARY KEY (`FleetID`);
ALTER TABLE `Fleet` ADD INDEX `Fleet_RaceID_idx` (`RaceID`);
ALTER TABLE `Fleet` ADD INDEX `Fleet_SystemID_idx` (`SystemID`);

CREATE TABLE `FleetHistory`
 (
	`HistoryID`			int, 
	`FleetID`			int, 
	`Description`			varchar (510), 
	`GameTime`			float
);

-- CREATE INDEXES ...
ALTER TABLE `FleetHistory` ADD INDEX `FleetHistory_HistoryID_idx` (`HistoryID`);
ALTER TABLE `FleetHistory` ADD INDEX `FleetHistory_ObjectID_idx` (`FleetID`);
ALTER TABLE `FleetHistory` ADD PRIMARY KEY (`HistoryID`);

CREATE TABLE `FleetMove`
 (
	`FleetMoveID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`FleetID`			int, 
	`Initiative`			int, 
	`MoveOrder`			int, 
	`SystemID`			int, 
	`DestType`			int, 
	`DestID`			int, 
	`PopulationID`			int, 
	`OrderDelay`			int, 
	`MinDistance`			int, 
	`OrbDistance`			int, 
	`MoveActionID`			int, 
	`NewSystemID`			int, 
	`NewWarpPointID`			int, 
	`Description`			varchar (510), 
	`Arrived`			char NOT NULL, 
	`SurveyPointsRequired`			float, 
	`TimeRequired`			int, 
	`ExtraInfo`			int, 
	`MaxCargo`			int, 
	`CommanderPickupID`			int, 
	`DivisionPickupID`			int, 
	`TeamPickupID`			int, 
	`MessageID`			int, 
	`DestLPID`			int, 
	`PrefabID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `FleetMove` ADD INDEX `FleetMove_DestLPID_idx` (`DestLPID`);
ALTER TABLE `FleetMove` ADD INDEX `FleetMove_FleetID_idx` (`FleetID`);
ALTER TABLE `FleetMove` ADD INDEX `FleetMove_FleetID1_idx` (`DestID`);
ALTER TABLE `FleetMove` ADD INDEX `FleetMove_FleetMoveID_idx` (`FleetMoveID`);
ALTER TABLE `FleetMove` ADD INDEX `FleetMove_GameID_idx` (`GameID`);
ALTER TABLE `FleetMove` ADD INDEX `FleetMove_MessageID_idx` (`MessageID`);
ALTER TABLE `FleetMove` ADD INDEX `FleetMove_MoveActionID_idx` (`MoveActionID`);
ALTER TABLE `FleetMove` ADD INDEX `FleetMove_NewSystemID_idx` (`NewSystemID`);
ALTER TABLE `FleetMove` ADD INDEX `FleetMove_NewWarpPointID_idx` (`NewWarpPointID`);
ALTER TABLE `FleetMove` ADD INDEX `FleetMove_PopulationID_idx` (`PopulationID`);
ALTER TABLE `FleetMove` ADD INDEX `FleetMove_PrefabID_idx` (`PrefabID`);
ALTER TABLE `FleetMove` ADD PRIMARY KEY (`FleetMoveID`);
ALTER TABLE `FleetMove` ADD INDEX `FleetMove_SystemID_idx` (`SystemID`);

CREATE TABLE `FleetMoveTemplate`
 (
	`FleetMoveTemplateID`			int, 
	`OrderTemplateID`			int, 
	`MoveOrder`			int, 
	`SystemID`			int, 
	`DestType`			int, 
	`DestID`			int, 
	`PopulationID`			int, 
	`MinDistance`			int, 
	`OrbDistance`			int, 
	`MoveActionID`			int, 
	`NewSystemID`			int, 
	`NewWarpPointID`			int, 
	`Description`			varchar (510), 
	`SurveyPointsRequired`			float, 
	`ExtraInfo`			int, 
	`MaxCargo`			int, 
	`CommanderPickupID`			int, 
	`DivisionPickupID`			int, 
	`TeamPickupID`			int, 
	`MessageID`			int, 
	`DestLPID`			int, 
	`PrefabID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `FleetMoveTemplate` ADD INDEX `FleetMoveTemplate_DestLPID_idx` (`DestLPID`);
ALTER TABLE `FleetMoveTemplate` ADD UNIQUE INDEX `FleetMoveTemplate_FleetID1_idx` (`DestID`);
ALTER TABLE `FleetMoveTemplate` ADD INDEX `FleetMoveTemplate_FleetMoveID_idx` (`FleetMoveTemplateID`);
ALTER TABLE `FleetMoveTemplate` ADD UNIQUE INDEX `FleetMoveTemplate_MessageID_idx` (`MessageID`);
ALTER TABLE `FleetMoveTemplate` ADD UNIQUE INDEX `FleetMoveTemplate_MoveActionID_idx` (`MoveActionID`);
ALTER TABLE `FleetMoveTemplate` ADD INDEX `FleetMoveTemplate_NewSystemID_idx` (`NewSystemID`);
ALTER TABLE `FleetMoveTemplate` ADD UNIQUE INDEX `FleetMoveTemplate_NewWarpPointID_idx` (`NewWarpPointID`);
ALTER TABLE `FleetMoveTemplate` ADD INDEX `FleetMoveTemplate_OrderTemplateID_idx` (`OrderTemplateID`);
ALTER TABLE `FleetMoveTemplate` ADD INDEX `FleetMoveTemplate_PopulationID_idx` (`PopulationID`);
ALTER TABLE `FleetMoveTemplate` ADD INDEX `FleetMoveTemplate_PrefabID_idx` (`PrefabID`);
ALTER TABLE `FleetMoveTemplate` ADD PRIMARY KEY (`FleetMoveTemplateID`);
ALTER TABLE `FleetMoveTemplate` ADD INDEX `FleetMoveTemplate_SystemID_idx` (`SystemID`);

CREATE TABLE `FleetOrganization`
 (
	`OrganizationID`			int, 
	`RaceID`			int, 
	`Name`			varchar (200), 
	`HigherID`			int, 
	`TFID`			int, 
	`Expanded`			char NOT NULL, 
	`Stored`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `FleetOrganization` ADD INDEX `FleetOrganization_HIgherID_idx` (`HigherID`);
ALTER TABLE `FleetOrganization` ADD INDEX `FleetOrganization_OrganizationID_idx` (`OrganizationID`);
ALTER TABLE `FleetOrganization` ADD PRIMARY KEY (`OrganizationID`);
ALTER TABLE `FleetOrganization` ADD INDEX `FleetOrganization_RaceID_idx` (`RaceID`);
ALTER TABLE `FleetOrganization` ADD INDEX `FleetOrganization_TFID_idx` (`TFID`);

CREATE TABLE `Formation`
 (
	`FormationID`			int, 
	`EscortFleetID`			int, 
	`ShipID`			int, 
	`ProtectedFleetID`			int, 
	`Distance`			int, 
	`OffsetBearing`			int, 
	`FleetName`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `Formation` ADD INDEX `Formation_EscortFleetID_idx` (`EscortFleetID`);
ALTER TABLE `Formation` ADD PRIMARY KEY (`FormationID`);
ALTER TABLE `Formation` ADD INDEX `Formation_ProtectedFleetID_idx` (`ProtectedFleetID`);
ALTER TABLE `Formation` ADD INDEX `Formation_SavedEscortID_idx` (`FormationID`);
ALTER TABLE `Formation` ADD INDEX `Formation_ShipID_idx` (`ShipID`);

CREATE TABLE `FunctionList`
 (
	`FunctionID`			int, 
	`FunctionName`			varchar (100), 
	`Measurement`			varchar (100), 
	`Priority`			int
);

-- CREATE INDEXES ...
ALTER TABLE `FunctionList` ADD INDEX `FunctionList_FunctionID_idx` (`FunctionID`);
ALTER TABLE `FunctionList` ADD PRIMARY KEY (`FunctionID`);

CREATE TABLE `Game`
 (
	`GameID`			int, 
	`DifficultyModifier`			int, 
	`GameTime`			float, 
	`TruceCountdown`			float, 
	`PreviousGameTime`			float, 
	`TimeChunk`			int, 
	`LastViewed`			float, 
	`DefaultRaceID`			int, 
	`LastGrowthTime`			float, 
	`StartYear`			int, 
	`GameName`			varchar (100), 
	`NumberOfSystems`			int, 
	`SMPassword`			varchar (50), 
	`LocalSystemChance`			int, 
	`LocalSystemSpread`			int, 
	`ProdTime`			int, 
	`OrbitalMotion`			int, 
	`OrbitalMotionAst`			int, 
	`Precursors`			int, 
	`Invaders`			int, 
	`StarSwarm`			int, 
	`GenerateNPRs`			int, 
	`AutoJumpGates`			int, 
	`NoOverhauls`			int, 
	`RealisticPromotions`			int, 
	`DoNotDisplay`			char NOT NULL, 
	`PoliticalAdmirals`			int, 
	`InexpFleets`			int, 
	`RaceChance`			int, 
	`MinComets`			int, 
	`LastLog`			float, 
	`YearLogged`			int, 
	`UseKnownStars`			int, 
	`Disaster`			int, 
	`PlayerExplorationTime`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Game` ADD UNIQUE INDEX `Game_DEfaultRaceID_idx` (`DefaultRaceID`);
ALTER TABLE `Game` ADD UNIQUE INDEX `Game_GameID_idx` (`GameID`);
ALTER TABLE `Game` ADD INDEX `Game_NumberOfSystems_idx` (`NumberOfSystems`);
ALTER TABLE `Game` ADD PRIMARY KEY (`GameID`);

CREATE TABLE `GameLog`
 (
	`GameLogID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`SMOnly`			char NOT NULL, 
	`Increment`			char NOT NULL, 
	`Time`			float, 
	`EventType`			int, 
	`MessageText`			varchar (510), 
	`SystemID`			int, 
	`Xcor`			float, 
	`Ycor`			float, 
	`IDType`			int, 
	`SubjectID`			int, 
	`SubjectName`			varchar (100), 
	`MultipleMessages`			int
);

-- CREATE INDEXES ...
ALTER TABLE `GameLog` ADD INDEX `GameLog_GameID_idx` (`GameID`);
ALTER TABLE `GameLog` ADD INDEX `GameLog_GameLogID_idx` (`GameLogID`);
ALTER TABLE `GameLog` ADD PRIMARY KEY (`GameLogID`);
ALTER TABLE `GameLog` ADD UNIQUE INDEX `GameLog_RaceID_idx` (`RaceID`);
ALTER TABLE `GameLog` ADD UNIQUE INDEX `GameLog_SystemID_idx` (`SystemID`);

CREATE TABLE `Gases`
 (
	`GasID`			int, 
	`Name`			varchar (50), 
	`Symbol`			varchar (10), 
	`Weight`			int, 
	`BoilingPoint`			int, 
	`GHGas`			char NOT NULL, 
	`AntiGHGas`			char NOT NULL, 
	`Dangerous`			int
);

-- CREATE INDEXES ...
ALTER TABLE `Gases` ADD INDEX `Gases_GasID_idx` (`GasID`);
ALTER TABLE `Gases` ADD PRIMARY KEY (`GasID`);

CREATE TABLE `GroundUnitTypeNames`
 (
	`RaceGroundNameID`			int, 
	`RaceID`			int, 
	`DivisionTypeID`			int, 
	`UnitTypeName`			varchar (200), 
	`UnitAbbrev`			varchar (20)
);

-- CREATE INDEXES ...
ALTER TABLE `GroundUnitTypeNames` ADD INDEX `GroundUnitTypeNames_DivisionTypeID_idx` (`DivisionTypeID`);
ALTER TABLE `GroundUnitTypeNames` ADD PRIMARY KEY (`RaceGroundNameID`);
ALTER TABLE `GroundUnitTypeNames` ADD INDEX `GroundUnitTypeNames_RaceGroundNameID_idx` (`RaceGroundNameID`);
ALTER TABLE `GroundUnitTypeNames` ADD INDEX `GroundUnitTypeNames_RaceID_idx` (`RaceID`);

CREATE TABLE `GUTraining`
 (
	`TaskID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`PopulationID`			int, 
	`SystemBodyID`			int, 
	`TaskTypeID`			int, 
	`DivisionTypeID`			int, 
	`DivisionID`			int, 
	`TotalBP`			float, 
	`CompletedBP`			float, 
	`UnitName`			varchar (80), 
	`TaskDescription`			varchar (200)
);

-- CREATE INDEXES ...
ALTER TABLE `GUTraining` ADD INDEX `GUTraining_ClassID_idx` (`DivisionTypeID`);
ALTER TABLE `GUTraining` ADD INDEX `GUTraining_GameID_idx` (`GameID`);
ALTER TABLE `GUTraining` ADD PRIMARY KEY (`TaskID`);
ALTER TABLE `GUTraining` ADD INDEX `GUTraining_RaceID_idx` (`RaceID`);
ALTER TABLE `GUTraining` ADD INDEX `GUTraining_RefitID_idx` (`DivisionID`);
ALTER TABLE `GUTraining` ADD INDEX `GUTraining_ShipyardID_idx` (`PopulationID`);
ALTER TABLE `GUTraining` ADD INDEX `GUTraining_SystemBodyID_idx` (`SystemBodyID`);
ALTER TABLE `GUTraining` ADD UNIQUE INDEX `GUTraining_TaskID_idx` (`TaskID`);
ALTER TABLE `GUTraining` ADD INDEX `GUTraining_TaskTypeID_idx` (`TaskTypeID`);

CREATE TABLE `HideEvents`
 (
	`RaceID`			int, 
	`EventID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `HideEvents` ADD UNIQUE INDEX `HideEvents_EventID_idx` (`EventID`);
ALTER TABLE `HideEvents` ADD PRIMARY KEY (`RaceID`, `EventID`);
ALTER TABLE `HideEvents` ADD UNIQUE INDEX `HideEvents_RaceID_idx` (`RaceID`);

CREATE TABLE `HullDescription`
 (
	`HullDescriptionID`			int, 
	`Description`			varchar (100), 
	`HullAbbr`			varchar (20)
);

-- CREATE INDEXES ...
ALTER TABLE `HullDescription` ADD INDEX `HullDescription_HullCode_idx` (`HullAbbr`);
ALTER TABLE `HullDescription` ADD INDEX `HullDescription_HullDescriptionID_idx` (`HullDescriptionID`);
ALTER TABLE `HullDescription` ADD PRIMARY KEY (`HullDescriptionID`);

CREATE TABLE `IndustrialProjects`
 (
	`ProjectID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`PopulationID`			int, 
	`SpeciesID`			int, 
	`Percentage`			float, 
	`ProductionType`			int, 
	`ProductionID`			int, 
	`RefitClassID`			int, 
	`WealthUse`			int, 
	`Amount`			float, 
	`PartialCompletion`			float, 
	`ProdPerUnit`			float, 
	`Description`			varchar (200), 
	`Pause`			char NOT NULL, 
	`Queue`			int, 
	`FuelRequired`			int, 
	`Duranium`			float, 
	`Neutronium`			float, 
	`Corbomite`			float, 
	`Tritanium`			float, 
	`Boronide`			float, 
	`Mercassium`			float, 
	`Vendarite`			float, 
	`Sorium`			float, 
	`Uridium`			float, 
	`Corundium`			float, 
	`Gallicite`			float
);

-- CREATE INDEXES ...
ALTER TABLE `IndustrialProjects` ADD INDEX `IndustrialProjects_GameID_idx` (`GameID`);
ALTER TABLE `IndustrialProjects` ADD PRIMARY KEY (`ProjectID`);
ALTER TABLE `IndustrialProjects` ADD INDEX `IndustrialProjects_ProductionID_idx` (`ProductionID`);
ALTER TABLE `IndustrialProjects` ADD INDEX `IndustrialProjects_ProductionQueueID_idx` (`ProjectID`);
ALTER TABLE `IndustrialProjects` ADD INDEX `IndustrialProjects_RaceID_idx` (`RaceID`);
ALTER TABLE `IndustrialProjects` ADD INDEX `IndustrialProjects_SystemBodyID_idx` (`PopulationID`);

CREATE TABLE `InnerPlanets`
 (
	`TableID`			int, 
	`MaxChance`			int, 
	`TypeID`			int, 
	`TrojanID`			int, 
	`DoublePlanet`			char NOT NULL, 
	`Rogue`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `InnerPlanets` ADD INDEX `InnerPlanets_DoubleID_idx` (`DoublePlanet`);
ALTER TABLE `InnerPlanets` ADD INDEX `InnerPlanets_PlanetaryTypeID_idx` (`TableID`);
ALTER TABLE `InnerPlanets` ADD PRIMARY KEY (`TableID`);
ALTER TABLE `InnerPlanets` ADD INDEX `InnerPlanets_SecondPlanetID_idx` (`TrojanID`);

CREATE TABLE `Installations`
 (
	`InstallationID`			int, 
	`InstallationName`			varchar (200), 
	`Cost`			float, 
	`ConstructionRate`			float, 
	`MiningRate`			float, 
	`RefiningRate`			float, 
	`OrdnanceRate`			float, 
	`FighterRate`			float, 
	`ResearchField`			int, 
	`ResearchRate`			float, 
	`TerraformRate`			float, 
	`Duranium`			float, 
	`Neutronium`			float, 
	`Corbomite`			float, 
	`Tritanium`			float, 
	`Boronide`			float, 
	`Mercassium`			float, 
	`Vendarite`			float, 
	`Sorium`			float, 
	`Uridium`			float, 
	`Corundium`			float, 
	`Gallicite`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Installations` ADD INDEX `Installations_ID_idx` (`InstallationID`);
ALTER TABLE `Installations` ADD PRIMARY KEY (`InstallationID`);

CREATE TABLE `KnownSpecies`
 (
	`KnownSpeciesID`			int, 
	`AlienSpeciesID`			int, 
	`DetectRaceID`			int, 
	`Status`			int
);

-- CREATE INDEXES ...
ALTER TABLE `KnownSpecies` ADD INDEX `KnownSpecies_AlienSpeciesID_idx` (`AlienSpeciesID`);
ALTER TABLE `KnownSpecies` ADD INDEX `KnownSpecies_DetectRaceID_idx` (`DetectRaceID`);
ALTER TABLE `KnownSpecies` ADD INDEX `KnownSpecies_KnownSpeciesID_idx` (`KnownSpeciesID`);
ALTER TABLE `KnownSpecies` ADD PRIMARY KEY (`KnownSpeciesID`);

CREATE TABLE `KnownSystems`
 (
	`KnownSystemID`			int, 
	`Name`			varchar (100), 
	`Primary`			varchar (50), 
	`SpecialType`			int, 
	`HYG`			char NOT NULL, 
	`Component1ID`			int, 
	`Component2ID`			int, 
	`C2Orbit`			float, 
	`Component3ID`			int, 
	`C3Orbit`			float, 
	`C3OrbitType`			int, 
	`Component4ID`			int, 
	`C4Orbit`			float, 
	`C4OrbitType`			int, 
	`X`			float, 
	`Y`			float, 
	`Z`			float, 
	`Distance`			float, 
	`HDNum`			varchar (30), 
	`Gliese`			varchar (30), 
	`XYBearing`			float, 
	`GalMapX`			float, 
	`GalMapY`			float, 
	`AdjustedBearing`			int
);

-- CREATE INDEXES ...
ALTER TABLE `KnownSystems` ADD INDEX `KnownSystems_Component3ID_idx` (`Component3ID`);
ALTER TABLE `KnownSystems` ADD INDEX `KnownSystems_Component3ID1_idx` (`Component4ID`);
ALTER TABLE `KnownSystems` ADD INDEX `KnownSystems_HDNum_idx` (`HDNum`);
ALTER TABLE `KnownSystems` ADD UNIQUE INDEX `KnownSystems_KNownSystemID_idx` (`KnownSystemID`);
ALTER TABLE `KnownSystems` ADD PRIMARY KEY (`KnownSystemID`);
ALTER TABLE `KnownSystems` ADD INDEX `KnownSystems_StarTypeID_idx` (`Component2ID`);

CREATE TABLE `KnownSystemsOld`
 (
	`KnownSystemID`			int, 
	`Name`			varchar (100), 
	`Primary`			varchar (50), 
	`SpecialType`			int, 
	`HYG`			char NOT NULL, 
	`Component1ID`			int, 
	`Component2ID`			int, 
	`C2Orbit`			float, 
	`Component3ID`			int, 
	`C3Orbit`			float, 
	`C3OrbitType`			int, 
	`Component4ID`			int, 
	`C4Orbit`			float, 
	`C4OrbitType`			int, 
	`X`			float, 
	`Y`			float, 
	`Z`			float, 
	`Distance`			float, 
	`HDNum`			varchar (30), 
	`Gliese`			varchar (30)
);

-- CREATE INDEXES ...
ALTER TABLE `KnownSystemsOld` ADD INDEX `KnownSystemsOld_Component3ID_idx` (`Component3ID`);
ALTER TABLE `KnownSystemsOld` ADD INDEX `KnownSystemsOld_Component3ID1_idx` (`Component4ID`);
ALTER TABLE `KnownSystemsOld` ADD INDEX `KnownSystemsOld_HDNum_idx` (`HDNum`);
ALTER TABLE `KnownSystemsOld` ADD INDEX `KnownSystemsOld_KNownSystemID_idx` (`KnownSystemID`);
ALTER TABLE `KnownSystemsOld` ADD PRIMARY KEY (`KnownSystemID`);
ALTER TABLE `KnownSystemsOld` ADD INDEX `KnownSystemsOld_StarTypeID_idx` (`Component2ID`);

CREATE TABLE `KnownSystemsUsed`
 (
	`KnownSystemID`			int, 
	`GameID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `KnownSystemsUsed` ADD INDEX `KnownSystemsUsed_GameID_idx` (`GameID`);
ALTER TABLE `KnownSystemsUsed` ADD PRIMARY KEY (`KnownSystemID`, `GameID`);

CREATE TABLE `LGPoint`
 (
	`LagrangePointID`			int, 
	`SystemID`			int, 
	`StarID`			int, 
	`PlanetID`			int, 
	`Xcor`			float, 
	`Ycor`			float, 
	`Distance`			float, 
	`Bearing`			float
);

-- CREATE INDEXES ...
ALTER TABLE `LGPoint` ADD INDEX `LGPoint_LagrangePointID_idx` (`LagrangePointID`);
ALTER TABLE `LGPoint` ADD INDEX `LGPoint_PlanetID_idx` (`PlanetID`);
ALTER TABLE `LGPoint` ADD PRIMARY KEY (`LagrangePointID`);
ALTER TABLE `LGPoint` ADD INDEX `LGPoint_StarID_idx` (`StarID`);
ALTER TABLE `LGPoint` ADD UNIQUE INDEX `LGPoint_SystemID_idx` (`SystemID`);

CREATE TABLE `Lifepods`
 (
	`LifepodID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`SpeciesID`			int, 
	`SystemID`			int, 
	`ClassID`			int, 
	`ShipName`			varchar (100), 
	`Crew`			int, 
	`Xcor`			float, 
	`Ycor`			float, 
	`CreationTime`			float, 
	`GradePoints`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Lifepods` ADD INDEX `Lifepods_ClassID_idx` (`ClassID`);
ALTER TABLE `Lifepods` ADD UNIQUE INDEX `Lifepods_GameID_idx` (`GameID`);
ALTER TABLE `Lifepods` ADD INDEX `Lifepods_LifePodID_idx` (`LifepodID`);
ALTER TABLE `Lifepods` ADD PRIMARY KEY (`LifepodID`);
ALTER TABLE `Lifepods` ADD UNIQUE INDEX `Lifepods_RaceID_idx` (`RaceID`);
ALTER TABLE `Lifepods` ADD INDEX `Lifepods_SpeciesID_idx` (`SpeciesID`);
ALTER TABLE `Lifepods` ADD UNIQUE INDEX `Lifepods_SystemID_idx` (`SystemID`);

CREATE TABLE `MapLabel`
 (
	`MapLabelID`			int, 
	`RaceID`			int, 
	`Caption`			varchar (200), 
	`Colour`			int, 
	`Xpos`			float, 
	`Ypos`			float, 
	`FontSize`			int, 
	`FontBold`			char NOT NULL, 
	`FontItalic`			char NOT NULL, 
	`FontName`			varchar (100), 
	`FontUnderline`			int
);

-- CREATE INDEXES ...
ALTER TABLE `MapLabel` ADD INDEX `MapLabel_MapLabelID_idx` (`MapLabelID`);
ALTER TABLE `MapLabel` ADD PRIMARY KEY (`MapLabelID`);
ALTER TABLE `MapLabel` ADD INDEX `MapLabel_RaceID_idx` (`RaceID`);

CREATE TABLE `Materials`
 (
	`MaterialID`			int, 
	`MaterialName`			varchar (40), 
	`ShortName`			varchar (12), 
	`Description`			varchar (400)
);

-- CREATE INDEXES ...
ALTER TABLE `Materials` ADD UNIQUE INDEX `Materials_MaterialID_idx` (`MaterialID`);
ALTER TABLE `Materials` ADD PRIMARY KEY (`MaterialID`);

CREATE TABLE `MDPackets`
 (
	`PacketID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`SysID`			int, 
	`DestID`			int, 
	`TotalSize`			float, 
	`Speed`			int, 
	`Xcor`			float, 
	`Ycor`			float, 
	`LastXcor`			float, 
	`LastYcor`			float, 
	`IncrementStartX`			float, 
	`IncrementStartY`			float, 
	`Duranium`			float, 
	`Neutronium`			float, 
	`Corbomite`			float, 
	`Tritanium`			float, 
	`Boronide`			float, 
	`Mercassium`			float, 
	`Vendarite`			float, 
	`Sorium`			float, 
	`Uridium`			float, 
	`Corundium`			float, 
	`Gallicite`			float
);

-- CREATE INDEXES ...
ALTER TABLE `MDPackets` ADD INDEX `MDPackets_DestID_idx` (`DestID`);
ALTER TABLE `MDPackets` ADD INDEX `MDPackets_GameID_idx` (`GameID`);
ALTER TABLE `MDPackets` ADD INDEX `MDPackets_PacketID_idx` (`PacketID`);
ALTER TABLE `MDPackets` ADD PRIMARY KEY (`PacketID`);
ALTER TABLE `MDPackets` ADD INDEX `MDPackets_RaceID_idx` (`RaceID`);
ALTER TABLE `MDPackets` ADD INDEX `MDPackets_SysID_idx` (`SysID`);

CREATE TABLE `MedalsAwarded`
 (
	`RaceMedalID`			int, 
	`OfficerID`			int, 
	`NumAwarded`			int
);

-- CREATE INDEXES ...
ALTER TABLE `MedalsAwarded` ADD INDEX `MedalsAwarded_MedalID_idx` (`RaceMedalID`);
ALTER TABLE `MedalsAwarded` ADD INDEX `MedalsAwarded_NumAwarded_idx` (`NumAwarded`);
ALTER TABLE `MedalsAwarded` ADD INDEX `MedalsAwarded_OfficerID_idx` (`OfficerID`);
ALTER TABLE `MedalsAwarded` ADD PRIMARY KEY (`RaceMedalID`, `OfficerID`);

CREATE TABLE `Messages`
 (
	`MessageID`			int, 
	`Message`			varchar (510)
);

-- CREATE INDEXES ...
ALTER TABLE `Messages` ADD INDEX `Messages_MessageID_idx` (`MessageID`);
ALTER TABLE `Messages` ADD PRIMARY KEY (`MessageID`);

CREATE TABLE `MiningNames`
 (
	`MNID`			int, 
	`MiningName`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `MiningNames` ADD INDEX `MiningNames_MNID_idx` (`MNID`);
ALTER TABLE `MiningNames` ADD PRIMARY KEY (`MNID`);

CREATE TABLE `MissileAssignment`
 (
	`MissileAssignID`			int, 
	`ShipID`			int, 
	`MissileLauncherTypeID`			int, 
	`MissileLauncherNum`			int, 
	`MissileID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `MissileAssignment` ADD INDEX `MissileAssignment_MissileAssignID_idx` (`MissileAssignID`);
ALTER TABLE `MissileAssignment` ADD INDEX `MissileAssignment_MissileID_idx` (`MissileID`);
ALTER TABLE `MissileAssignment` ADD UNIQUE INDEX `MissileAssignment_MIssileLauncherNum_idx` (`MissileLauncherNum`);
ALTER TABLE `MissileAssignment` ADD INDEX `MissileAssignment_MissileLauncherTypeID_idx` (`MissileLauncherTypeID`);
ALTER TABLE `MissileAssignment` ADD PRIMARY KEY (`MissileAssignID`);
ALTER TABLE `MissileAssignment` ADD INDEX `MissileAssignment_ShipID_idx` (`ShipID`);

CREATE TABLE `MissileGeoSurvey`
 (
	`SystemBodyID`			int, 
	`RaceID`			int, 
	`PointsRemaining`			float
);

-- CREATE INDEXES ...
ALTER TABLE `MissileGeoSurvey` ADD PRIMARY KEY (`SystemBodyID`, `RaceID`);
ALTER TABLE `MissileGeoSurvey` ADD INDEX `MissileGeoSurvey_RaceID_idx` (`RaceID`);
ALTER TABLE `MissileGeoSurvey` ADD INDEX `MissileGeoSurvey_SystemBodyID_idx` (`SystemBodyID`);

CREATE TABLE `Missiles`
 (
	`MissileID`			int, 
	`Name`			varchar (100), 
	`OrdnanceType`			int, 
	`MissileSeriesID`			int, 
	`EngineID`			int, 
	`NumEngines`			int, 
	`PrecursorMissile`			char NOT NULL, 
	`MissilesRequired`			int, 
	`MissilesAvailable`			int, 
	`Cost`			float, 
	`Size`			float, 
	`Speed`			float, 
	`Integrity`			int, 
	`RadDamage`			int, 
	`FuelRequired`			int, 
	`Endurance`			int, 
	`MaxRange`			float, 
	`WarheadType`			int, 
	`WarheadStrength`			int, 
	`SensorStrength`			float, 
	`SensorResolution`			int, 
	`SensorRange`			int, 
	`ThermalStrength`			float, 
	`EMStrength`			float, 
	`Geostrength`			float, 
	`TotalFlightTime`			int, 
	`LaserHeads`			int, 
	`ECM`			int, 
	`MR`			int, 
	`Armour`			int, 
	`SecondStageID`			int, 
	`NumSS`			int, 
	`SeparationRange`			int, 
	`Corbomite`			float, 
	`Tritanium`			float, 
	`Boronide`			float, 
	`Uridium`			float, 
	`Gallicite`			float, 
	`PreTNT`			char NOT NULL, 
	`TravelDelay`			int, 
	`MSPReactor`			float, 
	`MSPWarhead`			float, 
	`MSPEngine`			float, 
	`MSPFuel`			float, 
	`MSPAgility`			float, 
	`MSPActive`			float, 
	`MSPThermal`			float, 
	`MSPEM`			float, 
	`MSPGeo`			float, 
	`MSPArmour`			float, 
	`MSPECM`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Missiles` ADD INDEX `Missiles_EngineID_idx` (`EngineID`);
ALTER TABLE `Missiles` ADD INDEX `Missiles_MissileID_idx` (`MissileID`);
ALTER TABLE `Missiles` ADD INDEX `Missiles_NumEngines_idx` (`NumEngines`);
ALTER TABLE `Missiles` ADD PRIMARY KEY (`MissileID`);

CREATE TABLE `MissileSalvo`
 (
	`MissileSalvoID`			int, 
	`GameID`			int, 
	`ShipID`			int, 
	`RaceID`			int, 
	`SystemID`			int, 
	`SalvoName`			varchar (100), 
	`MissileID`			int, 
	`MissileNum`			int, 
	`LaunchTime`			float, 
	`TimeDelay`			int, 
	`FireControlID`			int, 
	`FCNum`			int, 
	`TargetID`			int, 
	`TargetType`			int, 
	`MissileSpeed`			int, 
	`ModifierToHit`			float, 
	`Endurance`			float, 
	`MissileSize`			int, 
	`SecondStageMissileID`			int, 
	`SecondStageNum`			int, 
	`Xcor`			float, 
	`Ycor`			float, 
	`LastXcor`			float, 
	`LastYcor`			float, 
	`LastTargetX`			float, 
	`LastTargetY`			float, 
	`IncrementStartX`			float, 
	`IncrementStartY`			float
);

-- CREATE INDEXES ...
ALTER TABLE `MissileSalvo` ADD INDEX `MissileSalvo_FCNum_idx` (`FCNum`);
ALTER TABLE `MissileSalvo` ADD INDEX `MissileSalvo_FireControlID_idx` (`FireControlID`);
ALTER TABLE `MissileSalvo` ADD INDEX `MissileSalvo_GameID_idx` (`GameID`);
ALTER TABLE `MissileSalvo` ADD INDEX `MissileSalvo_MissileID_idx` (`MissileID`);
ALTER TABLE `MissileSalvo` ADD INDEX `MissileSalvo_MissileNum_idx` (`MissileNum`);
ALTER TABLE `MissileSalvo` ADD INDEX `MissileSalvo_MissileSalvoID_idx` (`MissileSalvoID`);
ALTER TABLE `MissileSalvo` ADD PRIMARY KEY (`MissileSalvoID`);
ALTER TABLE `MissileSalvo` ADD INDEX `MissileSalvo_RaceID_idx` (`RaceID`);
ALTER TABLE `MissileSalvo` ADD INDEX `MissileSalvo_SecondStageMissileID1_idx` (`SecondStageMissileID`);
ALTER TABLE `MissileSalvo` ADD INDEX `MissileSalvo_SecondStageNum1_idx` (`SecondStageNum`);
ALTER TABLE `MissileSalvo` ADD INDEX `MissileSalvo_ShipID_idx` (`ShipID`);
ALTER TABLE `MissileSalvo` ADD INDEX `MissileSalvo_SystemID_idx` (`SystemID`);
ALTER TABLE `MissileSalvo` ADD INDEX `MissileSalvo_TargetID_idx` (`TargetID`);

CREATE TABLE `MissileSeries`
 (
	`SeriesID`			int, 
	`RaceID`			int, 
	`SeriesName`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `MissileSeries` ADD PRIMARY KEY (`SeriesID`);
ALTER TABLE `MissileSeries` ADD INDEX `MissileSeries_RaceID_idx` (`RaceID`);
ALTER TABLE `MissileSeries` ADD UNIQUE INDEX `MissileSeries_SeriesID_idx` (`SeriesID`);

CREATE TABLE `Moons`
 (
	`Field1`			varchar (510)
);

-- CREATE INDEXES ...

CREATE TABLE `NameTheme`
 (
	`NameThemeID`			int, 
	`Description`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `NameTheme` ADD INDEX `NameTheme_NameThemeID_idx` (`NameThemeID`);
ALTER TABLE `NameTheme` ADD PRIMARY KEY (`NameThemeID`);

CREATE TABLE `NodeExpand`
 (
	`ID`			int, 
	`RaceID`			int, 
	`Node`			varchar (100), 
	`Expand`			int
);

-- CREATE INDEXES ...
ALTER TABLE `NodeExpand` ADD UNIQUE INDEX `NodeExpand_ID_idx` (`ID`);
ALTER TABLE `NodeExpand` ADD PRIMARY KEY (`ID`);
ALTER TABLE `NodeExpand` ADD UNIQUE INDEX `NodeExpand_RaceID_idx` (`RaceID`);

CREATE TABLE `NPRClassComponent`
 (
	`ClassComponentID`			int, 
	`ClassID`			int, 
	`ComponentID`			int, 
	`NumComponent`			float, 
	`ChanceToHit`			int, 
	`ElectronicCTH`			int
);

-- CREATE INDEXES ...
ALTER TABLE `NPRClassComponent` ADD UNIQUE INDEX `NPRClassComponent_ClassComponentID_idx` (`ClassComponentID`);
ALTER TABLE `NPRClassComponent` ADD INDEX `NPRClassComponent_ClassID_idx` (`ClassID`);
ALTER TABLE `NPRClassComponent` ADD INDEX `NPRClassComponent_ComponentID_idx` (`ComponentID`);
ALTER TABLE `NPRClassComponent` ADD INDEX `NPRClassComponent_NumComponent_idx` (`NumComponent`);
ALTER TABLE `NPRClassComponent` ADD PRIMARY KEY (`ClassComponentID`);

CREATE TABLE `NPRClasses`
 (
	`NPRClassID`			int, 
	`NPRRaceType`			int, 
	`NPRClassType`			int, 
	`ResupplyPDC`			char NOT NULL, 
	`MaxChance`			int, 
	`HullDescriptionID`			int, 
	`FighterClass`			char NOT NULL, 
	`ArmourThickness`			int, 
	`ArmourWidth`			int, 
	`ParasiteCapacity`			int, 
	`ClassName`			varchar (100), 
	`ClassDesignDisplay`			text (255), 
	`Cost`			float, 
	`Size`			float, 
	`ClassType`			int, 
	`ClassThermal`			float, 
	`ClassCrossSection`			float, 
	`RankRequired`			int, 
	`RankSetManually`			int, 
	`ProtectionValue`			float, 
	`EnginePower`			int, 
	`FuelEfficiency`			float, 
	`FuelCapacity`			int, 
	`Harvesters`			int, 
	`Terraformers`			int, 
	`MiningModules`			int, 
	`MaintModules`			int, 
	`SalvageRate`			int, 
	`Spares`			int, 
	`MaxSpeed`			int, 
	`ShieldTypeID`			int, 
	`ShieldStrength`			int, 
	`ShieldRechargeRate`			int, 
	`DailyShieldCost`			int, 
	`ReactorPower`			int, 
	`RequiredPower`			int, 
	`DCRating`			int, 
	`DCSystems`			int, 
	`LifeSupport`			int, 
	`JumpRating`			int, 
	`JumpDistance`			int, 
	`Crew`			int, 
	`PassiveSensorStrength`			int, 
	`ActiveSensorStrength`			int, 
	`EMSensorStrength`			int, 
	`GravSurvey`			int, 
	`GeoSurvey`			int, 
	`ECM`			int, 
	`ControlRating`			int, 
	`NameTypeID`			int, 
	`TotalNumber`			int, 
	`CargoCapacity`			float, 
	`ColonistCapacity`			int, 
	`MagazineCapacity`			float, 
	`TroopCapacity`			int, 
	`DropCapacity`			int, 
	`CyroDropCapable`			char NOT NULL, 
	`JGConstructionTime`			int, 
	`TractorStrength`			int, 
	`STSTractor`			int, 
	`Obsolete`			int, 
	`Collier`			int, 
	`Freighter`			char NOT NULL, 
	`NonCombat`			char NOT NULL, 
	`HyperDrive`			char NOT NULL, 
	`FuelTanker`			int, 
	`ConscriptOnly`			int, 
	`Notes`			text (255), 
	`MaxDACRoll`			int, 
	`ESMaxDACRoll`			int, 
	`Locked`			char NOT NULL, 
	`FlagBridge`			char NOT NULL, 
	`BaseFailureChance`			int, 
	`PreTNT`			char NOT NULL, 
	`PlannedDeployment`			float
);

-- CREATE INDEXES ...
ALTER TABLE `NPRClasses` ADD INDEX `NPRClasses_ClassID_idx` (`NPRClassID`);
ALTER TABLE `NPRClasses` ADD INDEX `NPRClasses_HullDescriptionID_idx` (`HullDescriptionID`);
ALTER TABLE `NPRClasses` ADD PRIMARY KEY (`NPRClassID`);
ALTER TABLE `NPRClasses` ADD INDEX `NPRClasses_RaceID_idx` (`NPRRaceType`);
ALTER TABLE `NPRClasses` ADD INDEX `NPRClasses_ShieldTypeID_idx` (`ShieldTypeID`);

CREATE TABLE `NPRClassMaterials`
 (
	`ClassMaterials`			int, 
	`ClassID`			int, 
	`MaterialID`			int, 
	`Amount`			float
);

-- CREATE INDEXES ...
ALTER TABLE `NPRClassMaterials` ADD INDEX `NPRClassMaterials_ClassID_idx` (`ClassID`);
ALTER TABLE `NPRClassMaterials` ADD UNIQUE INDEX `NPRClassMaterials_MaterialID_idx` (`MaterialID`);
ALTER TABLE `NPRClassMaterials` ADD PRIMARY KEY (`ClassMaterials`);

CREATE TABLE `NPRClassOrdnance`
 (
	`ClassOrdnanceID`			int, 
	`ShipClassID`			int, 
	`MissileID`			int, 
	`Amount`			int
);

-- CREATE INDEXES ...
ALTER TABLE `NPRClassOrdnance` ADD INDEX `NPRClassOrdnance_ClassOrdnanceID_idx` (`ClassOrdnanceID`);
ALTER TABLE `NPRClassOrdnance` ADD UNIQUE INDEX `NPRClassOrdnance_Number_idx` (`Amount`);
ALTER TABLE `NPRClassOrdnance` ADD INDEX `NPRClassOrdnance_OrdnanceID1_idx` (`MissileID`);
ALTER TABLE `NPRClassOrdnance` ADD PRIMARY KEY (`ClassOrdnanceID`);
ALTER TABLE `NPRClassOrdnance` ADD INDEX `NPRClassOrdnance_ShipClassID_idx` (`ShipClassID`);

CREATE TABLE `NPRClassType`
 (
	`NPRClassTypeID`			int, 
	`Description`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `NPRClassType` ADD INDEX `NPRClassType_NPRClassTypeID_idx` (`NPRClassTypeID`);
ALTER TABLE `NPRClassType` ADD PRIMARY KEY (`NPRClassTypeID`);

CREATE TABLE `NPRFleetType`
 (
	`NPRFleetTypeID`			int, 
	`Description`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `NPRFleetType` ADD INDEX `NPRFleetType_NPRFleetTypeID_idx` (`NPRFleetTypeID`);
ALTER TABLE `NPRFleetType` ADD PRIMARY KEY (`NPRFleetTypeID`);

CREATE TABLE `NPRRaceType`
 (
	`NPRRaceTypeID`			int, 
	`Description`			varchar (100), 
	`MaxChance`			int
);

-- CREATE INDEXES ...
ALTER TABLE `NPRRaceType` ADD INDEX `NPRRaceType_NPRRaceTypeID_idx` (`NPRRaceTypeID`);
ALTER TABLE `NPRRaceType` ADD PRIMARY KEY (`NPRRaceTypeID`);

CREATE TABLE `NPRResearchQueue`
 (
	`QueueID`			int, 
	`TechSystemID`			int, 
	`NPRID`			int, 
	`SpecializationID`			int, 
	`ResearchOrder`			int
);

-- CREATE INDEXES ...
ALTER TABLE `NPRResearchQueue` ADD INDEX `NPRResearchQueue_NPRID_idx` (`NPRID`);
ALTER TABLE `NPRResearchQueue` ADD PRIMARY KEY (`QueueID`);
ALTER TABLE `NPRResearchQueue` ADD INDEX `NPRResearchQueue_ResSpecID_idx` (`SpecializationID`);
ALTER TABLE `NPRResearchQueue` ADD INDEX `NPRResearchQueue_TechSystemID_idx` (`TechSystemID`);

CREATE TABLE `NumOrder`
 (
	`BasicNumber`			int, 
	`Extension`			varchar (20), 
	`Full`			varchar (80), 
	`NumberText`			varchar (24), 
	`ShortExtension`			varchar (8)
);

-- CREATE INDEXES ...
ALTER TABLE `NumOrder` ADD INDEX `NumOrder_NumberText_idx` (`NumberText`);
ALTER TABLE `NumOrder` ADD PRIMARY KEY (`BasicNumber`);

CREATE TABLE `OrderTemplate`
 (
	`OrderTemplateID`			int, 
	`SystemID`			int, 
	`RaceID`			int, 
	`TemplateName`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `OrderTemplate` ADD INDEX `OrderTemplate_OrderTemplateID_idx` (`OrderTemplateID`);
ALTER TABLE `OrderTemplate` ADD PRIMARY KEY (`OrderTemplateID`);
ALTER TABLE `OrderTemplate` ADD INDEX `OrderTemplate_RaceID_idx` (`RaceID`);
ALTER TABLE `OrderTemplate` ADD INDEX `OrderTemplate_SystemID_idx` (`SystemID`);

CREATE TABLE `OuterPlanets`
 (
	`TableID`			int, 
	`MaxChance`			int, 
	`TypeID`			int, 
	`TrojanID`			int, 
	`DoublePlanet`			char NOT NULL, 
	`Rogue`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `OuterPlanets` ADD UNIQUE INDEX `OuterPlanets_DoubleID_idx` (`DoublePlanet`);
ALTER TABLE `OuterPlanets` ADD UNIQUE INDEX `OuterPlanets_PlanetaryTypeID_idx` (`TableID`);
ALTER TABLE `OuterPlanets` ADD PRIMARY KEY (`TableID`);
ALTER TABLE `OuterPlanets` ADD UNIQUE INDEX `OuterPlanets_SecondPlanetID_idx` (`TrojanID`);

CREATE TABLE `PausedResearch`
 (
	`TechSystemID`			int, 
	`PopulationID`			int, 
	`PointsAccumulated`			int
);

-- CREATE INDEXES ...
ALTER TABLE `PausedResearch` ADD UNIQUE INDEX `PausedResearch_PopulationID_idx` (`PopulationID`);
ALTER TABLE `PausedResearch` ADD PRIMARY KEY (`TechSystemID`, `PopulationID`);
ALTER TABLE `PausedResearch` ADD UNIQUE INDEX `PausedResearch_TechSystemID_idx` (`TechSystemID`);

CREATE TABLE `PDModes`
 (
	`PDModeID`			int, 
	`Description`			varchar (100), 
	`TargetMultiple`			int, 
	`BeamOption`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `PDModes` ADD INDEX `PDModes_PDModeID_idx` (`PDModeID`);
ALTER TABLE `PDModes` ADD PRIMARY KEY (`PDModeID`);

CREATE TABLE `PhoneticNames`
 (
	`PhoneticID`			int, 
	`PhoneticName`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `PhoneticNames` ADD INDEX `PhoneticNames_PhoneticID_idx` (`PhoneticID`);
ALTER TABLE `PhoneticNames` ADD PRIMARY KEY (`PhoneticID`);

CREATE TABLE `PlanetaryInstallation`
 (
	`PlanetaryInstallationID`			int, 
	`Name`			varchar (100), 
	`Description`			varchar (100), 
	`TargetSize`			int, 
	`Cost`			int, 
	`PBDamage`			char NOT NULL, 
	`SwarmUse`			char NOT NULL, 
	`CI`			char NOT NULL, 
	`NoBuild`			char NOT NULL, 
	`CivMove`			char NOT NULL, 
	`DisplayOrder`			float, 
	`Manned`			char NOT NULL, 
	`RequiredTechID`			int, 
	`MaxChance`			int, 
	`TotalDamaged`			int, 
	`Duranium`			float, 
	`Neutronium`			float, 
	`Corbomite`			float, 
	`Tritanium`			float, 
	`Boronide`			float, 
	`Mercassium`			float, 
	`Vendarite`			float, 
	`Sorium`			float, 
	`Uridium`			float, 
	`Corundium`			float, 
	`Gallicite`			float
);

-- CREATE INDEXES ...
ALTER TABLE `PlanetaryInstallation` ADD INDEX `PlanetaryInstallation_PlanetaryInstallationID_idx` (`PlanetaryInstallationID`);
ALTER TABLE `PlanetaryInstallation` ADD PRIMARY KEY (`PlanetaryInstallationID`);

CREATE TABLE `PlanetaryType`
 (
	`PlanetaryTypeID`			int, 
	`Type`			varchar (40)
);

-- CREATE INDEXES ...
ALTER TABLE `PlanetaryType` ADD INDEX `PlanetaryType_PlanetarTypeID_idx` (`PlanetaryTypeID`);
ALTER TABLE `PlanetaryType` ADD PRIMARY KEY (`PlanetaryTypeID`);

CREATE TABLE `PoliticalTreaty`
 (
	`PoliticalTreatyID`			int, 
	`Name`			varchar (100), 
	`ContactStatus`			int, 
	`SuccessMod`			int, 
	`DisplayOrder`			int, 
	`AnnualPoliticalModifier`			int, 
	`Penalty`			int, 
	`Description`			varchar (400)
);

-- CREATE INDEXES ...
ALTER TABLE `PoliticalTreaty` ADD PRIMARY KEY (`PoliticalTreatyID`);

CREATE TABLE `PopBombardRating`
 (
	`PopulationID`			int, 
	`BombardRaceID`			int, 
	`PopRaceID`			int, 
	`GameID`			int, 
	`BombardRating`			float, 
	`BombardRatingThisInc`			float, 
	`SectorCommand`			float, 
	`MaintenanceFacility`			float, 
	`CommercialFreight`			float, 
	`Infrastructure`			float, 
	`Population`			float, 
	`Mines`			float, 
	`RemoteMines`			float, 
	`FuelRefineries`			float, 
	`CivilianMiningComplex`			float, 
	`ConstructionFactories`			float, 
	`OrdnanceFactories`			float, 
	`FighterFactories`			float, 
	`ConventionalFactories`			float, 
	`GFTF`			float, 
	`NavalAcademies`			float, 
	`FinancialCentre`			float, 
	`CivilianSpaceCentre`			float, 
	`Sensors`			float, 
	`Terraforming`			float, 
	`ResearchLabs`			float, 
	`GeneticModificationCentre`			float, 
	`Shipyards`			float, 
	`MassDriver`			float, 
	`Spaceport`			float, 
	`SlipwayHits`			int, 
	`ShipyardHits`			int, 
	`Hits`			int, 
	`TotalDamageTaken`			int, 
	`UpdateThisIncrement`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `PopBombardRating` ADD INDEX `PopBombardRating_BombardRaceID_idx` (`BombardRaceID`);
ALTER TABLE `PopBombardRating` ADD INDEX `PopBombardRating_GameID_idx` (`GameID`);
ALTER TABLE `PopBombardRating` ADD INDEX `PopBombardRating_PopRaceID_idx` (`PopRaceID`);
ALTER TABLE `PopBombardRating` ADD INDEX `PopBombardRating_PopulationID_idx` (`PopulationID`);
ALTER TABLE `PopBombardRating` ADD PRIMARY KEY (`PopulationID`, `BombardRaceID`);

CREATE TABLE `PopInstallationDemand`
 (
	`PopInstID`			int, 
	`PopulationID`			int, 
	`InstallationID`			int, 
	`Amount`			float, 
	`Demand`			char NOT NULL, 
	`ActionID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `PopInstallationDemand` ADD INDEX `PopInstallationDemand_ActionID_idx` (`ActionID`);
ALTER TABLE `PopInstallationDemand` ADD UNIQUE INDEX `PopInstallationDemand_InstallationID_idx` (`InstallationID`);
ALTER TABLE `PopInstallationDemand` ADD INDEX `PopInstallationDemand_PopInstID_idx` (`PopInstID`);
ALTER TABLE `PopInstallationDemand` ADD INDEX `PopInstallationDemand_PopulationID_idx` (`PopulationID`);
ALTER TABLE `PopInstallationDemand` ADD PRIMARY KEY (`PopInstID`);

CREATE TABLE `PopMDChanges`
 (
	`PopulationID`			int, 
	`Duranium`			float, 
	`Neutronium`			float, 
	`Corbomite`			float, 
	`Tritanium`			float, 
	`Boronide`			float, 
	`Mercassium`			float, 
	`Vendarite`			float, 
	`Sorium`			float, 
	`Uridium`			float, 
	`Corundium`			float, 
	`Gallicite`			float
);

-- CREATE INDEXES ...
ALTER TABLE `PopMDChanges` ADD UNIQUE INDEX `PopMDChanges_PopulationID_idx` (`PopulationID`);
ALTER TABLE `PopMDChanges` ADD PRIMARY KEY (`PopulationID`);

CREATE TABLE `PopMDChangesTemp`
 (
	`PopulationID`			int, 
	`Duranium`			float, 
	`Neutronium`			float, 
	`Corbomite`			float, 
	`Tritanium`			float, 
	`Boronide`			float, 
	`Mercassium`			float, 
	`Vendarite`			float, 
	`Sorium`			float, 
	`Uridium`			float, 
	`Corundium`			float, 
	`Gallicite`			float
);

-- CREATE INDEXES ...
ALTER TABLE `PopMDChangesTemp` ADD UNIQUE INDEX `PopMDChangesTemp_PopulationID_idx` (`PopulationID`);
ALTER TABLE `PopMDChangesTemp` ADD PRIMARY KEY (`PopulationID`);

CREATE TABLE `PopPoliticalStatus`
 (
	`StatusID`			int, 
	`StatusName`			varchar (100), 
	`ProductionMod`			float, 
	`WealthMod`			float, 
	`SPRequired`			int, 
	`NextStatusID`			int, 
	`OccupationForceMod`			float, 
	`ProtectionRequired`			float, 
	`ServiceSector`			float
);

-- CREATE INDEXES ...
ALTER TABLE `PopPoliticalStatus` ADD INDEX `PopPoliticalStatus_NextStatusID_idx` (`NextStatusID`);
ALTER TABLE `PopPoliticalStatus` ADD PRIMARY KEY (`StatusID`);

CREATE TABLE `PopTradeBalance`
 (
	`PopulationID`			int, 
	`TradeGoodID`			int, 
	`GameID`			int, 
	`ProductionRate`			float, 
	`TradeBalance`			float, 
	`LastTradeBalance`			float, 
	`Priority`			int
);

-- CREATE INDEXES ...
ALTER TABLE `PopTradeBalance` ADD INDEX `PopTradeBalance_GameID_idx` (`GameID`);
ALTER TABLE `PopTradeBalance` ADD UNIQUE INDEX `PopTradeBalance_PopulationID_idx` (`PopulationID`);
ALTER TABLE `PopTradeBalance` ADD PRIMARY KEY (`PopulationID`, `TradeGoodID`);
ALTER TABLE `PopTradeBalance` ADD INDEX `PopTradeBalance_TradeGoodID_idx` (`TradeGoodID`);

CREATE TABLE `Population`
 (
	`PopulationID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`SpeciesID`			int, 
	`GroundCombatPop`			char NOT NULL, 
	`GenModSpeciesID`			int, 
	`SystemID`			int, 
	`SystemBodyID`			int, 
	`LastColonyCost`			float, 
	`PoliticalStatus`			int, 
	`StatusPoints`			float, 
	`UnrestPoints`			float, 
	`PreviousUnrest`			float, 
	`AutoManage`			char NOT NULL, 
	`ColonistDestination`			int, 
	`MiningPop`			char NOT NULL, 
	`NoStatusChange`			int, 
	`FighterDestFleetID`			int, 
	`Capital`			char NOT NULL, 
	`Population`			float, 
	`Spaceport`			float, 
	`GroundAttackID`			int, 
	`GroundAttackType`			int, 
	`SectorCommand`			float, 
	`MaintenanceFacility`			float, 
	`TempMF`			int, 
	`CivilianMiningComplex`			int, 
	`CMCActive`			char NOT NULL, 
	`ReqInf`			int, 
	`Infrastructure`			float, 
	`UndergroundInfrastructure`			float, 
	`Mines`			float, 
	`RemoteMines`			float, 
	`FuelRefineries`			float, 
	`FighterFactories`			float, 
	`ConstructionFactories`			float, 
	`OrdnanceFactories`			int, 
	`ConventionalFactories`			float, 
	`GFTF`			float, 
	`NavalAcademies`			float, 
	`FinancialCentre`			float, 
	`AcademyCrewmen`			int, 
	`AcademyOfficers`			float, 
	`FuelProdStatus`			char NOT NULL, 
	`FuelStockpile`			float, 
	`MaintenanceStockpile`			float, 
	`Sensors`			float, 
	`Terraforming`			float, 
	`ResearchLabs`			float, 
	`GeneticModificationCentre`			float, 
	`MassDriver`			float, 
	`MassDriverDest`			int, 
	`Efficiency`			float, 
	`TerraformingGasID`			int, 
	`chkTerraAdd`			int, 
	`MaxAtm`			float, 
	`Duranium`			float, 
	`Neutronium`			float, 
	`Corbomite`			float, 
	`Tritanium`			float, 
	`Boronide`			float, 
	`Mercassium`			float, 
	`Vendarite`			float, 
	`Sorium`			float, 
	`Uridium`			float, 
	`Corundium`			float, 
	`Gallicite`			float, 
	`LastDuranium`			float, 
	`LastNeutronium`			float, 
	`LastCorbomite`			float, 
	`LastTritanium`			float, 
	`LastBoronide`			float, 
	`LastMercassium`			float, 
	`LastVendarite`			float, 
	`LastSorium`			float, 
	`LastUridium`			float, 
	`LastCorundium`			float, 
	`LastGallicite`			float, 
	`ReserveDuranium`			float, 
	`ReserveNeutronium`			float, 
	`ReserveCorbomite`			float, 
	`ReserveTritanium`			float, 
	`ReserveBoronide`			float, 
	`ReserveMercassium`			float, 
	`ReserveVendarite`			float, 
	`ReserveSorium`			float, 
	`ReserveUridium`			float, 
	`ReserveCorundium`			float, 
	`ReserveGallicite`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Population` ADD UNIQUE INDEX `Population_GameID_idx` (`GameID`);
ALTER TABLE `Population` ADD INDEX `Population_GroundAttackID_idx` (`GroundAttackID`);
ALTER TABLE `Population` ADD INDEX `Population_PopulationID_idx` (`PopulationID`);
ALTER TABLE `Population` ADD PRIMARY KEY (`PopulationID`);
ALTER TABLE `Population` ADD INDEX `Population_RaceID_idx` (`RaceID`);
ALTER TABLE `Population` ADD UNIQUE INDEX `Population_SpeciesID_idx` (`SpeciesID`);
ALTER TABLE `Population` ADD INDEX `Population_SystemID_idx` (`SystemBodyID`);
ALTER TABLE `Population` ADD UNIQUE INDEX `Population_SystemID1_idx` (`SystemID`);

CREATE TABLE `POW`
 (
	`POWID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`PopulationID`			int, 
	`PowRaceID`			int, 
	`PowSpeciesID`			int, 
	`TotalPOW`			int
);

-- CREATE INDEXES ...
ALTER TABLE `POW` ADD INDEX `POW_GameID_idx` (`GameID`);
ALTER TABLE `POW` ADD INDEX `POW_GuardingRaceID_idx` (`PopulationID`);
ALTER TABLE `POW` ADD INDEX `POW_POWID_idx` (`POWID`);
ALTER TABLE `POW` ADD INDEX `POW_PowRaceID_idx` (`PowRaceID`);
ALTER TABLE `POW` ADD INDEX `POW_PowSpeciesID_idx` (`PowSpeciesID`);
ALTER TABLE `POW` ADD PRIMARY KEY (`POWID`);
ALTER TABLE `POW` ADD INDEX `POW_RaceID_idx` (`RaceID`);

CREATE TABLE `PrefabPDCs`
 (
	`PDCPrefabID`			int, 
	`PopulationID`			int, 
	`PrefabID`			int, 
	`NumComponents`			float
);

-- CREATE INDEXES ...
ALTER TABLE `PrefabPDCs` ADD INDEX `PrefabPDCs_NumComponents_idx` (`NumComponents`);
ALTER TABLE `PrefabPDCs` ADD UNIQUE INDEX `PrefabPDCs_PDCPrefabID_idx` (`PDCPrefabID`);
ALTER TABLE `PrefabPDCs` ADD INDEX `PrefabPDCs_PopID_idx` (`PopulationID`);
ALTER TABLE `PrefabPDCs` ADD UNIQUE INDEX `PrefabPDCs_PrefabID_idx` (`PrefabID`);
ALTER TABLE `PrefabPDCs` ADD PRIMARY KEY (`PDCPrefabID`);

CREATE TABLE `ProductionQueue`
 (
	`ProductionQueueID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`PopulationID`			int, 
	`SpeciesID`			int, 
	`ProductionType`			int, 
	`ProductionID`			int, 
	`RefitClassID`			int, 
	`Prefab`			char NOT NULL, 
	`Assembly`			char NOT NULL, 
	`Amount`			float, 
	`CreationOrder`			int, 
	`ProdPerUnit`			float, 
	`Description`			varchar (100), 
	`FuelRequired`			int, 
	`Duranium`			float, 
	`Neutronium`			float, 
	`Corbomite`			float, 
	`Tritanium`			float, 
	`Boronide`			float, 
	`Mercassium`			float, 
	`Vendarite`			float, 
	`Sorium`			float, 
	`Uridium`			float, 
	`Corundium`			float, 
	`Gallicite`			float, 
	`Pause`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `ProductionQueue` ADD INDEX `ProductionQueue_GameID_idx` (`GameID`);
ALTER TABLE `ProductionQueue` ADD PRIMARY KEY (`ProductionQueueID`);
ALTER TABLE `ProductionQueue` ADD INDEX `ProductionQueue_ProductionID_idx` (`ProductionID`);
ALTER TABLE `ProductionQueue` ADD UNIQUE INDEX `ProductionQueue_ProductionQueueID_idx` (`ProductionQueueID`);
ALTER TABLE `ProductionQueue` ADD INDEX `ProductionQueue_RaceID_idx` (`RaceID`);
ALTER TABLE `ProductionQueue` ADD UNIQUE INDEX `ProductionQueue_SystemBodyID_idx` (`PopulationID`);

CREATE TABLE `ProductionType`
 (
	`ProductionTypeID`			int, 
	`Description`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `ProductionType` ADD PRIMARY KEY (`ProductionTypeID`);
ALTER TABLE `ProductionType` ADD INDEX `ProductionType_ProductionTypeID_idx` (`ProductionTypeID`);

CREATE TABLE `ProtoPlanets`
 (
	`TableID`			int, 
	`MaxChance`			int, 
	`TypeID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ProtoPlanets` ADD INDEX `ProtoPlanets_PlanetaryTypeID_idx` (`TableID`);
ALTER TABLE `ProtoPlanets` ADD PRIMARY KEY (`TableID`);

CREATE TABLE `Race`
 (
	`RaceID`			int, 
	`GameID`			int, 
	`ConventionalStart`			char NOT NULL, 
	`NPR`			char NOT NULL, 
	`SpecialNPRID`			int, 
	`Precursor`			char NOT NULL, 
	`StarSwarm`			char NOT NULL, 
	`PreIndustrial`			char NOT NULL, 
	`DefaultSpeciesID`			int, 
	`RaceTitle`			varchar (200), 
	`RaceName`			varchar (100), 
	`WealthPoints`			float, 
	`PreviousWealth`			float, 
	`StartingWealth`			float, 
	`AnnualWealth`			int, 
	`GovTypeID`			int, 
	`RaceGridSize`			int, 
	`UnreadMessages`			char NOT NULL, 
	`FlagPic`			varchar (400), 
	`ThemeTune`			varchar (200), 
	`HullPic`			varchar (200), 
	`Default`			int, 
	`Contacts`			int NOT NULL, 
	`Colour`			int, 
	`Red`			int, 
	`Green`			int, 
	`Blue`			int, 
	`InvertText`			int, 
	`Password`			varchar (50), 
	`ThemeID`			int, 
	`NameThemeID`			int, 
	`SystemSummary`			int, 
	`ChartShow`			int, 
	`MinSystem`			int, 
	`MaxSystem`			int, 
	`MapSize`			int, 
	`DisplayGrade`			int, 
	`ShowHighlight`			int, 
	`MapRed`			int, 
	`MapGreen`			int, 
	`MapBlue`			int, 
	`FleetViewOption`			int, 
	`SelectRace`			int, 
	`FleetsVisible`			char NOT NULL, 
	`LastMapSystemViewed`			int, 
	`chkAllowAny`			int, 
	`chkAutoAssign`			int, 
	`chkTons`			int, 
	`StandardTour`			int, 
	`LastAssignment`			float, 
	`CurrentXenophobia`			int
);

-- CREATE INDEXES ...
ALTER TABLE `Race` ADD UNIQUE INDEX `Race_GameID_idx` (`GameID`);
ALTER TABLE `Race` ADD INDEX `Race_GovTypeID_idx` (`GovTypeID`);
ALTER TABLE `Race` ADD INDEX `Race_ParentRaceID_idx` (`DefaultSpeciesID`);
ALTER TABLE `Race` ADD PRIMARY KEY (`RaceID`);
ALTER TABLE `Race` ADD INDEX `Race_RaceID_idx` (`RaceID`);
ALTER TABLE `Race` ADD UNIQUE INDEX `Race_ThemeID_idx` (`ThemeID`);

CREATE TABLE `RaceClassName`
 (
	`RaceClassNameID`			int, 
	`RaceID`			int, 
	`RaceClassName`			varchar (60)
);

-- CREATE INDEXES ...
ALTER TABLE `RaceClassName` ADD PRIMARY KEY (`RaceClassNameID`);
ALTER TABLE `RaceClassName` ADD INDEX `RaceClassName_RaceClassNameID_idx` (`RaceClassNameID`);
ALTER TABLE `RaceClassName` ADD UNIQUE INDEX `RaceClassName_RaceID_idx` (`RaceID`);

CREATE TABLE `RaceDesignTech`
 (
	`RaceTechID`			int, 
	`TechID`			int, 
	`RaceID`			int, 
	`Obsolete`			char NOT NULL, 
	`KnownTech`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `RaceDesignTech` ADD PRIMARY KEY (`RaceTechID`);
ALTER TABLE `RaceDesignTech` ADD INDEX `RaceDesignTech_RaceID_idx` (`RaceID`);
ALTER TABLE `RaceDesignTech` ADD INDEX `RaceDesignTech_RaceTechID_idx` (`RaceTechID`);
ALTER TABLE `RaceDesignTech` ADD INDEX `RaceDesignTech_TechID_idx` (`TechID`);

CREATE TABLE `RaceMapDisplay`
 (
	`RaceMapDisplayID`			int, 
	`RaceID`			int, 
	`chkNames`			int, 
	`chkSysNum`			int, 
	`chkControl`			int, 
	`chkOldControl`			int, 
	`chkFleet`			int, 
	`chkICN`			int, 
	`chkICNCost`			int, 
	`chkWP`			int, 
	`chkWPSurvey`			int, 
	`chkSBS`			int, 
	`chkUnCol`			int, 
	`chkAlien`			int, 
	`chkHidden`			int, 
	`chkSector`			int, 
	`chkSectorName`			int, 
	`chkAlienFleet`			int, 
	`chkClosedWP`			int, 
	`chkPop400`			int, 
	`chk710`			int, 
	`chk710UnCol`			int, 
	`chkAnyPop`			int, 
	`chkSN`			int, 
	`chkShipyard`			int, 
	`chkTextProd`			int, 
	`chkCap`			int, 
	`chk4`			int, 
	`chkCBU`			int, 
	`chkProduction`			int, 
	`chkFleetSupply`			int, 
	`chkShowSupply`			int, 
	`chkSLP`			int, 
	`ZoomSetting`			float, 
	`chkHideObsolete`			int, 
	`chkSecurity`			int, 
	`chkStarType`			int, 
	`chkShowDistance`			int, 
	`chkControlColour`			int
);

-- CREATE INDEXES ...
ALTER TABLE `RaceMapDisplay` ADD UNIQUE INDEX `RaceMapDisplay_chkSysNum_idx` (`chkSysNum`);
ALTER TABLE `RaceMapDisplay` ADD PRIMARY KEY (`RaceMapDisplayID`);
ALTER TABLE `RaceMapDisplay` ADD UNIQUE INDEX `RaceMapDisplay_RaceID_idx` (`RaceID`);
ALTER TABLE `RaceMapDisplay` ADD UNIQUE INDEX `RaceMapDisplay_RaceMapDisplayID_idx` (`RaceMapDisplayID`);

CREATE TABLE `RaceModifiers`
 (
	`RaceModifierID`			int, 
	`RaceID`			int, 
	`GameID`			int, 
	`AcademyCrewmen`			int, 
	`OrdnanceCapacity`			float, 
	`FighterCapacity`			float, 
	`ShipBuilding`			float, 
	`FuelProduction`			float, 
	`MSProduction`			float, 
	`ConstructionProduction`			float, 
	`OrdnanceProduction`			float, 
	`FighterProduction`			float, 
	`MineProduction`			float, 
	`Research`			int, 
	`PlanetarySensorStrength`			int, 
	`TrainingLevel`			int, 
	`GUStrength`			int, 
	`GUTrained`			int, 
	`TerraformingRate`			float, 
	`ColonizationSkill`			float, 
	`StartTechPoints`			int, 
	`StartBuildPoints`			int, 
	`StartPDCPoints`			int, 
	`WealthCreationRate`			float, 
	`EconomicProdModifier`			float, 
	`ShipyardOperations`			float
);

-- CREATE INDEXES ...
ALTER TABLE `RaceModifiers` ADD INDEX `RaceModifiers_GameID_idx` (`GameID`);
ALTER TABLE `RaceModifiers` ADD PRIMARY KEY (`RaceModifierID`);
ALTER TABLE `RaceModifiers` ADD INDEX `RaceModifiers_RaceID_idx` (`RaceID`);

CREATE TABLE `RaceSurveyLocation`
 (
	`RaceSurveyLocationID`			int, 
	`RaceID`			int, 
	`SystemID`			int, 
	`LocationID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `RaceSurveyLocation` ADD INDEX `RaceSurveyLocation_LocationID_idx` (`LocationID`);
ALTER TABLE `RaceSurveyLocation` ADD PRIMARY KEY (`RaceSurveyLocationID`);
ALTER TABLE `RaceSurveyLocation` ADD INDEX `RaceSurveyLocation_RaceID_idx` (`RaceID`);
ALTER TABLE `RaceSurveyLocation` ADD UNIQUE INDEX `RaceSurveyLocation_SystemID_idx` (`SystemID`);

CREATE TABLE `RaceSysMapDisplay`
 (
	`RaceID`			int, 
	`Hostile`			int, 
	`Neutral`			int, 
	`Friendly`			int, 
	`Allied`			int, 
	`Civilian`			int, 
	`ContactFilter`			int, 
	`HideCMC`			int, 
	`DisplayFunction`			int, 
	`chkPlanets`			int, 
	`chkDwarf`			int, 
	`chkMoons`			int, 
	`chkAst`			int, 
	`chkWP`			int, 
	`chkStarOrbits`			int, 
	`chkPlanetOrbits`			int, 
	`chkDwarfOrbits`			int, 
	`chkMoonOrbits`			int, 
	`chkAsteroidOrbits`			int, 
	`chkStarNames`			int, 
	`chkPlanetNames`			int, 
	`chkDwarfNames`			int, 
	`chkMoonNames`			int, 
	`chkAstNames`			int, 
	`chkFleets`			int, 
	`chkMoveTail`			int, 
	`chkColonies`			int, 
	`chkCentre`			int, 
	`chkSL`			int, 
	`chkWaypoint`			int, 
	`chkOrder`			int, 
	`chkNoOverlap`			int, 
	`chkSensors`			int, 
	`chkActiveSensors`			int, 
	`chkSignature`			int, 
	`chkShowContacts`			int, 
	`chkTracking`			int, 
	`chkActiveOnly`			int, 
	`chkShowDist`			int, 
	`chkSBSurvey`			int, 
	`chkMinerals`			int, 
	`chkCometPath`			int, 
	`chkAstColOnly`			int, 
	`chkAstMinOnly`			int, 
	`chkGravFields`			int, 
	`chkTAD`			int, 
	`chkFiringRanges`			int, 
	`chkSalvoOrigin`			int, 
	`chkSalvoTarget`			int, 
	`chkEscorts`			int, 
	`chkFireControlRange`			int, 
	`PassiveSensor`			int, 
	`ActiveSensor`			int, 
	`DetRange`			int, 
	`chkHideIDs`			int, 
	`chkHideSL`			int, 
	`chkEvents`			int, 
	`chkPackets`			int, 
	`chkMPC`			int, 
	`chkLifepods`			int, 
	`chkWrecks`			int, 
	`chkHostileSensors`			int, 
	`chkOwnPops`			int, 
	`chkGeoPoints`			int, 
	`chkBearing`			int, 
	`chkCoordinates`			int, 
	`chkLostContacts`			int, 
	`chkHideCivNames`			int
);

-- CREATE INDEXES ...
ALTER TABLE `RaceSysMapDisplay` ADD PRIMARY KEY (`RaceID`);
ALTER TABLE `RaceSysMapDisplay` ADD INDEX `RaceSysMapDisplay_RaceID_idx` (`RaceID`);

CREATE TABLE `RaceSysSurvey`
 (
	`RaceSysSurveyID`			int, 
	`RaceID`			int NOT NULL, 
	`SystemID`			int NOT NULL, 
	`Name`			varchar (70) NOT NULL, 
	`DangerRating`			int, 
	`SysTPStatus`			char NOT NULL, 
	`ControlRaceID`			int, 
	`OldControlID`			int, 
	`ForeignFleetRaceID`			int, 
	`SectorID`			int, 
	`NameThemeID`			int, 
	`Probe`			char NOT NULL, 
	`NotEntered`			int, 
	`Discovered`			varchar (60), 
	`Xcor`			int NOT NULL, 
	`Ycor`			int NOT NULL, 
	`LastSaved`			int, 
	`ClosedWP`			int, 
	`SurveyDone`			char NOT NULL, 
	`GeoSurveyDone`			char NOT NULL, 
	`SelectedBodyXcor`			float, 
	`SelectedBodyYcor`			float, 
	`KmPerTwip`			float, 
	`NumKmJump`			float, 
	`RadiusChecked`			int
);

-- CREATE INDEXES ...
ALTER TABLE `RaceSysSurvey` ADD INDEX `RaceSysSurvey_ControlRaceID_idx` (`ControlRaceID`);
ALTER TABLE `RaceSysSurvey` ADD UNIQUE INDEX `RaceSysSurvey_NumKmJump_idx` (`NumKmJump`);
ALTER TABLE `RaceSysSurvey` ADD PRIMARY KEY (`RaceSysSurveyID`);
ALTER TABLE `RaceSysSurvey` ADD INDEX `RaceSysSurvey_RaceID_idx` (`RaceID`);
ALTER TABLE `RaceSysSurvey` ADD INDEX `RaceSysSurvey_SectorID_idx` (`SectorID`);
ALTER TABLE `RaceSysSurvey` ADD UNIQUE INDEX `RaceSysSurvey_SystemID_idx` (`SystemID`);

CREATE TABLE `RaceTech`
 (
	`RaceTechID`			int, 
	`TechID`			int, 
	`RaceID`			int, 
	`Obsolete`			char NOT NULL, 
	`KnownTech`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `RaceTech` ADD PRIMARY KEY (`RaceTechID`);
ALTER TABLE `RaceTech` ADD INDEX `RaceTech_RaceID_idx` (`RaceID`);
ALTER TABLE `RaceTech` ADD INDEX `RaceTech_RaceTechID_idx` (`RaceTechID`);
ALTER TABLE `RaceTech` ADD INDEX `RaceTech_TechID_idx` (`TechID`);

CREATE TABLE `RaceWPSurvey`
 (
	`RaceWPSurvey`			int, 
	`RaceID`			int NOT NULL, 
	`WarpPointID`			int NOT NULL, 
	`Explored`			int, 
	`Charted`			int, 
	`AlienUnits`			char NOT NULL, 
	`Hide`			int, 
	`Drawn`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `RaceWPSurvey` ADD PRIMARY KEY (`RaceWPSurvey`);
ALTER TABLE `RaceWPSurvey` ADD UNIQUE INDEX `RaceWPSurvey_RaceID_idx` (`RaceID`);
ALTER TABLE `RaceWPSurvey` ADD UNIQUE INDEX `RaceWPSurvey_WarpPointID_idx` (`WarpPointID`);

CREATE TABLE `RandomNames`
 (
	`Random`			int, 
	`Name`			varchar (100)
);

-- CREATE INDEXES ...

CREATE TABLE `Ranks`
 (
	`RankID`			int, 
	`RaceID`			int, 
	`RankName`			varchar (100), 
	`Priority`			int, 
	`Members`			int, 
	`GFRank`			varchar (100), 
	`Civilian`			varchar (100), 
	`Scientist`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `Ranks` ADD PRIMARY KEY (`RankID`);
ALTER TABLE `Ranks` ADD UNIQUE INDEX `Ranks_RaceID_idx` (`RaceID`);
ALTER TABLE `Ranks` ADD INDEX `Ranks_RankID_idx` (`RankID`);

CREATE TABLE `ResearchCategories`
 (
	`CategoryID`			int, 
	`CheckTech`			char NOT NULL, 
	`Name`			varchar (100), 
	`CompanyNameType`			int, 
	`PlayerDefined`			char NOT NULL, 
	`SourceTechType0`			int, 
	`SecondPrimaryTech`			int, 
	`SourceTechType1`			int, 
	`SourceTechType2`			int, 
	`SourceTechType3`			int, 
	`SourceTechType4`			int, 
	`SourceTechType5`			int, 
	`SourceTechType6`			int, 
	`SourceTechType7`			int, 
	`Sort0`			char NOT NULL, 
	`Sort1`			char NOT NULL, 
	`Sort2`			char NOT NULL, 
	`Sort3`			char NOT NULL, 
	`Sort4`			char NOT NULL, 
	`Sort5`			char NOT NULL, 
	`Sort6`			char NOT NULL, 
	`Sort7`			char NOT NULL, 
	`Components`			char NOT NULL, 
	`NoteField`			varchar (510)
);

-- CREATE INDEXES ...
ALTER TABLE `ResearchCategories` ADD INDEX `ResearchCategories_CategoryID_idx` (`CategoryID`);
ALTER TABLE `ResearchCategories` ADD PRIMARY KEY (`CategoryID`);

CREATE TABLE `ResearchField`
 (
	`ResearchFieldID`			int, 
	`FieldName`			varchar (100), 
	`ShortName`			varchar (20), 
	`Abbreviation`			varchar (10), 
	`USR`			char NOT NULL, 
	`UMF`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `ResearchField` ADD PRIMARY KEY (`ResearchFieldID`);

CREATE TABLE `ResearchProject`
 (
	`ProjectID`			int, 
	`TechID`			int, 
	`RaceID`			int, 
	`PopulationID`			int, 
	`Facilities`			int, 
	`ResSpecID`			int, 
	`ResearchPointsRequired`			float, 
	`Pause`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `ResearchProject` ADD INDEX `ResearchProject_PopulationID_idx` (`PopulationID`);
ALTER TABLE `ResearchProject` ADD PRIMARY KEY (`ProjectID`);
ALTER TABLE `ResearchProject` ADD INDEX `ResearchProject_ProjectID_idx` (`TechID`);
ALTER TABLE `ResearchProject` ADD INDEX `ResearchProject_ProjectID1_idx` (`ProjectID`);
ALTER TABLE `ResearchProject` ADD UNIQUE INDEX `ResearchProject_RaceID_idx` (`RaceID`);
ALTER TABLE `ResearchProject` ADD INDEX `ResearchProject_ResSpecID_idx` (`ResSpecID`);

CREATE TABLE `ResearchQueue`
 (
	`ResearchQueueID`			int, 
	`PopulationID`			int, 
	`TechSystemID`			int, 
	`CurrentProjectID`			int, 
	`ResearchOrder`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ResearchQueue` ADD PRIMARY KEY (`ResearchQueueID`);
ALTER TABLE `ResearchQueue` ADD INDEX `ResearchQueue_ProjectID_idx` (`CurrentProjectID`);
ALTER TABLE `ResearchQueue` ADD UNIQUE INDEX `ResearchQueue_RaceID_idx` (`PopulationID`);
ALTER TABLE `ResearchQueue` ADD UNIQUE INDEX `ResearchQueue_ResearchQueueID_idx` (`ResearchQueueID`);
ALTER TABLE `ResearchQueue` ADD UNIQUE INDEX `ResearchQueue_TechSystemID_idx` (`TechSystemID`);

CREATE TABLE `RuinRace`
 (
	`RuinRaceID`			int, 
	`GameID`			int, 
	`Title`			varchar (100), 
	`Name`			varchar (100), 
	`RacePic`			varchar (100), 
	`FlagPic`			varchar (100), 
	`Level`			int, 
	`LaserID`			int, 
	`TorpID`			int, 
	`RailgunID`			int, 
	`MesonID`			int, 
	`PlasmaID`			int, 
	`ReactorID`			int, 
	`GaussID`			int, 
	`ShieldID`			int, 
	`EngineID`			int, 
	`CommEngineID`			int, 
	`FACEngineID`			int, 
	`JD15`			int, 
	`JD24`			int, 
	`JD40`			int, 
	`CJD15`			int, 
	`CJD24`			int, 
	`CJD40`			int
);

-- CREATE INDEXES ...
ALTER TABLE `RuinRace` ADD INDEX `RuinRace_CommEngineID_idx` (`CommEngineID`);
ALTER TABLE `RuinRace` ADD INDEX `RuinRace_FACEngineID_idx` (`FACEngineID`);
ALTER TABLE `RuinRace` ADD UNIQUE INDEX `RuinRace_GameID_idx` (`GameID`);
ALTER TABLE `RuinRace` ADD UNIQUE INDEX `RuinRace_LaserID_idx` (`LaserID`);
ALTER TABLE `RuinRace` ADD UNIQUE INDEX `RuinRace_LaserID1_idx` (`TorpID`);
ALTER TABLE `RuinRace` ADD INDEX `RuinRace_LaserID2_idx` (`RailgunID`);
ALTER TABLE `RuinRace` ADD INDEX `RuinRace_LaserID3_idx` (`MesonID`);
ALTER TABLE `RuinRace` ADD INDEX `RuinRace_LaserID4_idx` (`PlasmaID`);
ALTER TABLE `RuinRace` ADD INDEX `RuinRace_LaserID5_idx` (`ReactorID`);
ALTER TABLE `RuinRace` ADD UNIQUE INDEX `RuinRace_LaserID6_idx` (`GaussID`);
ALTER TABLE `RuinRace` ADD UNIQUE INDEX `RuinRace_LaserID7_idx` (`ShieldID`);
ALTER TABLE `RuinRace` ADD PRIMARY KEY (`RuinRaceID`);
ALTER TABLE `RuinRace` ADD INDEX `RuinRace_RuinRaceID_idx` (`RuinRaceID`);

CREATE TABLE `SBGas`
 (
	`SBGasID`			int, 
	`SystemBodyID`			int, 
	`AtmosGasID`			int, 
	`AtmosGasAmount`			float, 
	`GasAtm`			float, 
	`FrozenOut`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `SBGas` ADD INDEX `SBGas_GasID_idx` (`AtmosGasID`);
ALTER TABLE `SBGas` ADD PRIMARY KEY (`SBGasID`);
ALTER TABLE `SBGas` ADD UNIQUE INDEX `SBGas_SBGasID_idx` (`SBGasID`);
ALTER TABLE `SBGas` ADD INDEX `SBGas_SystemBodyID_idx` (`SystemBodyID`);

CREATE TABLE `Scale005`
 (
	`ScaleID`			int, 
	`MaxChance`			int, 
	`OrbMod`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Scale005` ADD PRIMARY KEY (`ScaleID`);
ALTER TABLE `Scale005` ADD INDEX `Scale005_ScaleID_idx` (`ScaleID`);

CREATE TABLE `Scale01`
 (
	`ScaleID`			int, 
	`MaxChance`			int, 
	`OrbMod`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Scale01` ADD PRIMARY KEY (`ScaleID`);
ALTER TABLE `Scale01` ADD INDEX `Scale01_ScaleID_idx` (`ScaleID`);

CREATE TABLE `Scale03`
 (
	`ScaleID`			int, 
	`MaxChance`			int, 
	`OrbMod`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Scale03` ADD PRIMARY KEY (`ScaleID`);
ALTER TABLE `Scale03` ADD INDEX `Scale03_ScaleID_idx` (`ScaleID`);

CREATE TABLE `SecondaryCmdrTheme`
 (
	`EmpireID`			int, 
	`SecondaryThemeID`			int, 
	`MaxChance`			int
);

-- CREATE INDEXES ...
ALTER TABLE `SecondaryCmdrTheme` ADD PRIMARY KEY (`EmpireID`, `SecondaryThemeID`);
ALTER TABLE `SecondaryCmdrTheme` ADD INDEX `SecondaryCmdrTheme_RaceID_idx` (`EmpireID`);

CREATE TABLE `SectorCommand`
 (
	`SectorCommandID`			int, 
	`RaceID`			int, 
	`PopulationID`			int, 
	`SectorName`			varchar (200), 
	`Colour`			int
);

-- CREATE INDEXES ...
ALTER TABLE `SectorCommand` ADD UNIQUE INDEX `SectorCommand_AdminCommandID_idx` (`SectorCommandID`);
ALTER TABLE `SectorCommand` ADD INDEX `SectorCommand_PopulationID_idx` (`PopulationID`);
ALTER TABLE `SectorCommand` ADD PRIMARY KEY (`SectorCommandID`);
ALTER TABLE `SectorCommand` ADD UNIQUE INDEX `SectorCommand_RaceID_idx` (`RaceID`);

CREATE TABLE `SetAtmosphere`
 (
	`AtmosphereID`			int, 
	`TempBand`			int, 
	`MaxChance`			int, 
	`Gas1`			int, 
	`Gas2`			int, 
	`Gas3`			int, 
	`Description`			varchar (200)
);

-- CREATE INDEXES ...
ALTER TABLE `SetAtmosphere` ADD INDEX `SetAtmosphere_Gas1ID_idx` (`Gas1`);
ALTER TABLE `SetAtmosphere` ADD INDEX `SetAtmosphere_Gas2ID_idx` (`Gas2`);
ALTER TABLE `SetAtmosphere` ADD INDEX `SetAtmosphere_Gas3ID_idx` (`Gas3`);
ALTER TABLE `SetAtmosphere` ADD PRIMARY KEY (`AtmosphereID`);

CREATE TABLE `Ship`
 (
	`ShipID`			int, 
	`ActiveSensorsOn`			char NOT NULL, 
	`AddToTG`			char NOT NULL, 
	`AssignedMSID`			int, 
	`AssignedPopulationID`			int, 
	`Autofire`			int, 
	`BoardingCombatClock`			int, 
	`BuildCost`			int, 
	`Constructed`			float, 
	`CrewMorale`			float, 
	`CurrentActive`			int, 
	`CurrentCrew`			int, 
	`CurrentCrewQuartersHS`			float, 
	`CurrentECM`			int, 
	`CurrentEM`			int, 
	`CurrentEnginePower`			int, 
	`CurrentFlagBridge`			char NOT NULL, 
	`CurrentGeoSurvey`			int, 
	`CurrentGravSurvey`			int, 
	`CurrentHarvesters`			int, 
	`CurrentMaint`			int, 
	`CurrentMining`			int, 
	`CurrentParasiteCapacity`			int, 
	`CurrentPassive`			int, 
	`CurrentReactorPower`			int, 
	`CurrentRecreationalModule`			char NOT NULL, 
	`CurrentRequiredPower`			int, 
	`CurrentSalvageRate`			int, 
	`CurrentShieldCost`			float, 
	`CurrentShieldStrength`			float, 
	`CurrentSpares`			float, 
	`CurrentTerraformers`			int, 
	`CurrentWorkerCapacity`			int, 
	`CurrentTractorStrength`			int, 
	`DamageControlID`			int, 
	`DamageControlRating`			int, 
	`DamageControlSystems`			int, 
	`Destroyed`			char NOT NULL, 
	`FailureChance`			float, 
	`Fighter`			char NOT NULL, 
	`FireDelay`			int, 
	`FireStrength`			int, 
	`FleetID`			int, 
	`Fuel`			float, 
	`GameID`			int, 
	`GradePoints`			float, 
	`HoldTechData`			int, 
	`HyperCapable`			char NOT NULL, 
	`JGConstructionTime`			int, 
	`KillTonnageCommercial`			int, 
	`KillTonnageMilitary`			int, 
	`LastLaunchTime`			float, 
	`LastOverhaul`			float, 
	`LastShoreLeave`			float, 
	`LaunchMorale`			float, 
	`MaintenanceState`			int, 
	`MaintPriority`			int, 
	`MaxCargo`			int, 
	`MaxColonists`			int, 
	`MaxDrop`			int, 
	`MaxFuelCapacity`			int, 
	`MaxOrdnance`			int, 
	`MaxShieldStrength`			int, 
	`MaxTroops`			int, 
	`MothershipID`			int, 
	`OrganizationID`			int, 
	`PPV`			int, 
	`RaceID`			int, 
	`SensorDelay`			int, 
	`ShieldTypeID`			int, 
	`ShieldsActive`			char NOT NULL, 
	`ShipClassID`			int, 
	`ShipCrossSection`			float, 
	`ShipDesignDisplay`			text (255), 
	`ShipFuelEfficiency`			float, 
	`ShipMaxSpeed`			int, 
	`ShipName`			varchar (200), 
	`ShipNotes`			text (255), 
	`ShippingLineID`			int, 
	`ShipSpares`			int, 
	`ShipThermal`			int, 
	`ShipType`			int, 
	`SpeciesID`			int, 
	`SquadronID`			int, 
	`STSTractorAvailable`			int, 
	`SyncFire`			int, 
	`TaskForceID`			int, 
	`TFPoints`			float, 
	`TowingShipyard`			char NOT NULL, 
	`TractorLink`			int, 
	`TransponderActive`			char NOT NULL, 
	`ScrapFlag`			char NOT NULL, 
	`LastMissileHit`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Ship` ADD UNIQUE INDEX `Ship_DamageControlID_idx` (`DamageControlID`);
ALTER TABLE `Ship` ADD INDEX `Ship_FleetID_idx` (`FleetID`);
ALTER TABLE `Ship` ADD UNIQUE INDEX `Ship_GameID_idx` (`GameID`);
ALTER TABLE `Ship` ADD PRIMARY KEY (`ShipID`);
ALTER TABLE `Ship` ADD UNIQUE INDEX `Ship_RaceID_idx` (`RaceID`);
ALTER TABLE `Ship` ADD UNIQUE INDEX `Ship_ShieldTypeID_idx` (`ShieldTypeID`);
ALTER TABLE `Ship` ADD INDEX `Ship_ShipClassID_idx` (`ShipClassID`);
ALTER TABLE `Ship` ADD UNIQUE INDEX `Ship_ShipID_idx` (`ShipID`);
ALTER TABLE `Ship` ADD INDEX `Ship_SpeciesID_idx` (`SpeciesID`);
ALTER TABLE `Ship` ADD INDEX `Ship_TaskForceID_idx` (`TaskForceID`);

CREATE TABLE `ShipCargo`
 (
	`ShipCargoID`			int, 
	`ShipID`			int, 
	`SpeciesID`			int, 
	`CargoTypeID`			int, 
	`Amount`			float, 
	`TechSystemID`			int, 
	`TransportSystemID`			int, 
	`SpaceUsed`			float, 
	`SpecialCargoID`			int, 
	`LinePickupPopID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ShipCargo` ADD INDEX `ShipCargo_CargoTypeID_idx` (`CargoTypeID`);
ALTER TABLE `ShipCargo` ADD PRIMARY KEY (`ShipCargoID`);
ALTER TABLE `ShipCargo` ADD INDEX `ShipCargo_ShipCargoID_idx` (`ShipCargoID`);
ALTER TABLE `ShipCargo` ADD INDEX `ShipCargo_SHipID_idx` (`ShipID`);
ALTER TABLE `ShipCargo` ADD INDEX `ShipCargo_SpeciesID_idx` (`SpeciesID`);
ALTER TABLE `ShipCargo` ADD INDEX `ShipCargo_SubCargoID_idx` (`SpecialCargoID`);
ALTER TABLE `ShipCargo` ADD INDEX `ShipCargo_TechSystemID_idx` (`TechSystemID`);
ALTER TABLE `ShipCargo` ADD INDEX `ShipCargo_TransportSystemID_idx` (`TransportSystemID`);

CREATE TABLE `ShipDesignComponents`
 (
	`SDComponentID`			int, 
	`Name`			varchar (120), 
	`TypeAllowed`			int, 
	`ShipTypeLimit`			int, 
	`NoScrap`			char NOT NULL, 
	`MilitarySystem`			char NOT NULL, 
	`ShippingLineSystem`			char NOT NULL, 
	`BeamWeapon`			char NOT NULL, 
	`Crew`			int, 
	`Size`			float, 
	`Cost`			float, 
	`ComponentTypeID`			int, 
	`ComponentValue`			float, 
	`PowerRequirement`			int, 
	`RechargeRate`			float, 
	`ElectronicSystem`			char NOT NULL, 
	`ElectronicCTD`			int, 
	`TrackingSpeed`			int, 
	`SpecialFunction`			char NOT NULL, 
	`WeaponToHitModifier`			float, 
	`MaxSensorRange`			float, 
	`Resolution`			float, 
	`IntegrityRating`			int, 
	`TorpedoSpeed`			int, 
	`HTK`			int, 
	`FuelUse`			float, 
	`NoMaintFailure`			char NOT NULL, 
	`HangarReloadOnly`			char NOT NULL, 
	`InternalArmour`			int, 
	`ExplosionChance`			int, 
	`MaxExplosionSize`			int, 
	`DamageOutput`			int, 
	`NumberOfShots`			int, 
	`RangeModifier`			float, 
	`MaxWeaponRange`			int, 
	`SpinalWeapon`			int, 
	`JumpDistance`			int, 
	`JumpRating`			int, 
	`RateOfFire`			int, 
	`MaxPercentage`			int, 
	`FuelEfficiency`			float, 
	`HyperDrive`			char NOT NULL, 
	`IgnoreShields`			char NOT NULL, 
	`IgnoreArmour`			char NOT NULL, 
	`ElectronicOnly`			char NOT NULL, 
	`StealthRating`			float, 
	`CloakRating`			float, 
	`Weapon`			char NOT NULL, 
	`BGTech1`			int, 
	`BGTech2`			int, 
	`BGTech3`			int, 
	`BGTech4`			int, 
	`BGTech5`			int, 
	`BGTech6`			int, 
	`Duranium`			float, 
	`Neutronium`			float, 
	`Corbomite`			float, 
	`Tritanium`			float, 
	`Boronide`			float, 
	`Mercassium`			float, 
	`Vendarite`			float, 
	`Sorium`			float, 
	`Uridium`			float, 
	`Corundium`			float, 
	`Gallicite`			float
);

-- CREATE INDEXES ...
ALTER TABLE `ShipDesignComponents` ADD UNIQUE INDEX `ShipDesignComponents_RatingTypeID_idx` (`ComponentTypeID`);
ALTER TABLE `ShipDesignComponents` ADD INDEX `ShipDesignComponents_TechSystemID_idx` (`SDComponentID`);

CREATE TABLE `ShipHistory`
 (
	`HistoryID`			int, 
	`ShipID`			int, 
	`Description`			varchar (510), 
	`GameTime`			float
);

-- CREATE INDEXES ...
ALTER TABLE `ShipHistory` ADD INDEX `ShipHistory_HistoryID_idx` (`HistoryID`);
ALTER TABLE `ShipHistory` ADD INDEX `ShipHistory_ObjectID_idx` (`ShipID`);
ALTER TABLE `ShipHistory` ADD PRIMARY KEY (`HistoryID`);

CREATE TABLE `ShipNames`
 (
	`ShipNameID`			int, 
	`ShipName`			varchar (510) NOT NULL, 
	`USStates`			char NOT NULL, 
	`WH40KEmpire`			char NOT NULL, 
	`WH40KChaos`			char NOT NULL, 
	`Battles`			char NOT NULL, 
	`Moons`			char NOT NULL, 
	`Astronomers`			char NOT NULL, 
	`Bible`			char NOT NULL, 
	`USP`			char NOT NULL, 
	`UKPM`			char NOT NULL, 
	`Mountains`			char NOT NULL, 
	`LakesRivers`			char NOT NULL, 
	`Cities`			char NOT NULL, 
	`Countries`			char NOT NULL, 
	`Island`			char NOT NULL, 
	`Province`			char NOT NULL, 
	`Weapons`			char NOT NULL, 
	`Animals`			char NOT NULL, 
	`DogBreeds`			char NOT NULL, 
	`Birds`			char NOT NULL, 
	`Tribes`			char NOT NULL, 
	`Stars`			char NOT NULL, 
	`Minerals`			char NOT NULL, 
	`Leader`			char NOT NULL, 
	`Famous`			char NOT NULL, 
	`French1790`			char NOT NULL, 
	`Japanese`			char NOT NULL, 
	`Creepies`			char NOT NULL, 
	`Fantasy`			char NOT NULL, 
	`SeaCreatures`			char NOT NULL, 
	`Snakes`			char NOT NULL, 
	`Dinosaur`			char NOT NULL, 
	`Africa`			char NOT NULL, 
	`Alabama`			char NOT NULL, 
	`Alaska`			char NOT NULL, 
	`Brazil`			char NOT NULL, 
	`Alberta`			char NOT NULL, 
	`Argentina`			char NOT NULL, 
	`Asia`			char NOT NULL, 
	`Dune`			char NOT NULL, 
	`Europe`			char NOT NULL, 
	`Israel`			char NOT NULL, 
	`Jordan`			char NOT NULL, 
	`Kriegsmarine`			char NOT NULL, 
	`Lunar`			char NOT NULL, 
	`Mideast`			char NOT NULL, 
	`NWAfrica`			char NOT NULL, 
	`TrekNames`			char NOT NULL, 
	`AggNames`			char NOT NULL, 
	`Romania`			char NOT NULL, 
	`Scandinavia`			char NOT NULL, 
	`Scotland`			char NOT NULL, 
	`TrekShips`			char NOT NULL, 
	`US`			char NOT NULL, 
	`Tolkien`			char NOT NULL, 
	`USSR`			char NOT NULL, 
	`A`			char NOT NULL, 
	`B`			char NOT NULL, 
	`C`			char NOT NULL, 
	`D`			char NOT NULL, 
	`E`			char NOT NULL, 
	`F`			char NOT NULL, 
	`G`			char NOT NULL, 
	`H`			char NOT NULL, 
	`I`			char NOT NULL, 
	`J`			char NOT NULL, 
	`K`			char NOT NULL, 
	`L`			char NOT NULL, 
	`M`			char NOT NULL, 
	`N`			char NOT NULL, 
	`O`			char NOT NULL, 
	`P`			char NOT NULL, 
	`Q`			char NOT NULL, 
	`R`			char NOT NULL, 
	`S`			char NOT NULL, 
	`T`			char NOT NULL, 
	`U`			char NOT NULL, 
	`V`			char NOT NULL, 
	`W`			char NOT NULL, 
	`X`			char NOT NULL, 
	`Y`			char NOT NULL, 
	`Z`			char NOT NULL, 
	`USBB`			char NOT NULL, 
	`USCVL`			char NOT NULL, 
	`USCVE`			char NOT NULL, 
	`USCA`			char NOT NULL, 
	`USCL`			char NOT NULL, 
	`USDD`			char NOT NULL, 
	`USSUB`			char NOT NULL, 
	`ArleighBurkeClass`			char NOT NULL, 
	`DidoClass`			char NOT NULL, 
	`BritishCounties`			char NOT NULL, 
	`Explorers`			char NOT NULL, 
	`StellarClass`			char NOT NULL, 
	`Swords`			char NOT NULL, 
	`Forts`			char NOT NULL, 
	`Typhoon`			char NOT NULL, 
	`ClassicalAstronomers`			char NOT NULL, 
	`SixteenthCenturyExplorers`			char NOT NULL, 
	`Guardians`			char NOT NULL, 
	`TrafalgarOOB`			char NOT NULL, 
	`USCarriers`			char NOT NULL, 
	`USAmphibiousShips`			char NOT NULL, 
	`USDestroyerEscorts`			char NOT NULL, 
	`USNavyTransports`			char NOT NULL, 
	`USNavyAmmunitionShips`			char NOT NULL, 
	`USNavySupplyShips`			char NOT NULL, 
	`USNavyTankers`			char NOT NULL, 
	`USNavyRepairShips`			char NOT NULL, 
	`USNavyTenders`			char NOT NULL, 
	`USNavyMissileShips`			char NOT NULL, 
	`USNavyDestroyers`			char NOT NULL, 
	`RoyalNavyCapitalShips`			char NOT NULL, 
	`USNavyShipsNamedAfterBattles`			char NOT NULL, 
	`USCities`			char NOT NULL, 
	`RoyalNavyCarriers`			char NOT NULL, 
	`US41ForFreedom`			char NOT NULL, 
	`USNavyHeroes`			char NOT NULL, 
	`RussianCruisers`			char NOT NULL, 
	`RussianDestroyers`			char NOT NULL, 
	`RussianBattleships`			char NOT NULL, 
	`RoyalNavyDestroyers`			char NOT NULL, 
	`RoyalNavyDestroyersClassic`			char NOT NULL, 
	`RoyalNavyHuntClass`			char NOT NULL, 
	`RoyalNavyConstellationClass`			char NOT NULL, 
	`BritishRivers`			char NOT NULL, 
	`RoyalNavyCruisers`			char NOT NULL, 
	`RoyalNavyFlowerClass`			char NOT NULL, 
	`RoyalNavyTownClass`			char NOT NULL, 
	`JapaneseBattleships`			char NOT NULL, 
	`JapaneseCruisers`			char NOT NULL, 
	`JapaneseCarriers`			char NOT NULL, 
	`JapaneseDestroyers`			char NOT NULL, 
	`FrenchBattleships`			char NOT NULL, 
	`FrenchCruisers`			char NOT NULL, 
	`FrenchDestroyers`			char NOT NULL, 
	`GermanBattleships`			char NOT NULL, 
	`GermanCruisers`			char NOT NULL, 
	`GermanDestroyers`			char NOT NULL, 
	`GermanFastAttackCraft`			char NOT NULL, 
	`ItalianBattleships`			char NOT NULL, 
	`ItalianCruisers`			char NOT NULL, 
	`ItalianDestroyers`			char NOT NULL, 
	`RoyalNavyFrigates`			char NOT NULL, 
	`RoyalNavySubmarines`			char NOT NULL, 
	`USCounties`			char NOT NULL, 
	`RoyalNavyTankers`			char NOT NULL, 
	`RoyalNavyReplenishmentShips`			char NOT NULL, 
	`USNavyMineWarfare`			char NOT NULL, 
	`USNavySurveillanceShips`			char NOT NULL, 
	`USSNavySurveyShips`			char NOT NULL, 
	`RoyalNavySurveyShips`			char NOT NULL, 
	`RoyalNavyMinesweepers`			char NOT NULL, 
	`RoyalNavyTonclass`			char NOT NULL, 
	`RoyalNavyHamClass`			char NOT NULL, 
	`EmpireShips`			char NOT NULL, 
	`LibertyShips`			char NOT NULL, 
	`T2Tankers`			char NOT NULL, 
	`VictoryShips`			char NOT NULL, 
	`LibertySamShips`			char NOT NULL, 
	`RoyalNavyAmphibiousShips`			char NOT NULL, 
	`RussianSurveyShips`			char NOT NULL, 
	`RoyalNavyTrawlers`			char NOT NULL, 
	`RoyalCanadianNavyCruisers`			char NOT NULL, 
	`RoyalCanadianNavyDestroyers`			char NOT NULL, 
	`RoyalCanadianNavyPatrolVessels`			char NOT NULL, 
	`RoyalCanadianNavyMinesweepers`			char NOT NULL, 
	`RoyalAustralianNavyCruisers`			char NOT NULL, 
	`RoyalAustralianNavyDestroyers`			char NOT NULL, 
	`RoyalAustralianNavyEscorts`			char NOT NULL, 
	`RoyalAustralianNavyAmphibiousShips`			char NOT NULL, 
	`RoyalCanadianNavySubmarines`			char NOT NULL, 
	`RoyalAustralianNavySubmarines`			char NOT NULL, 
	`FrenchVictories`			char NOT NULL, 
	`FrenchFirstEmpireDepartements`			char NOT NULL, 
	`FrenchMilitaryPersonalities`			char NOT NULL, 
	`FrenchShipNamesGeneral01`			char NOT NULL, 
	`FrenchShipNamesGeneral02`			char NOT NULL, 
	`CoastSalishPlaceNamesandWords`			char NOT NULL, 
	`Gemstones`			char NOT NULL, 
	`PeriodicTable`			char NOT NULL, 
	`GreatFrenchmen`			char NOT NULL, 
	`GreekLakes`			char NOT NULL, 
	`Wizards`			char NOT NULL, 
	`DefensiveWorks`			char NOT NULL, 
	`AngelsandDemons`			char NOT NULL, 
	`NATODesignationsforSovietAircraft`			char NOT NULL, 
	`FamousHorsesofUSCivilWar`			char NOT NULL, 
	`Yugoloths`			char NOT NULL, 
	`Daemons`			char NOT NULL, 
	`DemonLords`			char NOT NULL, 
	`DemonsandDevils`			char NOT NULL, 
	`AustralianAboriginalPlaceName`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `ShipNames` ADD PRIMARY KEY (`ShipNameID`);
ALTER TABLE `ShipNames` ADD INDEX `ShipNames_ShipName_idx` (`ShipName`);

CREATE TABLE `ShipNamesUsed`
 (
	`RaceID`			int, 
	`ShipNameID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ShipNamesUsed` ADD PRIMARY KEY (`RaceID`, `ShipNameID`);
ALTER TABLE `ShipNamesUsed` ADD INDEX `ShipNamesUsed_RaceID_idx` (`RaceID`);
ALTER TABLE `ShipNamesUsed` ADD INDEX `ShipNamesUsed_ShipNameID_idx` (`ShipNameID`);

CREATE TABLE `ShipNameType`
 (
	`ShipNameTypeID`			int, 
	`ShipNameType`			varchar (100), 
	`ColumnName`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `ShipNameType` ADD INDEX `ShipNameType_ConventionID_idx` (`ShipNameTypeID`);
ALTER TABLE `ShipNameType` ADD PRIMARY KEY (`ShipNameTypeID`);

CREATE TABLE `ShippingLines`
 (
	`ShippingLineID`			int, 
	`GameID`			int, 
	`EmpireID`			int, 
	`NPRace`			char NOT NULL, 
	`LineName`			varchar (200), 
	`ShortName`			varchar (100), 
	`ShipNum`			int, 
	`WealthBalance`			int, 
	`LastDividendPaid`			int, 
	`LastDividendTime`			float, 
	`MaxAssets`			int, 
	`SmallFreighterID`			int, 
	`LargeFreighterID`			int, 
	`HugeFreighterID`			int, 
	`SmallColonyID`			int, 
	`LargeColonyID`			int, 
	`HugeColonyID`			int, 
	`PassengerLinerID`			int, 
	`HarvesterID`			int, 
	`CommEngineID`			int, 
	`CommercialEngines`			int, 
	`BestCHS`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ShippingLines` ADD INDEX `ShippingLines_ColonyID_idx` (`SmallColonyID`);
ALTER TABLE `ShippingLines` ADD INDEX `ShippingLines_CommEngineID_idx` (`CommEngineID`);
ALTER TABLE `ShippingLines` ADD INDEX `ShippingLines_EmpireID_idx` (`EmpireID`);
ALTER TABLE `ShippingLines` ADD INDEX `ShippingLines_FreighterID_idx` (`SmallFreighterID`);
ALTER TABLE `ShippingLines` ADD INDEX `ShippingLines_GameID_idx` (`GameID`);
ALTER TABLE `ShippingLines` ADD INDEX `ShippingLines_HarvesterID_idx` (`HarvesterID`);
ALTER TABLE `ShippingLines` ADD INDEX `ShippingLines_LargeColonyID_idx` (`LargeColonyID`);
ALTER TABLE `ShippingLines` ADD INDEX `ShippingLines_LargeColonyID1_idx` (`HugeColonyID`);
ALTER TABLE `ShippingLines` ADD INDEX `ShippingLines_LargeFreighterID_idx` (`LargeFreighterID`);
ALTER TABLE `ShippingLines` ADD UNIQUE INDEX `ShippingLines_LargeFreighterID1_idx` (`HugeFreighterID`);
ALTER TABLE `ShippingLines` ADD INDEX `ShippingLines_LinerID_idx` (`PassengerLinerID`);
ALTER TABLE `ShippingLines` ADD PRIMARY KEY (`ShippingLineID`);
ALTER TABLE `ShippingLines` ADD INDEX `ShippingLines_ShipNum_idx` (`ShipNum`);
ALTER TABLE `ShippingLines` ADD UNIQUE INDEX `ShippingLines_ShippingLineiD_idx` (`ShippingLineID`);

CREATE TABLE `ShippingWealthData`
 (
	`WealthDataID`			int, 
	`GameID`			int, 
	`ShippingLineID`			int, 
	`ShipID`			int, 
	`Contract`			char NOT NULL, 
	`Amount`			float, 
	`TradeGood`			int, 
	`TimeUsed`			float, 
	`Origin`			int, 
	`OriginRaceID`			int, 
	`Destination`			int, 
	`DestRaceID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ShippingWealthData` ADD INDEX `ShippingWealthData_DestinationID_idx` (`Destination`);
ALTER TABLE `ShippingWealthData` ADD INDEX `ShippingWealthData_DestRaceID_idx` (`DestRaceID`);
ALTER TABLE `ShippingWealthData` ADD UNIQUE INDEX `ShippingWealthData_GameID_idx` (`GameID`);
ALTER TABLE `ShippingWealthData` ADD PRIMARY KEY (`WealthDataID`);
ALTER TABLE `ShippingWealthData` ADD UNIQUE INDEX `ShippingWealthData_RaceID_idx` (`ShippingLineID`);
ALTER TABLE `ShippingWealthData` ADD UNIQUE INDEX `ShippingWealthData_ShipID_idx` (`ShipID`);
ALTER TABLE `ShippingWealthData` ADD INDEX `ShippingWealthData_WealthID_idx` (`WealthDataID`);

CREATE TABLE `ShipTechData`
 (
	`ShipID`			int, 
	`TechID`			int, 
	`RaceID`			int, 
	`GameID`			int, 
	`TechPoints`			float
);

-- CREATE INDEXES ...
ALTER TABLE `ShipTechData` ADD INDEX `ShipTechData_GameID_idx` (`GameID`);
ALTER TABLE `ShipTechData` ADD PRIMARY KEY (`ShipID`, `TechID`);
ALTER TABLE `ShipTechData` ADD INDEX `ShipTechData_RaceID_idx` (`RaceID`);
ALTER TABLE `ShipTechData` ADD INDEX `ShipTechData_ShipID_idx` (`ShipID`);
ALTER TABLE `ShipTechData` ADD INDEX `ShipTechData_TechID_idx` (`TechID`);

CREATE TABLE `ShipWeapon`
 (
	`ShipWeaponID`			int, 
	`ShipID`			int, 
	`MissileID`			int, 
	`Amount`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ShipWeapon` ADD INDEX `ShipWeapon_ClassOrdnanceID_idx` (`ShipWeaponID`);
ALTER TABLE `ShipWeapon` ADD UNIQUE INDEX `ShipWeapon_Number_idx` (`Amount`);
ALTER TABLE `ShipWeapon` ADD INDEX `ShipWeapon_OrdnanceID1_idx` (`MissileID`);
ALTER TABLE `ShipWeapon` ADD PRIMARY KEY (`ShipWeaponID`);
ALTER TABLE `ShipWeapon` ADD UNIQUE INDEX `ShipWeapon_ShipClassID_idx` (`ShipID`);

CREATE TABLE `Shipyard`
 (
	`ShipyardID`			int, 
	`GameID`			int, 
	`EmpireID`			int, 
	`ShipID`			int, 
	`PopulationID`			int, 
	`SYType`			int, 
	`ShipyardName`			varchar (200), 
	`Slipways`			float, 
	`Capacity`			float, 
	`BuildClassID`			int, 
	`RetoolClassID`			int, 
	`TaskType`			int, 
	`RequiredBP`			float, 
	`CompletedBP`			float, 
	`PauseActivity`			char NOT NULL, 
	`DefaultFleetID`			int, 
	`Xcor`			float, 
	`Ycor`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Shipyard` ADD INDEX `Shipyard_BuildClassID_idx` (`BuildClassID`);
ALTER TABLE `Shipyard` ADD INDEX `Shipyard_DefaultFleetID_idx` (`DefaultFleetID`);
ALTER TABLE `Shipyard` ADD INDEX `Shipyard_EmpireID_idx` (`EmpireID`);
ALTER TABLE `Shipyard` ADD INDEX `Shipyard_GameID_idx` (`GameID`);
ALTER TABLE `Shipyard` ADD INDEX `Shipyard_PopulationID_idx` (`PopulationID`);
ALTER TABLE `Shipyard` ADD PRIMARY KEY (`ShipyardID`);
ALTER TABLE `Shipyard` ADD INDEX `Shipyard_RetoolClassID_idx` (`RetoolClassID`);

CREATE TABLE `ShipyardCompanies`
 (
	`NameID`			int, 
	`Suffix`			varchar (300)
);

-- CREATE INDEXES ...
ALTER TABLE `ShipyardCompanies` ADD PRIMARY KEY (`NameID`);

CREATE TABLE `ShipyardNames`
 (
	`NameID`			int, 
	`SYName`			varchar (300)
);

-- CREATE INDEXES ...
ALTER TABLE `ShipyardNames` ADD PRIMARY KEY (`NameID`);

CREATE TABLE `SizeGasGiant`
 (
	`MaxChance`			int, 
	`BaseSize`			int, 
	`Multiplier`			int
);

-- CREATE INDEXES ...
ALTER TABLE `SizeGasGiant` ADD PRIMARY KEY (`MaxChance`);

CREATE TABLE `SizeTerrestrial`
 (
	`MaxChance`			int, 
	`BaseSize`			int, 
	`Multiplier`			int
);

-- CREATE INDEXES ...
ALTER TABLE `SizeTerrestrial` ADD PRIMARY KEY (`MaxChance`);

CREATE TABLE `SolSystemBodies`
 (
	`SystemBodyID`			int, 
	`Name`			varchar (100), 
	`PlanetNumber`			int, 
	`OrbitNumber`			int, 
	`TrojanPlanet`			int, 
	`TrojanLocation`			int, 
	`TrojanOffset`			float, 
	`OrbitalDistance`			float, 
	`CurrentDistance`			float, 
	`HeadingInward`			char NOT NULL, 
	`Bearing`			float, 
	`BodyClass`			int, 
	`Density`			float, 
	`Radius`			int, 
	`Gravity`			float, 
	`ParentBodyType`			int, 
	`BodyTypeID`			int, 
	`Mass`			float, 
	`Escape`			float, 
	`Year`			float, 
	`Day`			float, 
	`TidalForce`			float, 
	`TidalLock`			char NOT NULL, 
	`Tilt`			int, 
	`Eccentricity`			float, 
	`Roche`			float, 
	`CompositionType`			int, 
	`TectonicActivity`			int, 
	`Ring`			char NOT NULL, 
	`MagneticField`			float, 
	`BaseTemp`			float, 
	`SurfaceTemp`			float, 
	`HydroID`			int, 
	`HydroExt`			int, 
	`AtmosPress`			float, 
	`Albedo`			float, 
	`GHFactor`			float, 
	`RGE`			char NOT NULL, 
	`Xcor`			float, 
	`Ycor`			float, 
	`PlanetIcon`			varchar (20)
);

-- CREATE INDEXES ...
ALTER TABLE `SolSystemBodies` ADD INDEX `SolSystemBodies_HydroID_idx` (`HydroID`);
ALTER TABLE `SolSystemBodies` ADD PRIMARY KEY (`SystemBodyID`);
ALTER TABLE `SolSystemBodies` ADD UNIQUE INDEX `SolSystemBodies_SystemBodyID_idx` (`SystemBodyID`);

CREATE TABLE `SolSystemBodiesOld`
 (
	`SystemBodyID`			int, 
	`Name`			varchar (100), 
	`PlanetNumber`			int, 
	`OrbitNumber`			int, 
	`TrojanPlanet`			int, 
	`TrojanLocation`			int, 
	`OrbitalDistance`			float, 
	`Bearing`			float, 
	`BodyClass`			int, 
	`Density`			float, 
	`Radius`			int, 
	`Gravity`			float, 
	`ParentBodyType`			int, 
	`BodyTypeID`			int, 
	`Mass`			float, 
	`Escape`			float, 
	`Year`			float, 
	`Day`			float, 
	`TidalForce`			float, 
	`TidalLock`			char NOT NULL, 
	`Tilt`			int, 
	`Eccentricity`			float, 
	`Roche`			float, 
	`CompositionType`			int, 
	`TectonicActivity`			int, 
	`Ring`			char NOT NULL, 
	`MagneticField`			float, 
	`BaseTemp`			float, 
	`SurfaceTemp`			float, 
	`HydroID`			int, 
	`HydroExt`			int, 
	`AtmosPress`			float, 
	`Albedo`			float, 
	`GHFactor`			float, 
	`RGE`			char NOT NULL, 
	`Xcor`			float, 
	`Ycor`			float, 
	`PlanetIcon`			varchar (20)
);

-- CREATE INDEXES ...
ALTER TABLE `SolSystemBodiesOld` ADD UNIQUE INDEX `SolSystemBodiesOld_HydroID_idx` (`HydroID`);
ALTER TABLE `SolSystemBodiesOld` ADD PRIMARY KEY (`SystemBodyID`);
ALTER TABLE `SolSystemBodiesOld` ADD UNIQUE INDEX `SolSystemBodiesOld_SystemBodyID_idx` (`SystemBodyID`);

CREATE TABLE `SpareNames`
 (
	`ID`			int, 
	`Name`			varchar (22)
);

-- CREATE INDEXES ...
ALTER TABLE `SpareNames` ADD PRIMARY KEY (`ID`);

CREATE TABLE `SpecialOrders`
 (
	`SpecialOrderID`			int, 
	`Description`			varchar (80), 
	`DisplayOrder`			int, 
	`NPROnly`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `SpecialOrders` ADD PRIMARY KEY (`SpecialOrderID`);
ALTER TABLE `SpecialOrders` ADD UNIQUE INDEX `SpecialOrders_SpecialOrderID_idx` (`SpecialOrderID`);

CREATE TABLE `Species`
 (
	`SpeciesID`			int, 
	`GameID`			int, 
	`TechSystemID`			int, 
	`HomeworldID`			int, 
	`DerivedSpeciesID`			int, 
	`SpeciesName`			varchar (100), 
	`RacePic`			varchar (400), 
	`BreatheID`			int, 
	`Oxygen`			float, 
	`OxyDev`			float, 
	`PressMax`			float, 
	`Temperature`			float, 
	`TempDev`			float, 
	`Gravity`			float, 
	`GravDev`			float, 
	`Xenophobia`			int, 
	`Diplomacy`			int, 
	`Translation`			int, 
	`Militancy`			int, 
	`Expansionism`			int, 
	`Determination`			int, 
	`Trade`			int
);

-- CREATE INDEXES ...
ALTER TABLE `Species` ADD INDEX `Species_BreatheID_idx` (`BreatheID`);
ALTER TABLE `Species` ADD INDEX `Species_DerivedSpeciesID_idx` (`DerivedSpeciesID`);
ALTER TABLE `Species` ADD INDEX `Species_GameID_idx` (`GameID`);
ALTER TABLE `Species` ADD INDEX `Species_HomeworldID_idx` (`HomeworldID`);
ALTER TABLE `Species` ADD INDEX `Species_NewSpeciesID_idx` (`SpeciesID`);
ALTER TABLE `Species` ADD PRIMARY KEY (`SpeciesID`);

CREATE TABLE `SpyPoints`
 (
	`SpyingRaceID`			int, 
	`TargetRaceID`			int, 
	`Points`			float
);

-- CREATE INDEXES ...
ALTER TABLE `SpyPoints` ADD PRIMARY KEY (`SpyingRaceID`, `TargetRaceID`);
ALTER TABLE `SpyPoints` ADD INDEX `SpyPoints_SpyingRaceID_idx` (`SpyingRaceID`);
ALTER TABLE `SpyPoints` ADD UNIQUE INDEX `SpyPoints_TargetRaceID_idx` (`TargetRaceID`);

CREATE TABLE `Squadrons`
 (
	`SquadronID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`Name`			varchar (100), 
	`NickName`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `Squadrons` ADD INDEX `Squadrons_GameID_idx` (`GameID`);
ALTER TABLE `Squadrons` ADD PRIMARY KEY (`SquadronID`);
ALTER TABLE `Squadrons` ADD INDEX `Squadrons_RaceID_idx` (`RaceID`);

CREATE TABLE `StaffRoles`
 (
	`StaffID`			int, 
	`StaffRole`			varchar (50)
);

-- CREATE INDEXES ...
ALTER TABLE `StaffRoles` ADD PRIMARY KEY (`StaffID`);
ALTER TABLE `StaffRoles` ADD INDEX `StaffRoles_StaffID_idx` (`StaffID`);

CREATE TABLE `StartingTechGroups`
 (
	`StartingTechGroupID`			int, 
	`Description`			varchar (100), 
	`Weight`			int, 
	`MaxChance`			int, 
	`ExtraUseful`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `StartingTechGroups` ADD PRIMARY KEY (`StartingTechGroupID`);

CREATE TABLE `StellarType`
 (
	`StellarTypeID`			int, 
	`SpectralClass`			varchar (24), 
	`SpectralNumber`			int, 
	`SpecialSystemType`			int, 
	`Checked`			char NOT NULL, 
	`NotPS`			char NOT NULL, 
	`MaxChance`			int, 
	`BDMaxChance`			int, 
	`SizeText`			varchar (8), 
	`SizeID`			int, 
	`Luminosity`			float, 
	`Mass`			float, 
	`Temperature`			int, 
	`Radius`			float, 
	`AgeRangeID`			int, 
	`Red`			int, 
	`Green`			int, 
	`Blue`			int, 
	`MaxChanceOld`			int, 
	`Note`			varchar (40)
);

-- CREATE INDEXES ...
ALTER TABLE `StellarType` ADD PRIMARY KEY (`StellarTypeID`);
ALTER TABLE `StellarType` ADD INDEX `StellarType_SizeID_idx` (`SizeID`);
ALTER TABLE `StellarType` ADD INDEX `StellarType_StellarTypeID_idx` (`StellarTypeID`);

CREATE TABLE `StoredSBGas`
 (
	`SBGasID`			int, 
	`SystemBodyID`			int, 
	`AtmosGasID`			int, 
	`AtmosGasAmount`			float, 
	`GasAtm`			float, 
	`FrozenOut`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `StoredSBGas` ADD INDEX `StoredSBGas_GasID_idx` (`AtmosGasID`);
ALTER TABLE `StoredSBGas` ADD PRIMARY KEY (`SBGasID`);
ALTER TABLE `StoredSBGas` ADD INDEX `StoredSBGas_SBGasID_idx` (`SBGasID`);
ALTER TABLE `StoredSBGas` ADD INDEX `StoredSBGas_SystemBodyID_idx` (`SystemBodyID`);

CREATE TABLE `StoredStars`
 (
	`StarID`			int, 
	`SystemID`			int, 
	`StarTypeID`			int, 
	`Name`			varchar (100), 
	`Protostar`			int, 
	`Xcor`			float, 
	`Ycor`			float, 
	`Component`			int, 
	`OrbitingComponent`			int, 
	`MeanSeparation`			float, 
	`Bearing`			float, 
	`Luminosity`			float, 
	`SpectralNumber`			int, 
	`Mass`			float, 
	`Radius`			float, 
	`ClosestSeparation`			float, 
	`FurthestSeparation`			float, 
	`OrbitalPeriod`			float, 
	`Eccentricity`			float, 
	`NearestStarDistance`			float, 
	`NearestStarDistance2`			float, 
	`NSFA`			float, 
	`NSFA2`			float, 
	`AgeRangeID`			int, 
	`NearestStarID`			int, 
	`StarColour`			int, 
	`SpectralClassDesc`			varchar (40)
);

-- CREATE INDEXES ...
ALTER TABLE `StoredStars` ADD INDEX `StoredStars_AgeRangeID_idx` (`AgeRangeID`);
ALTER TABLE `StoredStars` ADD INDEX `StoredStars_NearestStarID_idx` (`NearestStarID`);
ALTER TABLE `StoredStars` ADD PRIMARY KEY (`StarID`);
ALTER TABLE `StoredStars` ADD UNIQUE INDEX `StoredStars_StarTypeID_idx` (`StarTypeID`);
ALTER TABLE `StoredStars` ADD UNIQUE INDEX `StoredStars_SystemID_idx` (`SystemID`);

CREATE TABLE `StoredSystemBodies`
 (
	`StoredSystemBodyID`			int, 
	`SystemID`			int, 
	`StarID`			int, 
	`Name`			varchar (100), 
	`PlanetNumber`			int, 
	`OrbitNumber`			int, 
	`OrbitalDistance`			float, 
	`CurrentDistance`			float, 
	`HeadingInward`			char NOT NULL, 
	`Bearing`			float, 
	`BodyClass`			int, 
	`Density`			float, 
	`Radius`			int, 
	`Gravity`			float, 
	`ParentBodyID`			int, 
	`ParentBodyType`			int, 
	`BodyTypeID`			int, 
	`Mass`			float, 
	`Escape`			float, 
	`Year`			float, 
	`TidalForce`			float, 
	`TidalLock`			char NOT NULL, 
	`Tilt`			int, 
	`Eccentricity`			float, 
	`Day`			float, 
	`Roche`			float, 
	`CompositionType`			int, 
	`TectonicActivity`			int, 
	`Ring`			char NOT NULL, 
	`MagneticField`			float, 
	`BaseTemp`			float, 
	`SurfaceTemp`			float, 
	`HydroID`			int, 
	`HydroExt`			int, 
	`AtmosPress`			float, 
	`Albedo`			float, 
	`GHFactor`			float, 
	`RGE`			char NOT NULL, 
	`Xcor`			float, 
	`Ycor`			float, 
	`Focus2X`			float, 
	`Focus2Y`			float, 
	`PlanetIcon`			varchar (20), 
	`TradeResourceModifier`			int, 
	`HabWorld`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `StoredSystemBodies` ADD INDEX `StoredSystemBodies_HydroID_idx` (`HydroID`);
ALTER TABLE `StoredSystemBodies` ADD INDEX `StoredSystemBodies_ParentBodyID_idx` (`ParentBodyID`);
ALTER TABLE `StoredSystemBodies` ADD PRIMARY KEY (`StoredSystemBodyID`);
ALTER TABLE `StoredSystemBodies` ADD INDEX `StoredSystemBodies_StarID_idx` (`StarID`);
ALTER TABLE `StoredSystemBodies` ADD INDEX `StoredSystemBodies_SystemBodyID_idx` (`StoredSystemBodyID`);
ALTER TABLE `StoredSystemBodies` ADD INDEX `StoredSystemBodies_SystemID_idx` (`SystemID`);

CREATE TABLE `SurveyLocation`
 (
	`SurveyLocationID`			int, 
	`SystemID`			int, 
	`Order`			int, 
	`Xcor`			float, 
	`Ycor`			float
);

-- CREATE INDEXES ...
ALTER TABLE `SurveyLocation` ADD PRIMARY KEY (`SurveyLocationID`);
ALTER TABLE `SurveyLocation` ADD UNIQUE INDEX `SurveyLocation_SurveyLocationID_idx` (`SurveyLocationID`);
ALTER TABLE `SurveyLocation` ADD INDEX `SurveyLocation_SystemID_idx` (`SystemID`);

CREATE TABLE `Survivors`
 (
	`SurvivorID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`SpeciesID`			int, 
	`ShipID`			int, 
	`SurvivorsShipName`			varchar (100), 
	`Crew`			int, 
	`Wounded`			int, 
	`RescueTime`			int, 
	`RescueSystemID`			int, 
	`GradePoints`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Survivors` ADD INDEX `Survivors_GameID_idx` (`GameID`);
ALTER TABLE `Survivors` ADD PRIMARY KEY (`SurvivorID`);
ALTER TABLE `Survivors` ADD INDEX `Survivors_RaceID_idx` (`RaceID`);
ALTER TABLE `Survivors` ADD INDEX `Survivors_RescueSystemID_idx` (`RescueSystemID`);
ALTER TABLE `Survivors` ADD INDEX `Survivors_ShipID_idx` (`SurvivorsShipName`);
ALTER TABLE `Survivors` ADD INDEX `Survivors_ShipID1_idx` (`ShipID`);
ALTER TABLE `Survivors` ADD INDEX `Survivors_SpeciesID_idx` (`SpeciesID`);
ALTER TABLE `Survivors` ADD UNIQUE INDEX `Survivors_SurvivorID_idx` (`SurvivorID`);

CREATE TABLE `SwarmPopCapacity`
 (
	`PopulationID`			int, 
	`SpareCapacity`			int, 
	`SpareProduction`			int
);

-- CREATE INDEXES ...
ALTER TABLE `SwarmPopCapacity` ADD INDEX `SwarmPopCapacity_PopulationID_idx` (`PopulationID`);
ALTER TABLE `SwarmPopCapacity` ADD PRIMARY KEY (`PopulationID`);

CREATE TABLE `System`
 (
	`SystemID`			int, 
	`FixedName`			varchar (60), 
	`SpecialType`			int, 
	`SystemNumber`			int NOT NULL, 
	`Age`			float, 
	`AbundanceModifier`			int, 
	`Stars`			int, 
	`GameID`			int, 
	`Display`			char NOT NULL, 
	`WPSurvey`			int, 
	`SystemTypeID`			int, 
	`DustDensity`			int, 
	`SolSystem`			char NOT NULL, 
	`X`			float, 
	`Y`			float, 
	`Z`			float, 
	`NoSensorChecks`			int
);

-- CREATE INDEXES ...
ALTER TABLE `System` ADD INDEX `System_GameID_idx` (`GameID`);
ALTER TABLE `System` ADD PRIMARY KEY (`SystemID`);
ALTER TABLE `System` ADD UNIQUE INDEX `System_StarSystemID_idx` (`SystemID`);
ALTER TABLE `System` ADD INDEX `System_SystemNumber_idx` (`SystemNumber`);

CREATE TABLE `SystemAbundance`
 (
	`AbundanceID`			int, 
	`Description`			varchar (24), 
	`MaxChance`			int, 
	`Modifier`			int
);

-- CREATE INDEXES ...
ALTER TABLE `SystemAbundance` ADD INDEX `SystemAbundance_AbundanceID_idx` (`AbundanceID`);
ALTER TABLE `SystemAbundance` ADD PRIMARY KEY (`AbundanceID`);

CREATE TABLE `SystemAge`
 (
	`AgeID`			int, 
	`SpectralClass`			varchar (24), 
	`TotalLife`			float, 
	`Lum1`			float, 
	`Lum2`			float, 
	`Lum3`			float, 
	`Lum4`			float, 
	`Lum5`			float, 
	`Lum6`			float, 
	`Lum7`			float, 
	`Lum8`			float, 
	`Lum9`			float, 
	`Lum10`			float, 
	`Age1`			float, 
	`Age2`			float, 
	`Age3`			float, 
	`Age4`			float, 
	`Age5`			float, 
	`Age6`			float, 
	`Age7`			float, 
	`Age8`			float, 
	`Age9`			float, 
	`Age10`			float
);

-- CREATE INDEXES ...
ALTER TABLE `SystemAge` ADD INDEX `SystemAge_AgeID_idx` (`AgeID`);
ALTER TABLE `SystemAge` ADD PRIMARY KEY (`AgeID`);

CREATE TABLE `SystemBody`
 (
	`SystemBodyID`			int, 
	`SystemID`			int, 
	`StarID`			int, 
	`GameID`			int, 
	`Name`			varchar (100), 
	`PlanetNumber`			int, 
	`OrbitNumber`			int, 
	`TrojanAsteroid`			float, 
	`OrbitalDistance`			float, 
	`CurrentDistance`			float, 
	`HeadingInward`			char NOT NULL, 
	`Bearing`			float, 
	`BodyClass`			int, 
	`Density`			float, 
	`Radius`			int, 
	`Gravity`			float, 
	`ParentBodyID`			int, 
	`ParentBodyType`			int, 
	`BodyTypeID`			int, 
	`Mass`			float, 
	`Escape`			float, 
	`Year`			float, 
	`TidalForce`			float, 
	`TidalLock`			char NOT NULL, 
	`Tilt`			int, 
	`Eccentricity`			float, 
	`Day`			float, 
	`Roche`			float, 
	`CompositionType`			int, 
	`TectonicActivity`			int, 
	`Ring`			char NOT NULL, 
	`MagneticField`			float, 
	`BaseTemp`			float, 
	`SurfaceTemp`			float, 
	`HydroID`			int, 
	`HydroExt`			int, 
	`AtmosPress`			float, 
	`Albedo`			float, 
	`GHFactor`			float, 
	`RGE`			char NOT NULL, 
	`Xcor`			float, 
	`Ycor`			float, 
	`Focus2X`			float, 
	`Focus2Y`			float, 
	`PlanetIcon`			varchar (20), 
	`RuinID`			int, 
	`RuinRaceID`			int, 
	`RadiationLevel`			float, 
	`DustLevel`			float, 
	`AbandonedFactories`			int, 
	`MineralSurveyComplete`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `SystemBody` ADD INDEX `SystemBody_HydroID_idx` (`HydroID`);
ALTER TABLE `SystemBody` ADD UNIQUE INDEX `SystemBody_ParentBodyID_idx` (`ParentBodyID`);
ALTER TABLE `SystemBody` ADD PRIMARY KEY (`SystemBodyID`);
ALTER TABLE `SystemBody` ADD UNIQUE INDEX `SystemBody_StarID_idx` (`StarID`);
ALTER TABLE `SystemBody` ADD UNIQUE INDEX `SystemBody_SystemBodyID_idx` (`SystemBodyID`);
ALTER TABLE `SystemBody` ADD INDEX `SystemBody_SystemID_idx` (`SystemID`);

CREATE TABLE `SystemBodySurveys`
 (
	`SystemBodySurveyID`			int, 
	`RaceID`			int, 
	`SystemID`			int, 
	`SystemBodyID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `SystemBodySurveys` ADD PRIMARY KEY (`SystemBodySurveyID`);
ALTER TABLE `SystemBodySurveys` ADD INDEX `SystemBodySurveys_RaceID_idx` (`RaceID`);
ALTER TABLE `SystemBodySurveys` ADD INDEX `SystemBodySurveys_SystemBodyID_idx` (`SystemBodyID`);
ALTER TABLE `SystemBodySurveys` ADD UNIQUE INDEX `SystemBodySurveys_SystemID_idx` (`SystemID`);

CREATE TABLE `SystemDisplay`
 (
	`SystemDisplay`			int, 
	`RaceID`			int, 
	`PosName`			int, 
	`PosType`			int, 
	`PosDist`			int, 
	`PosDia`			int, 
	`PosGrav`			int, 
	`PosYear`			int, 
	`PosDay`			int, 
	`PosTilt`			int, 
	`PosSTemp`			int, 
	`PosTect`			int, 
	`PosMass`			int, 
	`PosDense`			int, 
	`PosEsc`			int, 
	`PosMag`			int, 
	`PosTidal`			int, 
	`PosAtmos`			int, 
	`PosPress`			int, 
	`PosHydro`			int, 
	`PosExt`			int, 
	`PosBase`			int, 
	`PosAlb`			int, 
	`PosGHF`			int, 
	`PosSuit`			int, 
	`PosPop`			int, 
	`optAst`			int, 
	`optMoon`			int, 
	`optDist`			int, 
	`optRad`			int, 
	`optESC`			int, 
	`optTemp`			int, 
	`PosRad`			int, 
	`PosDust`			int
);

-- CREATE INDEXES ...
ALTER TABLE `SystemDisplay` ADD PRIMARY KEY (`SystemDisplay`);
ALTER TABLE `SystemDisplay` ADD INDEX `SystemDisplay_RaceID_idx` (`RaceID`);

CREATE TABLE `SystemNotes`
 (
	`RaceID`			int, 
	`SystemID`			int, 
	`Notes`			text (255)
);

-- CREATE INDEXES ...
ALTER TABLE `SystemNotes` ADD PRIMARY KEY (`RaceID`, `SystemID`);
ALTER TABLE `SystemNotes` ADD UNIQUE INDEX `SystemNotes_RaceID_idx` (`RaceID`);
ALTER TABLE `SystemNotes` ADD INDEX `SystemNotes_SystemID_idx` (`SystemID`);

CREATE TABLE `SystemPopulations`
 (
	`SystemID`			int, 
	`TotalPopulation`			float
);

-- CREATE INDEXES ...
ALTER TABLE `SystemPopulations` ADD PRIMARY KEY (`SystemID`);
ALTER TABLE `SystemPopulations` ADD UNIQUE INDEX `SystemPopulations_SystemID_idx` (`SystemID`);

CREATE TABLE `TaskForce`
 (
	`TaskForceID`			int, 
	`RaceID`			int, 
	`GameID`			int, 
	`Name`			varchar (100), 
	`LocationID`			int, 
	`LocationType`			int, 
	`Training`			int, 
	`Operations`			float, 
	`Intelligence`			float, 
	`Logistics`			float, 
	`Survey`			float, 
	`Comms`			float, 
	`PublicAffairs`			float, 
	`FighterOps`			float, 
	`Expanded`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `TaskForce` ADD INDEX `TaskForce_GameID_idx` (`GameID`);
ALTER TABLE `TaskForce` ADD INDEX `TaskForce_LocationID_idx` (`LocationID`);
ALTER TABLE `TaskForce` ADD INDEX `TaskForce_LocationTypeID_idx` (`LocationType`);
ALTER TABLE `TaskForce` ADD PRIMARY KEY (`TaskForceID`);
ALTER TABLE `TaskForce` ADD INDEX `TaskForce_RaceID_idx` (`RaceID`);
ALTER TABLE `TaskForce` ADD INDEX `TaskForce_TaskForceID_idx` (`TaskForceID`);

CREATE TABLE `TaskType`
 (
	`TaskTypeID`			int, 
	`Type`			varchar (60)
);

-- CREATE INDEXES ...
ALTER TABLE `TaskType` ADD PRIMARY KEY (`TaskTypeID`);

CREATE TABLE `TeamType`
 (
	`TeamType`			int, 
	`TeamDesc`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `TeamType` ADD PRIMARY KEY (`TeamType`);

CREATE TABLE `TechSystem`
 (
	`TechSystemID`			int, 
	`Name`			varchar (200), 
	`ComponentName`			varchar (100), 
	`CategoryID`			int, 
	`RaceID`			int, 
	`TechTypeID`			int, 
	`NoTechScan`			char NOT NULL, 
	`RuinOnly`			char NOT NULL, 
	`Prerequisite1`			int, 
	`Prerequisite2`			int, 
	`StartingSystem`			char NOT NULL, 
	`ConventionalSystem`			char NOT NULL, 
	`DevelopCost`			int, 
	`AdditionalInfo`			float, 
	`AdditionalInfo2`			float, 
	`AdditionalInfo3`			float, 
	`AdditionalInfo4`			float, 
	`TechDescription`			varchar (510)
);

-- CREATE INDEXES ...
ALTER TABLE `TechSystem` ADD INDEX `TechSystem_CategoryID_idx` (`CategoryID`);
ALTER TABLE `TechSystem` ADD PRIMARY KEY (`TechSystemID`);
ALTER TABLE `TechSystem` ADD INDEX `TechSystem_TechSystemID_idx` (`TechSystemID`);
ALTER TABLE `TechSystem` ADD INDEX `TechSystem_TechTypeID_idx` (`TechTypeID`);

CREATE TABLE `TechType`
 (
	`TechTypeID`			int, 
	`Description`			varchar (100), 
	`FieldID`			int, 
	`Checked`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `TechType` ADD INDEX `TechType_FieldID_idx` (`FieldID`);
ALTER TABLE `TechType` ADD PRIMARY KEY (`TechTypeID`);
ALTER TABLE `TechType` ADD INDEX `TechType_TechTypeID_idx` (`TechTypeID`);

CREATE TABLE `Tectonics`
 (
	`TectonicID`			int, 
	`Activity`			varchar (40)
);

-- CREATE INDEXES ...
ALTER TABLE `Tectonics` ADD PRIMARY KEY (`TectonicID`);
ALTER TABLE `Tectonics` ADD INDEX `Tectonics_TectonicID_idx` (`TectonicID`);

CREATE TABLE `TempAssignment`
 (
	`TempID`			int, 
	`CommanderID`			int, 
	`AssignmentName`			varchar (200), 
	`AssignmentLocation`			varchar (100), 
	`AssignmentType`			varchar (100), 
	`RankRequired`			varchar (8), 
	`CommandID`			int, 
	`Seniority`			int, 
	`Rank`			int, 
	`CommandType`			int
);

-- CREATE INDEXES ...
ALTER TABLE `TempAssignment` ADD INDEX `TempAssignment_CommanderID_idx` (`CommanderID`);
ALTER TABLE `TempAssignment` ADD UNIQUE INDEX `TempAssignment_CommandID_idx` (`CommandID`);
ALTER TABLE `TempAssignment` ADD PRIMARY KEY (`TempID`);
ALTER TABLE `TempAssignment` ADD UNIQUE INDEX `TempAssignment_TempID_idx` (`TempID`);

CREATE TABLE `ThemeClass`
 (
	`ThemeClassID`			int, 
	`ThemeID`			int, 
	`ClassName`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `ThemeClass` ADD PRIMARY KEY (`ThemeClassID`);
ALTER TABLE `ThemeClass` ADD UNIQUE INDEX `ThemeClass_ThemeClassID_idx` (`ThemeClassID`);
ALTER TABLE `ThemeClass` ADD UNIQUE INDEX `ThemeClass_ThemeID_idx` (`ThemeID`);

CREATE TABLE `ThemeRank`
 (
	`ThemeID`			int, 
	`ThemeRankID`			int, 
	`RankName`			varchar (60) NOT NULL, 
	`GFRankName`			varchar (100), 
	`CivilianRank`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `ThemeRank` ADD PRIMARY KEY (`ThemeID`, `ThemeRankID`);
ALTER TABLE `ThemeRank` ADD INDEX `ThemeRank_SugRankID_idx` (`ThemeID`);
ALTER TABLE `ThemeRank` ADD INDEX `ThemeRank_ThemeRankID_idx` (`ThemeRankID`);

CREATE TABLE `ThemeSystem`
 (
	`ThemeSystemID`			int, 
	`ThemeID`			int, 
	`SystemName`			varchar (50)
);

-- CREATE INDEXES ...
ALTER TABLE `ThemeSystem` ADD PRIMARY KEY (`ThemeSystemID`);
ALTER TABLE `ThemeSystem` ADD INDEX `ThemeSystem_ThemeID_idx` (`ThemeID`);
ALTER TABLE `ThemeSystem` ADD INDEX `ThemeSystem_ThemeSystemID_idx` (`ThemeSystemID`);

CREATE TABLE `TradeGoods`
 (
	`TradeGoodID`			int, 
	`Description`			varchar (100), 
	`PopRequired`			float, 
	`NoDisplay`			int, 
	`SpecialNote`			int
);

-- CREATE INDEXES ...
ALTER TABLE `TradeGoods` ADD PRIMARY KEY (`TradeGoodID`);
ALTER TABLE `TradeGoods` ADD INDEX `TradeGoods_TradeGoodID_idx` (`TradeGoodID`);

CREATE TABLE `TradeOffer`
 (
	`MineralTradeID`			int, 
	`OfferRaceID`			int, 
	`TradeTypeID`			int, 
	`TradeID`			int, 
	`Cost`			float, 
	`MaxTrade`			int, 
	`SystemBodyID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `TradeOffer` ADD INDEX `TradeOffer_MineralTradeID_idx` (`MineralTradeID`);
ALTER TABLE `TradeOffer` ADD INDEX `TradeOffer_OfferMineralID_idx` (`TradeID`);
ALTER TABLE `TradeOffer` ADD INDEX `TradeOffer_OfferTypeID_idx` (`TradeTypeID`);
ALTER TABLE `TradeOffer` ADD PRIMARY KEY (`MineralTradeID`);
ALTER TABLE `TradeOffer` ADD INDEX `TradeOffer_SystemBodyID_idx` (`SystemBodyID`);

CREATE TABLE `TraitsList`
 (
	`TraitID`			int, 
	`Name`			varchar (80), 
	`GroupID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `TraitsList` ADD INDEX `TraitsList_GroupID_idx` (`GroupID`);
ALTER TABLE `TraitsList` ADD PRIMARY KEY (`TraitID`);
ALTER TABLE `TraitsList` ADD INDEX `TraitsList_TraitID_idx` (`TraitID`);

CREATE TABLE `WarpPoint`
 (
	`WarpPointID`			int, 
	`SystemID`			int, 
	`Distance`			float, 
	`Bearing`			int, 
	`WPLink`			int, 
	`Xcor`			float, 
	`Ycor`			float, 
	`JumpGateStrength`			int, 
	`JumpGateRaceID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `WarpPoint` ADD PRIMARY KEY (`WarpPointID`);
ALTER TABLE `WarpPoint` ADD INDEX `WarpPoint_SystemID_idx` (`SystemID`);
ALTER TABLE `WarpPoint` ADD UNIQUE INDEX `WarpPoint_WarpPointID_idx` (`WarpPointID`);
ALTER TABLE `WarpPoint` ADD INDEX `WarpPoint_WPLink_idx` (`WPLink`);

CREATE TABLE `Waypoint`
 (
	`WaypointID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`SystemID`			int, 
	`CreationTime`			float, 
	`Xcor`			float, 
	`Ycor`			float, 
	`Number`			int, 
	`WaypointType`			int
);

-- CREATE INDEXES ...
ALTER TABLE `Waypoint` ADD UNIQUE INDEX `Waypoint_GameID_idx` (`GameID`);
ALTER TABLE `Waypoint` ADD INDEX `Waypoint_Number_idx` (`Number`);
ALTER TABLE `Waypoint` ADD PRIMARY KEY (`WaypointID`);
ALTER TABLE `Waypoint` ADD INDEX `Waypoint_RaceID_idx` (`RaceID`);
ALTER TABLE `Waypoint` ADD INDEX `Waypoint_SystemID_idx` (`SystemID`);
ALTER TABLE `Waypoint` ADD UNIQUE INDEX `Waypoint_WaypointID_idx` (`WaypointID`);

CREATE TABLE `WealthData`
 (
	`WealthDataID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`Amount`			float, 
	`UseID`			int, 
	`TimeUsed`			float
);

-- CREATE INDEXES ...
ALTER TABLE `WealthData` ADD INDEX `WealthData_GameID_idx` (`GameID`);
ALTER TABLE `WealthData` ADD PRIMARY KEY (`WealthDataID`);
ALTER TABLE `WealthData` ADD UNIQUE INDEX `WealthData_RaceID_idx` (`RaceID`);
ALTER TABLE `WealthData` ADD INDEX `WealthData_WealthID_idx` (`WealthDataID`);

CREATE TABLE `WealthUse`
 (
	`WealthUseID`			int, 
	`Description`			varchar (100), 
	`Income`			char NOT NULL, 
	`DisplayOrder`			float
);

-- CREATE INDEXES ...
ALTER TABLE `WealthUse` ADD PRIMARY KEY (`WealthUseID`);
ALTER TABLE `WealthUse` ADD UNIQUE INDEX `WealthUse_WealthUseID_idx` (`WealthUseID`);

CREATE TABLE `WeaponRecharge`
 (
	`WeaponRechargeID`			int, 
	`GameID`			int, 
	`ShipID`			int, 
	`WeaponID`			int, 
	`WeaponNum`			int, 
	`RechargeAmount`			float, 
	`MissileWeapon`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `WeaponRecharge` ADD INDEX `WeaponRecharge_GameID_idx` (`GameID`);
ALTER TABLE `WeaponRecharge` ADD PRIMARY KEY (`WeaponRechargeID`);
ALTER TABLE `WeaponRecharge` ADD INDEX `WeaponRecharge_ShipID_idx` (`ShipID`);
ALTER TABLE `WeaponRecharge` ADD INDEX `WeaponRecharge_WeaponID_idx` (`WeaponID`);
ALTER TABLE `WeaponRecharge` ADD INDEX `WeaponRecharge_WeaponNum_idx` (`WeaponNum`);
ALTER TABLE `WeaponRecharge` ADD INDEX `WeaponRecharge_WeaponRechargeID_idx` (`WeaponRechargeID`);

CREATE TABLE `WindowPosition`
 (
	`PositionID`			int, 
	`GameID`			int, 
	`FormName`			varchar (60), 
	`Left`			int, 
	`Top`			int
);

-- CREATE INDEXES ...
ALTER TABLE `WindowPosition` ADD INDEX `WindowPosition_GameID_idx` (`GameID`);
ALTER TABLE `WindowPosition` ADD INDEX `WindowPosition_PositionID_idx` (`PositionID`);
ALTER TABLE `WindowPosition` ADD PRIMARY KEY (`PositionID`);

CREATE TABLE `Wormholes`
 (
	`WormholeID`			int, 
	`GameID`			int, 
	`SystemID`			int, 
	`Xcor`			float, 
	`Ycor`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Wormholes` ADD INDEX `Wormholes_GameID_idx` (`GameID`);
ALTER TABLE `Wormholes` ADD PRIMARY KEY (`WormholeID`);
ALTER TABLE `Wormholes` ADD INDEX `Wormholes_SystemID_idx` (`SystemID`);
ALTER TABLE `Wormholes` ADD INDEX `Wormholes_WormholeID_idx` (`WormholeID`);

CREATE TABLE `WreckComponents`
 (
	`WreckID`			int, 
	`ComponentID`			int, 
	`Amount`			int
);

-- CREATE INDEXES ...
ALTER TABLE `WreckComponents` ADD INDEX `WreckComponents_ComponentID_idx` (`ComponentID`);
ALTER TABLE `WreckComponents` ADD PRIMARY KEY (`WreckID`, `ComponentID`);
ALTER TABLE `WreckComponents` ADD UNIQUE INDEX `WreckComponents_WreckID_idx` (`WreckID`);

CREATE TABLE `Wrecks`
 (
	`WreckID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`SystemID`			int, 
	`ClassID`			int, 
	`Size`			int, 
	`EffectiveSize`			int, 
	`StarSwarmHatching`			int, 
	`QueenStatus`			int, 
	`Xcor`			float, 
	`Ycor`			float, 
	`Duranium`			float, 
	`Neutronium`			float, 
	`Corbomite`			float, 
	`Tritanium`			float, 
	`Boronide`			float, 
	`Mercassium`			float, 
	`Vendarite`			float, 
	`Sorium`			float, 
	`Uridium`			float, 
	`Corundium`			float, 
	`Gallicite`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Wrecks` ADD INDEX `Wrecks_ClassID_idx` (`ClassID`);
ALTER TABLE `Wrecks` ADD UNIQUE INDEX `Wrecks_GameID_idx` (`GameID`);
ALTER TABLE `Wrecks` ADD UNIQUE INDEX `Wrecks_LifePodID_idx` (`WreckID`);
ALTER TABLE `Wrecks` ADD PRIMARY KEY (`WreckID`);
ALTER TABLE `Wrecks` ADD INDEX `Wrecks_RaceID_idx` (`RaceID`);
ALTER TABLE `Wrecks` ADD INDEX `Wrecks_SystemID_idx` (`SystemID`);

CREATE TABLE `AlienScan`
 (
	`AlienScanID`			int, 
	`ScanRaceID`			int, 
	`AlienClassID`			int, 
	`TechID`			int, 
	`AlienRaceID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `AlienScan` ADD INDEX `AlienScan_ALienRaceID_idx` (`AlienRaceID`);
ALTER TABLE `AlienScan` ADD INDEX `AlienScan_AlienScanID_idx` (`AlienScanID`);
ALTER TABLE `AlienScan` ADD UNIQUE INDEX `AlienScan_AlienShipScanID_idx` (`AlienClassID`);
ALTER TABLE `AlienScan` ADD PRIMARY KEY (`AlienScanID`);
ALTER TABLE `AlienScan` ADD UNIQUE INDEX `AlienScan_ScanRaceID_idx` (`ScanRaceID`);
ALTER TABLE `AlienScan` ADD INDEX `AlienScan_TechID_idx` (`TechID`);

CREATE TABLE `AutomatedClassDesign`
 (
	`AutomatedClassID`			int, 
	`DesignID`			varchar (100), 
	`NPRClassType`			int, 
	`DefaultClassName`			varchar (100), 
	`ShippingLineName`			varchar (40), 
	`KeyTechA`			int, 
	`KeyTechB`			int, 
	`JumpDriveType`			varchar (4), 
	`StandardRaceCreation`			char NOT NULL, 
	`BeamShipsUpdate`			char NOT NULL, 
	`MissileShipsUpdate`			char NOT NULL, 
	`PDShipsUpdate`			char NOT NULL, 
	`ShipEngineUpdate`			char NOT NULL, 
	`JumpEngineUpdate`			char NOT NULL, 
	`StarSwarm`			char NOT NULL, 
	`AutomatedWeaponAssign`			varchar (4), 
	`EWSystems`			char NOT NULL, 
	`HullID`			int, 
	`HullSizeType`			varchar (2), 
	`HullSize`			float, 
	`WeaponType`			varchar (4), 
	`MissileType`			varchar (4), 
	`EngineType`			int, 
	`EngineNumberType`			varchar (2), 
	`EngineNumber`			int, 
	`RandomEngineElement`			int, 
	`EngineeringType`			varchar (2), 
	`Engineering`			int, 
	`DeploymentDuration`			float, 
	`FuelDuration`			float, 
	`AdditionalArmour`			char NOT NULL, 
	`ArmourAdjustment`			int, 
	`Hangar`			int, 
	`Shields`			int, 
	`Active`			varchar (4), 
	`SecondaryActive`			varchar (4), 
	`NumFireControls`			int, 
	`MissileFireControl`			varchar (4), 
	`BeamFireControl`			varchar (100), 
	`ThermalFixed`			int, 
	`ThermalRandom`			int, 
	`EMFixed`			int, 
	`EMRandom`			int, 
	`CargoHolds`			int, 
	`CargoHandling`			int, 
	`CryogenicModules`			int, 
	`LuxuryAccomodation`			int, 
	`Extraction`			int, 
	`FixedHarvesterModules`			int, 
	`RandomHarvesterModules`			int, 
	`TerraformModules`			int, 
	`SalvageModules`			int, 
	`JGCS`			char NOT NULL, 
	`CIWSFixed`			int, 
	`CIWSRandom`			int, 
	`GeoSensorFixed`			int, 
	`GeoSensorRandom`			int, 
	`GravSensorFixed`			int, 
	`GravSensorRandom`			int
);

-- CREATE INDEXES ...
ALTER TABLE `AutomatedClassDesign` ADD UNIQUE INDEX `AutomatedClassDesign_AutomatedClassID_idx` (`AutomatedClassID`);
ALTER TABLE `AutomatedClassDesign` ADD UNIQUE INDEX `AutomatedClassDesign_HullID_idx` (`HullID`);
ALTER TABLE `AutomatedClassDesign` ADD INDEX `AutomatedClassDesign_MissileID_idx` (`MissileType`);
ALTER TABLE `AutomatedClassDesign` ADD INDEX `AutomatedClassDesign_NumFireControls_idx` (`NumFireControls`);
ALTER TABLE `AutomatedClassDesign` ADD PRIMARY KEY (`AutomatedClassID`);

CREATE TABLE `ClassSC`
 (
	`ClassSCID`			int, 
	`ShipClassID`			int, 
	`FighterClassID`			int, 
	`Number`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ClassSC` ADD INDEX `ClassSC_ExpendID_idx` (`FighterClassID`);
ALTER TABLE `ClassSC` ADD PRIMARY KEY (`ClassSCID`);
ALTER TABLE `ClassSC` ADD INDEX `ClassSC_ShipID_idx` (`ShipClassID`);
ALTER TABLE `ClassSC` ADD INDEX `ClassSC_ShipSCID_idx` (`ClassSCID`);

CREATE TABLE `CommanderNames`
 (
	`NameThemeID`			int, 
	`FirstName`			char NOT NULL, 
	`Name`			varchar (100), 
	`ThirdName`			char NOT NULL, 
	`Female`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `CommanderNames` ADD INDEX `CommanderNames_NameThemeID_idx` (`NameThemeID`);

CREATE TABLE `Contacts`
 (
	`UniqueID`			int, 
	`ContactID`			int, 
	`GameID`			int, 
	`SystemID`			int, 
	`DetectRaceID`			int, 
	`ContactRaceID`			int, 
	`ContactName`			varchar (100), 
	`CreationTime`			float, 
	`Reestablished`			float, 
	`LastUpdate`			float, 
	`ContactMethod`			int, 
	`ContactType`			int, 
	`Nebula`			char NOT NULL, 
	`PDCContact`			int, 
	`ContactStrength`			int, 
	`ContactNumber`			int, 
	`ContactClassID`			int, 
	`Resolution`			int, 
	`ContinualContactTime`			int, 
	`Xcor`			float, 
	`Ycor`			float, 
	`LastXcor`			float, 
	`LastYcor`			float, 
	`Speed`			int, 
	`Msg`			char NOT NULL, 
	`IncrementStartX`			float, 
	`IncrementStartY`			float
);

-- CREATE INDEXES ...
ALTER TABLE `Contacts` ADD INDEX `Contacts_ContactClassID_idx` (`ContactClassID`);
ALTER TABLE `Contacts` ADD UNIQUE INDEX `Contacts_ContactRaceID_idx` (`ContactRaceID`);
ALTER TABLE `Contacts` ADD INDEX `Contacts_FleetID_idx` (`ContactID`);
ALTER TABLE `Contacts` ADD INDEX `Contacts_GameID_idx` (`GameID`);
ALTER TABLE `Contacts` ADD PRIMARY KEY (`UniqueID`);
ALTER TABLE `Contacts` ADD INDEX `Contacts_RaceID_idx` (`DetectRaceID`);
ALTER TABLE `Contacts` ADD INDEX `Contacts_SystemID_idx` (`SystemID`);
ALTER TABLE `Contacts` ADD UNIQUE INDEX `Contacts_UniqueID_idx` (`UniqueID`);

CREATE TABLE `DefaultEventColour`
 (
	`EventTypeID`			int, 
	`RaceID`			int, 
	`AlertColour`			int, 
	`TextColour`			int, 
	`CreationOrder`			int
);

-- CREATE INDEXES ...
ALTER TABLE `DefaultEventColour` ADD INDEX `DefaultEventColour_EventTypeID_idx` (`EventTypeID`);
ALTER TABLE `DefaultEventColour` ADD PRIMARY KEY (`EventTypeID`, `RaceID`);

CREATE TABLE `EventColour`
 (
	`EventTypeID`			int, 
	`RaceID`			int, 
	`AlertColour`			int, 
	`TextColour`			int, 
	`CreationOrder`			int
);

-- CREATE INDEXES ...
ALTER TABLE `EventColour` ADD INDEX `EventColour_EventTypeID_idx` (`EventTypeID`);
ALTER TABLE `EventColour` ADD PRIMARY KEY (`EventTypeID`, `RaceID`);

CREATE TABLE `Fires`
 (
	`ShipID`			int, 
	`GameID`			int, 
	`FireStrength`			int
);

-- CREATE INDEXES ...
ALTER TABLE `Fires` ADD INDEX `Fires_GameID_idx` (`GameID`);
ALTER TABLE `Fires` ADD PRIMARY KEY (`ShipID`);
ALTER TABLE `Fires` ADD INDEX `Fires_ShipID_idx` (`ShipID`);

CREATE TABLE `ForeignAid`
 (
	`RaceID`			int, 
	`AlienID`			int, 
	`GameID`			int, 
	`Amount`			int
);

-- CREATE INDEXES ...
ALTER TABLE `ForeignAid` ADD INDEX `ForeignAid_AlienID_idx` (`AlienID`);
ALTER TABLE `ForeignAid` ADD INDEX `ForeignAid_GameID_idx` (`GameID`);
ALTER TABLE `ForeignAid` ADD PRIMARY KEY (`RaceID`, `AlienID`);
ALTER TABLE `ForeignAid` ADD INDEX `ForeignAid_RaceID_idx` (`RaceID`);

CREATE TABLE `GovType`
 (
	`GovTypeID`			int, 
	`GovName`			varchar (60), 
	`MissileBases`			float, 
	`TotalIndustrial`			int, 
	`ResearchRate`			float, 
	`TrainingLevel`			int, 
	`SYPerAcademy`			int, 
	`MaxChance`			int, 
	`GrowthMod`			float, 
	`ConstMod`			float, 
	`Shipyards`			int, 
	`Labs`			int, 
	`Construction`			int, 
	`Refineries`			float, 
	`Mines`			int, 
	`Sensors`			int, 
	`XenophobiaMod`			int, 
	`DiplomacyMod`			int, 
	`MilitancyMod`			int, 
	`ExpansionismMod`			int, 
	`DeterminationMod`			int, 
	`TradeMod`			int, 
	`UserDefined`			char NOT NULL, 
	`HA`			int, 
	`MI`			int, 
	`AI`			int, 
	`GAR`			int
);

-- CREATE INDEXES ...
ALTER TABLE `GovType` ADD UNIQUE INDEX `GovType_GovernmentTypeID_idx` (`GovTypeID`);
ALTER TABLE `GovType` ADD PRIMARY KEY (`GovTypeID`);

CREATE TABLE `IndustryStatus`
 (
	`PopID`			int, 
	`IndustrialType`			int, 
	`GameID`			int, 
	`Reactivating`			char NOT NULL, 
	`TimeRemaining`			int
);

-- CREATE INDEXES ...
ALTER TABLE `IndustryStatus` ADD INDEX `IndustryStatus_GameID_idx` (`GameID`);
ALTER TABLE `IndustryStatus` ADD UNIQUE INDEX `IndustryStatus_PopID_idx` (`PopID`);
ALTER TABLE `IndustryStatus` ADD PRIMARY KEY (`PopID`, `IndustrialType`);

CREATE TABLE `KnownRuinRace`
 (
	`RuinRaceID`			int, 
	`RaceID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `KnownRuinRace` ADD PRIMARY KEY (`RuinRaceID`, `RaceID`);
ALTER TABLE `KnownRuinRace` ADD INDEX `KnownRuinRace_RaceID_idx` (`RaceID`);
ALTER TABLE `KnownRuinRace` ADD INDEX `KnownRuinRace_RuinRaceID_idx` (`RuinRaceID`);

CREATE TABLE `LineNames`
 (
	`LineNameID`			int, 
	`LineNames`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `LineNames` ADD INDEX `LineNames_LineNameID_idx` (`LineNameID`);

CREATE TABLE `MineralDeposit`
 (
	`MineralDepositID`			int, 
	`MaterialID`			int, 
	`SystemID`			int, 
	`SystemBodyID`			int, 
	`Amount`			float, 
	`Accessibility`			float, 
	`HalfOriginalAmount`			float, 
	`OriginalAcc`			float
);

-- CREATE INDEXES ...
ALTER TABLE `MineralDeposit` ADD INDEX `MineralDeposit_MaterialID_idx` (`MaterialID`);
ALTER TABLE `MineralDeposit` ADD PRIMARY KEY (`MineralDepositID`);
ALTER TABLE `MineralDeposit` ADD INDEX `MineralDeposit_SystemBodyID_idx` (`SystemBodyID`);
ALTER TABLE `MineralDeposit` ADD INDEX `MineralDeposit_SystemID_idx` (`SystemID`);

CREATE TABLE `MoveAction`
 (
	`MoveActionID`			int, 
	`Description`			varchar (100), 
	`TransitOrder`			char NOT NULL, 
	`NoOrderChange`			char NOT NULL, 
	`BaseDelay`			int, 
	`DisplayOrder`			int, 
	`DesignModeOnly`			char NOT NULL, 
	`FleetCapabilities`			int, 
	`CheckLoad`			char NOT NULL, 
	`CheckUnload`			int, 
	`CheckSpecial`			char NOT NULL, 
	`MinQuantity`			char NOT NULL, 
	`NoGasGiants`			char NOT NULL, 
	`ShowLoadBox`			char NOT NULL, 
	`ReserveLevel`			char NOT NULL, 
	`WarpPoint`			char NOT NULL, 
	`SystemBody`			char NOT NULL, 
	`SurveyLocation`			char NOT NULL, 
	`Fleet`			char NOT NULL, 
	`Waypoint`			char NOT NULL, 
	`Contact`			char NOT NULL, 
	`Lifepod`			char NOT NULL, 
	`Wreck`			char NOT NULL, 
	`LagrangePoint`			char NOT NULL, 
	`Wormhole`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `MoveAction` ADD PRIMARY KEY (`MoveActionID`);

CREATE TABLE `NPRFleetOrders`
 (
	`NPRFleetType`			int, 
	`OptionNumber`			int, 
	`OrderType`			int, 
	`LocalHostileNeeded`			char NOT NULL, 
	`Notes`			varchar (200), 
	`AmmoNeeded`			char NOT NULL, 
	`Magazine50`			char NOT NULL, 
	`NoMslInNebula`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `NPRFleetOrders` ADD PRIMARY KEY (`NPRFleetType`, `OptionNumber`);

CREATE TABLE `PopComponent`
 (
	`ComponentID`			int, 
	`PopulationID`			int, 
	`Amount`			float
);

-- CREATE INDEXES ...
ALTER TABLE `PopComponent` ADD INDEX `PopComponent_ComponentID_idx` (`ComponentID`);
ALTER TABLE `PopComponent` ADD INDEX `PopComponent_PopulationID_idx` (`PopulationID`);
ALTER TABLE `PopComponent` ADD PRIMARY KEY (`ComponentID`, `PopulationID`);

CREATE TABLE `PopulationWeapon`
 (
	`PopulationWeaponID`			int, 
	`PopulationID`			int, 
	`MissileID`			int, 
	`Amount`			float
);

-- CREATE INDEXES ...
ALTER TABLE `PopulationWeapon` ADD INDEX `PopulationWeapon_PopulationID_idx` (`PopulationID`);
ALTER TABLE `PopulationWeapon` ADD PRIMARY KEY (`PopulationWeaponID`);
ALTER TABLE `PopulationWeapon` ADD INDEX `PopulationWeapon_SysBodyWeaponID_idx` (`PopulationWeaponID`);
ALTER TABLE `PopulationWeapon` ADD INDEX `PopulationWeapon_WeaponID_idx` (`MissileID`);

CREATE TABLE `RaceMedals`
 (
	`RaceMedalID`			int, 
	`RaceID`			int, 
	`MedalFileName`			varchar (100), 
	`MedalName`			varchar (100), 
	`MedalDescription`			varchar (510), 
	`MedalPoints`			int
);

-- CREATE INDEXES ...
ALTER TABLE `RaceMedals` ADD PRIMARY KEY (`RaceMedalID`);
ALTER TABLE `RaceMedals` ADD INDEX `RaceMedals_RaceID_idx` (`RaceID`);
ALTER TABLE `RaceMedals` ADD INDEX `RaceMedals_RaceMedalID_idx` (`RaceMedalID`);

CREATE TABLE `RacialRelations`
 (
	`RacialRelationsID`			int, 
	`ViewingRaceID`			int, 
	`ViewedRaceID`			int, 
	`RelationsID`			int, 
	`ViewedRaceName`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `RacialRelations` ADD INDEX `RacialRelations_NamedRaceID_idx` (`ViewedRaceID`);
ALTER TABLE `RacialRelations` ADD PRIMARY KEY (`RacialRelationsID`);
ALTER TABLE `RacialRelations` ADD INDEX `RacialRelations_RacialNamingID_idx` (`RacialRelationsID`);
ALTER TABLE `RacialRelations` ADD INDEX `RacialRelations_RelationsID_idx` (`RelationsID`);
ALTER TABLE `RacialRelations` ADD INDEX `RacialRelations_ViewingRaceID_idx` (`ViewingRaceID`);

CREATE TABLE `Ruin`
 (
	`RuinID`			int, 
	`MaxChance`			int, 
	`Description`			varchar (100), 
	`AnnualTechChance`			float, 
	`ExploitedChance`			int, 
	`FactoriesBase`			int, 
	`FactoriesRandom`			int
);

-- CREATE INDEXES ...
ALTER TABLE `Ruin` ADD PRIMARY KEY (`RuinID`);
ALTER TABLE `Ruin` ADD INDEX `Ruin_RuinID_idx` (`RuinID`);

CREATE TABLE `SensorChecks`
 (
	`SystemID`			int, 
	`RaceID`			int, 
	`GameID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `SensorChecks` ADD INDEX `SensorChecks_GameID_idx` (`GameID`);
ALTER TABLE `SensorChecks` ADD PRIMARY KEY (`SystemID`, `RaceID`);
ALTER TABLE `SensorChecks` ADD INDEX `SensorChecks_RaceID_idx` (`RaceID`);
ALTER TABLE `SensorChecks` ADD UNIQUE INDEX `SensorChecks_SystemID_idx` (`SystemID`);

CREATE TABLE `ShipClass`
 (
	`ShipClassID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`KeepQuarters`			int, 
	`OtherRaceClassID`			int, 
	`ShippingLineDesign`			char NOT NULL, 
	`MaxChance`			int, 
	`NPRClassType`			int, 
	`HullDescriptionID`			int, 
	`FighterClass`			char NOT NULL, 
	`CommanderPriority`			int, 
	`ArmourThickness`			int, 
	`ArmourWidth`			int, 
	`ParasiteCapacity`			int, 
	`ClassName`			varchar (100), 
	`PlannedDeployment`			float, 
	`Crew`			int, 
	`Freighter`			char NOT NULL, 
	`ClassDesignDisplay`			text (255), 
	`Cost`			float, 
	`Size`			float, 
	`ClassType`			int, 
	`ClassThermal`			float, 
	`ClassCrossSection`			float, 
	`RankRequired`			int, 
	`RankSetManually`			int, 
	`ProtectionValue`			float, 
	`SensorReduction`			float, 
	`EnginePower`			int, 
	`FuelEfficiency`			float, 
	`FuelCapacity`			int, 
	`Harvesters`			int, 
	`Terraformers`			int, 
	`MiningModules`			int, 
	`MaintModules`			int, 
	`SalvageRate`			int, 
	`Spares`			int, 
	`BaseFailureChance`			float, 
	`MaxSpeed`			int, 
	`ShieldTypeID`			int, 
	`ShieldStrength`			int, 
	`ShieldRechargeRate`			int, 
	`DailyShieldCost`			int, 
	`ReactorPower`			int, 
	`RequiredPower`			int, 
	`DCRating`			int, 
	`CrewQuartersHS`			float, 
	`JumpRating`			int, 
	`JumpDistance`			int, 
	`CommercialDrive`			int, 
	`CommercialEngines`			char NOT NULL, 
	`WorkerCapacity`			int, 
	`PassiveSensorStrength`			int, 
	`ActiveSensorStrength`			int, 
	`EMSensorStrength`			int, 
	`GravSurvey`			int, 
	`GeoSurvey`			int, 
	`ECM`			int, 
	`ControlRating`			int, 
	`NameTypeID`			int, 
	`TotalNumber`			int, 
	`CargoCapacity`			float, 
	`ColonistCapacity`			int, 
	`MagazineCapacity`			float, 
	`TroopCapacity`			int, 
	`DropCapacity`			int, 
	`CyroDropCapable`			char NOT NULL, 
	`JGConstructionTime`			int, 
	`TractorStrength`			int, 
	`STSTractor`			int, 
	`RecreationalModule`			char NOT NULL, 
	`Obsolete`			int, 
	`Collier`			int, 
	`HyperDrive`			char NOT NULL, 
	`FuelTanker`			int, 
	`SupplyShip`			int, 
	`ConscriptOnly`			int, 
	`Notes`			text (255), 
	`MaxDACRoll`			int, 
	`ESMaxDACRoll`			int, 
	`Locked`			char NOT NULL, 
	`FlagBridge`			char NOT NULL, 
	`PreTNT`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `ShipClass` ADD UNIQUE INDEX `ShipClass_ClassID_idx` (`ShipClassID`);
ALTER TABLE `ShipClass` ADD INDEX `ShipClass_GameID_idx` (`GameID`);
ALTER TABLE `ShipClass` ADD UNIQUE INDEX `ShipClass_HullDescriptionID_idx` (`HullDescriptionID`);
ALTER TABLE `ShipClass` ADD PRIMARY KEY (`ShipClassID`);
ALTER TABLE `ShipClass` ADD UNIQUE INDEX `ShipClass_RaceID_idx` (`RaceID`);
ALTER TABLE `ShipClass` ADD UNIQUE INDEX `ShipClass_ShieldTypeID_idx` (`ShieldTypeID`);

CREATE TABLE `ShipyardTask`
 (
	`TaskID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`PopulationID`			int, 
	`ShipyardID`			int, 
	`SystemBodyID`			int, 
	`TaskTypeID`			int, 
	`Freighter`			char NOT NULL, 
	`FleetID`			int, 
	`ShipID`			int, 
	`ClassID`			int, 
	`NPRShip`			char NOT NULL, 
	`RefitID`			int, 
	`TotalBP`			float, 
	`CompletedBP`			float, 
	`Paused`			char NOT NULL, 
	`Priority`			int, 
	`UnitName`			varchar (80), 
	`TaskDescription`			varchar (200), 
	`Duranium`			float, 
	`Neutronium`			float, 
	`Corbomite`			float, 
	`Tritanium`			float, 
	`Boronide`			float, 
	`Mercassium`			float, 
	`Vendarite`			float, 
	`Sorium`			float, 
	`Uridium`			float, 
	`Corundium`			float, 
	`Gallicite`			float
);

-- CREATE INDEXES ...
ALTER TABLE `ShipyardTask` ADD INDEX `ShipyardTask_ClassID_idx` (`ClassID`);
ALTER TABLE `ShipyardTask` ADD INDEX `ShipyardTask_FleetID_idx` (`FleetID`);
ALTER TABLE `ShipyardTask` ADD UNIQUE INDEX `ShipyardTask_GameID_idx` (`GameID`);
ALTER TABLE `ShipyardTask` ADD PRIMARY KEY (`TaskID`);
ALTER TABLE `ShipyardTask` ADD UNIQUE INDEX `ShipyardTask_RaceID_idx` (`RaceID`);
ALTER TABLE `ShipyardTask` ADD INDEX `ShipyardTask_RefitID_idx` (`RefitID`);
ALTER TABLE `ShipyardTask` ADD INDEX `ShipyardTask_ShipID_idx` (`ShipID`);
ALTER TABLE `ShipyardTask` ADD INDEX `ShipyardTask_ShipyardID_idx` (`PopulationID`);
ALTER TABLE `ShipyardTask` ADD INDEX `ShipyardTask_ShipyardID1_idx` (`ShipyardID`);
ALTER TABLE `ShipyardTask` ADD INDEX `ShipyardTask_SystemBodyID_idx` (`SystemBodyID`);
ALTER TABLE `ShipyardTask` ADD INDEX `ShipyardTask_TaskID_idx` (`TaskID`);
ALTER TABLE `ShipyardTask` ADD INDEX `ShipyardTask_TaskTypeID_idx` (`TaskTypeID`);

CREATE TABLE `SpareNamesBackup`
 (
	`ID`			int, 
	`Name`			varchar (22)
);

-- CREATE INDEXES ...
ALTER TABLE `SpareNamesBackup` ADD PRIMARY KEY (`ID`);

CREATE TABLE `Star`
 (
	`StarID`			int, 
	`GameID`			int, 
	`SystemID`			int, 
	`StarTypeID`			int, 
	`Name`			varchar (100), 
	`Protostar`			int, 
	`Xcor`			float, 
	`Ycor`			float, 
	`Component`			int, 
	`OrbitingComponent`			int, 
	`MeanSeparation`			float, 
	`Bearing`			float, 
	`Luminosity`			float, 
	`SpectralNumber`			int, 
	`Mass`			float, 
	`Radius`			float, 
	`ClosestSeparation`			float, 
	`FurthestSeparation`			float, 
	`OrbitalPeriod`			float, 
	`Eccentricity`			float, 
	`NearestStarDistance`			float, 
	`NearestStarDistance2`			float, 
	`NSFA`			float, 
	`NSFA2`			float, 
	`AgeRangeID`			int, 
	`NearestStarID`			int, 
	`StarColour`			int, 
	`SpectralClassDesc`			varchar (40)
);

-- CREATE INDEXES ...
ALTER TABLE `Star` ADD INDEX `Star_AgeRangeID_idx` (`AgeRangeID`);
ALTER TABLE `Star` ADD INDEX `Star_NearestStarID_idx` (`NearestStarID`);
ALTER TABLE `Star` ADD PRIMARY KEY (`StarID`);
ALTER TABLE `Star` ADD INDEX `Star_StarTypeID_idx` (`StarTypeID`);
ALTER TABLE `Star` ADD UNIQUE INDEX `Star_SystemID_idx` (`SystemID`);

CREATE TABLE `StoredSystems`
 (
	`StoredSystemID`			int, 
	`Age`			float, 
	`AbundanceModifier`			int, 
	`Stars`			int, 
	`SystemTypeID`			int, 
	`DustDensity`			int, 
	`Used`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `StoredSystems` ADD PRIMARY KEY (`StoredSystemID`);
ALTER TABLE `StoredSystems` ADD INDEX `StoredSystems_StarSystemID_idx` (`StoredSystemID`);

CREATE TABLE `SystemBodyName`
 (
	`SysBodyNameID`			int, 
	`RaceID`			int, 
	`SystemBodyID`			int, 
	`SystemID`			int, 
	`Name`			varchar (100)
);

-- CREATE INDEXES ...
ALTER TABLE `SystemBodyName` ADD PRIMARY KEY (`SysBodyNameID`);
ALTER TABLE `SystemBodyName` ADD INDEX `SystemBodyName_RaceID_idx` (`RaceID`);
ALTER TABLE `SystemBodyName` ADD INDEX `SystemBodyName_SysBodyNameID_idx` (`SysBodyNameID`);
ALTER TABLE `SystemBodyName` ADD INDEX `SystemBodyName_SystemBodyID_idx` (`SystemBodyID`);
ALTER TABLE `SystemBodyName` ADD INDEX `SystemBodyName_SystemID_idx` (`SystemID`);

CREATE TABLE `Teams`
 (
	`TeamID`			int, 
	`GameID`			int, 
	`RaceID`			int, 
	`TeamSpeciesID`			int, 
	`TeamTypeID`			int, 
	`TeamName`			varchar (200), 
	`TeamModifier`			int, 
	`LocationTypeID`			int, 
	`LocationID`			int, 
	`Formed`			int, 
	`TargetPopID`			int, 
	`TargetRaceID`			int, 
	`TeamMembers`			int
);

-- CREATE INDEXES ...
ALTER TABLE `Teams` ADD INDEX `Teams_GameID_idx` (`GameID`);
ALTER TABLE `Teams` ADD INDEX `Teams_LocationID_idx` (`LocationID`);
ALTER TABLE `Teams` ADD INDEX `Teams_LocationTypeID_idx` (`LocationTypeID`);
ALTER TABLE `Teams` ADD PRIMARY KEY (`TeamID`);
ALTER TABLE `Teams` ADD INDEX `Teams_RaceID_idx` (`RaceID`);
ALTER TABLE `Teams` ADD UNIQUE INDEX `Teams_SpeciesID_idx` (`TeamSpeciesID`);
ALTER TABLE `Teams` ADD INDEX `Teams_TargetRaceID_idx` (`TargetPopID`);
ALTER TABLE `Teams` ADD INDEX `Teams_TargetRaceID1_idx` (`TargetRaceID`);
ALTER TABLE `Teams` ADD INDEX `Teams_TeamID_idx` (`TeamID`);
ALTER TABLE `Teams` ADD INDEX `Teams_TeamTypeID_idx` (`TeamTypeID`);

CREATE TABLE `Theme`
 (
	`ThemeID`			int, 
	`ThemeName`			varchar (80), 
	`ClassDone`			char NOT NULL, 
	`RankDone`			char NOT NULL, 
	`SystemsDone`			char NOT NULL
);

-- CREATE INDEXES ...
ALTER TABLE `Theme` ADD PRIMARY KEY (`ThemeID`);
ALTER TABLE `Theme` ADD UNIQUE INDEX `Theme_ThemeID_idx` (`ThemeID`);

CREATE TABLE `TraitGroup`
 (
	`TraitGroupID`			int, 
	`Description`			varchar (100), 
	`Opposite1`			int, 
	`Opposite2`			int
);

-- CREATE INDEXES ...
ALTER TABLE `TraitGroup` ADD PRIMARY KEY (`TraitGroupID`);

CREATE TABLE `WeaponAssignment`
 (
	`WeaponAssignmentID`			int, 
	`ShipID`			int, 
	`WeaponID`			int, 
	`WeaponNum`			int, 
	`FCTypeID`			int, 
	`FCNum`			int, 
	`UseOnboard`			int
);

-- CREATE INDEXES ...
ALTER TABLE `WeaponAssignment` ADD INDEX `WeaponAssignment_FCNum_idx` (`FCNum`);
ALTER TABLE `WeaponAssignment` ADD INDEX `WeaponAssignment_FCTypeID_idx` (`FCTypeID`);
ALTER TABLE `WeaponAssignment` ADD PRIMARY KEY (`WeaponAssignmentID`);
ALTER TABLE `WeaponAssignment` ADD INDEX `WeaponAssignment_ShipID_idx` (`ShipID`);
ALTER TABLE `WeaponAssignment` ADD INDEX `WeaponAssignment_WeaponAssignmentID_idx` (`WeaponAssignmentID`);
ALTER TABLE `WeaponAssignment` ADD INDEX `WeaponAssignment_WeaponID_idx` (`WeaponID`);
ALTER TABLE `WeaponAssignment` ADD INDEX `WeaponAssignment_WeaponNum_idx` (`WeaponNum`);

CREATE TABLE `WreckTech`
 (
	`WreckTechID`			int, 
	`WreckID`			int, 
	`TechID`			int, 
	`Percentage`			int
);

-- CREATE INDEXES ...
ALTER TABLE `WreckTech` ADD PRIMARY KEY (`WreckTechID`);
ALTER TABLE `WreckTech` ADD UNIQUE INDEX `WreckTech_TechID_idx` (`TechID`);
ALTER TABLE `WreckTech` ADD INDEX `WreckTech_WreckID_idx` (`WreckID`);
ALTER TABLE `WreckTech` ADD INDEX `WreckTech_WreckTechID_idx` (`WreckTechID`);


