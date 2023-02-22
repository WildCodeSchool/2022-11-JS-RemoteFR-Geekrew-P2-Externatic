-- MySQL Script generated by MySQL Workbench
-- ven. 17 févr. 2023 18:37:44
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema p3
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `p3` ;

-- -----------------------------------------------------
-- Schema p3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `p3` DEFAULT CHARACTER SET utf8mb4 ;
USE `p3` ;

-- -----------------------------------------------------
-- Table `p3`.`CANDIDACY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`CANDIDACY` ;

CREATE TABLE IF NOT EXISTS `p3`.`CANDIDACY` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `candidate_id` INT NOT NULL,
  `job_offer_id` INT NOT NULL,
  `candidacy_date` DATE NOT NULL,
  `received_by_company` TINYINT(1) NOT NULL,
  `read_by_company` TINYINT(1) NOT NULL,
  `company_responded` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CANDIDACY_candidate_id` (`candidate_id` ASC) VISIBLE,
  INDEX `fk_CANDIDACY_job_offer_id` (`job_offer_id` ASC) VISIBLE,
  CONSTRAINT `fk_CANDIDACY_candidate_id`
    FOREIGN KEY (`candidate_id`)
    REFERENCES `p3`.`CANDIDATE` (`id`),
  CONSTRAINT `fk_CANDIDACY_job_offer_id`
    FOREIGN KEY (`job_offer_id`)
    REFERENCES `p3`.`JOB_OFFER` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`CANDIDATE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`CANDIDATE` ;

CREATE TABLE IF NOT EXISTS `p3`.`CANDIDATE` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cv` VARCHAR(255) NOT NULL,
  `age` INT NOT NULL,
  `gender` VARCHAR(25),
  `github` VARCHAR(255) NOT NULL,
  `active` TINYINT(1) NOT NULL,
  `soft_skills` TEXT NOT NULL,
  `consultant_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CANDIDATE_consultant_id` (`consultant_id` ASC) VISIBLE,
  INDEX `fk_CANDIDATE_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_CANDIDATE_consultant_id`
    FOREIGN KEY (`consultant_id`)
    REFERENCES `p3`.`CONSULTANT` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_CANDIDATE_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `p3`.`USER` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`CANDIDATE_has_NOTIFICATION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`CANDIDATE_has_NOTIFICATION` ;

CREATE TABLE IF NOT EXISTS `p3`.`CANDIDATE_has_NOTIFICATION` (
  `CANDIDATE_id` INT NOT NULL,
  `NOTIFICATION_id` INT NOT NULL,
  PRIMARY KEY (`CANDIDATE_id`, `NOTIFICATION_id`),
  INDEX `fk_CANDIDATE_has_NOTIFICATION_NOTIFICATION1_idx` (`NOTIFICATION_id` ASC) VISIBLE,
  INDEX `fk_CANDIDATE_has_NOTIFICATION_CANDIDATE1_idx` (`CANDIDATE_id` ASC) VISIBLE,
  CONSTRAINT `fk_CANDIDATE_has_NOTIFICATION_CANDIDATE1`
    FOREIGN KEY (`CANDIDATE_id`)
    REFERENCES `p3`.`CANDIDATE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CANDIDATE_has_NOTIFICATION_NOTIFICATION1`
    FOREIGN KEY (`NOTIFICATION_id`)
    REFERENCES `p3`.`NOTIFICATION` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`CANDIDATE_has_TECHNOLOGY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`CANDIDATE_has_TECHNOLOGY` ;

