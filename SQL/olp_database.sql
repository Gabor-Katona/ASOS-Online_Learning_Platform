-- --------------------------------------------------------
-- Hostiteľ:                     127.0.0.1
-- Verze serveru:                10.6.14-MariaDB - mariadb.org binary distribution
-- OS serveru:                   Win64
-- HeidiSQL Verzia:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportování struktury databáze pro
CREATE DATABASE IF NOT EXISTS `olp` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `olp`;

-- Exportování struktury pro tabulka olp.login
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` char(40) NOT NULL,
  `lastname` char(40) NOT NULL,
  `username` char(20) NOT NULL,
  `email` char(40) NOT NULL,
  `pw` char(100) NOT NULL,
  `role` char(15) NOT NULL,
  `token` char(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Exportování dat pro tabulku olp.login: ~3 rows (přibližně)
INSERT INTO `login` (`id`, `firstname`, `lastname`, `username`, `email`, `pw`, `role`, `token`) VALUES
	(1, 'admin1', 'admin1', 'admin1', 'admin1@admin.com', '$2a$10$CZKeUjwrqb5zx/hk3SryFO5TNkcDCHpnP/xpyM/drd0eA5GOw5kj6', 'admin', 'eb97ef6ddb9a4eb275a0747278f3295198a3ad30'),
	(2, 'teacher1', 'teacher1', 'teacher1', 'teacher1@teacher.com', '$2a$10$mjhpgXFdN3muFnbUX8pzn.YvCQXzgX4DEy8xO/9HS9VfdZgBIqtr2', 'teacher', '0f3ac0b52677e45e46d987c921f71fc8b3aba2a1'),
	(3, 'student1', 'student1', 'student1', 'student1@student.com', '$2a$10$rQToWGCGvkQ1dj16DqORpeaYbThl8YpngjowicDYJHptBB6bsmgZ6', 'student', 'b8ddd473d90bf400ae751df0532b44b7e6abc0d4');

-- Exportování struktury pro tabulka olp.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testid` int(10) unsigned NOT NULL,
  `text` text NOT NULL,
  `answera` text NOT NULL,
  `answerb` text NOT NULL,
  `answerc` text NOT NULL,
  `goodanswer` text NOT NULL,
  `goodansval` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_test` (`testid`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Exportování dat pro tabulku olp.questions: ~39 rows (přibližně)
INSERT INTO `questions` (`id`, `testid`, `text`, `answera`, `answerb`, `answerc`, `goodanswer`, `goodansval`) VALUES
	(42, 5, 'ot 2 - C', 'ju', 'srt', 'ate', 'q2a3', 'ate'),
	(43, 5, 'ot 3 - B', 'bsdf', 'bdf', 'sad', 'q3a2', 'bdf'),
	(44, 5, 'ot 4 - B', 'uhgm', 'mgj', 'gmjnvcx', 'q4a2', 'mgj'),
	(45, 5, 'ot 5 - A', 'gf', 'nfxnxfn', 'h gn gc ', 'q5a1', 'gf'),
	(46, 5, 'ot 6 - A', 'bsgbsb', 'gsdbs223', 'bsggfdgfg', 'q6a1', 'bsgbsb'),
	(47, 5, 'ot 7 - B', 'bg', 'oio', 'opuo', 'q7a2', 'oio'),
	(48, 5, 'ot 8 - C', 'bd c b', 'cbvx f', 'xx cv b', 'q8a3', 'xx cv b'),
	(49, 5, 'ot 9 - A', 'vfds', 'bgs', 'k,jb', 'q9a1', 'vfds'),
	(50, 5, 'ot 10 - C', 'jmgfd', 'f fdsg fd', 'Rambo 3', 'q10a3', 'Rambo 3'),
	(51, 6, 'fgsndjdnhgaf - C', 'bgsnn', 'bsfb', 'gbsf', 'q1a3', 'gbsf'),
	(52, 6, 'bsdgb sgdbgdbs - B', 'gteh', 'wrth', 'wrtfdwf dfw ', 'q2a2', 'wrth'),
	(53, 6, 'vsgareg - A', 'vesfb', 'sb', 'ab', 'q3a1', 'vesfb'),
	(54, 6, 'nhtmehnrgbfvd fbaefb - A', 'wnrh te', 'gsetht sdetgbtetb', 'dgsfbgg', 'q4a1', 'wnrh te'),
	(55, 6, 'agdhfsdfdsacv asfads vfv - B', 'geg', 'gega', 'geag', 'q5a2', 'gega'),
	(56, 6, 'raebebatbe - A', 'dg bd', 'sbg', 'gsd', 'q6a1', 'dg bd'),
	(57, 6, 'bsgdabbsgfbgd - C', 'ea', 'sgbgnh', 'nmfh', 'q7a3', 'nmfh'),
	(58, 6, 'fvsdfgrfeqfds - A', 'gtrwbg', 'brnbr', 'br', 'q8a1', 'gtrwbg'),
	(59, 6, 'rsgntnhtergwd gr - B', 'gegt', 'ewhb', 'hwrthr', 'q9a2', 'ewhb'),
	(60, 6, 'gewbngrfefddvfvbcxgdsfbg4ny5 - C', 'b srgbf', 'ndh he f n', ' bsrgf gb gs y', 'q10a3', ' bsrgf gb gs y'),
	(71, 9, 'test', 'faebsgabf', 'badb', 'badbngd sg', 'q1a3', 'badbngd sg'),
	(72, 9, 'nsbr dgb', ' dsb gfbg', 'f sb dg b', 'nbs hfnf', 'q2a3', 'nbs hfnf'),
	(73, 9, 's gdhd h', 'tgshdgh', 'gsdhgd', 'hs  t', 'q3a1', 'tgshdgh'),
	(74, 9, 'sht rr', ' dfhbadf', 'agdb fgn hf', ' fnhs g', 'q4a2', 'agdb fgn hf'),
	(75, 9, 'h raetdftb', 'hged f', 'ghr thgh ', 'gdf gw ', 'q5a1', 'hged f'),
	(76, 9, 'gs tgae fg', 'e dgs df', 'hs dh', 'jmd ghn ', 'q6a3', 'jmd ghn '),
	(77, 9, 'nd hgsf', ' gshgfds f', 'sd fgd', 'sd fg', 'q7a3', 'sd fg'),
	(78, 9, 'hysr ', ' shghdafdb', 'nshgng', 'eda', 'q8a2', 'nshgng'),
	(79, 9, 'df g efg ', 'h sdhgd', 'hdgs h', 's tdh', 'q9a3', 's tdh'),
	(80, 9, 'fd sahs', 'fhds h', 'dg shgh', 'sdh hs ghdaghgdaah gh', 'q10a2', 'dg shgh'),
	(81, 10, 'gfbgdsa', 'fgv', 'mjum,', 'kjhfsagh aghg ', 'q1a2', 'mjum,'),
	(82, 10, 's nhgsd hga', 'h gsfn h  h', ' n shfmnsjh md', 'jsgdfh asgdfh', 'q2a2', ' n shfmnsjh md'),
	(83, 10, 'h ndmnravc v dfghfg', 'nhh jm', 'm dgjtm', 'hnd hjsf', 'q3a3', 'hnd hjsf'),
	(84, 10, 'h srfgh adg', 'h gjdfhmjg m', 'h jsdfgsfvghnb ', 'gnh hhf', 'q4a3', 'gnh hhf'),
	(85, 10, ' jhfgh aefnmjhmjm', ' ghfjgdash gfbvdbs vdsb ', 'gmkjhdg,f gmhd', 'j ,mddjy,m jm', 'q5a3', 'j ,mddjy,m jm'),
	(86, 10, 'yj gthsgfd shf', 'hg jhnfgn', 'mghjm jjhgmd', 'tgg hmnhds', 'q6a1', 'hg jhnfgn'),
	(87, 10, ' hgsd ghn ', 'sfg ngfn', ' fgn fgh', 'n dsfghmn dgjmdfsag ', 'q7a2', ' fgn fgh'),
	(88, 10, 's ngfdnbs gfhnhf', 'hn gdhnmsgdhnb zf', 'nhsfghjra', 'hjgds rsadfg hfh', 'q8a2', 'nhsfghjra'),
	(89, 10, ' hfghs vbn ', 'vfsgn sfn', 'hfmjgdm,afdgsnv gfn', 'fhgjtsmhjmkarjshgjn fsd', 'q9a1', 'vfsgn sfn'),
	(90, 10, 'hns rjhsgd nhsfgmn gfhsm fhsm f', 'hjkmgdhh,mfshfgad g', 'gan gj,mjk,mjj', ',m hfjk,sfdg ds', 'q10a3', ',m hfjk,sfdg ds');

-- Exportování struktury pro tabulka olp.results
CREATE TABLE IF NOT EXISTS `results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `course` varchar(20) NOT NULL,
  `testtitle` varchar(200) NOT NULL,
  `points` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_result` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Exportování dat pro tabulku olp.results: ~8 rows (přibližně)
INSERT INTO `results` (`id`, `username`, `course`, `testtitle`, `points`) VALUES
	(1, 'admin1', 'courseA', 'novy test ', 10),
	(2, 'admin1', 'courseA', 'novy test', 7),
	(4, 'teacher1', 'course2', 'Dalsi test na debug', 9),
	(13, 'admin1', 'courseA', 'novy test ', 7),
	(15, 'student1', 'courseA', 'novy test ', 9),
	(16, 'student1', 'course2', 'Dalsi test na debug', 6),
	(17, 'student1', 'course1', 'test for test from teacher1', 6),
	(31, 'jakub', 'course1', 'novy test A ', 5);

-- Exportování struktury pro tabulka olp.tests
CREATE TABLE IF NOT EXISTS `tests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `course` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Exportování dat pro tabulku olp.tests: ~4 rows (přibližně)
INSERT INTO `tests` (`id`, `username`, `title`, `course`) VALUES
	(5, 'admin1', 'novy test A ', 'course1'),
	(6, 'admin1', 'Dalsi test na debug', 'course2'),
	(9, 'teacher1', 'test for test from teacher1', 'course1'),
	(10, 'admin1', 'New test for LiFi', 'course2');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
