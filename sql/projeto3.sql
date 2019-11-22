-- Problema ----------------------------------------------------------------------------------------------------
É necessário desenvolver um sistema que sirva para gerenciar conjuntos de equipamentos do jogo Destiny 2. Para cadastrar os conjuntos de armadura,
antes devem ser cadastrados os equipamentos, suas características (como mods), e também deve ser possível gerenciar o inventário de equipamentos, para
na hora de montar um conjunto de armadura, saber se esse equipamento já está equipado ou se ele está disponível. Além desses itens descritos, também é
necessário implementar validações na construção do conjunto de equipamentos, para validar se o tipo do equipamento é compatível com a posição que está 
sendo designada a ele, e também é necessário calcular o poder médio desse conjunto de equipamentos.

-- Tabelas -----------------------------------------------------------------------------------------------------

EquippedItems(GuardianId, PrimaryWeaponId, SpecialWeaponId, HeavyWeaponId, HeadId, BodyId, LegsId, ArmsId, ClassItemId) (Ao equipar algo, uma trigger deverá alterar o status no inventário correspondete)

WeaponInventory(GuardianId, WeaponId, StatusId)

ArmorInventory(GuardianId, ArmorId, StatusId)

Weapon(Name, TypeId, CategoryId, Power, Impact, RateOfFire, Stability, Range, ElementId, ModId)

Armor(Name, TypeId, Power, Intellect, Discipline, Strength, Mobility, Resilience, Recovery, ElementId, ModId)

Guardian(Name, ClassId, RaceId)

Mod(Name, Description, ModBonus(ModId, TargetId, BonusTypeId, Value) - Esse bonus é o multivalorado)

Status(Name)

BonusType(Name)

Element(Name)

Type(Name)

Category(Name)

Class(Name)

Race(Name)

Target(Name)