CREATE TABLE IF NOT EXISTS `p3`.`CANDIDATE_has_TECHNOLOGY` (
  `CANDIDATE_id` INT NOT NULL,
  `TECHNOLOGY_id` INT NOT NULL,
  PRIMARY KEY (`CANDIDATE_id`, `TECHNOLOGY_id`),
  INDEX `fk_CANDIDATE_has_TECHNOLOGY_TECHNOLOGY1_idx` (`TECHNOLOGY_id` ASC) VISIBLE,
  INDEX `fk_CANDIDATE_has_TECHNOLOGY_CANDIDATE1_idx` (`CANDIDATE_id` ASC) VISIBLE,
  CONSTRAINT `fk_CANDIDATE_has_TECHNOLOGY_CANDIDATE1`
    FOREIGN KEY (`CANDIDATE_id`)
    REFERENCES `p3`.`CANDIDATE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CANDIDATE_has_TECHNOLOGY_TECHNOLOGY1`
    FOREIGN KEY (`TECHNOLOGY_id`)
    REFERENCES `p3`.`TECHNOLOGY` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`COMPANY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`COMPANY` ;

CREATE TABLE IF NOT EXISTS `p3`.`COMPANY` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(150) NOT NULL,
  `number_of_employee` INT NOT NULL,
  `description` TEXT NOT NULL,
  `field` VARCHAR(150) NOT NULL,
  `siret` VARCHAR(14) NOT NULL,
  `company_type` VARCHAR(150) NOT NULL,
  `picture` VARCHAR(255) NOT NULL,
  `user_id` INT NOT NULL,
  `COMPANY_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_COMPANY_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_COMPANY_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `p3`.`USER` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`COMPANY_has_FIELD`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`COMPANY_has_FIELD` ;

CREATE TABLE IF NOT EXISTS `p3`.`COMPANY_has_FIELD` (
  `COMPANY_id` INT NOT NULL,
  `FIELD_id` INT NOT NULL,
  PRIMARY KEY (`COMPANY_id`, `FIELD_id`),
  INDEX `fk_COMPANY_has_FIELD_FIELD1_idx` (`FIELD_id` ASC) VISIBLE,
  INDEX `fk_COMPANY_has_FIELD_COMPANY1_idx` (`COMPANY_id` ASC) VISIBLE,
  CONSTRAINT `fk_COMPANY_has_FIELD_COMPANY1`
    FOREIGN KEY (`COMPANY_id`)
    REFERENCES `p3`.`COMPANY` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPANY_has_FIELD_FIELD1`
    FOREIGN KEY (`FIELD_id`)
    REFERENCES `p3`.`FIELD` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`COMPANY_has_NOTIFICATION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`COMPANY_has_NOTIFICATION` ;

CREATE TABLE IF NOT EXISTS `p3`.`COMPANY_has_NOTIFICATION` (
  `COMPANY_id` INT NOT NULL,
  `NOTIFICATION_id` INT NOT NULL,
  PRIMARY KEY (`COMPANY_id`, `NOTIFICATION_id`),
  INDEX `fk_COMPANY_has_NOTIFICATION_NOTIFICATION1_idx` (`NOTIFICATION_id` ASC) VISIBLE,
  INDEX `fk_COMPANY_has_NOTIFICATION_COMPANY1_idx` (`COMPANY_id` ASC) VISIBLE,
  CONSTRAINT `fk_COMPANY_has_NOTIFICATION_COMPANY1`
    FOREIGN KEY (`COMPANY_id`)
    REFERENCES `p3`.`COMPANY` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPANY_has_NOTIFICATION_NOTIFICATION1`
    FOREIGN KEY (`NOTIFICATION_id`)
    REFERENCES `p3`.`NOTIFICATION` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`CONSULTANT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`CONSULTANT` ;

CREATE TABLE IF NOT EXISTS `p3`.`CONSULTANT` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `gender` VARCHAR(25),
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CONSULTANT_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_CONSULTANT_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `p3`.`USER` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`CONSULTANT_has_NOTIFICATION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`CONSULTANT_has_NOTIFICATION` ;

CREATE TABLE IF NOT EXISTS `p3`.`CONSULTANT_has_NOTIFICATION` (
  `CONSULTANT_id` INT NOT NULL,
  `NOTIFICATION_id` INT NOT NULL,
  PRIMARY KEY (`CONSULTANT_id`, `NOTIFICATION_id`),
  INDEX `fk_CONSULTANT_has_NOTIFICATION_NOTIFICATION1_idx` (`NOTIFICATION_id` ASC) VISIBLE,
  INDEX `fk_CONSULTANT_has_NOTIFICATION_CONSULTANT1_idx` (`CONSULTANT_id` ASC) VISIBLE,
  CONSTRAINT `fk_CONSULTANT_has_NOTIFICATION_CONSULTANT1`
    FOREIGN KEY (`CONSULTANT_id`)
    REFERENCES `p3`.`CONSULTANT` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTANT_has_NOTIFICATION_NOTIFICATION1`
    FOREIGN KEY (`NOTIFICATION_id`)
    REFERENCES `p3`.`NOTIFICATION` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`CONTRACT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`CONTRACT` ;

CREATE TABLE IF NOT EXISTS `p3`.`CONTRACT` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`FAVORITE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`FAVORITE` ;

CREATE TABLE IF NOT EXISTS `p3`.`FAVORITE` (
  `CANDIDATE_id` INT NOT NULL,
  `JOB_OFFER_id` INT NOT NULL,
  PRIMARY KEY (`CANDIDATE_id`, `JOB_OFFER_id`),
  INDEX `fk_CANDIDATE_has_JOB_OFFER_JOB_OFFER1_idx` (`JOB_OFFER_id` ASC) VISIBLE,
  INDEX `fk_CANDIDATE_has_JOB_OFFER_CANDIDATE1_idx` (`CANDIDATE_id` ASC) VISIBLE,
  CONSTRAINT `fk_CANDIDATE_has_JOB_OFFER_CANDIDATE1`
    FOREIGN KEY (`CANDIDATE_id`)
    REFERENCES `p3`.`CANDIDATE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CANDIDATE_has_JOB_OFFER_JOB_OFFER1`
    FOREIGN KEY (`JOB_OFFER_id`)
    REFERENCES `p3`.`JOB_OFFER` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`FIELD`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`FIELD` ;

CREATE TABLE IF NOT EXISTS `p3`.`FIELD` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p3`.`HANDLED_OFFER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`HANDLED_OFFER` ;

CREATE TABLE IF NOT EXISTS `p3`.`HANDLED_OFFER` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `job_offer_id` INT NOT NULL,
  `consultant_id` INT NOT NULL,
  `number_of_candidates` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_HANDLED_OFFER_job_offer_id` (`job_offer_id` ASC) VISIBLE,
  INDEX `fk_HANDLED_OFFER_consultant_id` (`consultant_id` ASC) VISIBLE,
  CONSTRAINT `fk_HANDLED_OFFER_consultant_id`
    FOREIGN KEY (`consultant_id`)
    REFERENCES `p3`.`CONSULTANT` (`id`),
  CONSTRAINT `fk_HANDLED_OFFER_job_offer_id`
    FOREIGN KEY (`job_offer_id`)
    REFERENCES `p3`.`JOB_OFFER` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`JOB_OFFER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`JOB_OFFER` ;

CREATE TABLE IF NOT EXISTS `p3`.`JOB_OFFER` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `salary` INT NOT NULL,
  `title` VARCHAR(180) NOT NULL,
  `lower_salary` INT NOT NULL,
  `higher_salary` INT NOT NULL,
  `description` TEXT NOT NULL,
  `experience` VARCHAR(50) NOT NULL,
  `location` VARCHAR(150) NOT NULL,
  `contract_id` INT NOT NULL,
  `debut_date` DATE NOT NULL,
  `mission` TEXT NOT NULL,
  `profile_needed` TEXT NOT NULL,
  `interview_run` TEXT NOT NULL,
  `remote` TINYINT(1) NOT NULL,
  `bonuses` TEXT NOT NULL,
  `work_hours` INT NOT NULL,
  `date_of_creation` DATE NOT NULL,
  `number_of_candidates` INT NOT NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_JOB_OFFER_contract_id` (`contract_id` ASC) VISIBLE,
  INDEX `fk_JOB_OFFER_company_id` (`company_id` ASC) VISIBLE,
  CONSTRAINT `fk_JOB_OFFER_company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `p3`.`COMPANY` (`id`),
  CONSTRAINT `fk_JOB_OFFER_contract_id`
    FOREIGN KEY (`contract_id`)
    REFERENCES `p3`.`CONTRACT` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`JOB_OFFER_has_TECHNOLOGY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`JOB_OFFER_has_TECHNOLOGY` ;

CREATE TABLE IF NOT EXISTS `p3`.`JOB_OFFER_has_TECHNOLOGY` (
  `JOB_OFFER_id` INT NOT NULL,
  `TECHNOLOGY_id` INT NOT NULL,
  PRIMARY KEY (`JOB_OFFER_id`, `TECHNOLOGY_id`),
  INDEX `fk_JOB_OFFER_has_TECHNOLOGY_TECHNOLOGY1_idx` (`TECHNOLOGY_id` ASC) VISIBLE,
  INDEX `fk_JOB_OFFER_has_TECHNOLOGY_JOB_OFFER1_idx` (`JOB_OFFER_id` ASC) VISIBLE,
  CONSTRAINT `fk_JOB_OFFER_has_TECHNOLOGY_JOB_OFFER1`
    FOREIGN KEY (`JOB_OFFER_id`)
    REFERENCES `p3`.`JOB_OFFER` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_JOB_OFFER_has_TECHNOLOGY_TECHNOLOGY1`
    FOREIGN KEY (`TECHNOLOGY_id`)
    REFERENCES `p3`.`TECHNOLOGY` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`NOTIFICATION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`NOTIFICATION` ;

CREATE TABLE IF NOT EXISTS `p3`.`NOTIFICATION` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `job_offer_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `message` VARCHAR(150) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_NOTIFICATION_job_offer_id` (`job_offer_id` ASC) VISIBLE,
  CONSTRAINT `fk_NOTIFICATION_job_offer_id`
    FOREIGN KEY (`job_offer_id`)
    REFERENCES `p3`.`JOB_OFFER` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `p3`.`TECHNOLOGY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`TECHNOLOGY` ;

CREATE TABLE IF NOT EXISTS `p3`.`TECHNOLOGY` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `p3`.`USER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `p3`.`USER` ;

CREATE TABLE IF NOT EXISTS `p3`.`USER` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(100) NOT NULL,
  `lastname` VARCHAR(100) NOT NULL,
  `mail` VARCHAR(255) NOT NULL,
  `linkedin` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `location` VARCHAR(150) NOT NULL,
  `picture` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES 
(1,'Gusty','Amethist','Gusty.Amethist@yopmail.com','https://www.linkedin.com/in/Gusty-Amethist/','xx.xx.xx.xx.xx','aupifserahash','Chengdu','urldelimage'),
(2,'Courtnay','Rona','Courtnay.Rona@yopmail.com','https://www.linkedin.com/in/Courtnay-Rona/','xx.xx.xx.xx.xx','aupifserahash','Mashhad','urldelimage'),
(3,'Adore','Maribeth','Adore.Maribeth@yopmail.com','https://www.linkedin.com/in/Adore-Maribeth/','xx.xx.xx.xx.xx','aupifserahash','Semarang','urldelimage'),
(4,'Tracey','Middleton','Tracey.Middleton@yopmail.com','https://www.linkedin.com/in/Tracey-Middleton/','xx.xx.xx.xx.xx','aupifserahash','Kigali','urldelimage'),
(5,'Kate','Rheingold','Kate.Rheingold@yopmail.com','https://www.linkedin.com/in/Kate-Rheingold/','xx.xx.xx.xx.xx','aupifserahash','Dammam','urldelimage');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO item (title) VALUES ('Stuff'), ('Doodads');
