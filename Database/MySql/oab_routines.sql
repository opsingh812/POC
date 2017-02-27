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
-- Dumping routines for database 'oab'
--
/*!50003 DROP PROCEDURE IF EXISTS `getCustomerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getCustomerId`(
IN P_FNAME VARCHAR(20),
IN P_LNAME VARCHAR(20),
IN P_PHONE VARCHAR(15),
IN P_EMAIL VARCHAR(30)
)
BEGIN
	DECLARE V_CUSTID INT DEFAULT 0;
    SELECT CUST_ID INTO V_CUSTID FROM OAB_CUSTOMER WHERE CUST_EMAIL=P_EMAIL OR CUST_PHONE=P_PHONE;
	SELECT V_CUSTID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SAVEAPPOINTMENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SAVEAPPOINTMENT`(
IN P_STOREID INT,
IN P_APPTIME varchar(20),
IN P_APPDATE VARCHAR(20),
IN P_FNAME VARCHAR(20),
IN P_LNAME VARCHAR(20),
IN P_PHONE VARCHAR(15),
IN P_EMAIL VARCHAR(30),
IN P_TYPE VARCHAR(30),
IN P_REASON VARCHAR(30)
)
BEGIN
	DECLARE V_CUSTID INT DEFAULT 0;
    SELECT CUST_ID INTO V_CUSTID FROM OAB_CUSTOMER WHERE CUST_EMAIL=P_EMAIL AND CUST_PHONE=P_PHONE;
	
    if V_CUSTID = 0 then
		insert INTO OAB_CUSTOMER(CUST_FNAME,CUST_LNAME,CUST_PHONE,CUST_EMAIL) VALUES(P_FNAME,P_LNAME,P_PHONE,P_EMAIL);
        SELECT CUST_ID INTO V_CUSTID FROM OAB_CUSTOMER WHERE CUST_EMAIL=P_EMAIL AND CUST_PHONE=P_PHONE;
		insert into OAB_APPOINTMENT_detail(cust_id,store_id,appointment_time,appointment_date,cust_fname,cust_lname,cust_phone,cust_email,cust_type,cust_reason,APP_STATUS) values(V_CUSTID,P_STOREID,P_APPTIME,P_APPDATE,P_FNAME,P_LNAME,P_PHONE,P_EMAIL,P_TYPE,P_REASON,'ACTIVE'); 
    ELSEIF V_CUSTID > 0 THEN
		insert into OAB_APPOINTMENT_detail(cust_id,store_id,appointment_time,appointment_date,cust_fname,cust_lname,cust_phone,cust_email,cust_type,cust_reason,APP_STATUS) values(V_CUSTID,P_STOREID,P_APPTIME,P_APPDATE,P_FNAME,P_LNAME,P_PHONE,P_EMAIL,P_TYPE,P_REASON,'ACTIVE'); 
    END IF;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-27 18:59:23
