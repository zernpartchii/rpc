CREATE DATABASE  IF NOT EXISTS `rpc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rpc`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: rpc
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branch` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Bansalan'),(2,'Davao'),(3,'Digos'),(4,'Panabo'),(5,'Penaplato'),(6,'Tagum');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Zone_id` int NOT NULL,
  `Initials` varchar(20) NOT NULL,
  `Course_Program` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (37,1,'BSA','BS in Accountancy'),(38,1,'BSIA','BS in Internal Auditing'),(39,1,'BSAT','BS in Accounting Technology'),(40,1,'BSBAMFM','BS in Business Administration Major in Financial Management'),(41,1,'BSBAMMM','BS in Business Administration Major in Marketing Management'),(42,1,'BSBAMHR','BS in Business Administration Major in Human Resource'),(43,1,'BSHM','BS in Hospitality Management'),(44,1,'BSTM','BS in Tourism Management'),(45,2,'BSC','BS in Criminology'),(46,2,'BSCS','BS in Computer Science'),(47,2,'BSIT','BS in Information Technology'),(48,2,'BSEE','BS in Electrical Engineering'),(49,2,'BSECE','BS in Electronics and Communications Engineering'),(50,2,'BSCE','BS in Computer Engineering'),(51,3,'BAE','Bachelor of Arts in English'),(52,3,'BSP','BS in Psychology'),(53,3,'BEE','Bachelor of Elementary Education'),(54,3,'BSEME','Bachelor of Secondary Education Major in English'),(55,3,'BSEMM','Bachelor of Secondary Education Major in Mathematics'),(56,3,'BSEMSS','Bachelor of Secondary Education Major in Social Studies'),(57,3,'BSEMB','Bachelor of Secondary Education Major in Biology'),(58,3,'BSEMF','Bachelor of Secondary Education Major in Filipino'),(59,3,'BPE','Bachelor in Physical Education');
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proponents`
--

DROP TABLE IF EXISTS `proponents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proponents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `research_id` int NOT NULL,
  `Proponents` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_research_id` (`research_id`),
  CONSTRAINT `fk_research_id` FOREIGN KEY (`research_id`) REFERENCES `research_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proponents`
--

LOCK TABLES `proponents` WRITE;
/*!40000 ALTER TABLE `proponents` DISABLE KEYS */;
INSERT INTO `proponents` VALUES (283,95,'Geszer Gumapac'),(284,95,'Marife Siaton'),(285,95,''),(286,96,'Michael Llano '),(287,96,'Alex Aniñon'),(288,96,''),(289,97,'KAYE ARBIOL '),(290,97,'APRIL ROSE NITUDA'),(291,97,''),(292,98,'KEISHA PASINABO '),(293,98,'JohnLloyd ILAGAN'),(294,98,''),(295,99,'Aaron John Emuy '),(296,99,'Rodel Powao'),(297,99,''),(298,100,'JUANE CANOY '),(299,100,'FRITZ JANE POSTRERO'),(300,100,''),(313,105,'Lord Grimn'),(314,105,'Dazzling Rain'),(315,105,'');
/*!40000 ALTER TABLE `proponents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_information`
--

DROP TABLE IF EXISTS `research_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Group_Number` varchar(20) NOT NULL,
  `Zone` varchar(25) NOT NULL,
  `Program` varchar(200) NOT NULL,
  `Title` varchar(250) NOT NULL,
  `Adviser` varchar(50) NOT NULL,
  `Stat_DA` varchar(25) NOT NULL,
  `S_Y` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_information`
--

