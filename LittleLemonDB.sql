-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemon_erd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon_erd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon_erd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `little_lemon_erd` ;

-- -----------------------------------------------------
-- Table `little_lemon_erd`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_erd`.`Booking` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATETIME NOT NULL,
  `FirstName` VARCHAR(50) NOT NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `TableNumber` INT NULL,
  PRIMARY KEY (`BookingID`),
  UNIQUE INDEX `BookingID_UNIQUE` (`BookingID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_erd`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_erd`.`Menu` (
  `MenuID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  `Cuisine` VARCHAR(50) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`, `ItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_erd`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_erd`.`Customer` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(50) NOT NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `PhoneNumber` INT NOT NULL,
  `Email` VARCHAR(150) NOT NULL,
  `BookingID` INT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC) VISIBLE,
  INDEX `bookingid_FK_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `booking_id_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `little_lemon_erd`.`Booking` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_erd`.`Delivery Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_erd`.`Delivery Status` (
  `OrderID` INT NOT NULL,
  `delivery_date` DATETIME NULL,
  `Status` VARCHAR(45) NULL,
  `CustomerID` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `customer_IDFK_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `customer_IDFK`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon_erd`.`Customer` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_erd`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_erd`.`Staff` (
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `PhoneNumber` INT NOT NULL,
  `Email` VARCHAR(100) NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE INDEX `EmployeeID_UNIQUE` (`EmployeeID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_erd`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_erd`.`Orders` (
  `OrderID` INT NOT NULL,
  `Date` DATE NULL,
  `Item` VARCHAR(45) NULL,
  `Quantity` VARCHAR(45) NULL,
  `TotalCost` DECIMAL(2) NULL,
  `MenuID` INT NULL,
  `BookingID` INT NULL,
  `TableNo` INT NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `bookingid_fk_idx` (`BookingID` ASC) VISIBLE,
  INDEX `menuif_FK_idx` (`MenuID` ASC) VISIBLE,
  INDEX `employeeid_FK_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `bookingid_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `little_lemon_erd`.`Booking` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menuif_FK`
    FOREIGN KEY (`MenuID`)
    REFERENCES `little_lemon_erd`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `orderid_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `little_lemon_erd`.`Delivery Status` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `employeeid_FK`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `little_lemon_erd`.`Staff` (`EmployeeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
