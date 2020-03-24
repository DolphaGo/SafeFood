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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL,
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `wdate` date NOT NULL,
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `qid_idx` (`qid`),
  KEY `id4` (`id`),
  CONSTRAINT `id4` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `qid` FOREIGN KEY (`qid`) REFERENCES `qna` (`qid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (51,19,'dominjun','2019-11-29','안녕하세요'),(52,17,'dominjun','2019-11-29','음..ㅋㅋ'),(54,17,'tnals','2019-11-29','ㅋㅋㅋㅋㅋㅋ');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `follow` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `follow` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `follower` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fid`),
  KEY `follow` (`follow`),
  KEY `follower` (`follower`),
  CONSTRAINT `follow` FOREIGN KEY (`follow`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `follower` FOREIGN KEY (`follower`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (3,'dmswn','tnals'),(5,'rbgml','tnals'),(6,'ssafy10','tnals'),(7,'ssafy6','tnals'),(8,'wodms','tnals'),(11,'ssafy1','tnals'),(17,'tnals','rbgml'),(18,'dlgns','ssafy2'),(19,'gksmf','ssafy2'),(20,'ssafy','ssafy2'),(21,'ssafy9','ssafy2'),(22,'xorwls','ssafy2'),(23,'ektmf','ssafy2'),(24,'ssafy2','ssafy1'),(25,'ssafy2','ssafy3'),(26,'ssafy2','ssafy9'),(27,'ssafy2','ssafy8'),(28,'ssafy2','ssafy4'),(29,'ssafy','dominjun'),(30,'ssafy10','dominjun'),(31,'ssafy11','dominjun'),(33,'ssafy9','dominjun'),(34,'tnals','dominjun');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
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
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `food` (
  `code` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `supportpereat` double DEFAULT NULL,
  `calory` double DEFAULT NULL,
  `carbo` double DEFAULT NULL,
  `protein` double DEFAULT NULL,
  `fat` double DEFAULT NULL,
  `sugar` double DEFAULT NULL,
  `natrium` double DEFAULT NULL,
  `chole` double DEFAULT NULL,
  `fattyacid` double DEFAULT NULL,
  `transfat` double DEFAULT NULL,
  `maker` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `material` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `allergy` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `count` int(3) DEFAULT '0',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '간식',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'신라면큰사발',80,347.37,54.74,5.61,11.93,2.81,1087.72,0,5.61,0,'농심','육수맛조미베이스,소맥분(호주산,미국산),버섯풍미분말,감자전분(독일산),정백당,팜유(말레이시아산),변성전분,복합조미간장분말,난각칼슘,매운탕분말,정제염,정제염,비프조미페이스트,사골된장분말,비프조미분,이스트조미액,포도당,면류첨가알칼리제 ( 산도조절제 ),생고추조미분말,혼합제제 ( 산도조절제 ),칠리맛조미분,올리고녹차풍미액,양념구이조미분,비타민B₂,볶음양념분,수육조미분,호화감자전분,조미양념분,마늘추출물분말,후추가루,분말된장,5-리보뉴클레오티드이나트륨,양파풍미분,사골추출물분말,육수조미분말,양파조미베이스,호박산이나트륨,장국양념분말,다시마정미추출분말,매운맛조미분,고춧가루,분말카라멜 ( 카라멜색소 , 물엿분말 ),생강추출물분말,건표고버섯,건파,건청경채,조미건조홍고추','img/신라면큰사발.jpg','',8,'식사'),(2,'진라면컵매운맛',80,275.2,42.24,5.76,8.96,3.2,1139.2,0,3.2,0,'오뚜기','참맛매운육수분말,소맥분(미국산,호주산),변성전분,포도당,발효복합분,팜유(말레이시아산),진한감칠맛분,글루텐,숙성마늘맛분,정제소금,마늘양념분말,유화유지,난각분말,볶음마늘분,치킨추출농축액,백설탕,마늘시즈닝,간장분말,야채추출물,식용유지가공품,면류첨가알칼리제 ( 산도조절제 ),정제소금,비타민 B₂,효모조미분,칠리맛분말,녹차풍미유,전분,쇠고기간장분말,쇠고기향미분말,후추분말,고춧가루,구아검,조미아미노산분말,향미증진제,칠리추출물,고추농축소스,산도조절제,건파,조미쇠고기맛후레이크,건당근,건표고버섯,건조채심,건고추입자,[ 소맥분 ( 밀 ), 탈지대두 ( 대두 ), 유당 ( 우유 ), 난각분말 ( 계란 ), 땅콩단백 ( 땅콩 ), 돈골 ( 돼지고기 )]','img/진라면컵매운맛.jpg','대두, 땅콩, 우유, 돼지고기',22,'식사'),(3,'큰컵삼양라면',80,272.7,42.88,4.99,8.9,2.24,940.54,0,4.48,0,'삼양식품','볶음면조미분말,소맥분(미국산,호주산),부대찌개베이스,전분(태국산),팜유,설탕,정제염,정제염,맛베이스에스,미감에스유,식물성간장분말,면류첨가알칼리제 ( 산도조절제 ),감자전분,양파엑기스,양념간장분,구아검,지미맛분말,비타민B₂,구연산,햄풍미분말,육수맛분말,녹차풍미유,김치조미분말,돈육풍미분말,볶음양념분말,혼합양념분말,진사골추출물분말,전지분유,팜유,부대찌개분말,쇠고기양념분말,저염풍미분에스,후추분,향미증진제,매운조미고추맛분,김치찌개풍미분말,베이컨향분말,햄베이스시즈닝,파프리카추출색소,마늘맛오일,조미콩단백,실당근,건청파,청경채,고단백건조유부,{ 소맥분 ( 밀 ), 탈지대두 ( 대두 ), 돼지고기 , 전지분유 ( 우유 ), 계란 , 땅콩 }','img/큰컵삼양라면.jpg','대두, 땅콩, 우유, 돼지고기',6,'식사'),(4,'새우탕큰사발',80,372,48.16,7.68,15.76,0,1876,0,0,0,'농심','소맥분(호주산,미국산),감자전분(독일산),팜유,변성전분,식물성풍미유,난각칼슘,정제염,야채조미추출물,면류첨가알칼리제 ( 산도조절제 ),혼합제제 ( 산도조절제 ),올리고녹차풍미액,비타민B₂,새우베이스분말,정제염,정백당,육수베이스분말,매운맛분말,조미양념분,매운탕조미분말,호화옥수수분,육수맛조미베이스,오징어조미분말,오징어풍미분말,양념구이조미분,5-리보뉴클레오티드이나트륨,분말고추장,이스트풍미분,호박산이나트륨,복합조미간장분말,분말카라멜 ( 카라멜색소 , 물엿분말 ),다시마정미추출분말,혼합해물베이스분말,멸치조미분,향신조미분,후추가루,다시마표고조미분,수화검 ( 구아검 , 산탄검 ),후추추출물분말,어포,새우맛볼,건미역,건당근,건새우,새우 ( 중국산 58.1% , 캐나다산 41.0% , 국내산 0.9% )','img/새우탕큰사발.jpg','새우',12,'식사'),(5,'육개장큰사발면',80,273.45,42.47,5.24,9.31,1.75,936.73,0,4.65,0,'농심','육개장조미료,소맥분(호주산,미국산),팜유(말레이시아산),정제염,양념간장베이스,감자전분,변성전분,조미아미노산간장분말,정백당,식물성풍미유,물엿분말,난각칼슘,양념풍미분,정제염,볶음양념분,면류첨가알칼리제 ( 산도조절제 ),육수조미분말,비프양념분말,혼합제제 ( 산도조절제 ),간장조미액,마늘추출물분말,복합양념분말,구아검,올리고녹차풍미액,팜유조미분말,이스트풍미분,비타민B₂,후추가루,매운맛조미분,5-리보뉴클레오티드이나트륨,분말고추장,양파풍미분,수육조미분,호박산이나트륨,칠리풍미분말,복합조미간장분말,건파,계란스크램블,건조맛살어묵,소용돌이맛살','img/육개장큰사발면.jpg','',2,'식사'),(6,'메로나',100,156.25,25,1.25,6.25,20,68.75,18.75,4.75,0.63,'빙그레','정제수,백설탕,데어리스프레드 (외국산:뉴질랜드,독일,호주),프락토올리고당,물엿,혼합탈지분유 ( 외국산 :네덜란드,아일랜드,독일),말티톨시럽,메론시럽 0.15% ( 메론 70% : 국산 ),정제염,로커스트콩검,셀룰로오스검,혼합제제 ( 구아검 , 로커스트콩검 , 카라기난 , 셀룰로오스검 , 유화제 ),치자청색소,심황색소,합성착향료 ( 메론향 )','img/메로나.jpg','',3,'간식'),(7,'누크바',100,274,25,3,18.3,17.33,65,0,0,0,'롯데제과','정제수,기타코코아가공품[야자유(수입산),백설탕,채종유(호주산),땅콩버터,혼합분유,코코아매스],백설탕,혼합분유(수입산;탈지분유,유청분말),기타올리고당 ( 물엿 , 이소말토올리고당 , 액상과당 ),땅콩(중국산),가공버터 ( 유크림 , 야자유 ),아이스혼합유 ( 야자유 80% , 팜유 20% ),혼합제제Ⅰ ( 구아검 , 로커스트콩검 , 카라기난 , 타마린드검 ),천연착향료 ( 바닐라향 ),유화제,합성착향료 ( 바닐라향 ),혼합제제Ⅱ ( 치자황색소 , 덱스트린 , 비트레드 )','img/N45누크바.jpg','땅콩',13,'간식'),(8,'비비빅',100,186.67,40,3.33,1.6,21.25,106.67,6.67,1.07,0,'빙그레','정제수,당통팥22%(중국산: 백설탕 , 팥 ),백설탕,물엿,팥분말(중국산),혼합탈지분유,데어리스프레드,액상과당,찰옥수수알파전분,유청분말,정제염,구아검,락색소,카라멜색소,합성착향료 ( 팥향 ),치자청색소','img/비비빅.jpg','',3,'간식'),(9,'수박바',100,110.93,24.67,0.33,2.24,18.67,25.83,0.09,1.11,0.17,'롯데제과','정제수,백설탕,프락토올리고당,초코땅콩 ( 땅콩 ),폴리덱스트로스,말티톨시럽,아이스혼합유,유화제,혼합제제 ( 구아검 ( 대두 ), 카라기난 , 산도조절제 , 로커스트콩검 , 타마린드검 ),수박농축액 0.1% ( 고형분 65% ),합성착향료 ( 딸기향 , 멜론향 ),정제소금,혼합제제II ( 비트레드 , 덱스트린 , 치자황색소 ),비타민C,구연산,혼합제제III ( 치자청색소 , 치자황색소 , 덱스트린 )','img/수박바.jpg','대두, 땅콩',1,'간식'),(10,'죠스바',100,113.33,28.4,0.04,0.09,20,0.68,0,0,0.17,'롯데제과','정제수,프락토올리고당,백설탕,기타올리고당 ( 물엿 , 이소말토올리고당 , 액상과당 ),딸기쨈3%(딸기;국산),구연산,오렌지농축액0.14%(고형분65%),합성착향료 ( 딸기향 , 오렌지향 ),혼합제제Ⅰ ( 카라기난 , 구아검 ( 대두 ), 산도조절제 , 로커스트콩검 , 타마린드검 ),혼합제제Ⅱ ( 구아검 , 카라기난 , 산도조절제 , 로커스트콩검 , 타마린드검 ),혼합제제Ⅲ ( 유화제 , 탄산칼슘 , 규소수지 ),비타민C,혼합제제Ⅳ ( 덱스트린 , 치자청색소 , 홍국적색소 , 치자황색소 ),혼합제제Ⅴ ( 비트레드 , 덱스트린 , 치자황색소 )','img/죠스바.jpg','대두',1,'간식'),(11,'서울우유바나나',200,340,44,10,14,40.44,170,40,8,0,'서울우유','원유 60.12%(국산),정제수,액상과당,정백당,유크림 2.93%(국산),탈지분유 2.143%,바나나농축과즙(바나나과즙 1%,이스라엘산),올리고당,합성착향료 ( 바나나향 )','img/서울우유바나나.jpg','',36,'간식'),(12,'맛있는우유GT',200,280,20,12,16,18,200,60,9.6,0,'남양유업','1A등급 원유 ( 국산 ) 100% ( 세균수기준 )','img/맛있는우유GT.jpg','',2,'간식'),(13,'칠성사이다',200,168.42,42.11,0,0,33.6,10.53,0,0,0,'롯데칠성음료','정제수,액상과당,백설탕,탄산가스,구연산,레몬라임향','img/칠성사이다.jpg','',0,'간식'),(14,'비타500칼슘',200,172.9,43,0.09,0.06,44,143.84,0,0,0,'광동제약','정제수,액상과당,농축사과과즙 ( 당도 72Brix이상 , 뉴질랜드산 ),비타민C 0.5% ( 900% ),퓨라칼 (칼슘12%이상)0.05%,합성착향료 ( 드링크향 ),구연산,케이디비타 2800,구연산삼나트륨,펙틴,타우린,DL-사과산,오렌지추출물','img/비타500칼슘.jpg','',2,'간식'),(15,'비타파워',200,100,24,0,0,12.55,60,0,0,0,'롯데제과','정제수,액상과당,비타민C,구연산,합성착향료 ( 드링크향 , 혼합과일향 ),구연산삼나트륨,효소처리스테비아,타우린,수크랄로스 ( 합성감미료 ),비타민B2인산에스테르나트륨','img/비타파워.jpg','',1,'간식'),(16,'칸타타아메리카노',200,80,18.29,0,0,13.72,125.71,0,0,0,'롯데제과','칸타타원두커피추출액30%(에티오피아50%,콜롬비아30%,브라질20%),정제수,백설탕,합성착향료 ( 커피향 ),탄산수소나트륨,L-아스코르빈산나트륨','img/칸타타아메리카노.jpg','',1,'간식'),(17,'칸타타프리미엄라떼',200,182.86,36.57,4.57,2.06,36.56,228.57,11.43,1.37,0,'롯데제과','칸타타원두커피추출액42%(에티오피아50%,콜롬비아30%,브라질20%),정제수,우유15%(국내산),백설탕,혼합분유 ( 탈지분유 , 유청분말 ),탄산수소나트륨,합성착향료 ( 커피향 , 우유향 ),유화제,L-아스코르빈산나트륨','img/칸타타프리미엄라떼.jpg','우유',2,'간식'),(18,'맥심티오피스위트아메리카노',200,70.4,17.6,0,0,16,52,0,0,0,'동서식품','맥심 에스프레소 커피추출액 ( 고형분 5.0%이상 ,커피원두:콜롬비아산60%,브라질산21%)12.6%,정제수,백설탕,탄산칼륨,합성착향료 ( 커피향 ),비타민C,자당지방산에스테르','img/맥심티오피스위트아메리카노.jpg','',0,'간식'),(19,'맥심티오피마스터라떼',200,156.4,26,3.2,4.4,26.2,72.73,16,3.2,0,'동서식품','정제수,우유 (국내산)15%,맥심 에스프레소 커피추출액 ( 고형분 5.0%이상 ,커피원두:콜롬비아산60%,브라질산21%)12.6%,백설탕,유크림,탈지분유,탄산칼륨,자당지방산에스테르,비타민C','img/맥심티오피마스터라떼.jpg','우유',1,'간식'),(20,'아카페라아메리카노',200,58.33,13.33,0.83,0,11.68,91.67,0,0,0,'빙그레','정제수,콜드브루커피추출액7%(고형분3%이상/커피원두:에티오피아40%,콜롬비아30%,브라질30%),백설탕,에스프레소커피추출액 1.54% ( 고형분 34%이상 /커피원두:브라질),탄산수소나트륨,아스코르빈산나트륨,천연커피향','img/아카페라아메리카노.jpg','',11,'간식');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
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
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notice` (
  `NID` int(11) NOT NULL AUTO_INCREMENT,
  `WDATE` date NOT NULL,
  `TITLE` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `COUNT` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`NID`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'2019-11-22','뭐야','정말',5,NULL),(75,'2019-11-22','테스트','테스트123',1,NULL),(76,'2019-11-22','테스트','테스트123',0,NULL),(77,'2019-11-22','테스트','테스트123',1,NULL),(78,'2019-11-22','테스트','테스트123',2,NULL),(79,'2019-11-22','테스트','테스트123',0,NULL),(80,'2019-11-22','테스트','테스트123',0,NULL),(81,'2019-11-22','테스트','테스트123',0,NULL),(82,'2019-11-22','테스트','테스트123',0,NULL),(83,'2019-11-22','테스트','테스트123',3,NULL),(84,'2019-11-22','테스트','테스트123',0,NULL),(85,'2019-11-22','테스트','테스트123',0,NULL),(86,'2019-11-22','테스트','테스트123',0,NULL),(87,'2019-11-22','테스트','테스트123',0,NULL),(88,'2019-11-22','테스트','테스트123',0,NULL),(89,'2019-11-22','테스트','테스트123',0,NULL),(90,'2019-11-22','테스트','테스트123',0,NULL),(91,'2019-11-22','테스트','테스트123',0,NULL),(92,'2019-11-22','테스트','테스트123',0,NULL),(93,'2019-11-22','테스트','테스트123',0,NULL),(94,'2019-11-22','테스트','테스트123',0,NULL),(95,'2019-11-22','테스트','테스트123',0,NULL),(96,'2019-11-22','테스트','테스트123',0,NULL),(97,'2019-11-22','테스트','테스트123',0,NULL),(98,'2019-11-22','테스트','테스트123',0,NULL),(99,'2019-11-22','테스트','테스트123',0,NULL),(100,'2019-11-22','테스트','테스트123',0,NULL),(101,'2019-11-22','테스트','테스트123',0,NULL),(102,'2019-11-22','테스트','테스트123',0,NULL),(103,'2019-11-22','테스트','테스트123',0,NULL),(104,'2019-11-22','테스트','테스트123',0,NULL),(105,'2019-11-22','테스트','테스트123',0,NULL),(106,'2019-11-22','테스트','테스트123',0,NULL),(107,'2019-11-22','테스트','테스트123',0,NULL),(108,'2019-11-22','테스트','테스트123',0,NULL),(109,'2019-11-22','테스트','테스트123',0,NULL),(110,'2019-11-22','테스트','테스트123',0,NULL),(111,'2019-11-22','테스트','테스트123',0,NULL),(112,'2019-11-22','테스트','테스트123',0,NULL),(113,'2019-11-22','테스트','테스트123',0,NULL),(114,'2019-11-22','테스트','테스트123',0,NULL),(115,'2019-11-22','테스트','테스트123',0,NULL),(116,'2019-11-22','테스트','테스트123',0,NULL),(117,'2019-11-22','테스트','테스트123',0,NULL),(118,'2019-11-22','테스트','테스트123',0,NULL),(119,'2019-11-22','테스트','테스트123',0,NULL),(120,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(121,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(122,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(123,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(124,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(125,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(126,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(127,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(128,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(129,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(130,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(131,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(132,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(133,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(134,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(135,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(136,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(137,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(138,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(139,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(140,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(141,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(142,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(143,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(144,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(145,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(146,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(147,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(148,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(149,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(150,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(151,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(152,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(153,'2019-11-25','안뇽','ㅎㅇㅎㅇ',1,NULL),(154,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(155,'2019-11-25','안뇽','ㅎㅇㅎㅇ',1,NULL),(156,'2019-11-25','안뇽','ㅎㅇㅎㅇ',1,NULL),(157,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(158,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(159,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(160,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(161,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(162,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(163,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(164,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(165,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(166,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(167,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(168,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(169,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(170,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(171,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(172,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(173,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(174,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(175,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(176,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(177,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(178,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(179,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(180,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(181,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(182,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(183,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(184,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(185,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(186,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(187,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(188,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(189,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(190,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(191,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(192,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(193,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(194,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(195,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(196,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(197,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(198,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(199,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(200,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(201,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(202,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(203,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(204,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(205,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(206,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(207,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(208,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(209,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(210,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(211,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(212,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(213,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(214,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(215,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(216,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(217,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(218,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(219,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(220,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(221,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(222,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(223,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(224,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(225,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(226,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(227,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(228,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(229,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(230,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(231,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(232,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(233,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(234,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(235,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(236,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(237,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(238,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(239,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(240,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(241,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(242,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(243,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(244,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(245,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(246,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(247,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(248,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(249,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(250,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(251,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(252,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(253,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(254,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(255,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(256,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(257,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(258,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(259,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(260,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(261,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(262,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(263,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(264,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(265,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(266,'2019-11-25','안뇽','ㅎㅇㅎㅇ',1,NULL),(267,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(268,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(269,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(270,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(271,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(272,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(273,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(274,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(275,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(276,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(277,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(278,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(279,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(280,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(281,'2019-11-25','안뇽','ㅎㅇㅎㅇ',1,NULL),(282,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(283,'2019-11-25','안뇽','ㅎㅇㅎㅇ',0,NULL),(284,'2019-11-25','안뇽','ㅎㅇㅎㅇ',3,NULL),(285,'2019-11-25','안뇽ㅋㅋ','ㅎㅇㅎㅇ',2,NULL),(287,'2019-11-26','안뇽','ddddd',0,NULL),(288,'2019-11-26','sdfASDF','asdfasdg',2,NULL),(289,'2019-11-26','안뇽','sdfasdf',2,'5860378092632627_1761841836.jpg'),(290,'2019-11-26','123','sadfasdgasd',3,'5860378092632627_1761841836.jpg'),(291,'2019-11-26','sdfghsdfg하늘아~~','sadfasdgdsdd',24,'2222.png'),(292,'2019-11-28','안뇽','~!~~~',7,NULL);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
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
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qna` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `wdate` date NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`qid`),
  KEY `id3_idx` (`id`),
  CONSTRAINT `id3` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (17,'rbgml','2019-11-29','안뇽','안녕하세요',4),(19,'dominjun','2019-11-29','프로젝트중입니다..','ㅎㅎㅎㅎ',4),(20,'tnals','2019-11-29','그럼 이제...ㅎㅎㅎ','안녕히!!',0);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
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
