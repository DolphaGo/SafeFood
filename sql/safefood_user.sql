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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pass` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `allergy` text CHARACTER SET utf8 COLLATE utf8_bin,
  `filename` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('dlgns','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','이훈','싸피','010-1234-1234','대두, 우유, 게, 새우, 참치, 연어, 쑥, 소고기, 닭고기','19이훈.png'),('dmswn','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','최은주','필리핀','010-1234-1234','땅콩, 우유, 쑥, 소고기, 계란흰자','24최은주.png'),('dohatest','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','김도하테스트','서울','010-123123','대두, 땅콩','도하테스트.JPG'),('dominjun','9d1b478efb180d2cfe0d47c821d6123fd6786efedcc1bca4a5f8252ed36ca75a','도민준','별','000-0000-0000','대두, 쑥, 닭고기','dominjoon3.JPG'),('ektmf','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','이다슬','SSAFY','010-1234-1234','새우, 참치, 닭고기, 돼지고기','15이다슬.png'),('gksmf','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','이하늘','백트래킹하우스','010-1234-1234','대두, 참치, 돼지고기','18이하늘.png'),('gkwjd','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','정하정','싸피','010-1234-1234','대두, 땅콩, 우유, 게, 새우, 참치, 연어','22정하정.png'),('rbgml','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','윤규희','싸피','010-1234-1234','대두, 소고기, 닭고기, 돼지고기','14윤규희.png'),('rjsgml','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','윤건희','싸피','010-1234-1234','대두, 땅콩, 새우, 참치','13윤건희.png'),('rldus','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855','한기연','싸피','010-1234-1234','땅콩, 우유, 게, 연어','25한기연.png'),('ssafy','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','운영자','서울특별시','010-4201-4246','대두, 닭고기, 민들레','1000song2.JPG'),('ssafy1','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','권혁진','부산','010-1234-1234','게, 새우, 돼지고기','11.png'),('ssafy10','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','신채민','안암','010-4201-4246','참치, 연어, 민들레, 계란흰자','10.png'),('ssafy11','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','오충현','서울','010-1234-1234','우유, 게, 돼지고기, 복숭아','111.png'),('ssafy12','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','원범희','서울','010-1234-1234','대두, 소고기, 닭고기, 돼지고기','12.png'),('ssafy2','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','김도하','수원시','010-1234-1234','대두, 땅콩, 소고기, 닭고기','2.png'),('ssafy3','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','김민수','인천','010-1234-1234','대두, 연어, 돼지고기','3.png'),('ssafy4','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','김신재','안산','010-1234-1234','소고기, 돼지고기, 복숭아','4.png'),('ssafy5','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','김영연','서울','010-1234-1234','복숭아, 민들레, 계란흰자','5.png'),('ssafy6','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','김혜정','전주','010-1234-1234','게, 새우, 닭고기, 민들레','6.png'),('ssafy7','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','서현욱','김해','010-1234-1234','땅콩, 참치, 닭고기, 복숭아','7.png'),('ssafy8','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','송다은','서울','010-1234-1234','참치, 연어, 닭고기, 돼지고기','8.png'),('ssafy9','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','신상엽','건대','010-1234-1234','대두, 땅콩, 우유, 게, 새우, 소고기, 닭고기, 돼지고기, 복숭아','9.png'),('tjdnjs','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','조서원','SSAFY','010-1234-1234','대두, 땅콩, 우유, 게, 새우, 참치','23조서원.png'),('tjsdn','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','임선우','SSAFY','010-1234-1234','땅콩, 쑥','20임선우.png'),('tnals','18512bd994734f052b285211480f5553ab22865b8ded68b9e0f667051c177ea3','전지현','수원','010-1234-1234','대두, 우유, 연어, 쑥, 닭고기, 돼지고기, 계란흰자','1000song21.JPG'),('wjdgh','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','황정호','서울시','010-1234-1234','대두, 땅콩, 게','26황정호.png'),('wodms','dc2bb0b1a9619b3d4a966b59111ff70076316c239b61c1f783a19745a12d66ab','이재은','SK','010-1234-1234','대두, 닭고기, 돼지고기, 민들레','17이재은.png'),('xorwls','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855','정택진','싸피','010-1234-1234','대두, 땅콩, 우유, 게, 새우, 연어, 쑥, 소고기, 닭고기, 돼지고기, 복숭아, 민들레, 계란흰자','xorwls.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-29 15:24:51
