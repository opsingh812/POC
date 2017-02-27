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
-- Table structure for table `oab_appointment_detail`
--

DROP TABLE IF EXISTS `oab_appointment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oab_appointment_detail` (
  `cust_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `appointment_id` int(10) NOT NULL AUTO_INCREMENT,
  `appointment_time` time DEFAULT NULL,
  `appointment_date` varchar(12) DEFAULT NULL,
  `cust_fname` varchar(20) DEFAULT NULL,
  `cust_lname` varchar(20) DEFAULT NULL,
  `cust_phone` varchar(15) DEFAULT NULL,
  `cust_email` varchar(30) DEFAULT NULL,
  `cust_type` varchar(25) DEFAULT NULL,
  `cust_reason` varchar(30) DEFAULT NULL,
  `APP_STATUS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oab_appointment_detail`
--

LOCK TABLES `oab_appointment_detail` WRITE;
/*!40000 ALTER TABLE `oab_appointment_detail` DISABLE KEYS */;
INSERT INTO `oab_appointment_detail` (`cust_id`, `store_id`, `appointment_id`, `appointment_time`, `appointment_date`, `cust_fname`, `cust_lname`, `cust_phone`, `cust_email`, `cust_type`, `cust_reason`, `APP_STATUS`) VALUES (4,111,2,'09:00:00','2017-01-23','TEST','TEST','4444444444','virat@abc.com','TEST','TEST','ACTIVE'),(6,222,3,'15:30:00','2017-01-26','Omendra','Singh','2345678999','opsingh812@gmail.com','Existing Customer','Pickup online order','ACTIVE'),(4,333,4,'13:00:00','2017-01-24','Virat','Kohli','4444444444','virat@abc.com','Existing Customer','Sign up for wireless service','ACTIVE'),(7,222,5,'16:00:00','2017-01-25','Omi','Singh','9646204098','os@abc.com','New Customer','Pickup online order','ACTIVE'),(8,333,6,'15:00:00','2017-01-28','Venkata','Subba','8965741230','venkat@abc.com','New Customer','Discuss my wireless bill','ACTIVE'),(9,111,7,'16:00:00','2017-01-24','Shrikant','Savalkar','9865471230','shrikant@abc.com','New Customer','Upgrade my wireless device','ACTIVE'),(10,111,8,'16:00:00','2017-01-27','Ruchi ','Dhore','9657870797','ruchi@abc.com','New Customer','Sign up for wireless service','ACTIVE'),(11,111,9,'15:30:00','2017-01-25','Trisha','Das','7507210633','trisha@abc.com','New Customer','Pickup online order','ACTIVE'),(7,111,10,'12:30:00','2017-01-26','Omi','Singh','9646204098','os@abc.com','Existing Customer','Pickup online order','ACTIVE'),(7,111,11,'13:00:00','2017-01-25','Omi','Singh','9646204098','os@abc.com','Existing Customer','Pickup online order','ACTIVE'),(7,111,12,'12:00:00','2017-01-27','Omi','Singh','9646204098','os@abc.com','Existing Customer','Quick Sale','ACTIVE'),(7,111,13,'10:00:00','2017-01-23','Omi','Singh','9646204098','os@abc.com','Existing Customer','Online Appointment','ACTIVE'),(7,111,14,'12:00:00','2017-01-26','Omi','Singh','9646204098','os@abc.com','Existing Customer','Discuss my wireless bill','ACTIVE');
/*!40000 ALTER TABLE `oab_appointment_detail` ENABLE KEYS */;
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
