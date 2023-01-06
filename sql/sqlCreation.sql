SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SET AUTOCOMMIT = 0;
set time_zone = "+00:00"

CREATE SCHEMA IF NOT EXISTS `astra` DEFAULT CHARACTER SET utf8 ;
USE `astra` ;

CREATE TABLE IF NOT EXISTS `astra`.`utenti` (
  `idUtenti` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `password` VARCHAR(512) NOT NULL,
  `email` VARCHAR(512) NOT NULL,
  `role` enum('Gestore','Cliente' ), /*An ENUM is a string object with a value chosen from a list of permitted values that are enumerated explicitly in the column specification at table creation time.*/
  PRIMARY KEY (`idUtenti`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `astra`.`stanze` (
  `idStanze` INT NOT NULL AUTO_INCREMENT,
  `numeroStanza` VARCHAR(100) NOT NULL,
  `prezzoStanzaAnotte` VARCHAR(100) NOT NULL,
  `imgStanza` VARCHAR(100) NOT NULL,
  `utenti` INT NOT NULL,
  PRIMARY KEY (`idStanze`),
    FOREIGN KEY (`utenti`)
    REFERENCES `astra`.`utenti` (`idUtenti`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `astra`.`prenotazione` (
  `idPrenotazione` INT NOT NULL AUTO_INCREMENT,
  `dataInizioPrenotazione` VARCHAR(100) NOT NULL,
  `dataFinePrenotazione` VARCHAR(100) NOT NULL,
  `numeroStanza` VARCHAR(100) NOT NULL,
  `noteSullaStanza` VARCHAR(100) NOT NULL,
  `utenti` INT NOT NULL,
  PRIMARY KEY (`idPrenotazione`),
    FOREIGN KEY (`utenti`)
    REFERENCES `astra`.`utenti` (`idUtenti`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;