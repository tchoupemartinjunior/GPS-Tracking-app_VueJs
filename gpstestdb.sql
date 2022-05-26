-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 26 mai 2022 à 15:54
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gpstestdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `chauffeur`
--

DROP TABLE IF EXISTS `chauffeur`;
CREATE TABLE IF NOT EXISTS `chauffeur` (
  `idChauffeur` int(3) NOT NULL AUTO_INCREMENT,
  `nomChauffeur` varchar(20) NOT NULL,
  `telChauffeur` varchar(13) NOT NULL,
  PRIMARY KEY (`idChauffeur`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chauffeur`
--

INSERT INTO `chauffeur` (`idChauffeur`, `nomChauffeur`, `telChauffeur`) VALUES
(1, 'Ayokunle Avossevou', '+33789451633'),
(2, 'MJTchoupe', '+334578963214');

-- --------------------------------------------------------

--
-- Structure de la table `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE IF NOT EXISTS `position` (
  `idChauffeur` int(3) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `online` tinyint(1) DEFAULT NULL,
  `idVehicule` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `position`
--

INSERT INTO `position` (`idChauffeur`, `lat`, `lng`, `Date`, `online`, `idVehicule`) VALUES
(1, 48.0175, 0.17949, '2022-05-24 23:19:19', NULL, 1),
(1, 48.0165, 0.15949, '2022-05-24 22:58:30', NULL, 1),
(1, 48.0155, 0.15449, '2022-05-24 22:56:00', NULL, 1),
(1, 48.0274, 0.156149, '2022-05-24 22:50:01', NULL, 1),
(1, 48.0174, 0.158149, '2022-05-24 22:49:32', NULL, 1),
(1, 48.0162, 0.157964, '2022-05-24 09:52:44', NULL, 1),
(1, 48.0189, 0.157847, '2022-05-24 09:50:59', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUser`, `email`, `password`) VALUES
(1, 'ayokunle@gmailcom', '$2b$10$YCKkL2uYXvSdzKplC3bqr.17Y.iQxImyO.P7Yro0Doed9U8COfj.6'),
(2, 'tot@gmail.com', 'toto'),
(8, 'ayoyo@gmail.com', '$2b$10$Kjf2.Ithr7oK5OTAH6J.tOmWFQCg5ZmmhA8C.zg4L7l.pZqa3qLQS'),
(4, 'toto@gmail.com', 'tottoo'),
(7, 'avossevou@gmailcom', '$2b$10$VrWRJcoBROgR9DnUrogxo.xbTpCF3cr5ug9mLagMH.DnRn5zIxcLu');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
