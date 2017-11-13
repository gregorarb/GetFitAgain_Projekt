-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema getfitagain
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema getfitagain
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `getfitagain` DEFAULT CHARACTER SET utf8 ;
USE `getfitagain` ;

-- -----------------------------------------------------
-- Table `getfitagain`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `getfitagain`.`category` (
  `CategoryID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CategoryID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `getfitagain`.`difficulty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `getfitagain`.`difficulty` (
  `DifficultyID` INT(11) NOT NULL AUTO_INCREMENT,
  `Level` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`DifficultyID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `getfitagain`.`task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `getfitagain`.`task` (
  `TaskID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `Description` VARCHAR(4000) NOT NULL,
  `DifficultyID` INT(11) NOT NULL,
  PRIMARY KEY (`TaskID`, `DifficultyID`),
  INDEX `fk_Task_Difficulty1_idx` (`DifficultyID` ASC),
  CONSTRAINT `fk_Task_Difficulty1`
    FOREIGN KEY (`DifficultyID`)
    REFERENCES `getfitagain`.`difficulty` (`DifficultyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `getfitagain`.`undercategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `getfitagain`.`undercategory` (
  `UnderCategoryID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `CategoryID` INT(11) NOT NULL,
  PRIMARY KEY (`UnderCategoryID`, `CategoryID`),
  INDEX `fk_UnderCategory_Category1_idx` (`CategoryID` ASC),
  CONSTRAINT `fk_UnderCategory_Category1`
    FOREIGN KEY (`CategoryID`)
    REFERENCES `getfitagain`.`category` (`CategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `getfitagain`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `getfitagain`.`categories` (
  `CategoryID` INT(11) NOT NULL,
  `UnderCategoryID` INT(11) NOT NULL,
  `TaskID` INT(11) NOT NULL,
  PRIMARY KEY (`CategoryID`, `UnderCategoryID`, `TaskID`),
  INDEX `fk_Categorys_UnderCategory1_idx` (`UnderCategoryID` ASC),
  INDEX `fk_Categorys_Task1_idx` (`TaskID` ASC),
  CONSTRAINT `fk_Categorys_Category1`
    FOREIGN KEY (`CategoryID`)
    REFERENCES `getfitagain`.`category` (`CategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Categorys_Task1`
    FOREIGN KEY (`TaskID`)
    REFERENCES `getfitagain`.`task` (`TaskID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Categorys_UnderCategory1`
    FOREIGN KEY (`UnderCategoryID`)
    REFERENCES `getfitagain`.`undercategory` (`UnderCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `getfitagain`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `getfitagain`.`person` (
  `PersonID` INT(11) NOT NULL AUTO_INCREMENT,
  `prename` VARCHAR(50) NOT NULL,
  `surname` VARCHAR(50) NOT NULL,
  `birthdate` DATE NOT NULL,
  `street` VARCHAR(100) NOT NULL,
  `postcode` INT(11) NOT NULL,
  `Town` VARCHAR(50) NOT NULL,
  `Phonenumber` VARCHAR(30) NOT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `sex` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`PersonID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `getfitagain`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `getfitagain`.`doctor` (
  `DoctorID` INT(11) NOT NULL AUTO_INCREMENT,
  `areaofexpertise` VARCHAR(60) NULL DEFAULT NULL,
  `PersonID` INT(11) NOT NULL,
  PRIMARY KEY (`DoctorID`, `PersonID`),
  INDEX `fk_Doctor_Person_idx` (`PersonID` ASC),
  CONSTRAINT `fk_Doctor_Person`
    FOREIGN KEY (`PersonID`)
    REFERENCES `getfitagain`.`person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `getfitagain`.`therapist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `getfitagain`.`therapist` (
  `TherapistID` INT(11) NOT NULL AUTO_INCREMENT,
  `PersonID` INT(11) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`TherapistID`, `PersonID`),
  INDEX `fk_Therapist_Person1_idx` (`PersonID` ASC),
  CONSTRAINT `fk_Therapist_Person1`
    FOREIGN KEY (`PersonID`)
    REFERENCES `getfitagain`.`person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `getfitagain`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `getfitagain`.`customer` (
  `CustomerID` INT(11) NOT NULL AUTO_INCREMENT,
  `Diagnose` VARCHAR(2000) NOT NULL,
  `SocialSecurityNumber` VARCHAR(50) NOT NULL,
  `Insurance` VARCHAR(80) NULL DEFAULT NULL,
  `Password` VARCHAR(45) NULL DEFAULT NULL,
  `PersonID` INT(11) NOT NULL,
  `DoctorID` INT(11) NOT NULL,
  `TherapistID` INT(11) NOT NULL,
  PRIMARY KEY (`CustomerID`, `PersonID`, `DoctorID`, `TherapistID`),
  INDEX `fk_Customer_Person1_idx` (`PersonID` ASC),
  INDEX `fk_Customer_Doctor1_idx` (`DoctorID` ASC),
  INDEX `fk_Customer_Therapist1_idx` (`TherapistID` ASC),
  CONSTRAINT `fk_Customer_Doctor1`
    FOREIGN KEY (`DoctorID`)
    REFERENCES `getfitagain`.`doctor` (`DoctorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_Person1`
    FOREIGN KEY (`PersonID`)
    REFERENCES `getfitagain`.`person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_Therapist1`
    FOREIGN KEY (`TherapistID`)
    REFERENCES `getfitagain`.`therapist` (`TherapistID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `getfitagain`.`picture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `getfitagain`.`picture` (
  `PictureID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `order` INT(11) NOT NULL,
  `pic` MEDIUMBLOB NOT NULL,
  `group` INT(11) NOT NULL,
  PRIMARY KEY (`PictureID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `getfitagain`.`pictures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `getfitagain`.`pictures` (
  `PictureID` INT(11) NOT NULL,
  `TaskID` INT(11) NOT NULL,
  PRIMARY KEY (`PictureID`, `TaskID`),
  INDEX `fk_Pictures_Task1_idx` (`TaskID` ASC),
  CONSTRAINT `fk_Pictures_Picture1`
    FOREIGN KEY (`PictureID`)
    REFERENCES `getfitagain`.`picture` (`PictureID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pictures_Task1`
    FOREIGN KEY (`TaskID`)
    REFERENCES `getfitagain`.`task` (`TaskID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `getfitagain`.`trainingplan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `getfitagain`.`trainingplan` (
  `TrainingplanID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `CustomerID` INT(11) NOT NULL,
  PRIMARY KEY (`TrainingplanID`, `CustomerID`),
  INDEX `fk_Trainingplan_Customer1_idx` (`CustomerID` ASC),
  CONSTRAINT `fk_Trainingplan_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `getfitagain`.`customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `getfitagain`.`tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `getfitagain`.`tasks` (
  `TrainingplanID` INT(11) NOT NULL,
  `TaskID` INT(11) NOT NULL,
  `Repeats` INT(11) NOT NULL,
  `Sets` INT(11) NOT NULL,
  `Duration` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`TrainingplanID`, `TaskID`),
  INDEX `fk_Tasks_Task1_idx` (`TaskID` ASC),
  CONSTRAINT `fk_Tasks_Task1`
    FOREIGN KEY (`TaskID`)
    REFERENCES `getfitagain`.`task` (`TaskID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tasks_Trainingplan1`
    FOREIGN KEY (`TrainingplanID`)
    REFERENCES `getfitagain`.`trainingplan` (`TrainingplanID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
