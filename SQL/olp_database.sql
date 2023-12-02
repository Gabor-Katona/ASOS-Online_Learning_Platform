-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: olp
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.20.04.1

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
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_content_courses` (`course_id`),
  CONSTRAINT `FK_content_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (2,2,'image','text of the page'),(3,2,'text','text of the page2'),(5,3,'text','text of the page3');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (2,'myName','my course'),(3,'myName','my course2');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` char(40) NOT NULL,
  `lastname` char(40) NOT NULL,
  `username` char(20) NOT NULL,
  `email` char(40) NOT NULL,
  `pw` char(100) NOT NULL,
  `role` char(15) NOT NULL,
  `token` char(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin1','admin1','admin1','admin1@admin.com','$2a$10$CZKeUjwrqb5zx/hk3SryFO5TNkcDCHpnP/xpyM/drd0eA5GOw5kj6','admin','eb97ef6ddb9a4eb275a0747278f3295198a3ad30'),(2,'teacher1','teacher1','teacher1','teacher1@teacher.com','$2a$10$mjhpgXFdN3muFnbUX8pzn.YvCQXzgX4DEy8xO/9HS9VfdZgBIqtr2','teacher','0f3ac0b52677e45e46d987c921f71fc8b3aba2a1'),(3,'student1','student1','student1','student1@student.com','$2a$10$rQToWGCGvkQ1dj16DqORpeaYbThl8YpngjowicDYJHptBB6bsmgZ6','student','b8ddd473d90bf400ae751df0532b44b7e6abc0d4');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `testid` int unsigned NOT NULL,
  `text` text NOT NULL,
  `answera` text NOT NULL,
  `answerb` text NOT NULL,
  `answerc` text NOT NULL,
  `goodanswer` text NOT NULL,
  `goodansval` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_test` (`testid`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (42,5,'ot 2 - C','ju','srt','ate','q2a3','ate'),(43,5,'ot 3 - B','bsdf','bdf','sad','q3a2','bdf'),(44,5,'ot 4 - B','uhgm','mgj','gmjnvcx','q4a2','mgj'),(45,5,'ot 5 - A','gf','nfxnxfn','h gn gc ','q5a1','gf'),(46,5,'ot 6 - A','bsgbsb','gsdbs223','bsggfdgfg','q6a1','bsgbsb'),(47,5,'ot 7 - B','bg','oio','opuo','q7a2','oio'),(48,5,'ot 8 - C','bd c b','cbvx f','xx cv b','q8a3','xx cv b'),(49,5,'ot 9 - A','vfds','bgs','k,jb','q9a1','vfds'),(50,5,'ot 10 - C','jmgfd','f fdsg fd','Rambo 3','q10a3','Rambo 3'),(51,6,'fgsndjdnhgaf - C','bgsnn','bsfb','gbsf','q1a3','gbsf'),(52,6,'bsdgb sgdbgdbs - B','gteh','wrth','wrtfdwf dfw ','q2a2','wrth'),(53,6,'vsgareg - A','vesfb','sb','ab','q3a1','vesfb'),(54,6,'nhtmehnrgbfvd fbaefb - A','wnrh te','gsetht sdetgbtetb','dgsfbgg','q4a1','wnrh te'),(55,6,'agdhfsdfdsacv asfads vfv - B','geg','gega','geag','q5a2','gega'),(56,6,'raebebatbe - A','dg bd','sbg','gsd','q6a1','dg bd'),(57,6,'bsgdabbsgfbgd - C','ea','sgbgnh','nmfh','q7a3','nmfh'),(58,6,'fvsdfgrfeqfds - A','gtrwbg','brnbr','br','q8a1','gtrwbg'),(59,6,'rsgntnhtergwd gr - B','gegt','ewhb','hwrthr','q9a2','ewhb'),(60,6,'gewbngrfefddvfvbcxgdsfbg4ny5 - C','b srgbf','ndh he f n',' bsrgf gb gs y','q10a3',' bsrgf gb gs y'),(71,9,'test','faebsgabf','badb','badbngd sg','q1a3','badbngd sg'),(72,9,'nsbr dgb',' dsb gfbg','f sb dg b','nbs hfnf','q2a3','nbs hfnf'),(73,9,'s gdhd h','tgshdgh','gsdhgd','hs  t','q3a1','tgshdgh'),(74,9,'sht rr',' dfhbadf','agdb fgn hf',' fnhs g','q4a2','agdb fgn hf'),(75,9,'h raetdftb','hged f','ghr thgh ','gdf gw ','q5a1','hged f'),(76,9,'gs tgae fg','e dgs df','hs dh','jmd ghn ','q6a3','jmd ghn '),(77,9,'nd hgsf',' gshgfds f','sd fgd','sd fg','q7a3','sd fg'),(78,9,'hysr ',' shghdafdb','nshgng','eda','q8a2','nshgng'),(79,9,'df g efg ','h sdhgd','hdgs h','s tdh','q9a3','s tdh'),(80,9,'fd sahs','fhds h','dg shgh','sdh hs ghdaghgdaah gh','q10a2','dg shgh'),(81,10,'gfbgdsa','fgv','mjum,','kjhfsagh aghg ','q1a2','mjum,'),(82,10,'s nhgsd hga','h gsfn h  h',' n shfmnsjh md','jsgdfh asgdfh','q2a2',' n shfmnsjh md'),(83,10,'h ndmnravc v dfghfg','nhh jm','m dgjtm','hnd hjsf','q3a3','hnd hjsf'),(84,10,'h srfgh adg','h gjdfhmjg m','h jsdfgsfvghnb ','gnh hhf','q4a3','gnh hhf'),(85,10,' jhfgh aefnmjhmjm',' ghfjgdash gfbvdbs vdsb ','gmkjhdg,f gmhd','j ,mddjy,m jm','q5a3','j ,mddjy,m jm'),(86,10,'yj gthsgfd shf','hg jhnfgn','mghjm jjhgmd','tgg hmnhds','q6a1','hg jhnfgn'),(87,10,' hgsd ghn ','sfg ngfn',' fgn fgh','n dsfghmn dgjmdfsag ','q7a2',' fgn fgh'),(88,10,'s ngfdnbs gfhnhf','hn gdhnmsgdhnb zf','nhsfghjra','hjgds rsadfg hfh','q8a2','nhsfghjra'),(89,10,' hfghs vbn ','vfsgn sfn','hfmjgdm,afdgsnv gfn','fhgjtsmhjmkarjshgjn fsd','q9a1','vfsgn sfn'),(90,10,'hns rjhsgd nhsfgmn gfhsm fhsm f','hjkmgdhh,mfshfgad g','gan gj,mjk,mjj',',m hfjk,sfdg ds','q10a3',',m hfjk,sfdg ds'),(121,14,'Aký je hlavný médiun používaný v komunikácii pomocou viditeľného svetla (VLC)? -B','Rádiové vlny','Infrčervené svetlo','Mikrovlnné signály','q1a2','Infrčervené svetlo'),(122,14,'Ktorá technológia sa často používa na moduláciu údajov v systémoch VLC? -A','Amplitúdová modulácia','Frekvenčná modulácia','Fázová modulácia','q2a1','Amplitúdová modulácia'),(123,14,'Aká je výhoda používania LED diód v VLC oproti tradičným svetelným zdrojom? -B','Vyššia spotreba energie','Rýchlejšie prepínanie schopností','Obmedzený rozsah farieb','q3a2','Rýchlejšie prepínanie schopností'),(124,14,'Akú rolu zohráva fotodetektor v komunikačnom procese VLC? -B','Odosielanie údajov','Prijímanie a detekcia svetelných signálov','Generovanie svetelných vĺn','q4a2','Prijímanie a detekcia svetelných signálov'),(125,14,'Čo je hlavným problémom v komunikácii VLC v porovnaní s technológiami rádiových frekvencií? -B','Obmedzený prenosový pás','Náchylnosť na rušenie','Dlhý dosah','q5a2','Náchylnosť na rušenie'),(126,14,'Ktorý faktor NEovplyvňuje výkon komunikácie VLC v interiéri? -C','Odraz','Pohlcovanie','Magnetické pole Zeme','q6a3','Magnetické pole Zeme'),(127,14,'Aká je potenciálna aplikácia komunikácie viditeľného svetla v chytrých domácnostiach? -B','Mikrovlnné varenie','Li-Fi pre internetové pripojenie','Infrčervené diaľkové ovládanie','q7a2','Li-Fi pre internetové pripojenie'),(128,14,'Aký je význam priamkového pohľadu (LOS) v systémoch VLC? -B','Priamkový pohľad nie je potrebný pre VLC','Zabezpečuje neprerušenú komunikáciu','Priamkový pohľad ovplyvňuje len zvukové signály','q8a2','Zabezpečuje neprerušenú komunikáciu'),(129,14,'Ktorá farba svetla sa často používa v VLC kvôli jej stabilite a viditeľnosti? -C','Červená','Zelená','Modrá','q9a3','Modrá'),(130,14,'Aký je potenciálny prospech z integrovania VLC do systémov vnútorného určovania polohy? -B','Znížená presnosť','Imunita voči prekážkam','Obmedzený rozsah pokrytia','q10a2','Imunita voči prekážkam'),(131,15,'Aký je hlavný médium používané pre komunikáciu pomocou viditeľného svetla? -C','Rádiové vlny','Infrčervené svetlo','Biele svetlo','q1a3','Biele svetlo'),(132,15,'Ktorá technológia sa bežne používa pre moduláciu vo viditeľnej svetelnej komunikácii? -C','Modulácia amplitúdy','Modulácia frekvencie','Modulácia šírky impulzu','q2a3','Modulácia šírky impulzu'),(133,15,'V akom rozsahu viditeľného spektra sa bežne používa pre komunikáciu vo viditeľnej svetelnej komunikácii? -C','Ultrafialové','Infrčervené','Červené až modré','q3a3','Červené až modré'),(134,15,'Aká je hlavná výhoda viditeľnej svetelnej komunikácie oproti tradičným bezdrôtovým technológiám? -A','Vyššie prenosové rýchlosti','Väčší dosah','Nižšia spotreba energie','q4a1','Vyššie prenosové rýchlosti'),(135,15,'Ktorý komponent je nevyhnutný pre bezdrôtovú komunikáciu pomocou viditeľného svetla? -C','Fotodetektor','Solárny panel','Fotodióda','q5a3','Fotodióda'),(136,15,'Aká je hlavná výzva vo viditeľnej svetelnej komunikácii, pokiaľ ide o udržiavanie stabilného spojenia? -B','Rušenie zo strany rádiových signálov','Citlivosť na poveternostné podmienky','Ohraničená plocha pokrytia','q6a2','Citlivosť na poveternostné podmienky'),(137,15,'Ktorá modulačná schéma sa bežne používa pre reguláciu stmievania vo viditeľnej svetelnej komunikačných systémoch? -B','Quadrature Amplitude Modulation (QAM)','On-Off Keying (OOK)','Frequency Shift Keying (FSK)','q7a2','On-Off Keying (OOK)'),(138,15,'Aká je typická rýchlosť prenosu dát dosiahnuteľná pomocou viditeľnej svetelnej komunikácie? -A','Megabitov za sekundu','Kilobitov za sekundu','Gigabitov za sekundu','q8a1','Megabitov za sekundu'),(139,15,'Ktorá aplikácia NIE JE bežným prípadom použitia viditeľnej svetelnej komunikácie? -C','Určovanie polohy v interiéri','Pripojenie k internetu vecí (IoT)','Komunikácia vo vesmíre','q9a3','Komunikácia vo vesmíre'),(140,15,'Akú úlohu zohráva svetelný vysielač vo viditeľnej svetelnej komunikácii? -B','Prijímanie dát','Odosielanie dát','Filtrácia dát','q10a2','Odosielanie dát');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `course` varchar(20) NOT NULL,
  `testtitle` varchar(200) NOT NULL,
  `points` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_result` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,'admin1','courseA','novy test ',10),(2,'admin1','courseA','novy test',7),(4,'teacher1','course2','Dalsi test na debug',9),(13,'admin1','courseA','novy test ',7),(15,'student1','courseA','novy test ',9),(16,'student1','course2','Dalsi test na debug',6),(17,'student1','course1','test for test from teacher1',6),(31,'jakub','course1','novy test A ',5),(33,'admin1','course2','Dalsi test na debug',0),(34,'admin1','lifi','Ľahký test pre kurz LI-FI',7),(35,'student1','lifi','Ľahký test pre kurz LI-FI',7),(36,'admin1','lifi','Ľahký test pre kurz LI-FI',8);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `course` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (5,'admin1','novy test A ','course1'),(6,'admin1','Dalsi test na debug','course2'),(9,'teacher1','test for test from teacher1','course1'),(10,'admin1','New test for LiFi','course2'),(14,'admin1','Ľahký test pre kurz LI-FI','lifi'),(15,'admin1','Ľahký test pre VLC','vlc');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-02 14:38:47
