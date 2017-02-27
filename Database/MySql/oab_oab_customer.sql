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
-- Table structure for table `oab_customer`
--

DROP TABLE IF EXISTS `oab_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oab_customer` (
  `CUST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUST_FNAME` varchar(15) DEFAULT NULL,
  `CUST_LNAME` varchar(15) DEFAULT NULL,
  `CUST_PHONE` varchar(15) DEFAULT NULL,
  `CUST_EMAIL` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CUST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oab_customer`
--

LOCK TABLES `oab_customer` WRITE;
/*!40000 ALTER TABLE `oab_customer` DISABLE KEYS */;
INSERT INTO `oab_customer` (`CUST_ID`, `CUST_FNAME`, `CUST_LNAME`, `CUST_PHONE`, `CUST_EMAIL`) VALUES (1,'Shikhar','Dhawan','1111111111','shikhar@abc.com'),(2,'Rohit','Sharma','2222222222','rohit@abc.com'),(3,'Yuvraj','Singh','3333333333','yuvraj@abc.com'),(4,'Virat','Kohli','4444444444','virat@abc.com'),(5,'TEST','TEST','TEST','TEST'),(6,'Omendra','Singh','2345678999','opsingh812@gmail.com'),(7,'Omi','Singh','9646204098','os@abc.com'),(8,'Venkata','Subba','8965741230','venkat@abc.com'),(9,'Shrikant','Savalkar','9865471230','shrikant@abc.com'),(10,'Ruchi ','Dhore','9657870797','ruchi@abc.com'),(11,'Trisha','Das','7507210633','trisha@abc.com');
/*!40000 ALTER TABLE `oab_customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-27 18:59:23