-- Scripts de criação das tabelas ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bdproj3`.`Armor` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  `TypeId` INT(11) NOT NULL,
  `Power` INT(11) NOT NULL,
  `Intellect` INT(11) NOT NULL,
  `Discipline` INT(11) NOT NULL,
  `Strength` INT(11) NOT NULL,
  `Mobility` INT(11) NOT NULL,
  `Resilience` INT(11) NOT NULL,
  `Recovery` INT(11) NOT NULL,
  `ElementId` INT(11) NOT NULL,
  `ModId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Armor_1_idx` (`TypeId` ASC) VISIBLE,
  INDEX `fk_Armor_2_idx` (`ElementId` ASC) VISIBLE,
  INDEX `fk_Armor_3_idx` (`ModId` ASC) VISIBLE,
  CONSTRAINT `fk_Armor_Element`
    FOREIGN KEY (`ElementId`)
    REFERENCES `bdproj3`.`Element` (`Id`),
  CONSTRAINT `fk_Armor_Mod`
    FOREIGN KEY (`ModId`)
    REFERENCES `bdproj3`.`Mod` (`Id`),
  CONSTRAINT `fk_Armor_Type`
    FOREIGN KEY (`TypeId`)
    REFERENCES `bdproj3`.`Type` (`Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`ArmorInventory` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `GuardianId` INT(11) NOT NULL,
  `ArmorId` INT(11) NOT NULL,
  `StatusId` INT(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_ArmorInventory_1_idx` (`GuardianId` ASC) VISIBLE,
  INDEX `fk_ArmorInventory_2_idx` (`ArmorId` ASC) VISIBLE,
  INDEX `fk_ArmorInventory_3_idx` (`StatusId` ASC) VISIBLE,
  CONSTRAINT `fk_ArmorInventory_Armor`
    FOREIGN KEY (`ArmorId`)
    REFERENCES `bdproj3`.`Armor` (`Id`),
  CONSTRAINT `fk_ArmorInventory_Guardian`
    FOREIGN KEY (`GuardianId`)
    REFERENCES `bdproj3`.`Guardian` (`Id`),
  CONSTRAINT `fk_ArmorInventory_Status`
    FOREIGN KEY (`StatusId`)
    REFERENCES `bdproj3`.`Status` (`Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`BonusType` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`Category` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`Class` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`Element` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`EquippedItems` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `PrimaryWeaponId` INT(11) NOT NULL,
  `SpecialWeaponId` INT(11) NOT NULL,
  `HeavyWeaponId` INT(11) NOT NULL,
  `HeadId` INT(11) NOT NULL,
  `BodyId` INT(11) NOT NULL,
  `LegsId` INT(11) NOT NULL,
  `ArmsId` INT(11) NOT NULL,
  `ClassItemId` INT(11) NOT NULL,
  `GuardianId` INT(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_EquippedItems_1_idx` (`PrimaryWeaponId` ASC) VISIBLE,
  INDEX `fk_EquippedItems_2_idx` (`SpecialWeaponId` ASC) VISIBLE,
  INDEX `fk_EquippedItems_3_idx` (`HeavyWeaponId` ASC) VISIBLE,
  INDEX `fk_EquippedItems_4_idx` (`HeadId` ASC) VISIBLE,
  INDEX `fk_EquippedItems_5_idx` (`BodyId` ASC) VISIBLE,
  INDEX `fk_EquippedItems_6_idx` (`LegsId` ASC) VISIBLE,
  INDEX `fk_EquippedItems_7_idx` (`ArmsId` ASC) VISIBLE,
  INDEX `fk_EquippedItems_8_idx` (`ClassItemId` ASC) VISIBLE,
  CONSTRAINT `fk_EquippedArmor_Arms`
    FOREIGN KEY (`ArmsId`)
    REFERENCES `bdproj3`.`Armor` (`Id`),
  CONSTRAINT `fk_EquippedArmor_Body`
    FOREIGN KEY (`BodyId`)
    REFERENCES `bdproj3`.`Armor` (`Id`),
  CONSTRAINT `fk_EquippedArmor_ClassItem`
    FOREIGN KEY (`ClassItemId`)
    REFERENCES `bdproj3`.`Armor` (`Id`),
  CONSTRAINT `fk_EquippedArmor_Head`
    FOREIGN KEY (`HeadId`)
    REFERENCES `bdproj3`.`Armor` (`Id`),
  CONSTRAINT `fk_EquippedArmor_Legs`
    FOREIGN KEY (`LegsId`)
    REFERENCES `bdproj3`.`Armor` (`Id`),
  CONSTRAINT `fk_EquippedWeapon_Heavy`
    FOREIGN KEY (`HeavyWeaponId`)
    REFERENCES `bdproj3`.`Weapon` (`Id`),
  CONSTRAINT `fk_EquippedWeapon_Primary`
    FOREIGN KEY (`PrimaryWeaponId`)
    REFERENCES `bdproj3`.`Weapon` (`Id`),
  CONSTRAINT `fk_EquippedWeapon_Special`
    FOREIGN KEY (`SpecialWeaponId`)
    REFERENCES `bdproj3`.`Weapon` (`Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`Guardian` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `ClassId` INT(11) NOT NULL,
  `RaceId` INT(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Guardian_1_idx` (`ClassId` ASC) VISIBLE,
  INDEX `fk_Guardian_2_idx` (`RaceId` ASC) VISIBLE,
  CONSTRAINT `fk_Guardian_Class`
    FOREIGN KEY (`ClassId`)
    REFERENCES `bdproj3`.`Class` (`Id`),
  CONSTRAINT `fk_Guardian_Race`
    FOREIGN KEY (`RaceId`)
    REFERENCES `bdproj3`.`Race` (`Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`Mod` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  `Description` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`ModBonus` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `ModId` INT(11) NOT NULL,
  `TargetId` INT(11) NOT NULL,
  `BonusTypeId` INT(11) NOT NULL,
  `Value` INT(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_ModBonus_1_idx` (`ModId` ASC) VISIBLE,
  INDEX `fk_ModBonus_2_idx` (`TargetId` ASC) VISIBLE,
  INDEX `fk_ModBonus_3_idx` (`BonusTypeId` ASC) VISIBLE,
  CONSTRAINT `fk_ModBonus_3`
    FOREIGN KEY (`BonusTypeId`)
    REFERENCES `bdproj3`.`BonusType` (`Id`),
  CONSTRAINT `fk_ModBonus_Mod`
    FOREIGN KEY (`ModId`)
    REFERENCES `bdproj3`.`Mod` (`Id`),
  CONSTRAINT `fk_ModBonus_Target`
    FOREIGN KEY (`TargetId`)
    REFERENCES `bdproj3`.`Target` (`Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`Race` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`Status` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`Target` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`Type` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`Weapon` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  `TypeId` INT(11) NOT NULL,
  `CategoryId` INT(11) NOT NULL,
  `Power` INT(11) NOT NULL,
  `Impact` INT(11) NOT NULL,
  `RateOfFire` INT(11) NOT NULL,
  `Stability` INT(11) NOT NULL,
  `Range` INT(11) NOT NULL,
  `ElementId` INT(11) NOT NULL,
  `ModId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Weapon_1_idx` (`TypeId` ASC) VISIBLE,
  INDEX `fk_Weapon_2_idx` (`CategoryId` ASC) VISIBLE,
  INDEX `fk_Weapon_3_idx` (`ElementId` ASC) VISIBLE,
  INDEX `fk_Weapon_4_idx` (`ModId` ASC) VISIBLE,
  CONSTRAINT `fk_Weapon_4`
    FOREIGN KEY (`ModId`)
    REFERENCES `bdproj3`.`Mod` (`Id`),
  CONSTRAINT `fk_Weapon_Category`
    FOREIGN KEY (`CategoryId`)
    REFERENCES `bdproj3`.`Category` (`Id`),
  CONSTRAINT `fk_Weapon_Element`
    FOREIGN KEY (`ElementId`)
    REFERENCES `bdproj3`.`Element` (`Id`),
  CONSTRAINT `fk_Weapon_Type`
    FOREIGN KEY (`TypeId`)
    REFERENCES `bdproj3`.`Type` (`Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `bdproj3`.`WeaponInventory` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `GuardianId` INT(11) NOT NULL,
  `WeaponId` INT(11) NOT NULL,
  `StatusId` INT(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_WeaponInventory_1_idx` (`GuardianId` ASC) VISIBLE,
  INDEX `fk_WeaponInventory_2_idx` (`WeaponId` ASC) VISIBLE,
  INDEX `fk_WeaponInventory_3_idx` (`StatusId` ASC) VISIBLE,
  CONSTRAINT `fk_WeaponInventory_Guardian`
    FOREIGN KEY (`GuardianId`)
    REFERENCES `bdproj3`.`Guardian` (`Id`),
  CONSTRAINT `fk_WeaponInventory_Status`
    FOREIGN KEY (`StatusId`)
    REFERENCES `bdproj3`.`Status` (`Id`),
  CONSTRAINT `fk_WeaponInventory_Weapon`
    FOREIGN KEY (`WeaponId`)
    REFERENCES `bdproj3`.`Weapon` (`Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

-- Triggers --------------------------------------------------------------------------------------------------

CREATE DEFINER=`root`@`localhost` TRIGGER `EquippedItems_BEFORE_INSERT` BEFORE INSERT ON `EquippedItems` FOR EACH ROW BEGIN

IF (SELECT CategoryId FROM Weapon WHERE Id = NEW.PrimaryWeaponId) <> 3 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A arma primária deve ser da categoria Primária!';
END IF;

IF (SELECT CategoryId FROM Weapon WHERE Id = NEW.SpecialWeaponId) <> 2 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A arma especial deve ser da categoria Especial!';
END IF;

IF (SELECT CategoryId FROM Weapon WHERE Id = NEW.HeavyWeaponId) <> 1 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A arma pesada deve ser da categoria Pesada!';
END IF;

IF (SELECT TypeId FROM Armor WHERE Id = NEW.HeadId) <> 1 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A armadura da cabeça deve ser do tipo Cabeça!';
END IF;

IF (SELECT TypeId FROM Armor WHERE Id = NEW.BodyId) <> 2 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A armadura do corpo deve ser do tipo Corpo!';
END IF;

IF (SELECT TypeId FROM Armor WHERE Id = NEW.LegsId) <> 3 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A armadura das pernas deve ser do tipo Pernas!';
END IF;

IF (SELECT TypeId FROM Armor WHERE Id = NEW.ArmsId) <> 4 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A armadura dos braços deve ser do tipo Braços!';
END IF;

IF (SELECT TypeId FROM Armor WHERE Id = NEW.ClassItemId) <> 5 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: O item de classe deve ser do tipo Item de Classe!';
END IF;

END;

CREATE DEFINER=`root`@`localhost` TRIGGER `EquippedItems_AFTER_INSERT` AFTER INSERT ON `EquippedItems` FOR EACH ROW BEGIN

UPDATE WeaponInventory 
   SET StatusId = 2 
 WHERE Id IN (NEW.PrimaryWeaponId, NEW.SpecialWeaponId, NEW.HeavyWeaponId)
   AND GuardianId = NEW.GuardianId;
   
UPDATE ArmorInventory 
   SET StatusId = 2 
 WHERE Id IN (NEW.HeadId, NEW.BodyId, NEW.LegsId, NEW.ArmsId, NEW.ClassItemId)
   AND GuardianId = NEW.GuardianId;
 
END;

CREATE DEFINER=`root`@`localhost` TRIGGER `EquippedItems_BEFORE_UPDATE` BEFORE UPDATE ON `EquippedItems` FOR EACH ROW BEGIN

IF (SELECT CategoryId FROM Weapon WHERE Id = NEW.PrimaryWeaponId) <> 3 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A arma primária deve ser da categoria Primária!';
END IF;

IF (SELECT CategoryId FROM Weapon WHERE Id = NEW.SpecialWeaponId) <> 2 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A arma especial deve ser da categoria Especial!';
END IF;

IF (SELECT CategoryId FROM Weapon WHERE Id = NEW.HeavyWeaponId) <> 1 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A arma pesada deve ser da categoria Pesada!';
END IF;

IF (SELECT TypeId FROM Armor WHERE Id = NEW.HeadId) <> 1 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A armadura da cabeça deve ser do tipo Cabeça!';
END IF;

IF (SELECT TypeId FROM Armor WHERE Id = NEW.BodyId) <> 2 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A armadura do corpo deve ser do tipo Corpo!';
END IF;

IF (SELECT TypeId FROM Armor WHERE Id = NEW.LegsId) <> 3 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A armadura das pernas deve ser do tipo Pernas!';
END IF;

IF (SELECT TypeId FROM Armor WHERE Id = NEW.ArmsId) <> 4 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: A armadura dos braços deve ser do tipo Braços!';
END IF;

IF (SELECT TypeId FROM Armor WHERE Id = NEW.ClassItemId) <> 5 THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aviso: O item de classe deve ser do tipo Item de Classe!';
END IF;

END;

CREATE DEFINER=`root`@`localhost` TRIGGER `EquippedItems_AFTER_UPDATE` AFTER UPDATE ON `EquippedItems` FOR EACH ROW BEGIN

UPDATE WeaponInventory 
   SET StatusId = 1 
 WHERE Id IN (OLD.PrimaryWeaponId, OLD.SpecialWeaponId, OLD.HeavyWeaponId)
   AND GuardianId = OLD.GuardianId;
   
UPDATE ArmorInventory 
   SET StatusId = 1 
 WHERE Id IN (OLD.HeadId, OLD.BodyId, OLD.LegsId, OLD.ArmsId, OLD.ClassItemId)
   AND GuardianId = OLD.GuardianId;

UPDATE WeaponInventory 
   SET StatusId = 2 
 WHERE Id IN (NEW.PrimaryWeaponId, NEW.SpecialWeaponId, NEW.HeavyWeaponId)
   AND GuardianId = NEW.GuardianId;
   
UPDATE ArmorInventory 
   SET StatusId = 2 
 WHERE Id IN (NEW.HeadId, NEW.BodyId, NEW.LegsId, NEW.ArmsId, NEW.ClassItemId)
   AND GuardianId = NEW.GuardianId;

END;

CREATE DEFINER=`root`@`localhost` TRIGGER `EquippedItems_AFTER_DELETE` AFTER DELETE ON `EquippedItems` FOR EACH ROW BEGIN

UPDATE WeaponInventory 
   SET StatusId = 1 
 WHERE Id IN (OLD.PrimaryWeaponId, OLD.SpecialWeaponId, OLD.HeavyWeaponId)
   AND GuardianId = OLD.GuardianId;
   
UPDATE ArmorInventory 
   SET StatusId = 1 
 WHERE Id IN (OLD.HeadId, OLD.BodyId, OLD.LegsId, OLD.ArmsId, OLD.ClassItemId)
   AND GuardianId = OLD.GuardianId;

END;

-- Consultas -------------------------------------------------------------------------------------------------

/* Consulta com 4 tabelas */
/* Consultando todos os efeitos de cada Mod cadastrado no banco */
select M.Name as ModName
     , M.Description as ModDescription
     , T.Name as Target
     , BT.Name as BonusType
     , MB.Value as BonusValue
  from bdproj3.Mod as M
  join ModBonus as MB
    on MB.ModId = M.Id
  join BonusType as BT
    on BT.Id = MB.BonusTypeId
  join Target as T
    on T.Id = MB.TargetId	

/* Consultando todos os guardiões cadastrados, exibindo sua raça e classe */
select G.Name as Guardian
     , C.Name as Class
     , R.Name as Race
  from Guardian as G
  join Class as C
    on C.Id = G.ClassId
  join Race as R
    on R.Id = G.RaceId;

/* Consultando todas as armaduras cadastradas, exibindo a descrição de todas as suas informações e o valor total de seus atributos */
select A.Name as Armor
     , A.Power as Power
     , (A.Intellect+A.Discipline+A.Strength+A.Mobility+A.Resilience+A.Recovery) as TotalAttributes
     , T.Name as Type
     , E.Name as Element
     , M.Name as EquippedMod
  from Armor as A
  join Type as T
    on T.Id = A.TypeId
  join Element as E
    on E.Id = A.ElementId
  left join bdproj3.Mod as M
    on M.Id = A.ModId
 order by A.TypeId, Armor

/* Consultando todas as armas cadastradas, exibindo a descrição de todas as suas informações */
select W.Name as Weapon
     , W.Power
     , T.Name as Type
     , C.Name as Category
     , E.Name as Element
     , M.Name as EquippedMod
  from Weapon as W
  join Type as T
    on T.Id = W.TypeId
  join Category as C
    on C.Id = W.CategoryId
  join Element as E
    on E.Id = W.ElementId
  left join bdproj3.Mod as M
    on M.Id = W.ModId
 order by Weapon

/* Consultando todas as armaduras que estão no inventário de cada guardião, e exibindo seus status */
select G.Name as Guardian
	   , A.Name as Armor
     , S.Name as Status
  from ArmorInventory as AI
  join Guardian as G
    on G.Id = AI.GuardianId
  join Armor as A
    on A.Id = AI.ArmorId
  join Status as S
    on S.Id = AI.StatusId
 order by Guardian, Status, Armor

/* Consultando todas as armas que estão no inventário de cada guardião, e exibindo seus status */
select G.Name as Guardian
  	 , W.Name as Weapon
     , S.Name as Status
  from WeaponInventory as AI
  join Guardian as G
    on G.Id = AI.GuardianId
  join Weapon as W
    on W.Id = AI.WeaponId
  join Status as S
    on S.Id = AI.StatusId
 order by Guardian, Status, Weapon

/* Consultando os conjuntos de equipamentos de cada guardião com a descrição de cada equipamento */
select G.Name as Guardiao
     , PW.Name as ArmaPrimaria
     , SW.Name as ArmaEspecial
     , HW.Name as ArmaPesada
     , HA.Name as ArmaduraCabeça
     , BA.Name as ArmaduraCorpo
     , LA.Name as ArmaduraPernas
     , AA.Name as ArmaduraBracos
     , CI.Name as ItemClasse
  from EquippedItems as EI
  join Guardian as G
    on G.Id = EI.GuardianId
  join Weapon as PW
    on PW.Id = EI.PrimaryWeaponId
  join Weapon as SW
    on SW.Id = EI.SpecialWeaponId
  join Weapon as HW
    on HW.Id = EI.HeavyWeaponId
  join Armor as HA
    on HA.Id = EI.HeadId
  join Armor as BA
    on BA.Id = EI.BodyId
  join Armor as LA
    on LA.Id = EI.LegsId
  join Armor as AA
    on AA.Id = EI.ArmsId
  join Armor as CI
    on CI.Id = EI.ClassItemId
 order by Guardiao

/* Calculando a média de poder de cada conjunto de equipamento de cada guardião */
select G.Name as Guardiao
     , round((
		   (select round(avg(W.Power)) from Weapon as W where W.Id in (EI.PrimaryWeaponId, EI.SpecialWeaponId, EI.HeavyWeaponId)) + 
       (select round(avg(A.Power)) from Armor as A where A.Id in (EI.HeadId, EI.BodyId, EI.LegsId, EI.ArmsId, EI.ClassItemId))
	     ) / 2) as MediaPoder
  from EquippedItems as EI
  join Guardian as G
    on G.Id = EI.GuardianId