LOCK TABLES `research_information` WRITE;
/*!40000 ALTER TABLE `research_information` DISABLE KEYS */;
INSERT INTO `research_information` VALUES (95,'Group 1','2','BS in Information Technology','Research and Publication Center','John Jefferson Dela Cruz','Irish Mendoza','2021-2022'),(96,'Group 2','2','BS in Information Technology','The best practices for dealing with tight project deadlines.','Irish Mendoza','John Jefferson Dela Cruz','2021-2022'),(97,'Group 9','3','Bachelor of Arts in English','Why time management is essential for  goal setting','John Jefferson Dela Cruz','Ben Mahinay','2023-2024'),(98,'Group 3','1','BS in Accountancy','What is a borderline personality disorder? What leads to depression in a person?','John Jefferson Dela Cruz','Ben Mahinay','2020-2021'),(99,'Group 4','3','Bachelor of Arts in English','The best practice for quitting alcohol and cigarettes.','Rosfield Atiagan','John Jefferson Dela Cruz','2024-2025'),(100,'Group 5','2','BS in Information Technology','Criminals: Are there more men or women? Politics and Prisoners: Should prisoners have the right to vote? Victimless Crime: Does it exist? Sexual Harassment: Are women the only victims?','Ben Mahinay','Irish Mendoza','2021-2022'),(105,'69','2','BS in Information Technol','The Beginning After the End','John Mark','John Adam Presper Eckert','2021-2022');
/*!40000 ALTER TABLE `research_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_information`
--

DROP TABLE IF EXISTS `users_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL,
  `zone` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_information`
--

LOCK TABLES `users_information` WRITE;
/*!40000 ALTER TABLE `users_information` DISABLE KEYS */;
INSERT INTO `users_information` VALUES (82,'User','Admin','admin@gmail.com','$2y$10$XEH/mH5EMhZbsPHKOrzliunLs0erUYBO4LQEYkbh3wmPrDskIRE0y','','');
/*!40000 ALTER TABLE `users_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Zone` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (1,'Zone 1 - DAE, DBAE, HM, TM'),(2,'Zone 2 - DCJE, CS, IT, DEE'),(3,'Zone 3 - DASE, DTE');
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'rpc'
--

--
-- Dumping routines for database 'rpc'
--
/*!50003 DROP PROCEDURE IF EXISTS `deleteProgram_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteProgram_sp`(IN `p_Program` INT)
BEGIN
DELETE FROM `program` WHERE id = p_Program;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteZone_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteZone_sp`(IN `p_Zone` INT)
BEGIN
	DELETE FROM `zone` WHERE id = p_Zone;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_research_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_research_sp`(IN `p_id` INT(11) UNSIGNED)
DELETE FROM research_information WHERE id = p_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_proponents_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_proponents_sp`(IN `p_Proponents` VARCHAR(100))
BEGIN
	DECLARE research_id INT;
    SET research_id = (SELECT MAX(id) FROM `research_information`);
    
    INSERT INTO proponents(research_id, proponents) 
    VALUES(research_id, p_Proponents);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_research_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_research_sp`(IN `p_group_number` VARCHAR(25), IN `p_zone` VARCHAR(25), IN `p_program` VARCHAR(25), IN `p_title` VARCHAR(250), IN `p_adviser` VARCHAR(50), IN `p_stat` VARCHAR(50), IN `p_sy` VARCHAR(45))
BEGIN
INSERT INTO research_information(

group_number, zone,
program, title,
adviser, stat_da, S_Y)

VALUES(

p_group_number, p_zone,
p_program, p_title,
p_adviser, p_stat, p_sy
    
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_users_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_users_sp`(IN `p_firstname` VARCHAR(50), IN `p_lastname` VARCHAR(50), IN `p_email` VARCHAR(100), IN `p_users_password` VARCHAR(100), IN `p_type` VARCHAR(30), IN `p_zone` VARCHAR(45))
BEGIN
INSERT INTO users_information(first_name,last_name,email,user_password, type, zone)
VALUES(p_firstname,p_lastname,p_email,p_users_password, p_type, p_zone);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login_user_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login_user_sp`(INOUT `p_email` INT(100))
BEGIN
SELECT id, email, user_password FROM `users_information` WHERE email = p_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newPassword_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newPassword_sp`(IN `p_newPassword` VARCHAR(100), IN `p_id` INT)
BEGIN
UPDATE users_information SET user_password = p_newPassword WHERE id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_research_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_research_sp`()
BEGIN
SELECT * FROM `research_information` ORDER BY id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_proponents_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_proponents_sp`(IN `p_proponent` VARCHAR(100), IN `p_id` INT(11))
BEGIN
	UPDATE proponents SET
    proponents = p_proponent
    WHERE id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_research_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_research_sp`(IN `p_group_number` VARCHAR(20), IN `p_zone` VARCHAR(25), IN `p_program` VARCHAR(50), IN `p_title` VARCHAR(250), IN `p_adviser` VARCHAR(50), IN `p_stat` VARCHAR(25), IN `p_sy` VARCHAR(45), IN `p_id` INT(11) UNSIGNED)
UPDATE research_information SET

group_number = p_group_number, 
zone = p_zone,
program = p_program, 
title = p_title,
adviser = p_adviser,
stat_da = p_stat,
S_Y = p_sy

WHERE id = p_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_users_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_users_sp`(IN `p_firstname` VARCHAR(50), IN `p_lastname` VARCHAR(50), IN `p_email` VARCHAR(100), IN `p_userpassword` VARCHAR(100), IN `p_users_id` INT(11) UNSIGNED)
UPDATE  users_information SET 
first_name = p_firstname,
last_name = p_lastname,
email = p_email,
user_password = p_userpassword
WHERE id = p_users_id ;;
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

-- Dump completed on 2025-02-26 14:16:03
