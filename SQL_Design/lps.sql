-- MySQL Script generated by MySQL Workbench
-- Thu Dec  7 10:33:25 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lapd_test
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lapd_test` ;

-- -----------------------------------------------------
-- Schema lapd_test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lapd_test` DEFAULT CHARACTER SET utf8 ;
USE `lapd_test` ;

-- -----------------------------------------------------
-- Table `lapd_test`.`t_admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lapd_test`.`t_admin` ;

CREATE TABLE IF NOT EXISTS `lapd_test`.`t_admin` (
  `id` INT NOT NULL COMMENT '主键ID',
  `userName` VARCHAR(15) NOT NULL COMMENT '用户名称',
  `password` VARCHAR(15) NOT NULL COMMENT '密码',
  `registerTime` TIMESTAMP NOT NULL COMMENT '注册时间',
  `avatar` VARCHAR(255) NULL COMMENT '头像，存储头像的文件路径',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idadmin_UNIQUE` (`userName` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lapd_test`.`t_clockcategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lapd_test`.`t_clockcategory` ;

CREATE TABLE IF NOT EXISTS `lapd_test`.`t_clockcategory` (
  `id` INT NOT NULL COMMENT '序号',
  `clockcategory` VARCHAR(20) NOT NULL COMMENT '上钟类型',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`clockcategory` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lapd_test`.`t_orderstatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lapd_test`.`t_orderstatus` ;

CREATE TABLE IF NOT EXISTS `lapd_test`.`t_orderstatus` (
  `id` INT NOT NULL COMMENT '序号',
  `orderstatus` VARCHAR(20) NOT NULL COMMENT '订单类型',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `orderstatus_UNIQUE` (`orderstatus` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lapd_test`.`t_paypath`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lapd_test`.`t_paypath` ;

CREATE TABLE IF NOT EXISTS `lapd_test`.`t_paypath` (
  `id` INT NOT NULL COMMENT '主键',
  `payPath` VARCHAR(20) NOT NULL COMMENT '支付方式',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `payPath_UNIQUE` (`payPath` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lapd_test`.`t_pledge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lapd_test`.`t_pledge` ;

CREATE TABLE IF NOT EXISTS `lapd_test`.`t_pledge` (
  `id` INT NOT NULL COMMENT '主键',
  `name` VARCHAR(20) NULL COMMENT '所借用物品的名字',
  `price` INT(11) NULL DEFAULT 50 COMMENT '借用物品的价格',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lapd_test`.`t_serverItem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lapd_test`.`t_serverItem` ;

CREATE TABLE IF NOT EXISTS `lapd_test`.`t_serverItem` (
  `id` INT NOT NULL COMMENT '序号',
  `serverItem` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `roomcatagory_UNIQUE` (`serverItem` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lapd_test`.`t_room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lapd_test`.`t_room` ;

CREATE TABLE IF NOT EXISTS `lapd_test`.`t_room` (
  `id` INT NOT NULL COMMENT '主键',
  `name` VARCHAR(10) NOT NULL COMMENT '房间编号',
  `roomCategory` INT NOT NULL COMMENT '房间类型',
  `floor` INT NOT NULL,
  `size` INT NOT NULL COMMENT '房间可容纳客人的人数',
  `remark` VARCHAR(255) NULL DEFAULT NULL COMMENT '房间描述',
  `addTime` TIMESTAMP NOT NULL,
  `isFree` TINYINT(1) NOT NULL DEFAULT 1,
  `isClean` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `name_idx` (`roomCategory` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `name`
    FOREIGN KEY (`roomCategory`)
    REFERENCES `lapd_test`.`t_serverItem` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lapd_test`.`t_workstatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lapd_test`.`t_workstatus` ;

CREATE TABLE IF NOT EXISTS `lapd_test`.`t_workstatus` (
  `id` INT NOT NULL COMMENT '主键id',
  `workStatus` VARCHAR(20) NOT NULL COMMENT '工作状态',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `workStatus_UNIQUE` (`workStatus` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lapd_test`.`t_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lapd_test`.`t_user` ;

CREATE TABLE IF NOT EXISTS `lapd_test`.`t_user` (
  `id` INT NOT NULL,
  `userName` VARCHAR(45) NOT NULL COMMENT '员工编号',
  `password` VARCHAR(45) NOT NULL COMMENT '员工密码',
  `workId` INT(11) NULL COMMENT '员工的工作id',
  `birthday` DATE NULL COMMENT '出生日期',
  `telephonePhone` VARCHAR(15) NULL DEFAULT NULL COMMENT '电话号码',
  `email` VARCHAR(20) NULL COMMENT '电子邮件',
  `address` VARCHAR(200) NULL DEFAULT NULL COMMENT '地址',
  `avatar` VARCHAR(255) NULL COMMENT '头像图片路径',
  `question` VARCHAR(20) NOT NULL COMMENT '密保问题',
  `answer` VARCHAR(100) NOT NULL COMMENT '密保答案',
  `workStatus` INT NULL DEFAULT NULL,
  `registerTime` TIMESTAMP NOT NULL,
  `realName` VARCHAR(20) NULL COMMENT '真实姓名',
  `IDCardNo` VARCHAR(30) NULL COMMENT '身份证号码',
  UNIQUE INDEX `id_UNIQUE` (`workId` ASC),
  INDEX `workStatus_idx` (`workStatus` ASC),
  UNIQUE INDEX `idUser_UNIQUE` (`userName` ASC),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `IDCardNo_UNIQUE` (`IDCardNo` ASC),
  CONSTRAINT `UserworkStatus`
    FOREIGN KEY (`workStatus`)
    REFERENCES `lapd_test`.`t_workstatus` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lapd_test`.`t_serverorder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lapd_test`.`t_serverorder` ;

CREATE TABLE IF NOT EXISTS `lapd_test`.`t_serverorder` (
  `idOrder` VARCHAR(45) NOT NULL COMMENT '订单编号',
  `stuffId` INT NOT NULL COMMENT '员工编号',
  `roomId` INT NOT NULL COMMENT '所在房间编号',
  `statusId` INT NOT NULL COMMENT '订单状态',
  `clockCategoryId` INT NOT NULL,
  `payPathId` INT NULL DEFAULT NULL COMMENT '支付途径',
  `pledgeNameId` INT NULL COMMENT '所压物品',
  `initTime` TIMESTAMP NOT NULL COMMENT '开单时间',
  `receiveTime` TIMESTAMP NULL DEFAULT NULL COMMENT '此服务单开始时间',
  `finishTime` DATETIME NULL DEFAULT NULL COMMENT '此服务单结束时间',
  `pay` INT(11) NULL DEFAULT '0' COMMENT '应付金额',
  `realPay` INT(11) NULL DEFAULT '0' COMMENT '实付金额',
  `payTime` TIMESTAMP NULL DEFAULT NULL,
  `orderRemark` VARCHAR(255) NULL DEFAULT NULL COMMENT '订单描述',
  INDEX `idRoom_idx` (`roomId` ASC),
  INDEX `payPath_idx` (`payPathId` ASC),
  INDEX `pledgeName_idx` (`pledgeNameId` ASC),
  INDEX `clockcatagory_idx` (`clockCategoryId` ASC),
  INDEX `order_userId` (`stuffId` ASC),
  INDEX `orderstatus_idx` (`statusId` ASC),
  PRIMARY KEY (`idOrder`),
  CONSTRAINT `order_clockcatagory`
    FOREIGN KEY (`clockCategoryId`)
    REFERENCES `lapd_test`.`t_clockcategory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_idRoom`
    FOREIGN KEY (`roomId`)
    REFERENCES `lapd_test`.`t_room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_userId`
    FOREIGN KEY (`stuffId`)
    REFERENCES `lapd_test`.`t_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_orderstatusId`
    FOREIGN KEY (`statusId`)
    REFERENCES `lapd_test`.`t_orderstatus` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_payPath`
    FOREIGN KEY (`payPathId`)
    REFERENCES `lapd_test`.`t_paypath` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_pledgeName`
    FOREIGN KEY (`pledgeNameId`)
    REFERENCES `lapd_test`.`t_pledge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lapd_test`.`t_workrank`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lapd_test`.`t_workrank` ;

CREATE TABLE IF NOT EXISTS `lapd_test`.`t_workrank` (
  `id` INT NOT NULL,
  `rank` INT NOT NULL COMMENT '排名序号',
  `stuffId` INT(11) NOT NULL COMMENT '员工的工作牌号\n',
  `rankNum` INT(11) NULL DEFAULT '0' COMMENT '排钟数量',
  `spotNum` INT(11) NULL DEFAULT '0' COMMENT '点钟数量',
  INDEX `id_user_idx` (`stuffId` ASC),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rank_UNIQUE` (`rank` ASC),
  CONSTRAINT `id_user`
    FOREIGN KEY (`stuffId`)
    REFERENCES `lapd_test`.`t_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
