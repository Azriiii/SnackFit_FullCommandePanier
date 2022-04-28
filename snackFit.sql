-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 27, 2019 at 04:03 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `snackFit`
--

-- --------------------------------------------------------

--
-- Table structure for table `Commande`
--

CREATE TABLE `Commande` (
  `id_commande` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Prix` float NOT NULL,
  `Cord` varchar(100) COLLATE utf8_bin NOT NULL,
  `date_creation` date NOT NULL,
  `date_expiration` date DEFAULT NULL,
  `etat_commande` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT 'En Attente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Commande`
--

INSERT INTO `Commande` (`id_commande`, `id_client`, `id_produit`, `Qty`, `Prix`, `Cord`, `date_creation`, `date_expiration`, `etat_commande`) VALUES
(114, 6, 1, 123, 22140, 'Tunisie/Ariana/Ariana Essoughra', '2019-11-27', '2019-11-29', 'En Attente');

-- --------------------------------------------------------

--
-- Table structure for table `evenement`
--

CREATE TABLE `evenement` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `descp` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `dated` date NOT NULL,
  `datef` date NOT NULL,
  `lieu` varchar(255) NOT NULL,
  `nb_place` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fidelity`
--

CREATE TABLE `fidelity` (
  `id` int(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fidelityrequest`
--

CREATE TABLE `fidelityrequest` (
  `id` int(8) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `fidelity_name` varchar(20) NOT NULL,
  `id_fidelity` int(8) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `livraison`
--

CREATE TABLE `livraison` (
  `idlivraison` int(8) NOT NULL,
  `phonenumber` int(8) NOT NULL,
  `adressel` varchar(5) NOT NULL,
  `numfacture` int(5) NOT NULL,
  `idlivreur` int(8) NOT NULL,
  `message` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `livraison`
--

INSERT INTO `livraison` (`idlivraison`, `phonenumber`, `adressel`, `numfacture`, `idlivreur`, `message`) VALUES
(1, 1, 'th', 1, 11, 'kjgklmk'),
(12, 94624883, 'adres', 5, 1, 'tmazlout@gmail.com'),
(13, 123456789, 'adres', 5, 1, 'thouraya.mazlout@esprit.tn'),
(14, 9462883, 'ad', 5, 1, 'emchi@gmail.com'),
(15, 14598672, 'ad', 5, 1, 'emchi@gmail.com'),
(16, 45678951, 'amir', 0, 1, 'amirmazl@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `livreur`
--

CREATE TABLE `livreur` (
  `idlivreur` int(8) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `disp` varchar(3) NOT NULL,
  `remarque` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `livreur`
--

INSERT INTO `livreur` (`idlivreur`, `nom`, `prenom`, `disp`, `remarque`) VALUES
(1, 'thourayaaa', 'mazloutaaaaaa', 'non', 'yalla'),
(11, 'thou', 'mazlout', 'non', 'yalla');

-- --------------------------------------------------------

--
-- Table structure for table `Panier`
--

CREATE TABLE `Panier` (
  `ADD_IP` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_produit` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Prix` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Panier`
--

INSERT INTO `Panier` (`ADD_IP`, `id_produit`, `Qty`, `Prix`) VALUES
('MDdrb1R6QlJJbzRCeTFlcWxOV1E2dz09', 1, 1, 180);

-- --------------------------------------------------------

--
-- Table structure for table `participer`
--

CREATE TABLE `participer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `nb_place` int(11) NOT NULL,
  `date_res` datetime NOT NULL,
  `etat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Produit`
--

CREATE TABLE `Produit` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Produit`
--

INSERT INTO `Produit` (`ID`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Table structure for table `reclamation`
--

CREATE TABLE `reclamation` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cmd_id` int(11) NOT NULL,
  `date_rec` datetime NOT NULL,
  `motif` varchar(255) NOT NULL,
  `descp` varchar(255) NOT NULL,
  `etat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `fidelity` int(11) DEFAULT 0,
  `surname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `fidelity`, `surname`, `email`, `password`, `role`, `number`) VALUES
(6, 'Rassilo', 'rassil', 1, 'br', 'br.rassil@gmail.com', '1234', 'user', '55236654'),
(9, 'client2', 'noice', 1, 'two', 'client2@email.com', '0000', 'user', '24252636'),
(13, 'client3', 'client', 0, 'three', 'client3@email.com', '1234', 'user', '52556523'),
(22, 'admin', 'admin', 0, '', 'admin@email.com', 'admin', 'admin', '55236654');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_produit` (`id_produit`),
  ADD KEY `fk_id_client` (`id_client`);

--
-- Indexes for table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fidelity`
--
ALTER TABLE `fidelity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fidelityrequest`
--
ALTER TABLE `fidelityrequest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`idlivraison`),
  ADD KEY `numfacture` (`numfacture`),
  ADD KEY `idlivreur` (`idlivreur`);

--
-- Indexes for table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`idlivreur`);

--
-- Indexes for table `Panier`
--
ALTER TABLE `Panier`
  ADD PRIMARY KEY (`ADD_IP`,`id_produit`);

--
-- Indexes for table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `reclamation`
--
ALTER TABLE `reclamation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Commande`
--
ALTER TABLE `Commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fidelity`
--
ALTER TABLE `fidelity`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fidelityrequest`
--
ALTER TABLE `fidelityrequest`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `livraison`
--
ALTER TABLE `livraison`
  MODIFY `idlivraison` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `idlivreur` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `participer`
--
ALTER TABLE `participer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Produit`
--
ALTER TABLE `Produit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reclamation`
--
ALTER TABLE `reclamation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Commande`
--
ALTER TABLE `Commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `Produit` (`ID`),
  ADD CONSTRAINT `fk_id_client` FOREIGN KEY (`id_client`) REFERENCES `user` (`id`);

--
-- Constraints for table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `fk_idliv` FOREIGN KEY (`idlivreur`) REFERENCES `livreur` (`idlivreur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
