-- Drops the database Evaluation if it already exists
DROP DATABASE IF EXISTS `Evaluation`;
-- Creates the database Evaluation 
CREATE DATABASE `Evaluation`;
-- Makes Evaluation the currently used DB
USE `Evaluation`;

CREATE TABLE `Client` (
  `cli_num` INT NOT NULL AUTO_INCREMENT,
  `cli_adresse` VARCHAR(50),
  `cli_nom` VARCHAR(50),
  `cli_tel` VARCHAR(30),
  PRIMARY KEY (`cli_num`)
);

CREATE TABLE `Commande` (
  `com_num` INT NOT NULL AUTO_INCREMENT,
  `cli_num` INT NOT NULL,
  `com_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `com_obs` VARCHAR(50),
  PRIMARY KEY (`com_num`),
  FOREIGN KEY (`cli_num`) REFERENCES `Client`(`cli_num`)
);

CREATE TABLE `Produit` (
  `pro_num` INT NOT NULL AUTO_INCREMENT,
  `pro_libelle` VARCHAR(50),
  `pro_description` VARCHAR(50),
  PRIMARY KEY (`pro_num`)
);

CREATE TABLE `est_compose` (
  `com_num` INT NOT NULL,
  `pro_num` INT NOT NULL,
  PRIMARY KEY (`com_num`, `pro_num`),
  FOREIGN KEY (`com_num`) REFERENCES `Commande`(`com_num`),
  FOREIGN KEY (`pro_num`) REFERENCES `Produit`(`pro_num`)
);

-- Creates an index that make SELECT statements faster
-- However INSERT and UPDATE are slower since the db needs to update the index as well
CREATE INDEX `nom_idx` 
ON `Client`(`cli_nom`);