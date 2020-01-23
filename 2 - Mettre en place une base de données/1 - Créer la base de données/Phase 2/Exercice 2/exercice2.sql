-- Drops the database Exercise2 only if it already exists
DROP DATABASE IF EXISTS `Exercise2`;
-- Creates the database 
CREATE DATABASE `Exercise2`;
-- Makes Exercise1 the currently used database
USE `Exercise2`;

CREATE TABLE `Client` (
  `client_num` INT NOT NULL,
  `client_adresse` VARCHAR(100),
  `client_nom` VARCHAR(50),
  `client_prenom` VARCHAR(30),
  PRIMARY KEY (`client_num`)
);


CREATE TABLE `Station` (
  `station_num` INT NOT NULL,
  `station_nom` VARCHAR(60),
  PRIMARY KEY (`station_num`)
);


CREATE TABLE `Hotel` (
  `hotel_num` INT NOT NULL,
  `hotel_adresse` VARCHAR(100),
  `hotel_capacite` SMALLINT,
  `hotel_categorie` TINYINT,
  `hotel_nom` VARCHAR(60),
  `station_num` INT NOT NULL,
  PRIMARY KEY (`hotel_num`),
  FOREIGN KEY (`station_num`) REFERENCES `Station`(`station_num`)
);


CREATE TABLE `Chambre` (
  `chambre_num` INT NOT NULL,
  `chambre_capacite` TINYINT,
  `chambre_type` TINYINT,
  `degre_confort` TINYINT,
  `exposition` TINYINT,
  `hotel_num` INT NOT NULL,
  PRIMARY KEY (`chambre_num`),
  FOREIGN KEY (`hotel_num`) REFERENCES `Hotel`(`hotel_num`)
);


CREATE TABLE `Reservation` (
  `chambre_num` INT NOT NULL,
  `client_num` INT NOT NULL,
  `date_debut` DATE,
  `date_fin` DATE,
  `date_reservation` TIMESTAMP,
  `montant_arrhes` DECIMAL(5,2),
  `prix_total` DECIMAL(5,2),
  FOREIGN KEY (`chambre_num`) REFERENCES `Chambre`(`chambre_num`),
  FOREIGN KEY (`client_num`) REFERENCES `Client`(`client_num`)
);
