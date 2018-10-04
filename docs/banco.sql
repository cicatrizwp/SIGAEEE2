-- MySQL Script generated by MySQL Workbench
-- Thu 04 Oct 2018 09:56:26 AM -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sigaeee
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sigaeee` ;

-- -----------------------------------------------------
-- Schema sigaeee
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sigaeee` DEFAULT CHARACTER SET utf8 ;
USE `sigaeee` ;

-- -----------------------------------------------------
-- Table `sigaeee`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigaeee`.`usuario` ;

CREATE TABLE IF NOT EXISTS `sigaeee`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigaeee`.`esporte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigaeee`.`esporte` ;

CREATE TABLE IF NOT EXISTS `sigaeee`.`esporte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigaeee`.`posicao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigaeee`.`posicao` ;

CREATE TABLE IF NOT EXISTS `sigaeee`.`posicao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `esporte_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posicao_esporte1_idx` (`esporte_id` ASC),
  CONSTRAINT `fk_posicao_esporte1`
  FOREIGN KEY (`esporte_id`)
  REFERENCES `sigaeee`.`esporte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigaeee`.`equipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigaeee`.`equipe` ;

CREATE TABLE IF NOT EXISTS `sigaeee`.`equipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `logo` VARCHAR(45) NULL,
  `playbook` VARCHAR(45) NULL,
  `esporte_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_equipe_esporte1_idx` (`esporte_id` ASC),
  CONSTRAINT `fk_equipe_esporte1`
  FOREIGN KEY (`esporte_id`)
  REFERENCES `sigaeee`.`esporte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigaeee`.`atleta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigaeee`.`atleta` ;

CREATE TABLE IF NOT EXISTS `sigaeee`.`atleta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `peso` FLOAT NOT NULL,
  `altura` FLOAT NOT NULL,
  `data_nascimento` VARCHAR(10) NOT NULL,
  `posicao_id` INT NULL,
  `equipe_id` INT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_atleta_posicao1_idx` (`posicao_id` ASC),
  INDEX `fk_atleta_equipe1_idx` (`equipe_id` ASC),
  INDEX `fk_atleta_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_atleta_posicao1`
  FOREIGN KEY (`posicao_id`)
  REFERENCES `sigaeee`.`posicao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atleta_equipe1`
  FOREIGN KEY (`equipe_id`)
  REFERENCES `sigaeee`.`equipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atleta_usuario1`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `sigaeee`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigaeee`.`tipo_evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigaeee`.`tipo_evento` ;

CREATE TABLE IF NOT EXISTS `sigaeee`.`tipo_evento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigaeee`.`evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigaeee`.`evento` ;

CREATE TABLE IF NOT EXISTS `sigaeee`.`evento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `data` VARCHAR(10) NOT NULL,
  `local` VARCHAR(45) NULL,
  `tipo_evento_id` INT NOT NULL,
  `equipe_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_evento_tipo_evento1_idx` (`tipo_evento_id` ASC),
  INDEX `fk_evento_equipe1_idx` (`equipe_id` ASC),
  CONSTRAINT `fk_evento_tipo_evento1`
  FOREIGN KEY (`tipo_evento_id`)
  REFERENCES `sigaeee`.`tipo_evento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_equipe1`
  FOREIGN KEY (`equipe_id`)
  REFERENCES `sigaeee`.`equipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigaeee`.`gestor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sigaeee`.`gestor` ;

CREATE TABLE IF NOT EXISTS `sigaeee`.`gestor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_gestor_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_gestor_usuario1`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `sigaeee`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
