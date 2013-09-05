SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `UNE` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `UNE` ;

-- -----------------------------------------------------
-- Table `UNE`.`Profesor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `UNE`.`Profesor` (
  `rut` INT NOT NULL ,
  `Nombre` VARCHAR(45) NOT NULL ,
  `Apellido` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`rut`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNE`.`Ramo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `UNE`.`Ramo` (
  `id` INT NOT NULL ,
  `Profesor_id` INT NOT NULL ,
  `Nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_Ramos_Profesor_idx` (`Profesor_id` ASC) ,
  CONSTRAINT `fk_Ramos_Profesor`
    FOREIGN KEY (`Profesor_id` )
    REFERENCES `UNE`.`Profesor` (`rut` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNE`.`Sesion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `UNE`.`Sesion` (
  `id` INT NOT NULL ,
  `Ramos_id` INT NOT NULL ,
  `Fecha` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_Sesiones_Ramos1_idx` (`Ramos_id` ASC) ,
  CONSTRAINT `fk_Sesiones_Ramos1`
    FOREIGN KEY (`Ramos_id` )
    REFERENCES `UNE`.`Ramo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNE`.`Alumno`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `UNE`.`Alumno` (
  `rut` INT NOT NULL ,
  `Nombre` VARCHAR(45) NOT NULL ,
  `Apellido` VARCHAR(45) NOT NULL ,
  `Email` VARCHAR(45) NOT NULL ,
  `Password` VARCHAR(45) NULL ,
  PRIMARY KEY (`rut`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNE`.`Evaluacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `UNE`.`Evaluacion` (
  `id` INT NOT NULL ,
  `Nota` INT(1) NOT NULL ,
  `Asistio` TINYINT(1) NOT NULL ,
  `Alumno_rut` INT NOT NULL ,
  `Sesion_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_Evaluacion_Alumno1_idx` (`Alumno_rut` ASC) ,
  INDEX `fk_Evaluacion_Sesion1_idx` (`Sesion_id` ASC) ,
  CONSTRAINT `fk_Evaluacion_Alumno1`
    FOREIGN KEY (`Alumno_rut` )
    REFERENCES `UNE`.`Alumno` (`rut` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evaluacion_Sesion1`
    FOREIGN KEY (`Sesion_id` )
    REFERENCES `UNE`.`Sesion` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNE`.`Alumno_has_Ramo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `UNE`.`Alumno_has_Ramo` (
  `Alumno_rut` INT NOT NULL ,
  `Ramo_id` INT NOT NULL ,
  PRIMARY KEY (`Alumno_rut`, `Ramo_id`) ,
  INDEX `fk_Alumno_has_Ramo_Ramo1_idx` (`Ramo_id` ASC) ,
  INDEX `fk_Alumno_has_Ramo_Alumno1_idx` (`Alumno_rut` ASC) ,
  CONSTRAINT `fk_Alumno_has_Ramo_Alumno1`
    FOREIGN KEY (`Alumno_rut` )
    REFERENCES `UNE`.`Alumno` (`rut` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_has_Ramo_Ramo1`
    FOREIGN KEY (`Ramo_id` )
    REFERENCES `UNE`.`Ramo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `UNE` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
