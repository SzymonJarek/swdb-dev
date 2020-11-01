-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.20-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for swdb-dev
CREATE DATABASE IF NOT EXISTS `swdb-dev` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `swdb-dev`;

-- Dumping structure for table swdb-dev.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Dumping data for table swdb-dev.characters: ~5 rows (approximately)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` (`ID`, `Name`) VALUES
	(30, 'C-3PO'),
	(22, 'Darth Vader'),
	(12, 'Han Solo'),
	(19, 'Leia Organa'),
	(1, 'Luke Skywalker'),
	(3, 'R2-D2'),
	(18, 'Wilhuff Tarkin');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumping structure for table swdb-dev.char_to_ep
CREATE TABLE IF NOT EXISTS `char_to_ep` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `epID` int(11) NOT NULL DEFAULT '0',
  `charID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_char_to_ep_episodes` (`epID`),
  KEY `FK_char_to_ep_characters` (`charID`),
  CONSTRAINT `FK_char_to_ep_characters` FOREIGN KEY (`charID`) REFERENCES `characters` (`ID`),
  CONSTRAINT `FK_char_to_ep_episodes` FOREIGN KEY (`epID`) REFERENCES `episodes` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- Dumping data for table swdb-dev.char_to_ep: ~4 rows (approximately)
/*!40000 ALTER TABLE `char_to_ep` DISABLE KEYS */;
INSERT INTO `char_to_ep` (`ID`, `epID`, `charID`) VALUES
	(21, 1, 12),
	(22, 4, 12),
	(23, 5, 12),
	(33, 1, 22),
	(34, 4, 22),
	(35, 5, 22),
	(40, 1, 30),
	(41, 4, 30),
	(42, 5, 30);
/*!40000 ALTER TABLE `char_to_ep` ENABLE KEYS */;

-- Dumping structure for table swdb-dev.episodes
CREATE TABLE IF NOT EXISTS `episodes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table swdb-dev.episodes: ~3 rows (approximately)
/*!40000 ALTER TABLE `episodes` DISABLE KEYS */;
INSERT INTO `episodes` (`ID`, `Name`) VALUES
	(1, 'NewHope'),
	(4, 'EMPIRE'),
	(5, 'JEDI');
/*!40000 ALTER TABLE `episodes` ENABLE KEYS */;

-- Dumping structure for table swdb-dev.friends
CREATE TABLE IF NOT EXISTS `friends` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CharID` int(11) NOT NULL DEFAULT '0',
  `FriendID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_charIDD` (`CharID`),
  KEY `FK_friendIDD` (`FriendID`),
  CONSTRAINT `FK_charIDD` FOREIGN KEY (`CharID`) REFERENCES `characters` (`ID`),
  CONSTRAINT `FK_friendIDD` FOREIGN KEY (`FriendID`) REFERENCES `characters` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table swdb-dev.friends: ~3 rows (approximately)
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` (`ID`, `CharID`, `FriendID`) VALUES
	(9, 22, 18),
	(14, 30, 1),
	(15, 30, 12),
	(16, 30, 19),
	(17, 30, 3);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
