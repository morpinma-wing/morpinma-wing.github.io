-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
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
  PRIMARY KEY (`OrderID`,`Item_ProductID`,`Item_InventoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES (1,9,1),(2,8,2),(3,8,3),(4,1,4),(5,5,5),(6,10,6),(7,4,7),(8,8,8),(9,7,9),(10,8,10),(11,6,11),(12,2,12),(13,4,13),(14,1,14),(15,7,15),(16,4,16),(17,6,17),(18,9,18),(19,4,19),(20,1,20),(21,7,21),(22,6,22),(23,10,23),(24,6,24),(25,10,25),(26,10,26),(27,7,27),(28,1,28),(29,1,29),(30,5,30),(31,1,31),(32,9,32),(33,8,33),(34,9,34),(35,10,35),(36,1,36),(37,9,37),(38,10,38),(39,3,39),(40,2,40),(41,10,41),(42,8,42),(43,6,43),(44,5,44),(45,5,45),(46,1,46),(47,7,47),(48,5,48),(49,1,49),(50,8,50),(51,8,51),(52,3,52),(53,7,53),(54,9,54),(55,9,55),(56,5,56),(57,5,57),(58,2,58),(59,8,59),(60,8,60),(61,6,61),(62,8,62),(63,8,63),(64,3,64),(65,5,65),(66,5,66),(67,4,67),(68,5,68),(69,2,69),(70,10,70),(71,10,71),(72,5,72),(73,8,73),(74,2,74),(75,2,75),(76,5,76),(77,4,77),(78,1,78),(79,2,79),(80,10,80),(81,5,81),(82,7,82),(83,5,83),(84,3,84),(85,6,85),(86,2,86),(87,6,87),(88,6,88),(89,1,89),(90,5,90),(91,9,91),(92,10,92),(93,2,93),(94,8,94),(95,2,95),(96,1,96),(97,7,97),(98,5,98),(99,6,99),(100,8,100);
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
  `ProductName` varchar(50) NOT NULL,
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
INSERT INTO `cut_sheet` VALUES (1,'Stay cool and comfortable when the weather gets hot',1,'Air Conditioners'),(2,'Keep cozy with furnaces that use gas or oil to heat your home',2,'Furnaces'),(3,'Heat and cool your home with this versatile system powered by electricity',3,'Heat pumps'),(4,'Connect to WiFi to manage your comfort preferences',4,'Smart thermostats'),(5,'Heat and cool your home with an energy-efficient, all-in-one solution',5,'Heat pump packaged'),(6,'Heat or cool multiple rooms or your entire home without using ductwork',6,'Multi-zone ductless'),(7,'Explore an array of solutions designed to rid your home’s air of contaminants',7,'Air purification'),(8,'Control your comfort from virtually anywhere',8,'Trane Home App'),(9,'Enjoy durable comfort with a rust-resistant coil',9,'Comfort Coil'),(10,'Add or remove moisture from your indoor air to regulate your comfort',10,'Humidity Control');
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
  UNIQUE KEY `idx_inventory_item_InventoryID` (`InventoryID`),
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
INSERT INTO `inventory_item` VALUES (8,9,1),(12,1,1),(19,1,1),(29,4,1),(49,3,1),(50,7,1),(54,4,1),(57,8,1),(66,2,1),(92,7,1),(94,3,1),(95,8,1),(120,4,1),(135,3,1),(140,5,1),(142,6,1),(164,9,1),(166,9,1),(170,7,1),(191,5,1),(197,3,1),(201,10,1),(204,9,1),(218,10,1),(222,1,1),(229,2,1),(233,7,1),(242,3,1),(253,2,1),(256,2,1),(257,3,1),(258,5,1),(262,9,1),(263,3,1),(266,6,1),(270,8,1),(276,3,1),(300,5,1),(321,9,1),(326,8,1),(327,2,1),(333,4,1),(335,9,1),(343,6,1),(347,8,1),(353,9,1),(366,2,1),(369,8,1),(374,1,1),(378,10,1),(384,6,1),(406,7,1),(409,3,1),(417,2,1),(427,6,1),(429,4,1),(436,3,1),(438,5,1),(440,2,1),(442,8,1),(452,1,1),(457,7,1),(462,2,1),(469,1,1),(472,7,1),(474,6,1),(477,4,1),(480,5,1),(483,3,1),(485,7,1),(486,8,1),(510,4,1),(518,6,1),(520,9,1),(526,7,1),(549,3,1),(553,10,1),(565,2,1),(566,4,1),(569,6,1),(573,1,1),(589,3,1),(593,2,1),(605,4,1),(619,7,1),(642,6,1),(656,8,1),(660,7,1),(669,4,1),(673,8,1),(674,3,1),(682,1,1),(704,8,1),(718,4,1),(720,9,1),(721,2,1),(728,10,1),(731,4,1),(736,4,1),(737,5,1),(741,1,1),(744,6,1),(746,3,1),(748,9,1),(759,8,1),(774,2,1),(776,8,1),(784,2,1),(785,9,1),(786,8,1),(795,9,1),(804,9,1),(811,4,1),(831,9,1),(832,3,1),(852,3,1),(854,3,1),(862,5,1),(873,1,1),(879,5,1),(880,3,1),(892,2,1),(895,4,1),(896,4,1),(917,6,1),(934,7,1),(938,8,1),(941,1,1),(961,4,1),(965,6,1),(966,3,1),(972,10,1),(987,8,1),(997,9,1),(998,6,1),(999,7,1),(5,9,2),(10,10,2),(21,6,2),(55,5,2),(56,2,2),(61,3,2),(69,5,2),(70,1,2),(81,2,2),(82,5,2),(84,2,2),(97,4,2),(98,5,2),(102,1,2),(121,9,2),(124,8,2),(125,3,2),(145,2,2),(147,7,2),(161,2,2),(174,6,2),(180,5,2),(186,6,2),(188,3,2),(206,1,2),(230,6,2),(260,4,2),(265,1,2),(271,4,2),(273,8,2),(275,1,2),(279,6,2),(280,3,2),(287,3,2),(290,8,2),(297,4,2),(303,6,2),(310,7,2),(319,3,2),(322,9,2),(323,10,2),(336,1,2),(348,7,2),(351,5,2),(355,8,2),(358,6,2),(361,3,2),(373,3,2),(376,10,2),(383,5,2),(388,7,2),(396,3,2),(407,9,2),(410,6,2),(413,7,2),(426,7,2),(433,3,2),(434,10,2),(446,4,2),(460,8,2),(470,1,2),(473,2,2),(492,9,2),(494,8,2),(506,1,2),(522,4,2),(532,1,2),(542,6,2),(545,5,2),(550,5,2),(552,3,2),(564,6,2),(568,3,2),(572,1,2),(578,4,2),(585,8,2),(592,9,2),(602,3,2),(613,1,2),(616,9,2),(621,10,2),(626,2,2),(631,7,2),(632,3,2),(635,2,2),(647,4,2),(652,2,2),(658,3,2),(672,6,2),(702,8,2),(708,2,2),(715,2,2),(738,9,2),(740,3,2),(742,2,2),(750,1,2),(760,5,2),(761,10,2),(766,9,2),(802,2,2),(808,8,2),(810,6,2),(824,2,2),(837,2,2),(839,8,2),(846,2,2),(847,2,2),(859,7,2),(865,10,2),(874,1,2),(887,7,2),(899,6,2),(902,2,2),(905,9,2),(910,4,2),(911,9,2),(914,1,2),(930,3,2),(932,1,2),(942,5,2),(950,5,2),(951,2,2),(969,1,2),(976,9,2),(977,2,2),(982,9,2),(990,6,2),(991,2,2),(34,4,3),(35,8,3),(48,2,3),(74,6,3),(78,2,3),(80,2,3),(83,10,3),(87,4,3),(89,6,3),(90,8,3),(99,10,3),(101,4,3),(116,7,3),(118,8,3),(119,4,3),(122,4,3),(123,4,3),(128,10,3),(134,2,3),(149,7,3),(150,7,3),(153,7,3),(155,10,3),(156,10,3),(163,9,3),(165,6,3),(175,3,3),(181,7,3),(187,7,3),(200,3,3),(210,6,3),(213,4,3),(220,7,3),(225,5,3),(226,1,3),(234,10,3),(236,6,3),(247,4,3),(248,8,3),(264,2,3),(267,5,3),(269,5,3),(277,1,3),(289,5,3),(298,4,3),(304,2,3),(305,9,3),(306,8,3),(309,4,3),(316,1,3),(317,3,3),(329,3,3),(331,3,3),(338,6,3),(345,10,3),(349,2,3),(352,4,3),(354,6,3),(356,4,3),(357,7,3),(362,1,3),(365,10,3),(372,7,3),(375,6,3),(386,2,3),(390,5,3),(392,6,3),(400,5,3),(411,10,3),(419,3,3),(421,7,3),(423,10,3),(468,9,3),(481,3,3),(489,2,3),(502,8,3),(508,1,3),(521,8,3),(527,7,3),(529,5,3),(534,6,3),(536,1,3),(541,10,3),(555,3,3),(557,7,3),(586,7,3),(587,3,3),(595,7,3),(609,3,3),(610,5,3),(612,6,3),(615,7,3),(618,2,3),(622,2,3),(625,1,3),(630,8,3),(633,9,3),(645,1,3),(649,4,3),(657,7,3),(659,8,3),(661,10,3),(667,3,3),(677,9,3),(680,10,3),(687,9,3),(692,8,3),(697,6,3),(709,3,3),(714,9,3),(716,8,3),(719,9,3),(725,6,3),(726,9,3),(727,3,3),(734,8,3),(745,8,3),(752,2,3),(767,10,3),(781,4,3),(787,2,3),(789,5,3),(793,8,3),(797,5,3),(799,8,3),(803,10,3),(806,1,3),(825,6,3),(841,3,3),(843,3,3),(868,1,3),(870,1,3),(876,9,3),(884,10,3),(891,1,3),(906,4,3),(909,1,3),(916,6,3),(922,6,3),(924,6,3),(933,1,3),(940,5,3),(952,9,3),(960,3,3),(962,9,3),(963,8,3),(970,6,3),(974,4,3),(975,7,3),(983,4,3),(988,5,3),(993,8,3),(1000,5,3),(1,6,4),(3,9,4),(11,10,4),(13,6,4),(14,8,4),(15,8,4),(17,8,4),(24,8,4),(25,3,4),(31,5,4),(33,2,4),(37,4,4),(41,8,4),(43,9,4),(46,4,4),(64,4,4),(65,3,4),(72,6,4),(100,6,4),(107,9,4),(109,8,4),(112,1,4),(114,2,4),(115,4,4),(127,4,4),(130,3,4),(136,9,4),(152,6,4),(162,2,4),(168,2,4),(172,4,4),(178,1,4),(189,2,4),(194,4,4),(211,2,4),(212,8,4),(217,6,4),(224,4,4),(227,8,4),(228,3,4),(232,6,4),(243,8,4),(249,10,4),(254,9,4),(255,10,4),(261,9,4),(274,6,4),(278,3,4),(284,1,4),(295,6,4),(299,10,4),(313,5,4),(328,8,4),(330,2,4),(340,2,4),(344,2,4),(350,8,4),(360,4,4),(364,10,4),(379,3,4),(380,6,4),(393,10,4),(399,6,4),(403,1,4),(432,5,4),(435,10,4),(447,5,4),(448,6,4),(450,1,4),(454,2,4),(461,4,4),(465,3,4),(479,2,4),(482,6,4),(484,8,4),(490,2,4),(491,8,4),(493,8,4),(498,2,4),(501,6,4),(503,10,4),(505,10,4),(512,5,4),(514,8,4),(515,9,4),(517,8,4),(524,7,4),(530,8,4),(535,4,4),(537,8,4),(548,5,4),(560,4,4),(574,5,4),(576,6,4),(580,4,4),(582,6,4),(584,2,4),(588,6,4),(590,10,4),(599,3,4),(600,9,4),(611,4,4),(628,1,4),(636,4,4),(641,2,4),(643,7,4),(664,3,4),(665,7,4),(666,2,4),(670,1,4),(678,7,4),(683,1,4),(688,9,4),(689,1,4),(693,2,4),(694,6,4),(707,10,4),(713,1,4),(739,9,4),(743,9,4),(747,1,4),(753,9,4),(762,4,4),(763,9,4),(771,8,4),(772,10,4),(790,10,4),(792,4,4),(809,7,4),(812,9,4),(819,8,4),(823,4,4),(827,6,4),(848,1,4),(853,10,4),(855,6,4),(872,4,4),(878,3,4),(883,6,4),(885,1,4),(889,5,4),(893,10,4),(898,8,4),(901,5,4),(915,7,4),(920,10,4),(921,8,4),(925,4,4),(936,4,4),(939,4,4),(945,6,4),(953,7,4),(958,1,4),(959,6,4),(978,8,4),(980,5,4),(984,8,4),(986,1,4),(992,3,4);
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
  `Warranty_type` varchar(50) DEFAULT NULL,
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
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`Salesperson_EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
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
  `Name` varchar(20) DEFAULT NULL,
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

-- Dump completed on 2022-11-17  0:06:18
