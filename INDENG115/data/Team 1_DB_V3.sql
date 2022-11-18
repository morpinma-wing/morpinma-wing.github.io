CREATE DATABASE  IF NOT EXISTS `team1_thoms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `team1_thoms`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: team1_thoms
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `assists_with`
--

DROP TABLE IF EXISTS `assists_with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assists_with` (
  `Engineer_EmployeeID` int NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`Engineer_EmployeeID`,`CustomerID`),
  KEY `assists_with_ibfk_2_idx` (`CustomerID`),
  CONSTRAINT `assists_with_ibfk_1` FOREIGN KEY (`Engineer_EmployeeID`) REFERENCES `engineer` (`EmployeeID`),
  CONSTRAINT `assists_with_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assists_with`
--

LOCK TABLES `assists_with` WRITE;
/*!40000 ALTER TABLE `assists_with` DISABLE KEYS */;
/*!40000 ALTER TABLE `assists_with` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `BidID` int NOT NULL,
  `Associated_job` varchar(45) DEFAULT NULL,
  `Cost` float DEFAULT NULL,
  `Received_by_EmployeeID` int NOT NULL,
  PRIMARY KEY (`BidID`),
  UNIQUE KEY `BidID_UNIQUE` (`BidID`),
  KEY `bid_ibfk_1_idx` (`Received_by_EmployeeID`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`Received_by_EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `CompanyID` int NOT NULL,
  `Street_number` int DEFAULT NULL,
  `Street_name` varchar(45) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `Zipcode` int DEFAULT NULL,
  `Unit_number` int DEFAULT NULL,
  `Company_name` varchar(20) NOT NULL,
  `Manager_first` varchar(20) DEFAULT NULL,
  `Manager_MI` varchar(20) DEFAULT NULL,
  `Manager_last` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CompanyID`),
  UNIQUE KEY `CompanyID_UNIQUE` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,67275,'Todd Manor Mountain','RI',2846,0,'Trane','Joseph','H','Miller'),(2,7354,'Diaz Crest Brooks','VT',5133,0,'Mitsubishi','Rebecca',' ','Chapman'),(3,75061,'Justin Track Field','KY',40664,0,'Samsung','Aaron',' ','Moran'),(4,34332,'Castro Corner Fields','PA',15398,338,'GE','Jesus',' ','Rosales'),(5,5326,'Colleen Lane Village','NC',28512,0,'UPS','Tammy',' ','Wolf'),(6,3048,'Perry Hill Meadows','ME',4262,286,'FedEx','George',' ','Mcdonald'),(7,7166,'Tonya Ramp Lights','KY',40032,0,'DHL','John','F','Hernandez');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultation` (
  `ConsultationID` int NOT NULL,
  `Date_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`ConsultationID`),
  UNIQUE KEY `ConsultationID_UNIQUE` (`ConsultationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultation`
--

LOCK TABLES `consultation` WRITE;
/*!40000 ALTER TABLE `consultation` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contains` (
  `OrderID` int NOT NULL,
  `Item_ProductID` int NOT NULL,
  `Item_InventoryID` int NOT NULL,
  PRIMARY KEY (`OrderID`,`Item_ProductID`,`Item_InventoryID`),
  KEY `contains_ibfk_2_idx` (`Item_ProductID`,`Item_InventoryID`),
  CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`Item_ProductID`, `Item_InventoryID`) REFERENCES `inventory_item` (`ProductID`, `InventoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES (77,1,1),(98,1,5),(49,1,10),(11,1,12),(7,1,13),(93,1,19),(8,1,20),(71,1,20),(72,1,35),(63,1,37),(93,1,38),(40,1,39),(31,1,40),(41,1,47),(66,1,53),(99,1,53),(92,1,58),(14,1,59),(53,1,71),(28,1,76),(32,1,84),(43,1,88),(21,1,91),(62,1,93),(41,1,94),(1,1,96),(9,1,100),(42,1,100),(29,2,4),(17,2,13),(72,2,14),(36,2,15),(6,2,23),(50,2,24),(24,2,32),(16,2,35),(92,2,37),(24,2,38),(79,2,38),(88,2,39),(91,2,46),(98,2,47),(54,2,49),(61,2,51),(41,2,53),(42,2,54),(81,2,62),(26,2,65),(38,2,67),(40,2,70),(9,2,72),(47,2,72),(18,2,76),(70,2,76),(34,2,77),(38,2,92),(12,3,4),(56,3,5),(48,3,14),(75,3,18),(88,3,22),(76,3,24),(46,3,32),(82,3,32),(60,3,33),(32,3,43),(21,3,48),(77,3,48),(98,3,53),(23,3,56),(96,3,58),(49,3,63),(58,3,69),(50,3,81),(64,3,87),(65,3,88),(84,3,89),(51,3,94),(94,4,2),(95,4,9),(80,4,13),(4,4,19),(90,4,25),(51,4,27),(35,4,29),(92,4,32),(49,4,42),(27,4,47),(77,4,50),(35,4,51),(17,4,53),(5,4,55),(88,4,56),(48,4,59),(98,4,63),(60,4,64),(91,4,64),(22,4,65),(82,4,65),(7,4,67),(37,4,68),(79,4,68),(48,4,74),(28,4,75),(73,4,79),(20,4,86),(31,4,88),(92,4,89),(48,4,93),(29,5,2),(21,5,6),(84,5,6),(44,5,8),(53,5,14),(33,5,16),(46,5,18),(22,5,22),(68,5,26),(79,5,27),(15,5,31),(62,5,31),(49,5,34),(38,5,41),(29,5,43),(41,5,45),(59,5,45),(76,5,51),(23,5,52),(68,5,56),(70,5,56),(61,5,60),(6,5,69),(78,5,75),(47,5,82),(21,5,83),(70,5,91),(36,5,92),(48,5,94),(87,5,101),(81,5,104),(40,5,109),(20,5,110),(8,6,5),(15,6,6),(71,6,8),(15,6,9),(58,6,9),(46,6,11),(26,6,14),(100,6,16),(57,6,17),(69,6,27),(79,6,31),(51,6,36),(55,6,37),(39,6,39),(99,6,42),(3,6,44),(82,6,48),(39,6,51),(62,6,53),(5,6,82),(24,6,84),(91,6,89),(13,6,90),(39,6,97),(18,6,103),(61,6,104),(79,6,105),(53,7,5),(49,7,10),(70,7,12),(49,7,18),(87,7,20),(25,7,26),(83,7,31),(10,7,32),(69,7,46),(30,7,53),(13,7,55),(97,7,62),(63,7,63),(20,7,65),(5,7,71),(5,7,75),(87,7,80),(6,7,83),(1,7,84),(20,7,89),(99,7,91),(86,8,1),(33,8,6),(95,8,7),(24,8,22),(52,8,22),(99,8,26),(43,8,29),(59,8,41),(2,8,48),(25,8,48),(75,8,48),(7,8,53),(2,8,59),(28,8,63),(54,8,65),(69,8,69),(17,8,79),(36,8,80),(12,8,81),(26,8,96),(74,8,98),(81,9,1),(85,9,2),(94,9,8),(92,9,18),(37,9,23),(81,9,38),(6,9,39),(99,9,42),(6,9,43),(98,9,45),(49,9,50),(93,9,51),(78,9,57),(67,9,64),(80,9,67),(8,9,71),(19,9,74),(51,9,74),(21,9,77),(57,9,78),(10,9,80),(26,9,80),(2,9,82),(76,9,86),(62,9,89),(25,9,97),(94,10,5),(99,10,7),(34,10,20),(79,10,22),(21,10,25),(33,10,30),(44,10,31),(19,10,32),(89,10,32),(45,10,36),(49,10,36),(68,10,44),(55,10,47),(33,10,49),(86,10,50),(75,10,52),(74,10,65),(29,10,70),(32,10,72),(41,10,72),(19,10,79),(62,10,88);
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor`
--

DROP TABLE IF EXISTS `contractor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contractor` (
  `ContractorID` int NOT NULL,
  `First` varchar(20) DEFAULT NULL,
  `MI` varchar(2) DEFAULT NULL,
  `Last` varchar(20) DEFAULT NULL,
  `Phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ContractorID`),
  UNIQUE KEY `ContractorID_UNIQUE` (`ContractorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor`
--

LOCK TABLES `contractor` WRITE;
/*!40000 ALTER TABLE `contractor` DISABLE KEYS */;
/*!40000 ALTER TABLE `contractor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL,
  `Street_number` int DEFAULT NULL,
  `Street_name` varchar(45) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `Zipcode` int DEFAULT NULL,
  `Unit_number` int DEFAULT NULL,
  `First` varchar(20) DEFAULT NULL,
  `MI` varchar(2) DEFAULT NULL,
  `Last` varchar(20) DEFAULT NULL,
  `Customer_since_date` date DEFAULT NULL,
  `Industry` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `CustomerID_UNIQUE` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,6778,'Latasha Lock Valleys','IN',47295,0,'Shawn','S','Richard','1997-01-17','Healthcare'),(2,4869,'Richard Divide Motorway','NC',28269,775,'Michael',' ','Coleman','2004-02-22','Healthcare'),(3,0,'Butler Plains Oval','SC',29073,121,'Stephen','Y','Gonzalez','2005-05-05','Agriculture'),(4,78340,'Andrews Plaza Via','NE',68075,0,'Brenda',' ','Washington','2004-08-10','Healthcare'),(5,3456,'Thomas Villages Mall','AZ',85155,0,'Jeremy','V','Gallagher','2012-12-25','Recreation'),(6,8912,'John Spring Springs','AR',72560,0,'Jonathan',' ','Sexton','2014-12-27','Transportation'),(7,39476,'Sanchez Islands Stravenue','AZ',85194,0,'Rebecca',' ','Myers','2018-08-23','Agriculture'),(8,226,'Jason Ramp Ports','MN',55407,0,'Jeremiah',' ','Joseph','2012-07-30','Construction'),(9,79529,'David Grove Lodge','SD',57642,0,'Leah','V','White','2017-08-08','Transportation'),(10,68441,'Stuart Oval Vista','VA',24117,0,'Chelsea',' ','Miller','2011-02-08','Healthcare'),(11,4059,'Jackson Field Plaza','AL',35390,0,'Christopher','U','Smith','2019-10-19','Agriculture'),(12,782,'Brandon Ville Dam','IA',51753,0,'Kimberly','J','Hernandez','2007-02-07','Recreation'),(13,57570,'Todd Port Groves','NM',87425,0,'Stephanie',' ','Garcia','2008-10-09','Transportation'),(14,226,'Wesley Isle Cliffs','KY',42188,637,'Danny',' ','Gonzalez','2001-10-14','Transportation'),(15,243,'Gonzalez Alley Common','FL',34513,0,'John','V','Rodriguez','1994-11-22','Agriculture'),(16,6201,'Ross Ports Glens','MA',1407,751,'Gene','Y','Archer','2009-03-10','Construction'),(17,86262,'Pena Wells Corner','TN',37486,0,'Joseph',' ','Johnson','1999-04-07','Agriculture'),(18,96134,'Jessica Throughway Streets','NM',88295,0,'Craig','S','Wilson','1998-11-11','Healthcare'),(19,174,'Andrea Roads Shore','SC',29766,481,'Carolyn','M','Rodriguez','1995-12-21','Agriculture'),(20,3675,'Mason Field Hills','KS',66858,935,'Kyle',' ','Smith','1994-06-02','Recreation');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cut_sheet`
--

DROP TABLE IF EXISTS `cut_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cut_sheet` (
  `CutsheetID` int NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `ProductID` int NOT NULL,
  PRIMARY KEY (`CutsheetID`),
  UNIQUE KEY `Cutsheet_ID_UNIQUE` (`CutsheetID`),
  KEY `cutsheet_ibfk_1_idx` (`ProductID`),
  CONSTRAINT `cutsheet_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product_type` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cut_sheet`
--

LOCK TABLES `cut_sheet` WRITE;
/*!40000 ALTER TABLE `cut_sheet` DISABLE KEYS */;
INSERT INTO `cut_sheet` VALUES (1,'Stay cool and comfortable when the weather gets hot',1),(2,'Keep cozy with furnaces that use gas or oil to heat your home',2),(3,'Heat and cool your home with this versatile system powered by electricity',3),(4,'Connect to WiFi to manage your comfort preferences',4),(5,'Heat and cool your home with an energy-efficient, all-in-one solution',5),(6,'Heat or cool multiple rooms or your entire home without using ductwork',6),(7,'Explore an array of solutions designed to rid your home’s air of contaminants',7),(8,'Control your comfort from virtually anywhere',8),(9,'Enjoy durable comfort with a rust-resistant coil',9),(10,'Add or remove moisture from your indoor air to regulate your comfort',10);
/*!40000 ALTER TABLE `cut_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `DeliveryID` int NOT NULL,
  `Scheduled_delivery_Date_Time` datetime DEFAULT NULL,
  `Actual_delivery_Date_Time` datetime DEFAULT NULL,
  `Cost` float DEFAULT NULL,
  `Handled_by_CompanyID` int NOT NULL,
  `Delivered_to_SiteID` int NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  UNIQUE KEY `DeliveryID_UNIQUE` (`DeliveryID`),
  KEY `delivery_ibfk_1_idx` (`Handled_by_CompanyID`),
  KEY `delivery_ibfk_2_idx` (`Delivered_to_SiteID`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`Handled_by_CompanyID`) REFERENCES `logistics` (`CompanyID`),
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`Delivered_to_SiteID`) REFERENCES `site` (`SiteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'2022-01-23 02:23:34','2022-09-03 20:06:01',3841,5,10),(2,'2022-11-03 20:56:47','2022-11-09 00:28:50',4367,5,2),(3,'2022-10-27 23:52:59','2022-11-01 22:42:21',8957,7,12),(4,'2022-11-15 10:36:22','2022-11-17 14:47:02',6456,6,1),(5,'2022-03-31 12:20:51','2022-07-29 14:02:29',7438,6,13),(6,'2022-01-06 11:41:27','2022-10-14 04:25:45',6788,5,2),(7,'2022-10-20 19:35:44','2022-11-02 22:07:28',9541,7,13),(8,'2022-09-28 15:06:30','2022-10-27 10:58:29',3177,5,8),(9,'2022-07-05 01:18:59','2022-09-19 21:46:48',4499,5,4),(10,'2022-11-03 07:46:51','2022-11-14 04:07:14',9153,7,5),(11,'2022-08-29 22:44:20','2022-10-27 18:10:36',8288,5,8),(12,'2022-10-26 21:04:24','2022-11-05 10:56:20',1708,7,9),(13,'2022-08-05 18:58:16','2022-10-13 23:49:19',9532,5,18),(14,'2022-09-29 23:24:22','2022-11-03 22:55:54',8364,6,11),(15,'2022-11-13 03:00:34','2022-11-16 06:37:31',4092,5,18),(16,'2022-11-06 00:43:08','2022-11-14 03:14:29',2027,5,1),(17,'2022-09-03 21:10:01','2022-09-19 23:05:15',5029,6,1),(18,'2022-06-29 10:09:26','2022-07-27 06:17:55',3009,7,12),(19,'2022-10-21 22:37:15','2022-10-22 13:11:52',2488,7,12),(20,'2022-09-14 11:48:38','2022-10-30 07:17:52',7637,5,10),(21,'2022-11-17 03:56:53','2022-11-17 06:56:44',6702,6,7),(22,'2022-06-08 07:42:49','2022-08-12 03:46:40',1889,6,10),(23,'2022-09-28 14:33:17','2022-10-21 00:23:44',2196,6,10),(24,'2021-01-31 13:17:52','2022-08-26 13:11:29',4835,5,1),(25,'2022-09-27 15:19:59','2022-10-24 04:40:49',5149,5,19),(26,'2022-10-14 19:03:27','2022-11-09 06:10:45',9421,7,1),(27,'2022-10-19 19:30:45','2022-10-25 16:54:10',8185,7,20),(28,'2022-10-23 03:53:46','2022-11-07 01:30:04',2365,5,14),(29,'2021-10-13 07:16:22','2022-05-20 09:41:21',3203,6,10),(30,'2022-10-22 09:23:58','2022-11-10 10:16:00',738,6,18),(31,'2022-11-14 01:43:12','2022-11-16 08:07:31',3032,7,2),(32,'2022-11-01 14:45:36','2022-11-07 23:06:42',7679,5,3),(33,'2022-11-11 20:48:16','2022-11-12 16:35:47',7855,7,14),(34,'2022-10-05 09:24:03','2022-10-30 17:40:58',4359,5,3),(35,'2022-07-31 14:44:32','2022-08-08 09:05:17',4483,7,4),(36,'2022-08-29 05:48:45','2022-09-19 15:00:16',9323,5,5),(37,'2022-11-11 19:39:51','2022-11-16 01:45:02',3285,6,20),(38,'2022-11-16 07:00:05','2022-11-17 10:01:30',2348,7,19),(39,'2022-06-02 10:13:14','2022-07-02 16:18:50',2664,6,7),(40,'2022-11-09 17:21:34','2022-11-15 21:57:24',5695,7,6),(41,'2022-03-10 11:51:18','2022-09-30 16:19:18',6730,7,5),(42,'2022-09-08 20:07:12','2022-10-22 22:09:58',3627,6,3),(43,'2022-08-27 10:45:43','2022-10-15 15:21:48',3931,7,19),(44,'2022-01-11 02:43:02','2022-09-13 19:15:13',3786,6,12),(45,'2022-06-22 13:40:15','2022-08-09 22:45:17',3846,6,3),(46,'2022-09-25 06:00:23','2022-11-02 05:56:19',3983,5,20),(47,'2022-10-29 17:03:56','2022-10-30 00:28:30',7520,6,18),(48,'2021-04-05 16:54:27','2022-06-07 15:53:49',8721,5,18),(49,'2022-11-17 15:58:44','2022-11-17 16:15:13',7435,5,6),(50,'2021-11-27 02:09:57','2022-05-08 04:47:59',6277,6,16),(51,'2022-09-21 19:42:35','2022-10-23 09:42:58',7496,7,16),(52,'2022-05-21 00:06:16','2022-07-19 21:00:51',3529,7,4),(53,'2022-01-04 01:44:03','2022-08-11 16:18:49',866,5,4),(54,'2022-09-12 03:44:25','2022-11-06 01:34:07',9695,6,10),(55,'2022-08-28 21:38:03','2022-09-03 11:01:48',5632,7,3),(56,'2022-10-26 09:25:09','2022-11-10 12:54:35',7899,5,14),(57,'2022-10-13 03:03:07','2022-11-16 03:55:48',670,7,14),(58,'2022-08-10 04:43:55','2022-10-27 09:34:50',9023,7,9),(59,'2022-08-28 06:30:02','2022-09-14 17:51:57',5341,5,7),(60,'2022-10-28 17:22:11','2022-11-03 16:21:23',9752,7,18),(61,'2022-10-11 18:58:23','2022-10-12 21:28:46',1904,6,3),(62,'2022-11-10 05:04:06','2022-11-12 01:29:54',7581,7,15),(63,'2022-09-21 13:48:48','2022-11-02 15:30:59',2386,6,14),(64,'2021-07-14 15:59:08','2022-01-14 04:48:50',9904,5,3),(65,'2022-03-17 01:38:22','2022-06-11 02:51:35',8570,7,19),(66,'2022-01-13 15:45:13','2022-09-18 14:50:58',9809,7,13),(67,'2022-06-17 01:52:07','2022-09-18 22:26:06',2060,7,11),(68,'2021-06-07 09:52:14','2022-06-05 09:42:07',5921,7,4),(69,'2022-08-18 21:47:53','2022-10-25 09:11:47',2107,6,15),(70,'2022-09-16 14:05:13','2022-10-20 05:21:28',9759,5,15),(71,'2022-10-17 11:07:58','2022-10-27 09:15:23',3962,5,9),(72,'2022-09-23 23:47:14','2022-11-14 09:32:25',3508,5,11),(73,'2022-02-19 00:12:00','2022-10-30 12:08:02',4811,7,18),(74,'2022-09-12 05:36:43','2022-11-16 05:23:13',1340,5,15),(75,'2022-08-06 02:39:42','2022-09-04 04:31:12',2589,5,8);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL,
  `First` varchar(20) DEFAULT NULL,
  `MI` varchar(2) DEFAULT NULL,
  `Last` varchar(20) DEFAULT NULL,
  `Start_date` date DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `ContractorID_UNIQUE` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Alan',' ','Bush','2016-03-17'),(2,'Jonathon',' ','Romero','2002-07-25'),(3,'Jose','K','Petersen','2012-07-30'),(4,'Tonya','Q','Patterson','2011-03-15'),(5,'Edwin',' ','Stephens','2006-11-26'),(6,'Joseph','P','Peters','2005-01-07'),(7,'Desiree',' ','Henderson','2005-12-25'),(8,'Faith',' ','Shaw','2015-07-26'),(9,'Amber','A','Summers','2003-06-20'),(10,'Dana',' ','Avery','2006-04-25'),(11,'Kimberly','W','Moore','2004-10-23'),(12,'Joshua',' ','Krause','2009-05-19'),(13,'Timothy',' ','Robertson','2018-10-30'),(14,'James',' ','Taylor','1998-05-16'),(15,'Emily','A','Murphy','2016-09-02');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engineer`
--

DROP TABLE IF EXISTS `engineer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engineer` (
  `EmployeeID` int NOT NULL,
  `Salary` float DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `EmployeeID_UNIQUE` (`EmployeeID`),
  CONSTRAINT `engineer_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engineer`
--

LOCK TABLES `engineer` WRITE;
/*!40000 ALTER TABLE `engineer` DISABLE KEYS */;
INSERT INTO `engineer` VALUES (1,172078),(8,139462),(9,199261),(12,252670),(14,434763);
/*!40000 ALTER TABLE `engineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expert_on`
--

DROP TABLE IF EXISTS `expert_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expert_on` (
  `Engineer_EmployeeID` int NOT NULL,
  `ProductID` int NOT NULL,
  PRIMARY KEY (`Engineer_EmployeeID`,`ProductID`),
  KEY `expert_on_ibfk_2_idx` (`ProductID`),
  CONSTRAINT `expert_on_ibfk_1` FOREIGN KEY (`Engineer_EmployeeID`) REFERENCES `engineer` (`EmployeeID`),
  CONSTRAINT `expert_on_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product_type` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expert_on`
--

LOCK TABLES `expert_on` WRITE;
/*!40000 ALTER TABLE `expert_on` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FeedbackID` int NOT NULL,
  `Received_Date_Time` datetime DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Given_by_CustomerID` int NOT NULL,
  PRIMARY KEY (`FeedbackID`),
  UNIQUE KEY `FeedbackID_UNIQUE` (`FeedbackID`),
  KEY `as_idx` (`Given_by_CustomerID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Given_by_CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fulfillment`
--

DROP TABLE IF EXISTS `fulfillment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fulfillment` (
  `OrderID` int NOT NULL,
  `DeliveryID` int NOT NULL,
  PRIMARY KEY (`OrderID`,`DeliveryID`),
  KEY `fulfillment_ibfk_2_idx` (`DeliveryID`),
  CONSTRAINT `fulfillment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `fulfillment_ibfk_2` FOREIGN KEY (`DeliveryID`) REFERENCES `delivery` (`DeliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fulfillment`
--

LOCK TABLES `fulfillment` WRITE;
/*!40000 ALTER TABLE `fulfillment` DISABLE KEYS */;
INSERT INTO `fulfillment` VALUES (27,1),(25,2),(37,2),(81,2),(15,3),(19,3),(26,3),(83,3),(19,4),(45,4),(54,4),(18,5),(23,5),(36,5),(69,6),(73,6),(68,7),(95,7),(99,7),(11,8),(59,8),(80,8),(58,9),(84,9),(49,10),(57,10),(70,10),(11,11),(16,11),(52,11),(79,11),(3,12),(5,12),(27,12),(37,12),(61,12),(12,13),(42,13),(98,13),(33,14),(41,14),(67,14),(72,14),(77,14),(39,15),(65,15),(74,15),(93,15),(19,16),(22,16),(91,16),(16,17),(18,17),(19,17),(50,17),(60,17),(36,18),(72,19),(13,20),(15,20),(37,20),(46,20),(63,20),(20,21),(54,21),(2,22),(40,22),(59,23),(73,23),(74,23),(96,23),(53,24),(85,25),(21,26),(24,26),(81,26),(4,27),(34,27),(35,27),(19,28),(72,28),(78,28),(12,29),(45,29),(31,30),(51,30),(75,30),(77,30),(87,30),(1,31),(8,31),(52,31),(27,32),(26,33),(75,33),(99,33),(44,34),(67,34),(85,34),(38,35),(71,35),(90,35),(91,35),(32,36),(94,36),(7,37),(21,37),(67,37),(93,37),(16,38),(47,38),(87,38),(3,39),(13,40),(55,40),(69,40),(15,41),(74,42),(99,42),(6,43),(77,43),(82,43),(16,44),(21,45),(29,45),(74,45),(94,45),(2,46),(4,46),(36,46),(49,46),(89,46),(100,46),(56,47),(63,47),(79,47),(53,48),(57,48),(20,49),(26,49),(64,49),(12,50),(48,51),(68,51),(30,52),(87,52),(57,53),(47,54),(82,55),(9,56),(75,56),(87,57),(97,57),(99,58),(70,59),(3,60),(14,60),(22,60),(28,60),(2,61),(17,61),(37,61),(44,61),(76,61),(95,61),(22,62),(43,62),(58,62),(87,62),(88,62),(17,63),(76,63),(79,64),(19,65),(62,65),(92,65),(23,66),(90,66),(4,67),(41,68),(23,69),(27,69),(51,69),(96,69),(7,70),(22,70),(35,70),(66,70),(46,71),(68,71),(8,72),(10,72),(83,72),(86,72),(91,72),(11,73),(38,73),(11,74),(94,74),(92,75);
/*!40000 ALTER TABLE `fulfillment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `includes`
--

DROP TABLE IF EXISTS `includes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `includes` (
  `ProductID` int NOT NULL,
  `QuoteID` int NOT NULL,
  PRIMARY KEY (`ProductID`,`QuoteID`),
  KEY `includes_ibfk_2_idx` (`QuoteID`),
  CONSTRAINT `includes_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product_type` (`ProductID`),
  CONSTRAINT `includes_ibfk_2` FOREIGN KEY (`QuoteID`) REFERENCES `quote` (`QuoteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `includes`
--

LOCK TABLES `includes` WRITE;
/*!40000 ALTER TABLE `includes` DISABLE KEYS */;
/*!40000 ALTER TABLE `includes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_item`
--

DROP TABLE IF EXISTS `inventory_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_item` (
  `InventoryID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Made_by_CompanyID` int DEFAULT NULL,
  PRIMARY KEY (`InventoryID`,`ProductID`),
  KEY `Product_ID_idx` (`ProductID`),
  KEY `inventory_item_ibfk_1_idx` (`Made_by_CompanyID`),
  CONSTRAINT `inventory_item_ibfk_1` FOREIGN KEY (`Made_by_CompanyID`) REFERENCES `manufacturer` (`CompanyID`),
  CONSTRAINT `inventory_item_ibfk_4` FOREIGN KEY (`ProductID`) REFERENCES `product_type` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_item`
--

LOCK TABLES `inventory_item` WRITE;
/*!40000 ALTER TABLE `inventory_item` DISABLE KEYS */;
INSERT INTO `inventory_item` VALUES (1,5,1),(1,6,1),(1,7,1),(1,9,1),(2,1,1),(2,4,1),(2,9,1),(3,1,1),(3,7,1),(3,10,1),(4,6,1),(5,1,1),(5,3,1),(5,4,1),(6,7,1),(6,10,1),(7,1,1),(7,2,1),(7,6,1),(7,9,1),(7,10,1),(8,1,1),(8,2,1),(8,6,1),(8,7,1),(8,8,1),(8,9,1),(9,2,1),(9,6,1),(9,10,1),(10,3,1),(11,6,1),(11,7,1),(12,1,1),(12,6,1),(13,4,1),(13,5,1),(14,2,1),(14,5,1),(14,6,1),(14,7,1),(15,2,1),(15,4,1),(15,5,1),(15,8,1),(15,9,1),(15,10,1),(16,8,1),(17,9,1),(18,4,1),(18,5,1),(18,8,1),(19,4,1),(19,10,1),(20,1,1),(20,3,1),(21,1,1),(21,4,1),(22,3,1),(22,7,1),(22,8,1),(22,9,1),(23,2,1),(23,9,1),(24,2,1),(24,7,1),(24,10,1),(25,1,1),(25,3,1),(25,4,1),(25,8,1),(26,1,1),(26,3,1),(26,7,1),(26,8,1),(26,10,1),(27,1,1),(27,2,1),(27,9,1),(28,1,1),(28,3,1),(28,4,1),(28,6,1),(29,4,1),(29,5,1),(31,4,1),(31,10,1),(32,2,1),(32,3,1),(32,4,1),(32,7,1),(33,3,1),(33,10,1),(34,2,1),(34,6,1),(34,7,1),(35,4,1),(35,8,1),(37,2,1),(37,8,1),(37,9,1),(37,10,1),(38,9,1),(39,1,1),(39,5,1),(39,8,1),(40,9,1),(41,4,1),(41,7,1),(42,3,1),(42,6,1),(43,6,1),(43,8,1),(43,9,1),(43,10,1),(44,1,1),(44,2,1),(44,3,1),(44,5,1),(44,10,1),(45,6,1),(47,2,1),(47,3,1),(47,8,1),(47,10,1),(48,1,1),(48,2,1),(48,4,1),(48,6,1),(49,3,1),(49,5,1),(50,6,1),(50,10,1),(51,7,1),(51,8,1),(52,2,1),(52,8,1),(52,10,1),(53,2,1),(53,5,1),(54,2,1),(54,6,1),(56,2,1),(57,6,1),(57,9,1),(57,10,1),(58,10,1),(59,1,1),(59,5,1),(59,7,1),(60,1,1),(60,5,1),(61,3,1),(61,5,1),(61,9,1),(61,10,1),(62,3,1),(62,6,1),(62,7,1),(62,10,1),(63,2,1),(63,5,1),(63,7,1),(63,8,1),(64,8,1),(64,9,1),(65,3,1),(65,4,1),(65,9,1),(66,4,1),(66,6,1),(66,10,1),(67,1,1),(67,2,1),(68,3,1),(68,5,1),(69,1,1),(69,4,1),(70,2,1),(70,3,1),(70,6,1),(70,8,1),(70,10,1),(71,2,1),(71,5,1),(71,7,1),(71,8,1),(72,7,1),(73,2,1),(73,6,1),(73,8,1),(74,4,1),(74,6,1),(74,8,1),(74,9,1),(74,10,1),(75,3,1),(75,4,1),(75,6,1),(76,5,1),(77,10,1),(78,2,1),(78,3,1),(78,6,1),(78,9,1),(79,3,1),(79,4,1),(79,5,1),(80,8,1),(81,4,1),(81,5,1),(81,7,1),(81,9,1),(82,2,1),(82,3,1),(82,4,1),(82,5,1),(82,7,1),(82,8,1),(83,2,1),(83,3,1),(83,7,1),(83,9,1),(84,7,1),(84,10,1),(85,1,1),(86,2,1),(86,3,1),(86,10,1),(87,6,1),(88,2,1),(88,5,1),(88,7,1),(89,7,1),(90,3,1),(90,4,1),(91,4,1),(91,5,1),(91,6,1),(92,7,1),(94,2,1),(95,2,1),(95,5,1),(96,8,1),(97,6,1),(97,8,1),(100,1,1),(100,8,1),(101,5,1),(102,5,1),(102,8,1),(102,9,1),(103,9,1),(104,9,1),(110,5,1),(1,1,2),(1,2,2),(1,3,2),(1,8,2),(1,10,2),(2,10,2),(3,3,2),(4,2,2),(4,8,2),(6,1,2),(6,2,2),(6,9,2),(7,4,2),(8,3,2),(8,4,2),(8,10,2),(9,1,2),(9,5,2),(10,5,2),(10,8,2),(10,9,2),(10,10,2),(11,8,2),(11,9,2),(12,2,2),(12,5,2),(12,7,2),(13,1,2),(13,6,2),(13,8,2),(14,3,2),(14,8,2),(16,1,2),(16,3,2),(16,4,2),(16,5,2),(16,7,2),(17,1,2),(17,2,2),(17,10,2),(18,2,2),(18,3,2),(18,6,2),(18,9,2),(19,8,2),(20,2,2),(20,8,2),(20,10,2),(21,5,2),(21,7,2),(22,1,2),(22,2,2),(22,10,2),(23,4,2),(24,4,2),(25,5,2),(25,6,2),(26,2,2),(26,5,2),(27,3,2),(27,4,2),(27,7,2),(27,8,2),(28,2,2),(28,5,2),(29,6,2),(29,7,2),(29,10,2),(30,2,2),(30,4,2),(30,6,2),(30,7,2),(30,8,2),(30,9,2),(31,1,2),(31,2,2),(31,3,2),(31,5,2),(31,8,2),(32,5,2),(32,6,2),(32,9,2),(33,2,2),(33,4,2),(33,9,2),(34,1,2),(34,8,2),(34,10,2),(35,3,2),(35,5,2),(35,7,2),(36,1,2),(36,7,2),(37,1,2),(37,4,2),(37,7,2),(38,2,2),(38,4,2),(39,6,2),(39,7,2),(39,10,2),(40,1,2),(40,6,2),(41,3,2),(41,8,2),(42,1,2),(42,5,2),(42,8,2),(43,2,2),(43,4,2),(43,7,2),(45,1,2),(45,4,2),(45,5,2),(45,9,2),(46,1,2),(46,2,2),(46,3,2),(46,6,2),(46,10,2),(47,4,2),(47,5,2),(47,6,2),(48,5,2),(48,8,2),(48,10,2),(49,2,2),(49,9,2),(50,4,2),(50,7,2),(50,8,2),(51,1,2),(52,9,2),(53,3,2),(53,8,2),(53,9,2),(54,4,2),(54,5,2),(55,2,2),(55,3,2),(55,7,2),(55,9,2),(56,3,2),(56,4,2),(56,5,2),(56,7,2),(56,9,2),(57,3,2),(57,4,2),(57,5,2),(57,8,2),(58,1,2),(58,2,2),(58,8,2),(59,4,2),(60,4,2),(60,7,2),(60,9,2),(60,10,2),(61,1,2),(61,2,2),(61,4,2),(61,7,2),(61,8,2),(62,1,2),(62,2,2),(62,5,2),(62,9,2),(63,10,2),(64,6,2),(65,2,2),(65,6,2),(65,8,2),(65,10,2),(66,1,2),(66,5,2),(67,3,2),(67,4,2),(67,5,2),(67,6,2),(68,2,2),(68,9,2),(69,2,2),(69,7,2),(70,5,2),(70,7,2),(71,1,2),(71,3,2),(71,4,2),(71,9,2),(72,1,2),(72,3,2),(72,4,2),(72,5,2),(73,5,2),(73,7,2),(74,1,2),(74,2,2),(75,7,2),(75,10,2),(76,1,2),(76,2,2),(76,3,2),(76,6,2),(76,9,2),(76,10,2),(77,2,2),(78,5,2),(78,8,2),(79,2,2),(79,6,2),(79,9,2),(79,10,2),(80,1,2),(80,4,2),(80,5,2),(80,7,2),(81,1,2),(81,6,2),(81,8,2),(83,1,2),(83,4,2),(83,6,2),(83,8,2),(84,1,2),(84,4,2),(84,8,2),(85,3,2),(85,4,2),(85,8,2),(86,4,2),(86,5,2),(86,6,2),(86,8,2),(87,3,2),(87,7,2),(88,3,2),(88,6,2),(89,2,2),(89,9,2),(89,10,2),(90,1,2),(90,2,2),(90,5,2),(91,2,2),(92,1,2),(92,8,2),(93,2,2),(93,3,2),(93,4,2),(93,6,2),(94,1,2),(94,3,2),(94,5,2),(95,1,2),(95,8,2),(95,9,2),(96,6,2),(96,9,2),(98,8,2),(100,5,2),(103,6,2),(104,1,2),(105,1,2),(106,5,2),(106,6,2),(107,1,2),(107,5,2),(110,6,2),(2,2,3),(2,3,3),(2,8,3),(3,9,3),(4,4,3),(4,7,3),(5,5,3),(5,6,3),(5,8,3),(5,9,3),(5,10,3),(6,4,3),(6,6,3),(7,5,3),(7,8,3),(9,3,3),(9,4,3),(9,7,3),(9,9,3),(10,1,3),(10,2,3),(10,4,3),(10,6,3),(11,1,3),(11,4,3),(12,3,3),(12,4,3),(12,9,3),(12,10,3),(13,2,3),(13,10,3),(14,10,3),(15,1,3),(15,3,3),(15,6,3),(15,7,3),(16,6,3),(16,9,3),(17,3,3),(17,4,3),(17,6,3),(17,7,3),(18,1,3),(18,7,3),(19,3,3),(19,5,3),(20,4,3),(20,5,3),(20,7,3),(20,9,3),(21,2,3),(21,3,3),(21,6,3),(21,9,3),(22,4,3),(22,5,3),(22,6,3),(23,6,3),(24,1,3),(24,3,3),(24,6,3),(24,9,3),(25,2,3),(25,7,3),(25,9,3),(26,9,3),(27,5,3),(27,10,3),(28,7,3),(28,9,3),(28,10,3),(29,3,3),(30,1,3),(30,3,3),(30,10,3),(31,6,3),(33,1,3),(33,8,3),(34,4,3),(34,5,3),(35,2,3),(35,6,3),(36,3,3),(36,9,3),(37,3,3),(37,6,3),(38,1,3),(38,3,3),(38,10,3),(39,2,3),(39,4,3),(40,3,3),(40,5,3),(40,7,3),(40,8,3),(41,5,3),(41,6,3),(41,10,3),(42,2,3),(42,7,3),(43,1,3),(44,7,3),(45,2,3),(45,7,3),(45,8,3),(46,5,3),(46,8,3),(46,9,3),(47,7,3),(47,9,3),(48,7,3),(49,4,3),(49,6,3),(49,10,3),(50,1,3),(50,2,3),(50,5,3),(51,2,3),(51,4,3),(51,5,3),(51,10,3),(52,1,3),(52,4,3),(52,7,3),(53,1,3),(53,4,3),(53,7,3),(53,10,3),(54,3,3),(54,9,3),(54,10,3),(55,4,3),(55,8,3),(55,10,3),(56,8,3),(57,1,3),(57,7,3),(58,5,3),(58,7,3),(58,9,3),(59,2,3),(59,3,3),(59,9,3),(60,2,3),(62,4,3),(62,8,3),(63,1,3),(63,3,3),(63,4,3),(63,6,3),(64,1,3),(64,2,3),(64,10,3),(65,1,3),(65,5,3),(65,7,3),(66,2,3),(66,3,3),(66,7,3),(66,8,3),(67,9,3),(68,6,3),(68,8,3),(68,10,3),(69,9,3),(70,1,3),(71,6,3),(72,6,3),(72,8,3),(73,1,3),(73,3,3),(75,2,3),(75,5,3),(75,8,3),(76,8,3),(77,1,3),(77,3,3),(77,5,3),(77,6,3),(77,7,3),(77,9,3),(78,1,3),(78,4,3),(78,7,3),(78,10,3),(79,1,3),(80,3,3),(80,10,3),(81,2,3),(81,3,3),(82,6,3),(82,9,3),(83,5,3),(83,10,3),(84,2,3),(84,3,3),(84,6,3),(85,2,3),(85,9,3),(86,9,3),(87,1,3),(87,4,3),(87,5,3),(87,9,3),(88,1,3),(88,8,3),(88,9,3),(88,10,3),(89,3,3),(89,6,3),(89,8,3),(90,6,3),(91,1,3),(91,3,3),(91,7,3),(92,5,3),(92,9,3),(93,1,3),(94,4,3),(94,6,3),(94,9,3),(95,6,3),(97,1,3),(97,9,3),(98,5,3),(98,9,3),(99,5,3),(99,6,3),(99,8,3),(99,9,3),(100,9,3),(101,6,3),(101,8,3),(101,9,3),(102,1,3),(103,5,3),(104,5,3),(104,6,3),(105,5,3),(105,6,3),(108,5,3),(109,5,3),(1,4,4),(2,5,4),(2,6,4),(2,7,4),(3,2,4),(3,4,4),(3,5,4),(3,6,4),(3,8,4),(4,1,4),(4,3,4),(4,5,4),(4,9,4),(4,10,4),(5,2,4),(5,7,4),(6,3,4),(6,5,4),(6,8,4),(7,3,4),(7,7,4),(8,5,4),(9,8,4),(10,7,4),(11,2,4),(11,3,4),(11,5,4),(11,10,4),(12,8,4),(13,3,4),(13,7,4),(13,9,4),(14,1,4),(14,4,4),(14,9,4),(16,2,4),(16,10,4),(17,5,4),(17,8,4),(18,10,4),(19,1,4),(19,2,4),(19,6,4),(19,7,4),(19,9,4),(20,6,4),(21,8,4),(21,10,4),(23,1,4),(23,3,4),(23,5,4),(23,7,4),(23,8,4),(23,10,4),(24,5,4),(24,8,4),(25,10,4),(26,4,4),(26,6,4),(27,6,4),(28,8,4),(29,1,4),(29,2,4),(29,8,4),(29,9,4),(30,5,4),(31,7,4),(31,9,4),(32,1,4),(32,8,4),(32,10,4),(33,5,4),(33,6,4),(33,7,4),(34,3,4),(34,9,4),(35,1,4),(35,9,4),(35,10,4),(36,2,4),(36,4,4),(36,5,4),(36,6,4),(36,8,4),(36,10,4),(37,5,4),(38,5,4),(38,6,4),(38,7,4),(38,8,4),(39,3,4),(39,9,4),(40,2,4),(40,4,4),(40,10,4),(41,1,4),(41,2,4),(41,9,4),(42,4,4),(42,9,4),(42,10,4),(43,3,4),(43,5,4),(44,4,4),(44,6,4),(44,8,4),(44,9,4),(45,3,4),(45,10,4),(46,4,4),(46,7,4),(47,1,4),(48,3,4),(48,9,4),(49,1,4),(49,7,4),(49,8,4),(50,3,4),(50,9,4),(51,3,4),(51,6,4),(51,9,4),(52,3,4),(52,5,4),(52,6,4),(53,6,4),(54,1,4),(54,7,4),(54,8,4),(55,1,4),(55,5,4),(55,6,4),(56,1,4),(56,6,4),(56,10,4),(57,2,4),(58,3,4),(58,4,4),(58,6,4),(59,6,4),(59,8,4),(59,10,4),(60,3,4),(60,6,4),(60,8,4),(61,6,4),(63,9,4),(64,3,4),(64,4,4),(64,5,4),(64,7,4),(66,9,4),(67,7,4),(67,8,4),(67,10,4),(68,1,4),(68,4,4),(68,7,4),(69,3,4),(69,5,4),(69,6,4),(69,8,4),(69,10,4),(70,4,4),(70,9,4),(71,10,4),(72,2,4),(72,9,4),(72,10,4),(73,4,4),(73,9,4),(73,10,4),(74,3,4),(74,5,4),(74,7,4),(75,1,4),(75,9,4),(76,4,4),(76,7,4),(77,4,4),(77,8,4),(79,7,4),(79,8,4),(80,2,4),(80,6,4),(80,9,4),(81,10,4),(82,1,4),(82,10,4),(84,5,4),(84,9,4),(85,5,4),(85,6,4),(85,7,4),(85,10,4),(86,1,4),(86,7,4),(87,2,4),(87,8,4),(87,10,4),(88,4,4),(89,1,4),(89,4,4),(89,5,4),(90,7,4),(90,8,4),(90,9,4),(91,8,4),(91,9,4),(92,2,4),(92,3,4),(92,4,4),(92,6,4),(93,5,4),(93,8,4),(93,9,4),(94,8,4),(95,4,4),(96,1,4),(96,2,4),(96,5,4),(97,5,4),(98,1,4),(98,6,4),(99,1,4),(100,6,4),(101,1,4),(102,6,4),(103,1,4),(106,1,4),(107,6,4),(108,6,4),(109,6,4),(111,6,4);
/*!40000 ALTER TABLE `inventory_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistics`
--

DROP TABLE IF EXISTS `logistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logistics` (
  `CompanyID` int NOT NULL,
  PRIMARY KEY (`CompanyID`),
  UNIQUE KEY `CompanyID_UNIQUE` (`CompanyID`),
  CONSTRAINT `logistics_ibfk_1` FOREIGN KEY (`CompanyID`) REFERENCES `company` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistics`
--

LOCK TABLES `logistics` WRITE;
/*!40000 ALTER TABLE `logistics` DISABLE KEYS */;
INSERT INTO `logistics` VALUES (5),(6),(7);
/*!40000 ALTER TABLE `logistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `made_by`
--

DROP TABLE IF EXISTS `made_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `made_by` (
  `ContractorID` int NOT NULL,
  `BidID` int NOT NULL,
  PRIMARY KEY (`ContractorID`,`BidID`),
  KEY `made_by_ibfk_2_idx` (`BidID`),
  CONSTRAINT `made_by_ibfk_1` FOREIGN KEY (`ContractorID`) REFERENCES `contractor` (`ContractorID`),
  CONSTRAINT `made_by_ibfk_2` FOREIGN KEY (`BidID`) REFERENCES `bid` (`BidID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `made_by`
--

LOCK TABLES `made_by` WRITE;
/*!40000 ALTER TABLE `made_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `made_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `made_to`
--

DROP TABLE IF EXISTS `made_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `made_to` (
  `ConsultationID` int NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`ConsultationID`,`CustomerID`),
  KEY `made_to_ibfk_2_idx` (`CustomerID`),
  CONSTRAINT `made_to_ibfk_1` FOREIGN KEY (`ConsultationID`) REFERENCES `consultation` (`ConsultationID`),
  CONSTRAINT `made_to_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `made_to`
--

LOCK TABLES `made_to` WRITE;
/*!40000 ALTER TABLE `made_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `made_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_worker`
--

DROP TABLE IF EXISTS `maintenance_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_worker` (
  `EmployeeID` int NOT NULL,
  `Hourly_wage` float DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `EmployeeID_UNIQUE` (`EmployeeID`),
  CONSTRAINT `maintenance_worker_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_worker`
--

LOCK TABLES `maintenance_worker` WRITE;
/*!40000 ALTER TABLE `maintenance_worker` DISABLE KEYS */;
INSERT INTO `maintenance_worker` VALUES (5,25.71),(10,37.73);
/*!40000 ALTER TABLE `maintenance_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `CompanyID` int NOT NULL,
  PRIMARY KEY (`CompanyID`),
  UNIQUE KEY `CompanyID_UNIQUE` (`CompanyID`),
  CONSTRAINT `manufacturer_ibfk_1` FOREIGN KEY (`CompanyID`) REFERENCES `company` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1),(2),(3),(4);
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting` (
  `MeetingID` int NOT NULL,
  `Scheduled_by_EmployeeID` int NOT NULL,
  `Start_Date_Time` datetime DEFAULT NULL,
  `Agenda` varchar(45) DEFAULT NULL,
  `Notes` varchar(45) DEFAULT NULL,
  `Attendance` varchar(45) DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MeetingID`,`Scheduled_by_EmployeeID`),
  KEY `meeting_ibfk_1_idx` (`Scheduled_by_EmployeeID`),
  CONSTRAINT `meeting_ibfk_1` FOREIGN KEY (`Scheduled_by_EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting`
--

LOCK TABLES `meeting` WRITE;
/*!40000 ALTER TABLE `meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_customer`
--

DROP TABLE IF EXISTS `new_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_customer` (
  `CustomerID` int NOT NULL,
  `Referred_by_CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `CustomerID_UNIQUE` (`CustomerID`),
  KEY `new_customer_ibfk_2_idx` (`Referred_by_CustomerID`),
  CONSTRAINT `new_customer_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `new_customer_ibfk_2` FOREIGN KEY (`Referred_by_CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_customer`
--

LOCK TABLES `new_customer` WRITE;
/*!40000 ALTER TABLE `new_customer` DISABLE KEYS */;
INSERT INTO `new_customer` VALUES (3,5),(4,7),(8,13),(10,15),(11,20);
/*!40000 ALTER TABLE `new_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL,
  `Placed_Date_Time` datetime NOT NULL,
  `Payment_Type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE KEY `OrderID_UNIQUE` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2021-10-06 19:34:22','Credit Card'),(2,'2021-06-23 10:36:31','Cash'),(3,'2022-01-07 19:38:47','Credit Card'),(4,'2021-02-21 10:40:47','Check'),(5,'2021-04-27 19:20:23','Cash'),(6,'2022-07-21 19:31:58','Cash'),(7,'2022-09-13 16:09:10','Cash'),(8,'2021-09-24 23:48:07','Cash'),(9,'2022-03-25 05:30:14','Cash'),(10,'2021-06-25 22:00:02','Check'),(11,'2021-10-23 21:08:05','Credit Card'),(12,'2020-12-18 18:23:44','Credit Card'),(13,'2021-05-29 15:13:23','Credit Card'),(14,'2020-11-26 12:10:18','Check'),(15,'2020-12-09 08:45:40','Credit Card'),(16,'2021-04-10 08:41:21','Credit Card'),(17,'2020-12-25 18:05:27','Credit Card'),(18,'2022-01-02 23:04:17','Credit Card'),(19,'2021-09-07 07:48:14','Credit Card'),(20,'2022-11-12 22:57:21','Cash'),(21,'2021-04-11 23:25:25','Check'),(22,'2022-08-30 13:42:19','Check'),(23,'2021-10-06 03:30:58','Credit Card'),(24,'2022-06-08 04:37:19','Credit Card'),(25,'2021-07-21 08:50:57','Credit Card'),(26,'2022-10-27 11:45:26','Cash'),(27,'2022-01-01 05:35:23','Check'),(28,'2021-07-19 21:17:25','Cash'),(29,'2021-04-28 13:43:51','Check'),(30,'2021-10-26 06:35:08','Cash'),(31,'2021-02-23 13:45:35','Cash'),(32,'2021-08-09 06:06:19','Credit Card'),(33,'2021-09-02 06:24:26','Credit Card'),(34,'2021-08-19 17:02:04','Credit Card'),(35,'2022-04-24 00:25:42','Cash'),(36,'2021-08-30 17:58:43','Cash'),(37,'2021-12-12 22:09:22','Check'),(38,'2021-07-19 03:48:49','Credit Card'),(39,'2022-02-10 03:13:35','Credit Card'),(40,'2022-02-03 00:53:10','Credit Card'),(41,'2021-04-30 20:35:03','Credit Card'),(42,'2021-06-24 10:14:26','Cash'),(43,'2021-11-29 10:39:20','Credit Card'),(44,'2021-08-11 20:33:43','Check'),(45,'2021-03-28 11:41:25','Credit Card'),(46,'2021-06-25 09:32:47','Check'),(47,'2022-05-21 01:32:49','Check'),(48,'2021-04-06 16:19:17','Cash'),(49,'2022-04-06 06:47:41','Cash'),(50,'2021-12-15 08:08:24','Cash'),(51,'2022-05-08 10:06:13','Cash'),(52,'2022-01-29 11:10:46','Cash'),(53,'2020-12-11 15:49:10','Cash'),(54,'2022-11-04 12:35:03','Cash'),(55,'2022-09-10 09:16:16','Check'),(56,'2021-10-11 01:17:40','Check'),(57,'2020-11-23 19:41:40','Check'),(58,'2021-09-04 16:20:34','Credit Card'),(59,'2022-09-08 15:51:29','Credit Card'),(60,'2022-04-24 21:46:04','Credit Card'),(61,'2021-11-17 15:38:31','Cash'),(62,'2021-04-01 01:00:11','Cash'),(63,'2022-02-15 03:00:59','Check'),(64,'2021-06-09 06:47:19','Cash'),(65,'2022-05-24 21:50:25','Check'),(66,'2022-06-13 00:18:54','Check'),(67,'2021-04-23 11:54:42','Check'),(68,'2022-09-14 13:50:42','Cash'),(69,'2021-02-15 11:52:49','Check'),(70,'2022-02-02 15:04:28','Check'),(71,'2021-05-18 17:13:06','Credit Card'),(72,'2022-09-13 16:55:12','Cash'),(73,'2021-10-12 18:08:04','Cash'),(74,'2021-09-28 19:05:10','Check'),(75,'2022-09-23 13:08:54','Check'),(76,'2020-12-29 11:45:42','Credit Card'),(77,'2021-11-19 09:48:22','Cash'),(78,'2021-11-12 05:00:33','Credit Card'),(79,'2021-07-03 17:35:51','Credit Card'),(80,'2022-05-25 14:38:24','Cash'),(81,'2022-09-07 02:02:31','Check'),(82,'2022-01-23 11:16:02','Credit Card'),(83,'2021-10-16 10:25:12','Cash'),(84,'2021-03-02 21:24:01','Cash'),(85,'2021-10-21 04:56:35','Check'),(86,'2022-08-13 04:34:13','Check'),(87,'2020-12-22 07:14:08','Cash'),(88,'2022-09-23 15:53:17','Cash'),(89,'2020-12-01 04:41:35','Cash'),(90,'2021-08-22 21:26:43','Credit Card'),(91,'2022-04-25 20:41:01','Cash'),(92,'2022-01-23 01:58:19','Credit Card'),(93,'2022-09-02 17:09:58','Credit Card'),(94,'2022-04-30 03:42:09','Cash'),(95,'2022-07-29 08:56:43','Cash'),(96,'2021-11-22 22:04:21','Cash'),(97,'2022-08-31 13:08:26','Credit Card'),(98,'2021-10-26 10:47:02','Check'),(99,'2022-07-26 08:49:43','Cash'),(100,'2022-08-05 20:18:47','Credit Card');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_numbers`
--

DROP TABLE IF EXISTS `phone_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_numbers` (
  `CustomerID` int NOT NULL,
  `Phone_number` varchar(20) NOT NULL,
  `Type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`,`Phone_number`),
  CONSTRAINT `phone_numbers_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_numbers`
--

LOCK TABLES `phone_numbers` WRITE;
/*!40000 ALTER TABLE `phone_numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `ProductID` int NOT NULL,
  `Product_name` varchar(20) NOT NULL,
  `Cost` float DEFAULT NULL,
  `Size` varchar(20) DEFAULT NULL,
  `Warranty_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `Product_ID_UNIQUE` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,'Air Conditioners',3215,'120','Outdoor Units Warranty (ACs & Heat Pumps)'),(2,'Furnaces',5621,'135','Furnaces Warranty'),(3,'Heat pumps',2334,'24','Outdoor Units Warranty (ACs & Heat Pumps)'),(4,'Smart thermostats',245,'20','Air Handlers Warranty'),(5,'Heat pump packaged',3445,'30','Outdoor Units Warranty (ACs & Heat Pumps)'),(6,'Multi-zone ductless',4452,'60','Ductless Systems Warranty'),(7,'Air purification',453,'42','Air Handlers Warranty'),(8,'Trane Home App',343,'12','Air Handlers Warranty'),(9,'Comfort Coil',831,'24','Coil Warranty'),(10,'Humidity control',314,'13','Air Handlers Warranty');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `OrderID` int NOT NULL,
  `Salesperson_EmployeeID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE KEY `OrderID_UNIQUE` (`OrderID`),
  KEY `purchase_ibfk_2_idx` (`Salesperson_EmployeeID`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`Salesperson_EmployeeID`) REFERENCES `salesperson` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (10,2),(24,2),(41,2),(49,2),(54,2),(55,2),(79,2),(85,2),(87,2),(94,2),(96,2),(22,3),(33,3),(44,3),(58,3),(67,3),(69,3),(81,3),(90,3),(97,3),(6,4),(32,4),(56,4),(59,4),(75,4),(4,6),(11,6),(27,6),(34,6),(39,6),(7,7),(19,7),(37,7),(53,7),(13,11),(18,11),(20,11),(66,11),(25,13),(28,13),(29,13),(42,13),(45,13),(84,13),(92,13),(98,13),(26,15),(61,15),(73,15),(100,15);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote`
--

DROP TABLE IF EXISTS `quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote` (
  `QuoteID` int NOT NULL,
  `Quote_Date_Time` datetime DEFAULT NULL,
  `Valid_through_Date_Time` datetime DEFAULT NULL,
  `Cost` float DEFAULT NULL,
  `Salesperson_EmployeeID` int NOT NULL,
  `Given_to_CustomerID` int NOT NULL,
  PRIMARY KEY (`QuoteID`),
  UNIQUE KEY `QuoteID_UNIQUE` (`QuoteID`),
  KEY `EmployeeID_idx` (`Salesperson_EmployeeID`),
  KEY `CustomerID_idx` (`Given_to_CustomerID`),
  CONSTRAINT `quote_ibfk_1` FOREIGN KEY (`Given_to_CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `quote_ibfk_2` FOREIGN KEY (`Salesperson_EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote`
--

LOCK TABLES `quote` WRITE;
/*!40000 ALTER TABLE `quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receives`
--

DROP TABLE IF EXISTS `receives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receives` (
  `Maintenance_EmployeeID` int NOT NULL,
  `Item_ProductID` int NOT NULL,
  `Item_InventoryID` int NOT NULL,
  PRIMARY KEY (`Maintenance_EmployeeID`,`Item_ProductID`,`Item_InventoryID`),
  KEY `receives_ibfk_2_idx` (`Item_ProductID`,`Item_InventoryID`),
  CONSTRAINT `receives_ibfk_1` FOREIGN KEY (`Maintenance_EmployeeID`) REFERENCES `maintenance_worker` (`EmployeeID`),
  CONSTRAINT `receives_ibfk_2` FOREIGN KEY (`Item_ProductID`, `Item_InventoryID`) REFERENCES `inventory_item` (`ProductID`, `InventoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receives`
--

LOCK TABLES `receives` WRITE;
/*!40000 ALTER TABLE `receives` DISABLE KEYS */;
/*!40000 ALTER TABLE `receives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returning_customer`
--

DROP TABLE IF EXISTS `returning_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returning_customer` (
  `CustomerID` int NOT NULL,
  `Represented_by_SalespersonID` int NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `CustomerID_UNIQUE` (`CustomerID`),
  KEY `returning_customer_ibfk_2_idx` (`Represented_by_SalespersonID`),
  CONSTRAINT `returning_customer_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `returning_customer_ibfk_2` FOREIGN KEY (`Represented_by_SalespersonID`) REFERENCES `salesperson` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returning_customer`
--

LOCK TABLES `returning_customer` WRITE;
/*!40000 ALTER TABLE `returning_customer` DISABLE KEYS */;
INSERT INTO `returning_customer` VALUES (1,2),(9,2),(18,2),(20,4),(12,6),(13,7),(16,7),(2,11),(17,11),(6,13),(19,13),(5,15),(7,15),(14,15),(15,15);
/*!40000 ALTER TABLE `returning_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `SiteID` int NOT NULL,
  `Room_number` varchar(20) NOT NULL,
  `Capacity` int DEFAULT NULL,
  PRIMARY KEY (`SiteID`,`Room_number`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`SiteID`) REFERENCES `site` (`SiteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `OrderID` int NOT NULL,
  `Sold_to_CustomerID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE KEY `OrderID_UNIQUE` (`OrderID`),
  KEY `sale_ibfk_2_idx` (`Sold_to_CustomerID`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`Sold_to_CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (2,1),(89,1),(93,1),(5,2),(16,2),(38,2),(63,2),(71,2),(74,2),(95,2),(91,3),(40,4),(1,5),(9,5),(83,6),(35,7),(46,7),(78,7),(70,8),(15,9),(52,9),(60,9),(76,9),(99,9),(43,10),(80,11),(36,12),(64,12),(65,12),(14,13),(31,13),(51,13),(72,13),(47,14),(3,15),(48,15),(21,16),(23,16),(77,16),(30,17),(12,18),(57,18),(62,18),(8,19),(17,19),(50,20),(68,20),(82,20),(86,20),(88,20);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesperson`
--

DROP TABLE IF EXISTS `salesperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesperson` (
  `EmployeeID` int NOT NULL,
  `Commission` float DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `EmployeeID_UNIQUE` (`EmployeeID`),
  CONSTRAINT `salesperson_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesperson`
--

LOCK TABLES `salesperson` WRITE;
/*!40000 ALTER TABLE `salesperson` DISABLE KEYS */;
INSERT INTO `salesperson` VALUES (2,12.64),(3,10.11),(4,16.25),(6,24.08),(7,13.59),(11,22.02),(13,19.99),(15,10.82);
/*!40000 ALTER TABLE `salesperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `SiteID` int NOT NULL,
  `Street_number` int DEFAULT NULL,
  `Street_name` varchar(45) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `Zipcode` int DEFAULT NULL,
  `Unit_number` int DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Property_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SiteID`),
  UNIQUE KEY `SiteID_UNIQUE` (`SiteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,16731,'Bennett Village Crossing','MT',59396,0,'MT Department of Transportation','Public'),(2,1397,'Gabrielle Bypass Ports','TN',38122,0,'Wheeler-Sullivan','Commercial'),(3,8689,'Laura Branch Unions','NM',88035,0,'Mathews-Moore','Industrial'),(4,6550,'Bethany Center Greens','VA',24327,0,'Zamora Group','Industrial'),(5,13235,'Diaz Stream Cliffs','RI',2864,0,'Cooper LLC','Commercial'),(6,23637,'Kristi Road Highway','MT',59079,0,'MT Department of Agriculture','Public'),(7,1071,'Brooks Island Point','MA',1660,0,'Court Crossing','Resedential'),(8,19851,'Jessica Manor Lane','MD',20921,372,'Williams Ltd','Industrial'),(9,845,'Pruitt Dale Mountain','ID',83359,0,'Bauer-Mills','Commercial'),(10,1689,'Owens Lock Forges','AR',72527,0,'Harrell Ltd','Industrial'),(11,937,'Adams Lakes Pass','TN',38460,0,'College Village','Resedential'),(12,160,'Robert Courts Greens','DE',19745,0,'The Villas','Resedential'),(13,47540,'William Forges Isle','WY',82485,0,'Scott-Williams','Industrial'),(14,66919,'Smith Mountain Extensions','PA',18413,0,'Hamilton, Bass and Melton','Industrial'),(15,63974,'Lara Corners Mission','DE',19845,0,'DE Department of Public Health','Public'),(16,166,'Johnson Camp Curve','WI',54396,653,'Cox and Sons','Industrial'),(17,296,'Joyce Fork Valley','CO',81423,0,'Todd, White and Webster','Industrial'),(18,8437,'Wright Inlet Fields','TX',77650,0,'Martin Ltd','Commercial'),(19,879,'Matthew Lights Crossing','ID',83785,0,'ID Department of Public Health','Public'),(20,83058,'Wesley Well Camp','AK',99941,79,'AK Department of Public Safety','Public');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-17 19:27:10
