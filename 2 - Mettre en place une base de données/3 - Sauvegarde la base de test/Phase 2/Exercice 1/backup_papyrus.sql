-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: papyrus
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `papyrus`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `papyrus` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `papyrus`;

--
-- Table structure for table `entcom`
--

DROP TABLE IF EXISTS `entcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entcom` (
  `NUMCOM` int(11) NOT NULL AUTO_INCREMENT,
  `OBSCOM` varchar(50) DEFAULT NULL,
  `DATCOM` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NUMFOU` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`NUMCOM`),
  KEY `NUMFOU` (`NUMFOU`),
  CONSTRAINT `entcom_ibfk_1` FOREIGN KEY (`NUMFOU`) REFERENCES `fournis` (`NUMFOU`)
) ENGINE=InnoDB AUTO_INCREMENT=70630 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entcom`
--

LOCK TABLES `entcom` WRITE;
/*!40000 ALTER TABLE `entcom` DISABLE KEYS */;
INSERT INTO `entcom` VALUES (70010,NULL,'2007-02-10 00:00:00',120),(70011,'Commande urgente','2007-03-01 00:00:00',540),(70020,NULL,'2007-04-25 00:00:00',9180),(70025,'Commande urgente','2007-04-30 00:00:00',9150),(70210,'Commande cadencée','2007-05-05 00:00:00',120),(70250,'Commande cadencée','2007-10-02 00:00:00',8700),(70300,NULL,'2007-06-06 00:00:00',9120),(70620,NULL,'2007-10-02 00:00:00',540),(70625,NULL,'2007-10-09 00:00:00',120),(70629,NULL,'2007-10-12 00:00:00',9180);
/*!40000 ALTER TABLE `entcom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournis`
--

DROP TABLE IF EXISTS `fournis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournis` (
  `NUMFOU` smallint(6) NOT NULL,
  `NOMFOU` varchar(25) NOT NULL,
  `RUEFOU` varchar(50) NOT NULL,
  `POSFOU` char(5) NOT NULL,
  `VILFOU` varchar(30) NOT NULL,
  `CONFOU` varchar(15) NOT NULL,
  `SATISF` tinyint(10) DEFAULT NULL,
  PRIMARY KEY (`NUMFOU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournis`
--

LOCK TABLES `fournis` WRITE;
/*!40000 ALTER TABLE `fournis` DISABLE KEYS */;
INSERT INTO `fournis` VALUES (120,'Georges','20 rue du papier','92200','Papercity','GROBRIGAN',8),(540,'Nestor','53 rue laisse flotter les rubans','78250','Bugbugville','ECLIPSE',7),(8700,'Lison','120 rue des plantes','75014','Paris','MEDICIS',NULL),(9120,'Hercule','11 rue des sports','85100','La Roche sur Yon','DISCOBOL',8),(9150,'Pollux','26 avenue des locomotives','59987','Coroncountry','DEPANPAP',5),(9180,'Track','68 boulevard des octets','04044','Dumpville','HURRYTAPE',NULL);
/*!40000 ALTER TABLE `fournis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligcom`
--

DROP TABLE IF EXISTS `ligcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ligcom` (
  `NUMLIG` tinyint(4) NOT NULL,
  `QTECDE` int(11) NOT NULL,
  `PRIUNI` decimal(9,2) NOT NULL,
  `QTELIV` int(11) DEFAULT NULL,
  `DERLIV` datetime NOT NULL,
  `NUMCOM` int(11) NOT NULL,
  `CODART` char(4) NOT NULL,
  PRIMARY KEY (`NUMCOM`,`NUMLIG`),
  KEY `CODART` (`CODART`),
  CONSTRAINT `ligcom_ibfk_1` FOREIGN KEY (`NUMCOM`) REFERENCES `entcom` (`NUMCOM`),
  CONSTRAINT `ligcom_ibfk_2` FOREIGN KEY (`CODART`) REFERENCES `produit` (`CODART`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligcom`
--

LOCK TABLES `ligcom` WRITE;
/*!40000 ALTER TABLE `ligcom` DISABLE KEYS */;
INSERT INTO `ligcom` VALUES (1,3000,470.00,3000,'2007-03-15 00:00:00',70010,'I100'),(2,2000,485.00,2000,'2007-07-05 00:00:00',70010,'I105'),(3,1000,680.00,1000,'2007-08-20 00:00:00',70010,'I108'),(4,200,40.00,250,'2007-02-20 00:00:00',70010,'D035'),(5,6000,3500.00,6000,'2007-03-31 00:00:00',70010,'P220'),(6,6000,2000.00,2000,'2007-03-31 00:00:00',70010,'P240'),(7,10000,3500.00,10000,'2007-08-31 00:00:00',70010,'P220'),(1,1000,600.00,1000,'2007-05-16 00:00:00',70011,'I105'),(1,200,140.00,NULL,'2007-12-31 00:00:00',70020,'B001'),(2,200,140.00,NULL,'2007-12-31 00:00:00',70020,'B002'),(1,1000,590.00,1000,'2007-05-15 00:00:00',70025,'I100'),(2,500,590.00,500,'2007-05-15 00:00:00',70025,'I105'),(1,1000,470.00,1000,'2007-07-15 00:00:00',70210,'I100'),(1,15000,4900.00,12000,'2007-12-15 00:00:00',70250,'P230'),(2,10000,3350.00,10000,'2007-11-10 00:00:00',70250,'P220'),(1,50,790.00,50,'2007-10-31 00:00:00',70300,'I110'),(1,200,600.00,200,'2007-11-01 00:00:00',70620,'I105'),(1,1000,470.00,1000,'2007-10-15 00:00:00',70625,'I100'),(2,10000,3500.00,10000,'2007-10-31 00:00:00',70625,'P220'),(1,200,140.00,NULL,'2007-12-31 00:00:00',70629,'B001'),(2,200,140.00,NULL,'2007-12-31 00:00:00',70629,'B002');
/*!40000 ALTER TABLE `ligcom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `CODART` char(4) NOT NULL,
  `LIBART` varchar(30) NOT NULL,
  `STKALE` int(11) NOT NULL,
  `STKPHY` int(11) NOT NULL,
  `QTEANN` int(11) NOT NULL,
  `UNIMES` char(5) NOT NULL,
  PRIMARY KEY (`CODART`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES ('B001','Bande magnétique 1200',20,87,240,'unité'),('B002','Bande magnétique 6250',20,12,410,'unite'),('D035','CD R slim 80 mm',40,42,150,'B010'),('D050','CD R-W 80mm',50,4,0,'B010'),('I100','Papier 1 ex continu',100,557,3500,'B1000'),('I105','Papier 2 ex continu',75,5,2300,'B1000'),('I108','Papier 3 ex continu',200,557,3500,'B500'),('I110','Papier 4 ex continu',10,12,63,'B400'),('P220','Pré-imprimé commande',500,2500,24500,'B500'),('P230','Pré-imprimé facture',500,250,12500,'B500'),('P240','Pré-imprimé bulletin paie',500,3000,6250,'B500'),('P250','Pré-imprimé bon livraison',500,2500,24500,'B500'),('P270','Pré-imprimé bon fabrication',500,2500,24500,'B500'),('R080','ruban Epson 850',10,2,120,'unite'),('R132','ruban impl 1200 lignes',25,200,182,'unite');
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vente`
--

DROP TABLE IF EXISTS `vente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vente` (
  `DELLIV` smallint(6) NOT NULL,
  `QTE1` int(11) NOT NULL,
  `QTE2` int(11) DEFAULT NULL,
  `QTE3` int(11) DEFAULT NULL,
  `PRIX1` decimal(9,2) NOT NULL,
  `PRIX2` decimal(9,2) DEFAULT NULL,
  `PRIX3` decimal(9,2) DEFAULT NULL,
  `NUMFOU` smallint(6) NOT NULL,
  `CODART` char(4) NOT NULL,
  KEY `NUMFOU` (`NUMFOU`),
  KEY `CODART` (`CODART`),
  CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`NUMFOU`) REFERENCES `fournis` (`NUMFOU`),
  CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`CODART`) REFERENCES `produit` (`CODART`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vente`
--

LOCK TABLES `vente` WRITE;
/*!40000 ALTER TABLE `vente` DISABLE KEYS */;
INSERT INTO `vente` VALUES (90,0,50,120,700.00,600.00,500.00,120,'I100'),(70,0,60,100,710.00,630.00,600.00,540,'I100'),(60,0,70,90,800.00,600.00,500.00,9120,'I100'),(90,0,90,200,650.00,600.00,590.00,9150,'I100'),(30,0,50,100,720.00,670.00,490.00,9180,'I100'),(90,10,50,120,705.00,630.00,500.00,120,'I105'),(70,0,60,100,810.00,645.00,600.00,540,'I105'),(60,0,70,90,920.00,800.00,700.00,9120,'I105'),(90,0,90,200,685.00,600.00,590.00,9150,'I105'),(30,0,50,100,720.00,670.00,510.00,8700,'I105'),(90,5,30,100,795.00,720.00,680.00,120,'I108'),(60,0,70,100,920.00,820.00,780.00,9120,'I108'),(90,0,70,90,9000.00,870.00,835.00,9180,'I110'),(60,0,70,90,950.00,850.00,790.00,9120,'I110'),(0,0,NULL,NULL,40.00,NULL,NULL,120,'D035'),(5,0,100,NULL,40.00,30.00,NULL,9120,'D035'),(8,0,NULL,NULL,37.00,NULL,NULL,9120,'I105'),(0,0,NULL,NULL,40.00,NULL,NULL,120,'D035'),(5,0,100,5,40.00,30.00,0.00,9120,'D035'),(8,0,NULL,NULL,37.00,NULL,NULL,9120,'I105'),(15,0,100,NULL,3700.00,3500.00,NULL,120,'P220'),(30,0,100,NULL,5200.00,5000.00,NULL,120,'P230'),(15,0,100,NULL,2200.00,2000.00,NULL,120,'P240'),(30,0,100,500,1500.00,1400.00,1200.00,9120,'P250'),(20,50,100,NULL,3500.00,3350.00,NULL,8700,'P220'),(60,0,50,NULL,5000.00,4900.00,NULL,8700,'P230'),(10,0,100,NULL,120.00,100.00,NULL,9120,'R080'),(5,0,NULL,NULL,275.00,NULL,NULL,9120,'R132'),(15,0,50,100,150.00,145.00,140.00,8700,'B001'),(15,0,50,100,210.00,200.00,185.00,8700,'B002');
/*!40000 ALTER TABLE `vente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-23  9:45:37
