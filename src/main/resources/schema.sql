
-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cybermind
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cybermind
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cybermind` DEFAULT CHARACTER SET utf8 ;
USE `cybermind` ;


DROP TABLE IF EXISTS `cybermind`.`users_roles`;
DROP TABLE IF EXISTS `cybermind`.`relationship`;
DROP TABLE IF EXISTS `cybermind`.`solved_tasks`;
DROP TABLE IF EXISTS `cybermind`.`user`;
DROP TABLE IF EXISTS `cybermind`.`example`;
DROP TABLE IF EXISTS `cybermind`.`task`;
DROP TABLE IF EXISTS `cybermind`.`chapter`;
DROP TABLE IF EXISTS `cybermind`.`learn`;
DROP TABLE IF EXISTS `cybermind`.`role`;


-- -----------------------------------------------------
-- Table `cybermind`.`user`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  `enabled` TINYINT(4) NOT NULL,
  `points` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`relationship`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`relationship` (
  `userId` INT NOT NULL,
  `friend` INT NOT NULL,
  INDEX `fk_relationship_user1_idx` (`friend` ASC) VISIBLE,
  PRIMARY KEY (`userId`, `friend`),
  CONSTRAINT `fk_relationship_user`
    FOREIGN KEY (`userId`)
    REFERENCES `cybermind`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_relationship_user1`
    FOREIGN KEY (`friend`)
    REFERENCES `cybermind`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`task`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`task` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(1024) NOT NULL,
  `output` VARCHAR(1024) NOT NULL,
  `input` VARCHAR(1024) NOT NULL,
  `solution` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`example`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`example` (
  `id` INT NOT NULL,
  `taskId` INT NOT NULL,
  `input` VARCHAR(1024) NOT NULL,
  `output` VARCHAR(1024) NOT NULL,
  `explanation` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_example_task1_idx` (`taskId` ASC) VISIBLE,
  CONSTRAINT `fk_example_task1`
    FOREIGN KEY (`taskId`)
    REFERENCES `cybermind`.`task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`solved_tasks`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`solved_tasks` (
  `userId` INT NOT NULL,
  `taskId` INT NOT NULL,
  `isSolved` TINYINT NOT NULL,
  PRIMARY KEY (`userId`, `taskId`),
  INDEX `fk_user_has_task_task1_idx` (`taskId` ASC) VISIBLE,
  INDEX `fk_user_has_task_user1_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_task_user1`
    FOREIGN KEY (`userId`)
    REFERENCES `cybermind`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_task_task1`
    FOREIGN KEY (`taskId`)
    REFERENCES `cybermind`.`task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`learn`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`learn` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`chapter`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`chapter` (
  `id` INT NOT NULL,
  `learnId` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `text` VARCHAR(1024) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chapter_learn1_idx` (`learnId` ASC) VISIBLE,
  CONSTRAINT `fk_chapter_learn1`
    FOREIGN KEY (`learnId`)
    REFERENCES `cybermind`.`learn` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`role`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`role` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`users_roles`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`users_roles` (
  `role_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`),
  INDEX `fk_role_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_role_has_user_role1_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_role_has_user_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `cybermind`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `cybermind`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;