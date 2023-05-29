-- MySQL Script generated by MySQL Workbench
-- Wed May 24 16:11:59 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mppa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idusuario` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `lastupdate` DATETIME NULL,
  `active` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `idusuario`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `idusuario_UNIQUE` (`idusuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `calle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `calle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `id_calle` INT NULL,
  `callecol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `altura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `altura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  `id_altura` INT NULL,
  `alturacol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `especie_arbol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `especie_arbol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  `id_especie_arbol` INT NULL,
  `especie_arbolcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vereda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vereda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  `id_vereda` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estado_gen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estado_gen` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  `id_estado` INT NULL,
  `estado_gencol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rare_elements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rare_elements` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(25) NULL,
  `id_rare_elements` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `espacio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `espacio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  `id_espacio` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `id_espacio_UNIQUE` (`id_espacio` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `arbolado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arbolado` (
  `fid` INT NOT NULL AUTO_INCREMENT,
  `ele` FLOAT NULL,
  `time` DATETIME NULL,
  `name` VARCHAR(4) NULL,
  `modulo` INT(2) NULL,
  `id_gps` INT(2) NULL,
  `id_asociad` INT(4) NULL,
  `observacion` LONGTEXT NULL,
  `planilla` INT(4) NULL,
  `altura_ini` INT(4) NULL,
  `altura_fin` INT(4) NULL,
  `lado` INT(1) NULL,
  `id_bbdd` INT(5) NULL,
  `obs_data` LONGTEXT NULL,
  `circunsf` FLOAT NULL,
  `diametro` FLOAT NULL,
  `numeracion_aproximada` FLOAT NULL,
  `rare_elements` TINYINT NULL,
  `rare_elements_type` INT(1) NULL,
  `desc_rare_elements` LONGTEXT NULL,
  `ancho_vereda` TINYINT NULL,
  `vereda_damage` TINYINT NULL,
  `vereda_levantada` TINYINT NULL,
  `actualizacion` DATE NULL,
  `calle_id` INT NOT NULL,
  `altura_id` INT NOT NULL,
  `especie_arbol_id` INT NOT NULL,
  `vereda_id` INT NOT NULL,
  `estado_gen_id` INT NOT NULL,
  `rare_elements_id` INT NOT NULL,
  `espacio_id` INT NOT NULL,
  PRIMARY KEY (`fid`, `calle_id`, `altura_id`, `especie_arbol_id`, `vereda_id`, `estado_gen_id`, `rare_elements_id`, `espacio_id`),
  UNIQUE INDEX `id_UNIQUE` (`fid` ASC) VISIBLE,
  INDEX `fk_arbolado_calle_idx` (`calle_id` ASC) VISIBLE,
  INDEX `fk_arbolado_altura1_idx` (`altura_id` ASC) VISIBLE,
  INDEX `fk_arbolado_especie_arbol1_idx` (`especie_arbol_id` ASC) VISIBLE,
  INDEX `fk_arbolado_vereda1_idx` (`vereda_id` ASC) VISIBLE,
  INDEX `fk_arbolado_estado_gen1_idx` (`estado_gen_id` ASC) VISIBLE,
  INDEX `fk_arbolado_rare_elements1_idx` (`rare_elements_id` ASC) VISIBLE,
  INDEX `fk_arbolado_espacio1_idx` (`espacio_id` ASC) VISIBLE,
  CONSTRAINT `fk_arbolado_calle`
    FOREIGN KEY (`calle_id`)
    REFERENCES `calle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arbolado_altura1`
    FOREIGN KEY (`altura_id`)
    REFERENCES `altura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arbolado_especie_arbol1`
    FOREIGN KEY (`especie_arbol_id`)
    REFERENCES `especie_arbol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arbolado_vereda1`
    FOREIGN KEY (`vereda_id`)
    REFERENCES `vereda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arbolado_estado_gen1`
    FOREIGN KEY (`estado_gen_id`)
    REFERENCES `estado_gen` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arbolado_rare_elements1`
    FOREIGN KEY (`rare_elements_id`)
    REFERENCES `rare_elements` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arbolado_espacio1`
    FOREIGN KEY (`espacio_id`)
    REFERENCES `espacio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
