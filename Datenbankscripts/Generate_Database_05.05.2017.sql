-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema getfitagain
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `getfitagain` ;

-- -----------------------------------------------------
-- Schema getfitagain
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `getfitagain` DEFAULT CHARACTER SET utf8 ;
USE `getfitagain` ;

-- -----------------------------------------------------
-- Table `getfitagain`.`Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `getfitagain`.`Person` ;

CREATE TABLE IF NOT EXISTS `getfitagain`.`Person` (
  `PersonID` INT NOT NULL AUTO_INCREMENT,
  `prename` VARCHAR(50) NOT NULL,
  `surname` VARCHAR(50) NOT NULL,
  `birthdate` DATE NOT NULL,
  `street` VARCHAR(100) NOT NULL,
  `postcode` INT NOT NULL,
  `Town` VARCHAR(50) NOT NULL,
  `Phonenumber` VARCHAR(30) NOT NULL,
  `Email` VARCHAR(100) NULL,
  `sex` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`PersonID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `getfitagain`.`Doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `getfitagain`.`Doctor` ;

CREATE TABLE IF NOT EXISTS `getfitagain`.`Doctor` (
  `DoctorID` INT NOT NULL AUTO_INCREMENT,
  `areaofexpertise` VARCHAR(60) NULL,
  `PersonID` INT NOT NULL,
  PRIMARY KEY (`DoctorID`, `PersonID`),
  INDEX `fk_Doctor_Person_idx` (`PersonID` ASC),
  CONSTRAINT `fk_Doctor_Person`
    FOREIGN KEY (`PersonID`)
    REFERENCES `getfitagain`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `getfitagain`.`Therapist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `getfitagain`.`Therapist` ;

CREATE TABLE IF NOT EXISTS `getfitagain`.`Therapist` (
  `TherapistID` INT NOT NULL AUTO_INCREMENT,
  `PersonID` INT NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`TherapistID`, `PersonID`),
  INDEX `fk_Therapist_Person1_idx` (`PersonID` ASC),
  CONSTRAINT `fk_Therapist_Person1`
    FOREIGN KEY (`PersonID`)
    REFERENCES `getfitagain`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `getfitagain`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `getfitagain`.`Customer` ;

CREATE TABLE IF NOT EXISTS `getfitagain`.`Customer` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `Diagnose` VARCHAR(2000) NOT NULL,
  `SocialSecurityNumber` VARCHAR(50) NOT NULL,
  `Insurance` VARCHAR(80) NULL,
  `Password` VARCHAR(45) NULL,
  `PersonID` INT NOT NULL,
  `DoctorID` INT NOT NULL,
  `TherapistID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`, `PersonID`, `DoctorID`, `TherapistID`),
  INDEX `fk_Customer_Person1_idx` (`PersonID` ASC),
  INDEX `fk_Customer_Doctor1_idx` (`DoctorID` ASC),
  INDEX `fk_Customer_Therapist1_idx` (`TherapistID` ASC),
  CONSTRAINT `fk_Customer_Person1`
    FOREIGN KEY (`PersonID`)
    REFERENCES `getfitagain`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_Doctor1`
    FOREIGN KEY (`DoctorID`)
    REFERENCES `getfitagain`.`Doctor` (`DoctorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_Therapist1`
    FOREIGN KEY (`TherapistID`)
    REFERENCES `getfitagain`.`Therapist` (`TherapistID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `getfitagain`.`Trainingplan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `getfitagain`.`Trainingplan` ;

CREATE TABLE IF NOT EXISTS `getfitagain`.`Trainingplan` (
  `PlanID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`PlanID`, `CustomerID`),
  INDEX `fk_Trainingplan_Customer1_idx` (`CustomerID` ASC),
  CONSTRAINT `fk_Trainingplan_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `getfitagain`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `getfitagain`.`Difficulty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `getfitagain`.`Difficulty` ;

