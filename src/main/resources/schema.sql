
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
DROP TABLE IF EXISTS `cybermind`.`chapter`;
DROP TABLE IF EXISTS `cybermind`.`learn`;
DROP TABLE IF EXISTS `cybermind`.`role`;
DROP TABLE IF EXISTS `cybermind`.`task_tags`;
DROP TABLE IF EXISTS `cybermind`.`tags`;
DROP TABLE IF EXISTS `cybermind`.`task`;


-- -----------------------------------------------------
-- Table `cybermind`.`user`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  `enabled` TINYINT(4) NOT NULL,
  `points` INT NOT NULL DEFAULT 0,
  `image` VARCHAR(64) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`relationship`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`relationship` (
  `user_id` INT NOT NULL,
  `friend` INT NOT NULL,
  INDEX `fk_relationship_user1_idx` (`friend` ASC) VISIBLE,
  PRIMARY KEY (`user_id`, `friend`),
  CONSTRAINT `fk_relationship_user`
    FOREIGN KEY (`user_id`)
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(2048) NOT NULL,
  `level` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`solved_tasks`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`solved_tasks` (
  `user_id` INT NOT NULL,
  `task_id` INT NOT NULL,
  `is_solved` TINYINT NOT NULL,
  PRIMARY KEY (`user_id`, `task_id`),
  INDEX `fk_user_has_task_task1_idx` (`task_id` ASC) VISIBLE,
  INDEX `fk_user_has_task_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_task_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `cybermind`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_task_task1`
    FOREIGN KEY (`task_id`)
    REFERENCES `cybermind`.`task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`learn`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`learn` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`chapter`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`chapter` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `learn_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `text` VARCHAR(1024) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chapter_learn1_idx` (`learn_id` ASC) VISIBLE,
  CONSTRAINT `fk_chapter_learn1`
    FOREIGN KEY (`learn_id`)
    REFERENCES `cybermind`.`learn` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`role`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
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


-- -----------------------------------------------------
-- Table `cybermind`.`tags`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`tags` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cybermind`.`task_tags`
-- -----------------------------------------------------
CREATE TABLE `cybermind`.`task_tags` (
  `task_id` INT NOT NULL,
  `tags_id` INT NOT NULL,
  PRIMARY KEY (`task_id`, `tags_id`),
  INDEX `fk_task_has_tags_tags1_idx` (`tags_id` ASC) VISIBLE,
  INDEX `fk_task_has_tags_task1_idx` (`task_id` ASC) VISIBLE,
  CONSTRAINT `fk_task_has_tags_task1`
    FOREIGN KEY (`task_id`)
    REFERENCES `cybermind`.`task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_has_tags_tags1`
    FOREIGN KEY (`tags_id`)
    REFERENCES `cybermind`.`tags` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;