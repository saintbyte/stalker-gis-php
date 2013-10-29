-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 26, 2013 at 04:39 PM
-- Server version: 5.1.68-cll
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sbm_flash`
--

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE IF NOT EXISTS `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `dev_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `dev_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `md5` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `files`
--

-- --------------------------------------------------------

--
-- Table structure for table `hashtags`
--

CREATE TABLE IF NOT EXISTS `hashtags` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `z` int(11) NOT NULL,
  `tag` varchar(128) NOT NULL,
  `descr` text NOT NULL,
  `uid` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `src_url` varchar(255) NOT NULL,
  `marker_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lat` (`lat`,`lng`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=318 ;

--
-- Dumping data for table `hashtags`
--
INSERT INTO `hashtags` (`id`, `lat`, `lng`, `z`, `tag`, `descr`, `uid`, `created_on`, `src_url`, `marker_id`) VALUES(90, 61.7580753658618, 59.4508961545181, 11, 'Перевал Дятлова', '', 1, '2010-10-19 13:25:28', '#', 0);
INSERT INTO `hashtags` (`id`, `lat`, `lng`, `z`, `tag`, `descr`, `uid`, `created_on`, `src_url`, `marker_id`) VALUES(91, 61.5009731953483, 59.7489003049088, 11, 'Чистоп', '', 1, '2010-10-19 13:28:12', '#', 0);
--
-- Table structure for table `kmlstore`
--

CREATE TABLE IF NOT EXISTS `kmlstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `src_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;

--
-- Dumping data for table `kmlstore`
--
--
-- Table structure for table `mailaddmessages`
--

CREATE TABLE IF NOT EXISTS `mailaddmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `uid` int(11) NOT NULL,
  `sended` int(1) NOT NULL,
  `send_datetime` datetime NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `html` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mailaddmessages`
--

INSERT INTO `mailaddmessages` (`id`, `create_date`, `uid`, `sended`, `send_datetime`, `text`, `html`) VALUES(1, '2012-12-20 06:01:46', 1, 1, '2012-12-20 07:15:01', 'Итак если вы это видите значит, вы подписаны на рассылку', 'Итак если вы это видите значит, вы подписаны на <b>рассылку</b>');
INSERT INTO `mailaddmessages` (`id`, `create_date`, `uid`, `sended`, `send_datetime`, `text`, `html`) VALUES(2, '2013-01-04 12:16:16', 1, 1, '2013-01-09 07:15:02', 'Поздравляю вас всех с обновление спутниковых снимков на гугле. Теперь район петрогрона можно ещё лучше расмотреть. Всем кому покажется что там остатки пирамиды получат от меня фотки для исследования данного вопроса. А вообще одну с точку где возможно камень брали ещё до строительства ЖД в тому районе могу сообщить.', 'Поздравляю вас всех с обновление спутниковых снимков на гугле. Теперь район петрогрона можно ещё лучше расмотреть. Всем кому покажется что там остатки пирамиды получат от меня фотки для исследования данного вопроса. А вообще одну с точку где возможно камень брали ещё до строительства ЖД в тому районе могу сообщить.');
INSERT INTO `mailaddmessages` (`id`, `create_date`, `uid`, `sended`, `send_datetime`, `text`, `html`) VALUES(3, '2013-01-04 12:16:16', 1, 1, '2013-02-27 07:11:02', 'Все знают что я работаю над второй версией сталкер-гиса. Вот ссылка на начало работы над ним: http://stalker-gis.ru/2/', 'Все знают что я работаю над второй версией сталкер-гиса. Вот ссылка на начало работы над ним: <a href="http://stalker-gis.ru/2/">http://stalker-gis.ru/2/</a>');

-- --------------------------------------------------------

--
-- Table structure for table `mailqueue`
--

CREATE TABLE IF NOT EXISTS `mailqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `header` text COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `sended` int(1) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `send_datetime` datetime NOT NULL,
  `result` int(1) NOT NULL,
  `ishtml` int(1) NOT NULL,
  `msgtype` int(11) NOT NULL DEFAULT '0' COMMENT '0 is Mail, 1 is SMS , 2 OVer G2CM',
  `unkey` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `prior` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2623 ;

--
-- Dumping data for table `mailqueue`
--
-- --------------------------------------------------------

--
-- Table structure for table `marker_types`
--

CREATE TABLE IF NOT EXISTS `marker_types` (
  `marker_id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `descr` text COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `visible` int(11) NOT NULL,
  PRIMARY KEY (`marker_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=724 ;

--
-- Dumping data for table `marker_types`
--

INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(2, '2hand.png', '2hand', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(3, '360degrees.png', '360degrees', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(4, 'abduction.png', 'abduction', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(5, 'aboriginal.png', 'aboriginal', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(6, 'accesdenied.png', 'accesdenied', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(7, 'acupuncture.png', 'acupuncture', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(8, 'administration.png', 'administration', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(9, 'administrativeboundary.png', 'administrativeboundary', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(10, 'aed-2.png', 'aed 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(11, 'agritourism.png', 'agritourism', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(12, 'air_fixwing.png', 'air fixwing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(13, 'aircraftcarrier.png', 'aircraftcarrier', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(14, 'aircraftsmall.png', 'aircraftsmall', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(15, 'airport.png', 'airport', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(16, 'airport_apron.png', 'airport apron', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(17, 'airport_runway.png', 'airport runway', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(18, 'airport_terminal.png', 'airport terminal', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(19, 'airshow-2.png', 'airshow 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(20, 'algae.png', 'algae', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(21, 'alien.png', 'alien', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(22, 'alligator.png', 'alligator', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(23, 'ambulanceboat.png', 'ambulanceboat', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(24, 'amphitheater-2.png', 'amphitheater 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(25, 'amphitheater.png', 'amphitheater', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(26, 'anchorpier.png', 'anchorpier', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(27, 'anemometer_mono.png', 'anemometer mono', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(28, 'animal-shelter-export.png', 'animal shelter export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(29, 'anniversary.png', 'anniversary', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(30, 'ant-export.png', 'ant export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(31, 'anthropo.png', 'anthropo', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(32, 'apartment-3.png', 'apartment 3', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(33, 'apple.png', 'apple', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(34, 'aquarium.png', 'aquarium', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(35, 'arch.png', 'arch', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(36, 'archery.png', 'archery', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(37, 'army.png', 'army', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(38, 'art-museum-2.png', 'art museum 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(39, 'artgallery.png', 'artgallery', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(40, 'atm-2.png', 'atm 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(41, 'atv.png', 'atv', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(42, 'audio.png', 'audio', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(43, 'australianfootball.png', 'australianfootball', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(44, 'avalanche1.png', 'avalanche1', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(45, 'award.png', 'award', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(46, 'b_emblem.png', 'b emblem', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(47, 'badminton-2.png', 'badminton 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(48, 'bags.png', 'bags', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(49, 'bank.png', 'bank', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(50, 'bar.png', 'bar', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(51, 'bar_coktail.png', 'bar coktail', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(52, 'bar_juice.png', 'bar juice', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(53, 'barbecue.png', 'barbecue', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(54, 'barber.png', 'barber', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(55, 'barrier.png', 'barrier', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(56, 'baseball.png', 'baseball', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(57, 'basketball.png', 'basketball', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(58, 'bats.png', 'bats', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(59, 'battlefield.png', 'battlefield', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(60, 'battleship-3.png', 'battleship 3', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(61, 'beach.png', 'beach', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(62, 'beachvolleyball.png', 'beachvolleyball', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(63, 'bear.png', 'bear', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(64, 'beautifulview.png', 'beautifulview', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(65, 'beautysalon.png', 'beautysalon', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(66, 'bed_breakfast1-2.png', 'bed breakfast1 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(67, 'bee.png', 'bee', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(68, 'beergarden.png', 'beergarden', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(69, 'bicycle_shop.png', 'bicycle shop', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(70, 'bigcity.png', 'bigcity', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(71, 'bike_downhill.png', 'bike downhill', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(72, 'bike_rising.png', 'bike rising', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(73, 'billiard-2.png', 'billiard 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(74, 'binoculars.png', 'binoculars', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(75, 'birds-2.png', 'birds 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(76, 'blackcock1.png', 'blackcock1', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(77, 'blast.png', 'blast', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(78, 'boardercross.png', 'boardercross', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(79, 'boat.png', 'boat', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(80, 'boatcrane.png', 'boatcrane', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(81, 'bobsleigh.png', 'bobsleigh', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(82, 'bollie.png', 'bollie', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(83, 'bomb.png', 'bomb', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(84, 'bomber-2.png', 'bomber 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(85, 'bouddha.png', 'bouddha', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(86, 'bowling.png', 'bowling', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(87, 'boxing.png', 'boxing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(88, 'bread.png', 'bread', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(89, 'brewery1.png', 'brewery1', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(90, 'bridge_modern.png', 'bridge modern', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(91, 'bridge_old.png', 'bridge old', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(92, 'bulldozer.png', 'bulldozer', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(93, 'bullfight.png', 'bullfight', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(94, 'bunker-2-2.png', 'bunker 2 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(95, 'bunker.png', 'bunker', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(96, 'bus.png', 'bus', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(97, 'busstop.png', 'busstop', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(98, 'bustour.png', 'bustour', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(99, 'butcher-2.png', 'butcher 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(100, 'butterfly-2.png', 'butterfly 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(101, 'cabin-2.png', 'cabin 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(102, 'cablecar.png', 'cablecar', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(103, 'cafetaria.png', 'cafetaria', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(104, 'calendar-3.png', 'calendar 3', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(105, 'campfire-2.png', 'campfire 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(106, 'camping-2.png', 'camping 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(107, 'candy.png', 'candy', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(108, 'canyon-2.png', 'canyon 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(109, 'car.png', 'car', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(110, 'caraccident.png', 'caraccident', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(111, 'carrental.png', 'carrental', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(112, 'carwash.png', 'carwash', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(113, 'casino-2.png', 'casino 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(114, 'castle-2.png', 'castle 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(115, 'cat.png', 'cat', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(116, 'cathedral.png', 'cathedral', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(117, 'catholicgrave.png', 'catholicgrave', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(118, 'caution.png', 'caution', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(119, 'cave-2.png', 'cave 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(120, 'cctv.png', 'cctv', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(121, 'cemetary.png', 'cemetary', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(122, 'channelchange.png', 'channelchange', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(123, 'chapel-2.png', 'chapel 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(124, 'chart-2.png', 'chart 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(125, 'cheese.png', 'cheese', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(126, 'chemistry-2.png', 'chemistry 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(127, 'chicken-2.png', 'chicken 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(128, 'childmuseum01.png', 'childmuseum01', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(129, 'chiropractor.png', 'chiropractor', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(130, 'christmasmarket.png', 'christmasmarket', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(131, 'church-2.png', 'church 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(132, 'cinema.png', 'cinema', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(133, 'circus.png', 'circus', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(134, 'citysquare.png', 'citysquare', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(135, 'citywalls.png', 'citywalls', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(136, 'climbing.png', 'climbing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(137, 'clock.png', 'clock', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(138, 'closedroad.png', 'closedroad', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(139, 'clothers_female.png', 'clothers female', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(140, 'clothers_male.png', 'clothers male', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(141, 'cloudy.png', 'cloudy', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(142, 'cloudysunny.png', 'cloudysunny', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(143, 'coffee.png', 'coffee', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(144, 'coins.png', 'coins', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(145, 'comedyclub.png', 'comedyclub', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(146, 'comics.png', 'comics', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(147, 'comment-map-icon.png', 'comment map icon', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(148, 'communitycentre.png', 'communitycentre', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(149, 'company.png', 'company', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(150, 'compost.png', 'compost', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(151, 'computers.png', 'computers', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(152, 'condominium.png', 'condominium', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(153, 'conference.png', 'conference', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(154, 'congress.png', 'congress', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(155, 'construction.png', 'construction', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(156, 'constructioncrane.png', 'constructioncrane', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(157, 'contract.png', 'contract', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(158, 'conveniencestore.png', 'conveniencestore', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(159, 'convent-2.png', 'convent 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(160, 'conversation-map-icon.png', 'conversation map icon', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(161, 'convertible.png', 'convertible', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(162, 'corral.png', 'corral', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(163, 'country.png', 'country', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(164, 'court.png', 'court', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(165, 'cow-export.png', 'cow export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(166, 'cowabduction.png', 'cowabduction', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(167, 'craftstore.png', 'craftstore', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(168, 'cramschool.png', 'cramschool', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(169, 'crematorium.png', 'crematorium', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(170, 'cricket.png', 'cricket', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(171, 'crimescene.png', 'crimescene', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(172, 'cromlech.png', 'cromlech', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(173, 'cropcircles.png', 'cropcircles', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(174, 'cross-2.png', 'cross 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(175, 'crossingguard.png', 'crossingguard', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(176, 'cruiseship.png', 'cruiseship', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(177, 'cup.png', 'cup', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(178, 'curling-2.png', 'curling 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(179, 'currencyexchange.png', 'currencyexchange', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(180, 'customs.png', 'customs', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(181, 'cycling.png', 'cycling', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(182, 'cycling_feed.png', 'cycling feed', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(183, 'cycling_sprint.png', 'cycling sprint', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(184, 'dam.png', 'dam', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(185, 'dance_class.png', 'dance class', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(186, 'dancinghall.png', 'dancinghall', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(187, 'database.png', 'database', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(188, 'daycare.png', 'daycare', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(189, 'deepseafishing.png', 'deepseafishing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(190, 'deer.png', 'deer', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(191, 'dentist.png', 'dentist', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(192, 'departmentstore.png', 'departmentstore', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(193, 'desert-2.png', 'desert 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(194, 'dinopark.png', 'dinopark', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(195, 'direction_down.png', 'direction down', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(196, 'disability.png', 'disability', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(197, 'discgolf.png', 'discgolf', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(198, 'diving.png', 'diving', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(199, 'dogs_leash.png', 'dogs leash', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(200, 'dolphins.png', 'dolphins', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(201, 'doublebendright.png', 'doublebendright', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(202, 'downloadicon.png', 'downloadicon', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(203, 'drinkingfountain.png', 'drinkingfountain', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(204, 'drinkingwater.png', 'drinkingwater', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(205, 'drugstore.png', 'drugstore', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(206, 'duck-export.png', 'duck export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(207, 'e-bike-charging.png', 'e bike charging', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(208, 'e-bike-rental.png', 'e bike rental', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(209, 'earthquake-3.png', 'earthquake 3', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(210, 'eggs.png', 'eggs', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(211, 'elephants.png', 'elephants', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(212, 'elevator.png', 'elevator', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(213, 'elevator_down.png', 'elevator down', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(214, 'elevator_up.png', 'elevator up', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(215, 'embassy.png', 'embassy', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(216, 'emu.png', 'emu', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(217, 'entrance.png', 'entrance', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(218, 'exchequer.png', 'exchequer', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(219, 'exit.png', 'exit', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(220, 'expert.png', 'expert', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(221, 'factory.png', 'factory', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(222, 'fallingrocks.png', 'fallingrocks', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(223, 'family.png', 'family', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(224, 'farm-2.png', 'farm 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(225, 'farmstand.png', 'farmstand', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(226, 'fastfood.png', 'fastfood', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(227, 'female-2.png', 'female 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(228, 'ferriswheel.png', 'ferriswheel', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(229, 'ferry.png', 'ferry', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(230, 'festival.png', 'festival', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(231, 'fetalalcoholsyndrom.png', 'fetalalcoholsyndrom', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(232, 'field.png', 'field', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(233, 'fillingstation.png', 'fillingstation', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(234, 'findajob.png', 'findajob', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(235, 'finish.png', 'finish', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(236, 'fire-hydrant-2.png', 'fire hydrant 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(237, 'fire.png', 'fire', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(238, 'fireexstinguisher.png', 'fireexstinguisher', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(239, 'firemen.png', 'firemen', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(240, 'fireworks.png', 'fireworks', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(241, 'firstaid.png', 'firstaid', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(242, 'fishchips.png', 'fishchips', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(243, 'fishing.png', 'fishing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(244, 'fishingboat.png', 'fishingboat', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(245, 'fishingstore.png', 'fishingstore', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(246, 'fitness.png', 'fitness', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(247, 'fjord-2.png', 'fjord 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(248, 'flag-export.png', 'flag export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(249, 'flood.png', 'flood', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(250, 'flowers.png', 'flowers', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(251, 'folder-2.png', 'folder 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(252, 'fooddeliveryservice.png', 'fooddeliveryservice', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(253, 'foodtruck.png', 'foodtruck', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(254, 'footprint.png', 'footprint', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(255, 'ford-2.png', 'ford 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(256, 'forest.png', 'forest', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(257, 'forest2.png', 'forest2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(258, 'fossils.png', 'fossils', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(259, 'foundry-2.png', 'foundry 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(260, 'fountain-2.png', 'fountain 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(261, 'fourbyfour.png', 'fourbyfour', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(262, 'fox1.png', 'fox1', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(263, 'freqchg.png', 'freqchg', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(264, 'frog-2.png', 'frog 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(265, 'fruits.png', 'fruits', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(266, 'fsb_marker.png', 'fsb marker', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(267, 'ft.png', 'ft', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(268, 'funicolar-22x22.png', 'funicolar 22x22', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(269, 'gas_cylinder1.png', 'gas cylinder1', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(270, 'gay-female.png', 'gay female', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(271, 'gay-male.png', 'gay male', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(272, 'geocaching-3.png', 'geocaching 3', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(273, 'geothermal-site.png', 'geothermal site', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(274, 'geyser-2.png', 'geyser 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(275, 'ghosttown.png', 'ghosttown', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(276, 'gifts.png', 'gifts', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(277, 'glacier-2.png', 'glacier 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(278, 'glasses.png', 'glasses', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(279, 'gluten_free.png', 'gluten free', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(280, 'golfing.png', 'golfing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(281, 'gondola-2.png', 'gondola 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(282, 'gourmet_0star.png', 'gourmet 0star', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(283, 'grass.png', 'grass', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(284, 'grocery.png', 'grocery', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(285, 'group-2.png', 'group 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(286, 'gumball_machine.png', 'gumball machine', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(287, 'handball.png', 'handball', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(288, 'hanggliding.png', 'hanggliding', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(289, 'harbor.png', 'harbor', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(290, 'hare1.png', 'hare1', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(291, 'hats.png', 'hats', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(292, 'haybale.png', 'haybale', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(293, 'headstone-2.png', 'headstone 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(294, 'helicopter.png', 'helicopter', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(295, 'helipad.png', 'helipad', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(296, 'highhills.png', 'highhills', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(297, 'highschool.png', 'highschool', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(298, 'highway.png', 'highway', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(299, 'hiking.png', 'hiking', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(300, 'historical_museum.png', 'historical museum', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(301, 'historicalquarter.png', 'historicalquarter', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(302, 'hoergeraeteakustiker_22px.png', 'hoergeraeteakustiker 22px', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(303, 'home-2.png', 'home 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(304, 'homecenter.png', 'homecenter', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(305, 'honeycomb.png', 'honeycomb', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(306, 'hookah_final.png', 'hookah final', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(307, 'horseriding.png', 'horseriding', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(308, 'hospital-building.png', 'hospital building', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(309, 'hostel_0star.png', 'hostel 0star', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(310, 'hotairbaloon.png', 'hotairbaloon', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(311, 'hotel_0star.png', 'hotel 0star', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(312, 'hotspring.png', 'hotspring', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(313, 'house.png', 'house', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(314, 'hunting.png', 'hunting', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(315, 'hut.png', 'hut', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(316, 'icecream.png', 'icecream', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(317, 'icehockey.png', 'icehockey', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(318, 'iceskating.png', 'iceskating', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(319, 'icon.png', 'icon', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(320, 'icy_road.png', 'icy road', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(321, 'indoor-arena.png', 'indoor arena', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(322, 'information.png', 'information', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(323, 'iobridge.png', 'iobridge', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(324, 'jacuzzi.png', 'jacuzzi', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(325, 'japanese-food.png', 'japanese food', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(326, 'japanese-lantern.png', 'japanese lantern', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(327, 'japanese-sake.png', 'japanese sake', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(328, 'japanese-sweet-2.png', 'japanese sweet 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(329, 'japanese-temple.png', 'japanese temple', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(330, 'jazzclub.png', 'jazzclub', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(331, 'jeep.png', 'jeep', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(332, 'jetfighter.png', 'jetfighter', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(333, 'jewelry.png', 'jewelry', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(334, 'jewishgrave.png', 'jewishgrave', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(335, 'jewishquarter.png', 'jewishquarter', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(336, 'jogging.png', 'jogging', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(337, 'judo.png', 'judo', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(338, 'junction.png', 'junction', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(339, 'kangaroo2.png', 'kangaroo2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(340, 'karate.png', 'karate', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(341, 'karting.png', 'karting', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(342, 'kayak1.png', 'kayak1', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(343, 'kayaking.png', 'kayaking', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(344, 'kebab.png', 'kebab', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(345, 'kingair.png', 'kingair', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(346, 'kiosk.png', 'kiosk', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(347, 'kitesurfing.png', 'kitesurfing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(348, 'laboratory.png', 'laboratory', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(349, 'lake.png', 'lake', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(350, 'landfill.png', 'landfill', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(351, 'landmark.png', 'landmark', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(352, 'laterne.png', 'laterne', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(353, 'laundromat.png', 'laundromat', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(354, 'levelcrossing.png', 'levelcrossing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(355, 'library.png', 'library', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(356, 'lifeguard-2.png', 'lifeguard 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(357, 'lighthouse-2.png', 'lighthouse 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(358, 'linedown.png', 'linedown', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(359, 'lingerie.png', 'lingerie', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(360, 'liquor.png', 'liquor', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(361, 'lobster-export.png', 'lobster export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(362, 'lock.png', 'lock', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(363, 'lockerrental.png', 'lockerrental', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(364, 'lodging_0star.png', 'lodging 0star', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(365, 'love_date.png', 'love date', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(366, 'loveinterest.png', 'loveinterest', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(367, 'magicshow.png', 'magicshow', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(368, 'mainroad.png', 'mainroad', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(369, 'male-2.png', 'male 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(370, 'mall.png', 'mall', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(371, 'map.png', 'map', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(372, 'mapicon.png', 'mapicon', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(373, 'marina-2.png', 'marina 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(374, 'market.png', 'market', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(375, 'massage.png', 'massage', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(376, 'mastcrane1.png', 'mastcrane1', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(377, 'medicalstore.png', 'medicalstore', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(378, 'medicine.png', 'medicine', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(379, 'megalith.png', 'megalith', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(380, 'memorial.png', 'memorial', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(381, 'metano-icon.png', 'metano icon', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(382, 'metronetwork.png', 'metronetwork', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(383, 'military.png', 'military', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(384, 'mine.png', 'mine', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(385, 'missile-2.png', 'missile 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(386, 'mobilephonetower.png', 'mobilephonetower', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(387, 'modernmonument.png', 'modernmonument', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(388, 'moderntower.png', 'moderntower', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(389, 'monkey-export.png', 'monkey export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(390, 'monument-historique-icon-white-22x22.png', 'monument historique icon white 22x22', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(391, 'monument.png', 'monument', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(392, 'moonstar.png', 'moonstar', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(393, 'mosquee.png', 'mosquee', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(394, 'mosquito-2.png', 'mosquito 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(395, 'motel-2.png', 'motel 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(396, 'motorbike.png', 'motorbike', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(397, 'motorcycle.png', 'motorcycle', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(398, 'mountain-pass-locator-diagonal-reverse-export.png', 'mountain pass locator diagonal reverse export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(399, 'mountainbiking-3.png', 'mountainbiking 3', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(400, 'mountains.png', 'mountains', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(401, 'movierental.png', 'movierental', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(402, 'moving-walkway-enter-export.png', 'moving walkway enter export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(403, 'muffin_bagle.png', 'muffin bagle', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(404, 'mural.png', 'mural', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(405, 'museum_archeological.png', 'museum archeological', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(406, 'museum_art.png', 'museum art', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(407, 'museum_crafts.png', 'museum crafts', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(408, 'museum_industry.png', 'museum industry', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(409, 'museum_naval.png', 'museum naval', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(410, 'museum_openair.png', 'museum openair', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(411, 'museum_science.png', 'museum science', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(412, 'museum_war.png', 'museum war', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(413, 'mushroom.png', 'mushroom', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(414, 'music.png', 'music', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(415, 'music_choral.png', 'music choral', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(416, 'music_classical.png', 'music classical', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(417, 'music_hiphop.png', 'music hiphop', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(418, 'music_live.png', 'music live', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(419, 'music_rock.png', 'music rock', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(420, 'nanny.png', 'nanny', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(421, 'ne_barn-2.png', 'ne barn 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(422, 'newsagent.png', 'newsagent', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(423, 'no-nuke-export.png', 'no nuke export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(424, 'nordicski.png', 'nordicski', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(425, 'notvisited.png', 'notvisited', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(426, 'ns_2015_nippon_marker_custom_icon.png', 'ns 2015 nippon marker custom icon', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(427, 'nursery.png', 'nursery', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(428, 'nursing_home_icon.png', 'nursing home icon', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(429, 'observatory.png', 'observatory', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(430, 'office-building.png', 'office building', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(431, 'oil-2.png', 'oil 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(432, 'oilpumpjack.png', 'oilpumpjack', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(433, 'oilrig2.png', 'oilrig2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(434, 'olympicsite.png', 'olympicsite', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(435, 'ophthalmologist.png', 'ophthalmologist', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(436, 'outlet2.png', 'outlet2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(437, 'oyster-3.png', 'oyster 3', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(438, 'pagoda-2.png', 'pagoda 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(439, 'paint.png', 'paint', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(440, 'paintball.png', 'paintball', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(441, 'palace-2.png', 'palace 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(442, 'palm-tree-export.png', 'palm tree export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(443, 'panoramicview.png', 'panoramicview', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(444, 'paragliding.png', 'paragliding', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(445, 'parasailing.png', 'parasailing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(446, 'parkandride.png', 'parkandride', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(447, 'parking-meter-export.png', 'parking meter export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(448, 'parkinggarage.png', 'parkinggarage', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(449, 'party-2.png', 'party 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(450, 'patisserie.png', 'patisserie', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(451, 'peace.png', 'peace', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(452, 'pedestriancrossing.png', 'pedestriancrossing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(453, 'penguin-2.png', 'penguin 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(454, 'pens.png', 'pens', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(455, 'perfumery.png', 'perfumery', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(456, 'petanque.png', 'petanque', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(457, 'petroglyphs-2.png', 'petroglyphs 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(458, 'pets.png', 'pets', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(459, 'phantom.png', 'phantom', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(460, 'phones.png', 'phones', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(461, 'photo.png', 'photo', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(462, 'photography.png', 'photography', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(463, 'picnic-2.png', 'picnic 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(464, 'pig.png', 'pig', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(465, 'pin-export.png', 'pin export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(466, 'pirates.png', 'pirates', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(467, 'pizzaria.png', 'pizzaria', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(468, 'planecrash.png', 'planecrash', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(469, 'planetarium-2.png', 'planetarium 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(470, 'playground.png', 'playground', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(471, 'pleasurepier.png', 'pleasurepier', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(472, 'poker.png', 'poker', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(473, 'police.png', 'police', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(474, 'postal.png', 'postal', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(475, 'powerlinepole.png', 'powerlinepole', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(476, 'poweroutage.png', 'poweroutage', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(477, 'powerplant.png', 'powerplant', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(478, 'powersubstation.png', 'powersubstation', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(479, 'prayer.png', 'prayer', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(480, 'presentation.png', 'presentation', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(481, 'price-tag-export.png', 'price tag export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(482, 'printer-2.png', 'printer 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(483, 'prison.png', 'prison', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(484, 'publicart.png', 'publicart', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(485, 'pyramid.png', 'pyramid', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(486, 'quadrifoglio.png', 'quadrifoglio', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(487, 'radar.png', 'radar', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(488, 'radiation.png', 'radiation', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(489, 'radio-control-model-car.png', 'radio control model car', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(490, 'radio-station-2.png', 'radio station 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(491, 'rainy.png', 'rainy', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(492, 'rape.png', 'rape', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(493, 'reatorlogowhite-22x22.png', 'reatorlogowhite 22x22', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(494, 'recycle.png', 'recycle', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(495, 'regroup.png', 'regroup', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(496, 'repair.png', 'repair', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(497, 'rescue-2.png', 'rescue 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(498, 'resort.png', 'resort', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(499, 'restaurant.png', 'restaurant', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(500, 'restaurant_african.png', 'restaurant african', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(501, 'restaurant_breakfast.png', 'restaurant breakfast', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(502, 'restaurant_buffet.png', 'restaurant buffet', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(503, 'restaurant_chinese.png', 'restaurant chinese', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(504, 'restaurant_fish.png', 'restaurant fish', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(505, 'restaurant_greek.png', 'restaurant greek', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(506, 'restaurant_indian.png', 'restaurant indian', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(507, 'restaurant_italian.png', 'restaurant italian', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(508, 'restaurant_korean.png', 'restaurant korean', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(509, 'restaurant_mediterranean.png', 'restaurant mediterranean', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(510, 'restaurant_mexican.png', 'restaurant mexican', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(511, 'restaurant_romantic.png', 'restaurant romantic', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(512, 'restaurant_steakhouse.png', 'restaurant steakhouse', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(513, 'restaurant_tapas.png', 'restaurant tapas', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(514, 'restaurant_thai.png', 'restaurant thai', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(515, 'restaurant_turkish.png', 'restaurant turkish', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(516, 'restaurant_vegetarian.png', 'restaurant vegetarian', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(517, 'revolt.png', 'revolt', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(518, 'riparianhabitat.png', 'riparianhabitat', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(519, 'river-2.png', 'river 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(520, 'road.png', 'road', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(521, 'roadtype_gravel.png', 'roadtype gravel', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(522, 'rockhouse.png', 'rockhouse', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(523, 'rodent.png', 'rodent', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(524, 'rollerblade.png', 'rollerblade', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(525, 'rollerskate.png', 'rollerskate', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(526, 'ropescourse.png', 'ropescourse', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(527, 'rowboat.png', 'rowboat', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(528, 'rugbyfield.png', 'rugbyfield', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(529, 'ruins-2.png', 'ruins 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(530, 'sailing.png', 'sailing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(531, 'sandwich-2.png', 'sandwich 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(532, 'sauna.png', 'sauna', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(533, 'sawmill-2.png', 'sawmill 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(534, 'school.png', 'school', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(535, 'schreibwaren_web.png', 'schreibwaren web', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(536, 'scoutgroup.png', 'scoutgroup', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(537, 'scubadiving.png', 'scubadiving', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(538, 'seals.png', 'seals', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(539, 'segway.png', 'segway', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(540, 'seniorsite.png', 'seniorsite', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(541, 'septic_tank.png', 'septic tank', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(542, 'share.png', 'share', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(543, 'shark-export.png', 'shark export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(544, 'shintoshrine.png', 'shintoshrine', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(545, 'shipwreck.png', 'shipwreck', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(546, 'shoes.png', 'shoes', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(547, 'shooting.png', 'shooting', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(548, 'shootingrange.png', 'shootingrange', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(549, 'shore-2.png', 'shore 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(550, 'shower.png', 'shower', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(551, 'sight-2.png', 'sight 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(552, 'signpost-2.png', 'signpost 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(553, 'sikh.png', 'sikh', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(554, 'ski_shoe1.png', 'ski shoe1', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(555, 'skiing.png', 'skiing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(556, 'skijump.png', 'skijump', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(557, 'skilifting.png', 'skilifting', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(558, 'skis.png', 'skis', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(559, 'skull.png', 'skull', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(560, 'sledge.png', 'sledge', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(561, 'sledge_summer.png', 'sledge summer', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(562, 'sledgerental.png', 'sledgerental', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(563, 'slipway.png', 'slipway', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(564, 'smallcity.png', 'smallcity', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(565, 'smiley_happy.png', 'smiley happy', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(566, 'smoking.png', 'smoking', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(567, 'snail.png', 'snail', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(568, 'snakes.png', 'snakes', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(569, 'sneakers.png', 'sneakers', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(570, 'snorkeling.png', 'snorkeling', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(571, 'snowboarding.png', 'snowboarding', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(572, 'snowmobiling.png', 'snowmobiling', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(573, 'snowpark_arc.png', 'snowpark arc', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(574, 'snowshoeing.png', 'snowshoeing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(575, 'snowy-2.png', 'snowy 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(576, 'soccer.png', 'soccer', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(577, 'soil-boring-icon.png', 'soil boring icon', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(578, 'solarenergy.png', 'solarenergy', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(579, 'sozialeeinrichtung.png', 'sozialeeinrichtung', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(580, 'spa.png', 'spa', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(581, 'spaceport-2.png', 'spaceport 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(582, 'speed_50.png', 'speed 50', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(583, 'speedhump.png', 'speedhump', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(584, 'speedriding.png', 'speedriding', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(585, 'spelunking.png', 'spelunking', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(586, 'spider.png', 'spider', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(587, 'splice.png', 'splice', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(588, 'sportscar.png', 'sportscar', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(589, 'sportutilityvehicle.png', 'sportutilityvehicle', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(590, 'square-compass.png', 'square compass', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(591, 'squash-2.png', 'squash 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(592, 'stadium.png', 'stadium', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(593, 'stairs.png', 'stairs', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(594, 'star-3.png', 'star 3', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(595, 'stargate-raw.png', 'stargate raw', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(596, 'start-race-2.png', 'start race 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(597, 'statue-2.png', 'statue 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(598, 'steamtrain.png', 'steamtrain', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(599, 'stop.png', 'stop', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(600, 'strike.png', 'strike', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(601, 'stripclub2.png', 'stripclub2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(602, 'submarine-2.png', 'submarine 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(603, 'sugar-shack.png', 'sugar shack', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(604, 'summercamp.png', 'summercamp', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(605, 'sumo-2.png', 'sumo 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(606, 'sunny.png', 'sunny', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(607, 'sunsetland.png', 'sunsetland', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(608, 'supermarket.png', 'supermarket', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(609, 'surfacelift.png', 'surfacelift', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(610, 'surfing.png', 'surfing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(611, 'surfpaddle.png', 'surfpaddle', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(612, 'surveying-2.png', 'surveying 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(613, 'swimming.png', 'swimming', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(614, 'synagogue-2.png', 'synagogue 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(615, 'taekwondo-2.png', 'taekwondo 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(616, 'tailor.png', 'tailor', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(617, 'takeaway.png', 'takeaway', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(618, 'targ.png', 'targ', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(619, 'taxi.png', 'taxi', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(620, 'taxiboat.png', 'taxiboat', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(621, 'taxiway.png', 'taxiway', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(622, 'teahouse.png', 'teahouse', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(623, 'tebletennis.png', 'tebletennis', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(624, 'telephone.png', 'telephone', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(625, 'temple-2.png', 'temple 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(626, 'templehindu.png', 'templehindu', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(627, 'tennis.png', 'tennis', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(628, 'terrace.png', 'terrace', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(629, 'text.png', 'text', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(630, 'textiles.png', 'textiles', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(631, 'theater.png', 'theater', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(632, 'theft.png', 'theft', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(633, 'themepark.png', 'themepark', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(634, 'therapy.png', 'therapy', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(635, 'theravadapagoda.png', 'theravadapagoda', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(636, 'theravadatemple.png', 'theravadatemple', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(637, 'thunderstorm.png', 'thunderstorm', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(638, 'ticket_office2.png', 'ticket office2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(639, 'tidaldiamond.png', 'tidaldiamond', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(640, 'tiger-2.png', 'tiger 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(641, 'tires.png', 'tires', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(642, 'toilets.png', 'toilets', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(643, 'tollstation.png', 'tollstation', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(644, 'tools.png', 'tools', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(645, 'tornado-2.png', 'tornado 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(646, 'torture.png', 'torture', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(647, 'tower.png', 'tower', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(648, 'townhouse.png', 'townhouse', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(649, 'toys.png', 'toys', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(650, 'trafficcamera.png', 'trafficcamera', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(651, 'trafficlight.png', 'trafficlight', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(652, 'train.png', 'train', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(653, 'tramway.png', 'tramway', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(654, 'trash.png', 'trash', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(655, 'travel_agency.png', 'travel agency', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(656, 'treasure-mark.png', 'treasure mark', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(657, 'treedown.png', 'treedown', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(658, 'triskelion.png', 'triskelion', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(659, 'trolley.png', 'trolley', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(660, 'truck3.png', 'truck3', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(661, 'tsunami.png', 'tsunami', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(662, 'tunnel.png', 'tunnel', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(663, 'turtle-2.png', 'turtle 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(664, 'tv.png', 'tv', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(665, 'tweet.png', 'tweet', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(666, 'u-pick_stand.png', 'u pick stand', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(667, 'ufo.png', 'ufo', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(668, 'umbrella-2.png', 'umbrella 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(669, 'underground.png', 'underground', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(670, 'university.png', 'university', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(671, 'usfootball.png', 'usfootball', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(672, 'van.png', 'van', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(673, 'vespa.png', 'vespa', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(674, 'veterinary.png', 'veterinary', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(675, 'video.png', 'video', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(676, 'videogames.png', 'videogames', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(677, 'villa.png', 'villa', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(678, 'vineyard-2.png', 'vineyard 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(679, 'volcano-2.png', 'volcano 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(680, 'volleyball.png', 'volleyball', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(681, 'waiting.png', 'waiting', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(682, 'walkingtour.png', 'walkingtour', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(683, 'war.png', 'war', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(684, 'warehouse-2.png', 'warehouse 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(685, 'water.png', 'water', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(686, 'watercraft.png', 'watercraft', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(687, 'waterdrop.png', 'waterdrop', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(688, 'waterfall-2.png', 'waterfall 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(689, 'watermill-2.png', 'watermill 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(690, 'waterpark.png', 'waterpark', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(691, 'waterskiing.png', 'waterskiing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(692, 'watertower.png', 'watertower', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(693, 'waterwell.png', 'waterwell', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(694, 'waterwellpump.png', 'waterwellpump', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(695, 'webcam.png', 'webcam', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(696, 'wedding.png', 'wedding', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(697, 'weights.png', 'weights', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(698, 'wetlands.png', 'wetlands', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(699, 'whale-2.png', 'whale 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(700, 'wifi.png', 'wifi', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(701, 'wiki-export.png', 'wiki export', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(702, 'wildlifecrossing.png', 'wildlifecrossing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(703, 'wind-2.png', 'wind 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(704, 'windmill-2.png', 'windmill 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(705, 'windsurfing.png', 'windsurfing', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(706, 'windturbine.png', 'windturbine', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(707, 'winebar.png', 'winebar', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(708, 'winetasting.png', 'winetasting', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(709, 'woodshed.png', 'woodshed', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(710, 'workoffice.png', 'workoffice', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(711, 'workshop.png', 'workshop', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(712, 'world.png', 'world', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(713, 'worldheritagesite.png', 'worldheritagesite', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(714, 'worldwildway.png', 'worldwildway', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(715, 'wrestling-2.png', 'wrestling 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(716, 'x-ray.png', 'x ray', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(717, 'yoga.png', 'yoga', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(718, 'yooner.png', 'yooner', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(719, 'you-are-here-2.png', 'you are here 2', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(720, 'youthhostel.png', 'youthhostel', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(721, 'zombie-outbreak1.png', 'zombie outbreak1', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(722, 'zoo.png', 'zoo', '', 32, 37, 1);
INSERT INTO `marker_types` (`marker_id`, `icon`, `name`, `descr`, `width`, `height`, `visible`) VALUES(723, 'zoom.png', 'zoom', '', 32, 37, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mylocation`
--

CREATE TABLE IF NOT EXISTS `mylocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `z` int(11) NOT NULL,
  `accuracy` int(11) NOT NULL,
  `altitudea` int(11) NOT NULL,
  `heading` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=972 ;

--
-- Dumping data for table `mylocation`
--

-- --------------------------------------------------------

--
-- Table structure for table `notepad`
--

CREATE TABLE IF NOT EXISTS `notepad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `change_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE IF NOT EXISTS `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cur` int(11) NOT NULL,
  `quote` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE IF NOT EXISTS `track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peerid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trackers`
--

CREATE TABLE IF NOT EXISTS `trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `trackers`
--

INSERT INTO `trackers` (`id`, `uid`, `name`, `active`) VALUES(1, 1, 'gpslogger1', 1);
INSERT INTO `trackers` (`id`, `uid`, `name`, `active`) VALUES(2, 1, 'gpslogger2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(128) NOT NULL,
  `view_name` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(128) NOT NULL,
  `tw_id` int(11) NOT NULL,
  `vk_id` int(11) NOT NULL,
  `fb_id` int(11) NOT NULL,
  `tw_name` varchar(128) NOT NULL,
  `send_email` int(11) NOT NULL DEFAULT '0',
  `send_sms` int(11) NOT NULL DEFAULT '0',
  `sms_over_email` int(11) NOT NULL DEFAULT '0',
  `tel` varchar(128) NOT NULL DEFAULT '0',
  `at_monring` int(1) NOT NULL,
  `for_vilazka` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `tw_id` (`tw_id`,`vk_id`,`fb_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `view_name`, `password`, `email`, `tw_id`, `vk_id`, `fb_id`, `tw_name`, `send_email`, `send_sms`, `sms_over_email`, `tel`, `at_monring`, `for_vilazka`) VALUES(1, '123', 'Я такой крутой =)', '202cb962ac59075b964b07152d234b70', 'xxxxx@cccc.ru', 0, 0, 0, '', 1, 1, 1, '7xxxxxx', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `userstoken`
--

CREATE TABLE IF NOT EXISTS `userstoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=41 ;

--
-- Dumping data for table `userstoken`
--

-- --------------------------------------------------------

--
-- Table structure for table `wiki`
--

CREATE TABLE IF NOT EXISTS `wiki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(128) NOT NULL,
  `text` longtext NOT NULL,
  `owner_uid` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `wiki`
--

INSERT INTO `wiki` (`id`, `parent_id`, `name`, `title`, `text`, `owner_uid`, `datetime`, `deleted`) VALUES(10, 0, '', 'Главная страница', '<p>Это wiki. Это штука создана чтоб вести записи и документировать проекты. Без авторизации недоступна. Поддерживает версии - любые изменения сохраняются как версии документа.&nbsp;</p>\r\n<\r\n<p><s<p>Все суб страницы:</p>\r\n<p>[SUBPAGES]</p>', 0, '2013-04-12 07:48:34', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_version`
--

CREATE TABLE IF NOT EXISTS `wiki_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(128) NOT NULL,
  `text` longtext NOT NULL,
  `owner_uid` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98 ;

--
-- Dumping data for table `wiki_version`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
