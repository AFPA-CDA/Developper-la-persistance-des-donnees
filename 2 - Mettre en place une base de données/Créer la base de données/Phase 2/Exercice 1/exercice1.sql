-- Drops the database Exercise1 only if it already exists
DROP DATABASE IF EXISTS `Exercise1`;
-- Creates the database 
CREATE DATABASE `Exercise1`;
-- Makes Exercise1 the currently used database
USE `Exercise1`;

CREATE TABLE `Personne` (
  `per_num` INT NOT NULL,
  `per_nom` VARCHAR(50),
  `per_prenom` VARCHAR(30),
  `per_adresse` VARCHAR(100),
  `per_ville` VARCHAR(80),
  PRIMARY KEY (`per_num`)
);


CREATE TABLE `Groupe` (
  `gro_num` INT NOT NULL,
  `gro_libelle` VARCHAR(50),
  PRIMARY KEY (`gro_num`)
);


CREATE TABLE `Appartient` (
  `per_num` INT NOT NULL,
  `gro_num` INT NOT NULL,
  FOREIGN KEY (`per_num`) REFERENCES `Personne`(`per_num`),
  FOREIGN KEY (`gro_num`) REFERENCES `Groupe`(`gro_num`)
);