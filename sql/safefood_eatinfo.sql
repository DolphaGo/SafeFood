-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: safefood
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `eatinfo`
--

DROP TABLE IF EXISTS `eatinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `eatinfo` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `edate` date NOT NULL,
  `code` int(11) NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `code_idx` (`code`),
  KEY `id_idx` (`id`),
  CONSTRAINT `code` FOREIGN KEY (`code`) REFERENCES `food` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eatinfo`
--

LOCK TABLES `eatinfo` WRITE;
/*!40000 ALTER TABLE `eatinfo` DISABLE KEYS */;
INSERT INTO `eatinfo` VALUES (31,'tnals','2019-11-29',1),(32,'tnals','2019-11-29',2),(33,'tnals','2019-11-29',3),(34,'tnals','2019-11-29',7),(35,'tnals','2019-11-29',16),(36,'tnals','2019-11-28',14),(37,'tnals','2019-11-28',7),(48,'dominjun','2019-11-28',1),(49,'dominjun','2019-11-29',2),(50,'dominjun','2019-11-30',18),(51,'dominjun','2019-11-29',1);
/*!40000 ALTER TABLE `eatinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-29 15:24:50
