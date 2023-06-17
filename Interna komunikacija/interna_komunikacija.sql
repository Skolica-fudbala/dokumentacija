-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2023 at 06:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `interna_komunikacija`
--

-- --------------------------------------------------------

--
-- Table structure for table `dogadjaji`
--

CREATE TABLE `dogadjaji` (
  `ID_dogadjaj` int(11) NOT NULL,
  `Naziv dogadjaja` varchar(255) NOT NULL,
  `Opis dogadjaja` varchar(1000) NOT NULL,
  `Datum i vreme pocetka` datetime NOT NULL,
  `Datum i vreme zavrsetka` datetime NOT NULL,
  `Mesto dogadjaja` varchar(255) NOT NULL,
  `ID_organizatora_dogadjaja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `obavestenja`
--

CREATE TABLE `obavestenja` (
  `ID_obavestenja` int(11) NOT NULL,
  `Naslov obavestenja` varchar(255) NOT NULL,
  `Sadrzaj obavestenja` varchar(2000) NOT NULL,
  `Datum objavljivanja` date NOT NULL,
  `Autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poruke`
--

CREATE TABLE `poruke` (
  `ID_poruke` int(11) NOT NULL,
  `Sadrzaj poruke` varchar(1000) NOT NULL,
  `Datum i vreme slanja` datetime NOT NULL,
  `Status poruke` tinyint(1) NOT NULL,
  `ID_primaoca` int(11) NOT NULL,
  `ID_posiljaoca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sastanci`
--

CREATE TABLE `sastanci` (
  `ID_sastanak` int(11) NOT NULL,
  `Naziv sastanka` varchar(255) NOT NULL,
  `Opis sastanka` varchar(255) NOT NULL,
  `Datum i vreme sastanka` datetime NOT NULL,
  `Mesto sastanka` varchar(255) NOT NULL,
  `ID_organizatora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zaposleni`
--

CREATE TABLE `zaposleni` (
  `ID_zaposleni` int(11) NOT NULL,
  `Ime` varchar(255) NOT NULL,
  `Prezime` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Pozicija` varchar(255) NOT NULL,
  `Broj telefona` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dogadjaji`
--
ALTER TABLE `dogadjaji`
  ADD PRIMARY KEY (`ID_dogadjaj`),
  ADD UNIQUE KEY `ID_organizatora_dogadjaja` (`ID_organizatora_dogadjaja`);

--
-- Indexes for table `obavestenja`
--
ALTER TABLE `obavestenja`
  ADD PRIMARY KEY (`ID_obavestenja`),
  ADD UNIQUE KEY `Autor` (`Autor`);

--
-- Indexes for table `poruke`
--
ALTER TABLE `poruke`
  ADD PRIMARY KEY (`ID_poruke`),
  ADD KEY `ID_poruke` (`ID_poruke`,`ID_posiljaoca`),
  ADD KEY `id_posiljaoca` (`ID_posiljaoca`),
  ADD KEY `ID_primaoca` (`ID_primaoca`);

--
-- Indexes for table `sastanci`
--
ALTER TABLE `sastanci`
  ADD PRIMARY KEY (`ID_sastanak`),
  ADD UNIQUE KEY `ID_organizatora` (`ID_organizatora`);

--
-- Indexes for table `zaposleni`
--
ALTER TABLE `zaposleni`
  ADD PRIMARY KEY (`ID_zaposleni`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dogadjaji`
--
ALTER TABLE `dogadjaji`
  MODIFY `ID_dogadjaj` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `obavestenja`
--
ALTER TABLE `obavestenja`
  MODIFY `ID_obavestenja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poruke`
--
ALTER TABLE `poruke`
  MODIFY `ID_poruke` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sastanci`
--
ALTER TABLE `sastanci`
  MODIFY `ID_sastanak` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zaposleni`
--
ALTER TABLE `zaposleni`
  MODIFY `ID_zaposleni` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dogadjaji`
--
ALTER TABLE `dogadjaji`
  ADD CONSTRAINT `dogadjaji_ibfk_1` FOREIGN KEY (`ID_organizatora_dogadjaja`) REFERENCES `zaposleni` (`ID_zaposleni`);

--
-- Constraints for table `obavestenja`
--
ALTER TABLE `obavestenja`
  ADD CONSTRAINT `obavestenja_ibfk_1` FOREIGN KEY (`Autor`) REFERENCES `zaposleni` (`ID_zaposleni`);

--
-- Constraints for table `poruke`
--
ALTER TABLE `poruke`
  ADD CONSTRAINT `poruke_ibfk_1` FOREIGN KEY (`ID_posiljaoca`) REFERENCES `zaposleni` (`ID_zaposleni`),
  ADD CONSTRAINT `poruke_ibfk_2` FOREIGN KEY (`ID_primaoca`) REFERENCES `zaposleni` (`ID_zaposleni`);

--
-- Constraints for table `sastanci`
--
ALTER TABLE `sastanci`
  ADD CONSTRAINT `sastanci_ibfk_1` FOREIGN KEY (`ID_organizatora`) REFERENCES `zaposleni` (`ID_zaposleni`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
