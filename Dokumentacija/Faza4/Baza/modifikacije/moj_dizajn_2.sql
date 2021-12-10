-- MySQL Script generated by MySQL Workbench
-- Fri May 28 14:03:37 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema moj_dizajn
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema moj_dizajn
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `moj_dizajn` DEFAULT CHARACTER SET utf8 ;
USE `moj_dizajn` ;

-- -----------------------------------------------------
-- Table `moj_dizajn`.`korisnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moj_dizajn`.`korisnik` (
  `korisnicko_ime` VARCHAR(20) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  `ime_i_prezime` VARCHAR(45) NOT NULL,
  `status` VARCHAR(6) NOT NULL DEFAULT 'regkor',
  `sifra` VARCHAR(20) NOT NULL,
  `stanje` INT NOT NULL DEFAULT 1,
  `cv` VARCHAR(255) NULL,
  `slika` MEDIUMBLOB NULL,
  `biografija` VARCHAR(500) NULL,
  PRIMARY KEY (`korisnicko_ime`),
  UNIQUE INDEX `korisnicko_ime_UNIQUE` (`korisnicko_ime` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moj_dizajn`.`model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moj_dizajn`.`model` (
  `idModel` INT NOT NULL AUTO_INCREMENT,
  `dizajner` VARCHAR(20) NOT NULL,
  `slika` MEDIUMBLOB NOT NULL,
  PRIMARY KEY (`idModel`),
  INDEX `fp_korisnik_idKorisnik_idx` (`dizajner` ASC) ,
  CONSTRAINT `fp_korisnik_model_korisnicko_ime`
    FOREIGN KEY (`dizajner`)
    REFERENCES `moj_dizajn`.`korisnik` (`korisnicko_ime`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moj_dizajn`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moj_dizajn`.`tag` (
  `idTag` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idTag`),
  UNIQUE INDEX `idTag_UNIQUE` (`idTag` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moj_dizajn`.`ocena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moj_dizajn`.`ocena` (
  `idOcena` INT NOT NULL AUTO_INCREMENT,
  `korisnik` VARCHAR(20) NOT NULL,
  `dizajner` VARCHAR(20) NOT NULL,
  `cena` TINYINT(1) NOT NULL,
  `dizajn` TINYINT(1) NOT NULL,
  `kvalitet` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idOcena`),
  INDEX `fp_korisnik_korisnik_idx` (`korisnik` ASC) ,
  INDEX `fp_korisnik_dizajner_idx` (`dizajner` ASC) ,
  CONSTRAINT `fp_korisnik_ocena_korisnik`
    FOREIGN KEY (`korisnik`)
    REFERENCES `moj_dizajn`.`korisnik` (`korisnicko_ime`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fp_korisnik_ocena_dizajner`
    FOREIGN KEY (`dizajner`)
    REFERENCES `moj_dizajn`.`korisnik` (`korisnicko_ime`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moj_dizajn`.`upit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moj_dizajn`.`upit` (
  `idUpit` INT NOT NULL AUTO_INCREMENT,
  `komentar` VARCHAR(255) NOT NULL,
  `model` INT NULL,
  `korisnik` VARCHAR(20) NOT NULL,
  `dizajner` VARCHAR(20) NOT NULL,
  `canvas` MEDIUMBLOB NULL,
  `vreme` DATETIME NOT NULL,
  `primer_modela` MEDIUMBLOB NULL,
  PRIMARY KEY (`idUpit`),
  UNIQUE INDEX `idUpit_UNIQUE` (`idUpit` ASC) ,
  INDEX `FP_model_idModel_idx` (`model` ASC) ,
  INDEX `FP_korisnik_korisnik_idx` (`korisnik` ASC) ,
  INDEX `FP_korisnik_dizajner_idx` (`dizajner` ASC) ,
  CONSTRAINT `fp_model_upit_idModel`
    FOREIGN KEY (`model`)
    REFERENCES `moj_dizajn`.`model` (`idModel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fp_korisnik_upit_korisnik`
    FOREIGN KEY (`korisnik`)
    REFERENCES `moj_dizajn`.`korisnik` (`korisnicko_ime`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fp_korisnik_upit_dizajner`
    FOREIGN KEY (`dizajner`)
    REFERENCES `moj_dizajn`.`korisnik` (`korisnicko_ime`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moj_dizajn`.`model_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moj_dizajn`.`model_tag` (
  `idModel` INT NOT NULL,
  `idTag` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idModel`, `idTag`),
  INDEX `fk_model_has_tag_tag1_idx` (`idTag` ASC) ,
  INDEX `fk_model_has_tag_model1_idx` (`idModel` ASC) ,
  CONSTRAINT `fp_model_tag_model`
    FOREIGN KEY (`idModel`)
    REFERENCES `moj_dizajn`.`model` (`idModel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fp_model_tag_tag`
    FOREIGN KEY (`idTag`)
    REFERENCES `moj_dizajn`.`tag` (`idTag`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `moj_dizajn`.`korisnik`
-- -----------------------------------------------------
START TRANSACTION;
USE `moj_dizajn`;
INSERT INTO `moj_dizajn`.`korisnik` (`korisnicko_ime`, `email`, `ime_i_prezime`, `status`, `sifra`, `stanje`, `cv`, `slika`, `biografija`) VALUES ('ana', 'ana@gmail.com', 'ana milosevic', 'mod', 'ana123', 0, NULL, NULL, NULL);
INSERT INTO `moj_dizajn`.`korisnik` (`korisnicko_ime`, `email`, `ime_i_prezime`, `status`, `sifra`, `stanje`, `cv`, `slika`, `biografija`) VALUES ('admin', 'admin@gmail.com', 'admin adminovic', 'admin', 'admin123', 0, NULL, NULL, NULL);
INSERT INTO `moj_dizajn`.`korisnik` (`korisnicko_ime`, `email`, `ime_i_prezime`, `status`, `sifra`, `stanje`, `cv`, `slika`, `biografija`) VALUES ('zeksi', 'zeksi@gmail.com', 'zeljko milicevic', 'regkor', 'zeksi123', 0, NULL, NULL, NULL);
INSERT INTO `moj_dizajn`.`korisnik` (`korisnicko_ime`, `email`, `ime_i_prezime`, `status`, `sifra`, `stanje`, `cv`, `slika`, `biografija`) VALUES ('anci', 'anci@gmail.com', 'ana milosevic', 'diz', 'anci123', 0, 'najlepsa sam', NULL, 'jos sam lepsa');
INSERT INTO `moj_dizajn`.`korisnik` (`korisnicko_ime`, `email`, `ime_i_prezime`, `status`, `sifra`, `stanje`, `cv`, `slika`, `biografija`) VALUES ('aca', 'aca@gmail.com', 'a vasilic', 'regkor', 'aca123', 0, NULL, NULL, NULL);
INSERT INTO `moj_dizajn`.`korisnik` (`korisnicko_ime`, `email`, `ime_i_prezime`, `status`, `sifra`, `stanje`, `cv`, `slika`, `biografija`) VALUES ('dusan', 'dusan@gmail.com', 'dusan ani', 'diz', 'dusan123', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
INSERT INTO `moj_dizajn`.`korisnik` (`korisnicko_ime`, `email`, `ime_i_prezime`, `status`, `sifra`, `stanje`, `cv`, `slika`, `biografija`) VALUES ('kuca_dizajn', 'kuca@gmial.com', 'kuca kucic', 'diz', 'kuca123', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
INSERT INTO `moj_dizajn`.`korisnik` (`korisnicko_ime`, `email`, `ime_i_prezime`, `status`, `sifra`, `stanje`, `cv`, `slika`, `biografija`) VALUES ('vislja', 'vislja@gmail.com', 'vislja si', 'diz', 'vislja123', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
INSERT INTO `moj_dizajn`.`korisnik` (`korisnicko_ime`, `email`, `ime_i_prezime`, `status`, `sifra`, `stanje`, `cv`, `slika`, `biografija`) VALUES ('danko', 'danko@gmail.com', 'danko lepi', 'diz', 'vislja123', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
INSERT INTO `moj_dizajn`.`korisnik` (`korisnicko_ime`, `email`, `ime_i_prezime`, `status`, `sifra`, `stanje`, `cv`, `slika`, `biografija`) VALUES ('micika', 'micika@gmai.com', 'micika djuro', 'mod', 'micika123', 0, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `moj_dizajn`.`tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `moj_dizajn`;
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('sto');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('vrata');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('ormar');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('krevet');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('stolica');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('fotelja');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('crna');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('plavo');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('zuto');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('skopivo');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('crveno');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('bracni');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('francuski');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('polica');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('knjige');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('radni');
INSERT INTO `moj_dizajn`.`tag` (`idTag`) VALUES ('zeleno');

COMMIT;

