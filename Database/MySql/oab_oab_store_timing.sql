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
-- Table structure for table `oab_store_timing`
--

DROP TABLE IF EXISTS `oab_store_timing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oab_store_timing` (
  `store_id` varchar(10) DEFAULT NULL,
  `store_DAY` varchar(10) DEFAULT NULL,
  `store_date` varchar(12) DEFAULT NULL,
  `morning_time_start` time DEFAULT NULL,
  `morning_time_end` time DEFAULT NULL,
  `afternoon_time_start` time DEFAULT NULL,
  `afternoon_time_end` time DEFAULT NULL,
  `evening_time_start` time DEFAULT NULL,
  `evening_time_end` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oab_store_timing`
--

LOCK TABLES `oab_store_timing` WRITE;
/*!40000 ALTER TABLE `oab_store_timing` DISABLE KEYS */;
INSERT INTO `oab_store_timing` (`store_id`, `store_DAY`, `store_date`, `morning_time_start`, `morning_time_end`, `afternoon_time_start`, `afternoon_time_end`, `evening_time_start`, `evening_time_end`) VALUES ('111','MONDAY','2017-01-23','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('111','TUESDAY','2017-01-24','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('111','WEDNESDAY','2017-01-25','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('111','THURSDAY','2017-01-26','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('111','FRIDAY','2017-01-27','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('111','SATURDAY','2017-01-28','11:00:00','13:00:00','14:00:00','16:00:00','00:00:00','00:00:00'),('111','SUNDAY','2017-01-29','09:00:00','13:00:00','14:00:00','16:00:00','00:00:00','00:00:00'),('222','MONDAY','2017-01-23','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('222','TUESDAY','2017-01-24','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('222','WEDNESDAY','2017-01-25','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('222','THURSDAY','2017-01-26','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('222','FRIDAY','2017-01-27','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('222','SATURDAY','2017-01-28','11:00:00','13:00:00','14:00:00','16:00:00','00:00:00','00:00:00'),('222','SUNDAY','2017-01-29','09:00:00','13:00:00','14:00:00','16:00:00','00:00:00','00:00:00'),('333','MONDAY','2017-01-23','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('333','TUESDAY','2017-01-24','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('333','WEDNESDAY','2017-01-25','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('333','THURSDAY','2017-01-26','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('333','FRIDAY','2017-01-27','09:00:00','11:00:00','12:00:00','14:00:00','15:00:00','17:00:00'),('333','SATURDAY','2017-01-28','11:00:00','13:00:00','14:00:00','16:00:00','00:00:00','00:00:00'),('333','SUNDAY','2017-01-29','09:00:00','13:00:00','14:00:00','16:00:00','00:00:00','00:00:00');
/*!40000 ALTER TABLE `oab_store_timing` ENABLE KEYS */;
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
