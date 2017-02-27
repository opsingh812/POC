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
-- Table structure for table `oab_store`
--

DROP TABLE IF EXISTS `oab_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oab_store` (
  `store_id` int(11) DEFAULT NULL,
  `store_pin` varchar(10) DEFAULT NULL,
  `store_name` varchar(30) DEFAULT NULL,
  `store_address1` varchar(100) DEFAULT NULL,
  `store_address2` varchar(100) DEFAULT NULL,
  `store_phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oab_store`
--

LOCK TABLES `oab_store` WRITE;
/*!40000 ALTER TABLE `oab_store` DISABLE KEYS */;
INSERT INTO `oab_store` (`store_id`, `store_pin`, `store_name`, `store_address1`, `store_address2`, `store_phone`) VALUES (111,'411057','ABC Retail Shop','S.No. 188, R.K. Life Space Building','Shop No.5, 1st Floor,Wakad,Pune,Maharashtra 411057','9632587410'),(222,'411057','ABC Mini Store','Mankar Chowk Rd, Vishnu Dev Nagar,','Wakad, Pimpri-Chinchwad, Maharashtra 411057','9874563210'),(333,'411057','ABC Express Store','Store	Shop no.1, Mhatoba Complex, Hinjawadi Rd,','Hinjawadi, Pimpri-Chinchwad, Maharashtra 411057','9514786320');
/*!40000 ALTER TABLE `oab_store` ENABLE KEYS */;
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
