-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: airline
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `airpot`
--

DROP TABLE IF EXISTS `airpot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airpot` (
  `airpotid` int(11) NOT NULL,
  `airpotname` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`airpotid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airpot`
--

LOCK TABLES `airpot` WRITE;
/*!40000 ALTER TABLE `airpot` DISABLE KEYS */;
INSERT INTO `airpot` VALUES (104,'AirAsia','uk'),(105,'AirCanda','usa'),(116,'DeltaAirLines','Bombay'),(192,'AmericanAirlines','USA'),(198,'jetBlueAirways','UK'),(211,'DeltaAirLines','France'),(409,'UnitedAirlines','USA'),(502,'AirCanda','kagwad'),(805,'AirAsia','India'),(900,'DeltaAirLines','US'),(901,'UnitedAirlines','uk');
/*!40000 ALTER TABLE `airpot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `eid` int(11) NOT NULL,
  `ename` varchar(45) NOT NULL,
  `contactno` int(11) NOT NULL,
  `address` varchar(45) NOT NULL,
  `post` varchar(45) NOT NULL,
  `salary` int(11) NOT NULL,
  `nationality` varchar(45) NOT NULL,
  `airpotid` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `airpotid_idx` (`airpotid`),
  CONSTRAINT `airpotid` FOREIGN KEY (`airpotid`) REFERENCES `airpot` (`airpotid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (701,'John',13245,'731,fondren,houstan','flight attendent',30000,'France',211),(702,'James',78996,'638,voss,houstan','technician',40000,'Finland',104),(703,'Jennifer',46512,'3321,castle,spring','airhostess',25000,'America',409),(704,'Franklin',79845,'291,berry,bellaire','pilot',43000,'Germany',198),(705,'Ricky',96321,'975,fire oak,humble','flight instructer',38000,'America',409),(706,'Arjun',12345,'5631,rice,houstan','air traffic controller',25000,'India',805),(707,'Peter',85236,'980,dallas,houstan','passenger service agent',25000,'India',805);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight` (
  `FlightNo` int(11) NOT NULL,
  `FlightName` varchar(45) NOT NULL,
  `airpotid` int(11) NOT NULL,
  `AFrom` varchar(45) NOT NULL,
  `ATo` varchar(45) NOT NULL,
  `Departuredate` date NOT NULL,
  `AirvalDate` date NOT NULL,
  PRIMARY KEY (`FlightNo`,`airpotid`),
  KEY `airpotid_idx` (`airpotid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (10,'Spicejet',104,'Madras','Canada','2018-11-01','2018-11-02'),(11,'AirIndia',409,'Banglore','USA','2017-12-15','2017-12-16'),(12,'IndiGo',192,'Banglore','Bombay','2018-09-16','2018-09-17'),(17,'FlyDubai',805,'Dubai','Banglore','2018-10-20','2018-10-21'),(28,'BritishAirways',192,'USA','Bombay','2018-10-12','2018-10-13'),(61,'IndiGo',211,'Banglore','France','2018-07-02','2018-07-04'),(91,'jetAirways',198,'Delhi','Thiland','2017-12-01','2017-12-02'),(101,'BritishAirways',211,'England','Bombay','2018-04-20','2018-05-10');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `Phoneno` int(11) NOT NULL,
  `FlightNo` int(11) NOT NULL,
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `p_id_UNIQUE` (`p_id`),
  KEY `FlightNo_idx` (`FlightNo`),
  CONSTRAINT `FlightNo` FOREIGN KEY (`FlightNo`) REFERENCES `flight` (`FlightNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Dheeraj','Male',886130126,28),(2,'Deeksha','Female',805011506,11),(3,'Darshan','Male',974613558,61),(4,'Poonam','Female',974868456,91),(5,'Shubham','Male',974868489,28),(6,'Pooja','Female',974855896,10),(7,'patil','male',123546789,10),(8,'Kiran','Male',97585444,11),(9,'daya','Female',7466923,10);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `tid` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `FlightNo` int(11) NOT NULL,
  `airpotid` int(11) NOT NULL,
  `seatclass` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`tid`,`p_id`,`FlightNo`,`airpotid`),
  KEY `p_id_idx` (`p_id`),
  KEY `FlightNo_idx` (`FlightNo`),
  KEY `airpotid_idx` (`airpotid`),
  CONSTRAINT `p_id` FOREIGN KEY (`p_id`) REFERENCES `passenger` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1431,4,91,409,'first class',21000),(1432,3,61,198,'BusinessClass',11000),(1433,6,10,211,'BusinessClass',11000),(1434,1,28,104,'premium class',8000),(1435,2,11,805,'premium class',8000),(1436,7,61,409,'Economyclass',5000),(1437,1,91,409,'BusinessClass',11000);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-08 20:21:22