CREATE TABLE IF NOT EXISTS `getfitagain`.`Difficulty` (
  `DifficultyID` INT NOT NULL AUTO_INCREMENT,
  `Level` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`DifficultyID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `getfitagain`.`Task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `getfitagain`.`Task` ;

CREATE TABLE IF NOT EXISTS `getfitagain`.`Task` (
  `TaskID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `Description` VARCHAR(4000) NOT NULL,
  `DifficultyID` INT NOT NULL,
  PRIMARY KEY (`TaskID`, `DifficultyID`),
  INDEX `fk_Task_Difficulty1_idx` (`DifficultyID` ASC),
  CONSTRAINT `fk_Task_Difficulty1`
    FOREIGN KEY (`DifficultyID`)
    REFERENCES `getfitagain`.`Difficulty` (`DifficultyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `getfitagain`.`Tasks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `getfitagain`.`Tasks` ;

CREATE TABLE IF NOT EXISTS `getfitagain`.`Tasks` (
  `Trainingplan_PlanID` INT NOT NULL,
  `TaskID` INT NOT NULL,
  `Repeats` INT NOT NULL,
  `Sets` INT NOT NULL,
  `Duration` INT NULL,
  PRIMARY KEY (`Trainingplan_PlanID`, `TaskID`),
  INDEX `fk_Tasks_Task1_idx` (`TaskID` ASC),
  CONSTRAINT `fk_Tasks_Trainingplan1`
    FOREIGN KEY (`Trainingplan_PlanID`)
    REFERENCES `getfitagain`.`Trainingplan` (`PlanID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tasks_Task1`
    FOREIGN KEY (`TaskID`)
    REFERENCES `getfitagain`.`Task` (`TaskID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `getfitagain`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `getfitagain`.`Category` ;

CREATE TABLE IF NOT EXISTS `getfitagain`.`Category` (
  `CategoryID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CategoryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `getfitagain`.`UnderCategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `getfitagain`.`UnderCategory` ;

CREATE TABLE IF NOT EXISTS `getfitagain`.`UnderCategory` (
  `UnderCategoryID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `CategoryID` INT NOT NULL,
  PRIMARY KEY (`UnderCategoryID`, `CategoryID`),
  INDEX `fk_UnderCategory_Category1_idx` (`CategoryID` ASC),
  CONSTRAINT `fk_UnderCategory_Category1`
    FOREIGN KEY (`CategoryID`)
    REFERENCES `getfitagain`.`Category` (`CategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `getfitagain`.`Categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `getfitagain`.`Categories` ;

CREATE TABLE IF NOT EXISTS `getfitagain`.`Categories` (
  `CategoryID` INT NOT NULL,
  `UnderCategoryID` INT NOT NULL,
  `TaskID` INT NOT NULL,
  PRIMARY KEY (`CategoryID`, `UnderCategoryID`, `TaskID`),
  INDEX `fk_Categorys_UnderCategory1_idx` (`UnderCategoryID` ASC),
  INDEX `fk_Categorys_Task1_idx` (`TaskID` ASC),
  CONSTRAINT `fk_Categorys_Category1`
    FOREIGN KEY (`CategoryID`)
    REFERENCES `getfitagain`.`Category` (`CategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Categorys_UnderCategory1`
    FOREIGN KEY (`UnderCategoryID`)
    REFERENCES `getfitagain`.`UnderCategory` (`UnderCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Categorys_Task1`
    FOREIGN KEY (`TaskID`)
    REFERENCES `getfitagain`.`Task` (`TaskID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `getfitagain`.`Picture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `getfitagain`.`Picture` ;

CREATE TABLE IF NOT EXISTS `getfitagain`.`Picture` (
  `PictureID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `order` INT NOT NULL,
  `pic` MEDIUMBLOB NOT NULL,
  `group` INT NOT NULL,
  PRIMARY KEY (`PictureID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `getfitagain`.`Pictures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `getfitagain`.`Pictures` ;

CREATE TABLE IF NOT EXISTS `getfitagain`.`Pictures` (
  `PictureID` INT NOT NULL,
  `TaskID` INT NOT NULL,
  PRIMARY KEY (`PictureID`, `TaskID`),
  INDEX `fk_Pictures_Task1_idx` (`TaskID` ASC),
  CONSTRAINT `fk_Pictures_Picture1`
    FOREIGN KEY (`PictureID`)
    REFERENCES `getfitagain`.`Picture` (`PictureID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pictures_Task1`
    FOREIGN KEY (`TaskID`)
    REFERENCES `getfitagain`.`Task` (`TaskID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
