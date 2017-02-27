CREATE DATABASE  IF NOT EXISTS `oab` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `oab`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 10.10.78.150    Database: oab
-- ------------------------------------------------------
-- Server version	5.1.73-community

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
-- Table structure for table `oab_rep`
--

DROP TABLE IF EXISTS `oab_rep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oab_rep` (
  `rep_id` varchar(10) DEFAULT NULL,
  `store_id` varchar(20) DEFAULT NULL,
  `rep_fname` varchar(50) DEFAULT NULL,
  `rep_lname` varchar(50) DEFAULT NULL,
  `rep_phone` varchar(20) DEFAULT NULL,
  `rep_email` varchar(30) DEFAULT NULL,
  `rep_password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oab_rep`
--

LOCK TABLES `oab_rep` WRITE;
/*!40000 ALTER TABLE `oab_rep` DISABLE KEYS */;
INSERT INTO `oab_rep` (`rep_id`, `store_id`, `rep_fname`, `rep_lname`, `rep_phone`, `rep_email`, `rep_password`) VALUES ('ABC111','111','Kevin','Peterson','5874693214','kevin@abc.com','abc'),('ABC112','111','Andrew','Flintoff','1236547890','andrew@abc.com','abc'),('ABC113','222','Hashim','Amla','9654782136','hashim@abc.com','abc'),('ABC114','222','Dale','Steyn','8796541230','dale@abc.com','abc'),('ABC115','333','Adam','Gilchrist','9865741230','adam@abc.com','abc');
/*!40000 ALTER TABLE `oab_rep` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-27 18:59:22
