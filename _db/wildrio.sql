-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 11, 2016 at 05:33 PM
-- Server version: 5.5.50-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wildrio`
--

-- --------------------------------------------------------

--
-- Table structure for table `epreuve`
--

CREATE TABLE IF NOT EXISTS `epreuve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D6ADE47F5E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `epreuve`
--

INSERT INTO `epreuve` (`id`, `name`) VALUES
(5, '100m nage libre masculin'),
(4, 'aviron masculin'),
(2, 'basket masculin'),
(1, 'football masculin'),
(3, 'volley feminin');

-- --------------------------------------------------------

--
-- Table structure for table `fos_user`
--

CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(1, 'tony', 'tony', 'jokr.01@gmail.com', 'jokr.01@gmail.com', 1, 'kr2v7tr7mlsooooc0oskgcsswwkk0s0', '$2y$13$kr2v7tr7mlsooooc0oskgOL1mrG5/Mn3z7I96FHEF/wHQcEczN0Pm', '2016-08-11 16:28:10', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL),
(2, 'toto', 'toto', 'jokr.01+toto@gmail.com', 'jokr.01+toto@gmail.com', 1, '791r1haluq040o8wkg84w4wo8sg4cco', '$2y$13$791r1haluq040o8wkg84wuZIRVeW20Q2RTN2AgqE5JJo.B9ZM8g/m', '2016-08-11 16:14:06', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(3, 'tata', 'tata', 'jokr.01+tata@gmial.com', 'jokr.01+tata@gmial.com', 1, 'mv6ra9wpopwws8ss40k0gks040o4448', '$2y$13$mv6ra9wpopwws8ss40k0ge28OrbZhjGIWL/Mnm3a7KBbdepk5SK9G', '2016-08-11 16:18:24', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE IF NOT EXISTS `participant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epreuve_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D79F6B11AB990336` (`epreuve_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`id`, `name`, `epreuve_id`) VALUES
(1, 'Florent Manaudou', 5),
(2, 'Will Smith', 4),
(3, 'Mickael Jordan', 4),
(4, 'Camille Lacourt', 5),
(5, 'Yannick Agnel', 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `FK_D79F6B11AB990336` FOREIGN KEY (`epreuve_id`) REFERENCES `epreuve` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
