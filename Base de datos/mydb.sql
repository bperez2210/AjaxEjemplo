-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`personas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`personas` ;

CREATE TABLE IF NOT EXISTS `mydb`.`personas` (
  `PK_cedula` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido1` VARCHAR(30) NOT NULL,
  `apellido2` VARCHAR(30) NULL DEFAULT NULL,
  `fecNacimiento` DATE NOT NULL,
  `sexo` INT(11) NULL DEFAULT NULL,
  `observaciones` VARCHAR(400) NULL DEFAULT NULL,
  `ultUsuario` VARCHAR(20) NULL DEFAULT NULL,
  `ultModificacion` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`PK_cedula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`direcciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`direcciones` ;

CREATE TABLE IF NOT EXISTS `mydb`.`direcciones` (
  `PK_idDireccion` INT(11) NOT NULL AUTO_INCREMENT,
  `FK_cedula` INT(11) NOT NULL,
  `nomLugar` VARCHAR(40) NOT NULL,
  `direccion` VARCHAR(400) NOT NULL,
  `ultUsuario` VARCHAR(20) NULL DEFAULT NULL,
  `ultModificacion` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`PK_idDireccion`),
  INDEX `FK_DireccionesPersona_idx` (`FK_cedula` ASC),
  CONSTRAINT `FK_DireccionesPersona`
    FOREIGN KEY (`FK_cedula`)
    REFERENCES `mydb`.`personas` (`PK_cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`telefonos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`telefonos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`telefonos` (
  `PK_telefono` INT(11) NOT NULL,
  `PK_FK_cedula` INT(11) NOT NULL,
  `descripcion` VARCHAR(50) NULL DEFAULT NULL,
  `ultUsuario` VARCHAR(20) NULL DEFAULT NULL,
  `ultModificacion` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`PK_telefono`),
  INDEX `FK_DireccionesPersonas_idx` (`PK_FK_cedula` ASC),
  CONSTRAINT `FK_DireccionesPersonas`
    FOREIGN KEY (`PK_FK_cedula`)
    REFERENCES `mydb`.`personas` (`PK_cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
