-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2023 at 07:00 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `planiranje_proizvodnje`
--

-- --------------------------------------------------------

--
-- Table structure for table `igraci`
--

CREATE TABLE `igraci` (
  `id` int(11) NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `pol` tinyint(1) NOT NULL,
  `adresa` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `broj_telefona` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicinski_pregledi`
--

CREATE TABLE `medicinski_pregledi` (
  `id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `id_igraca` int(11) NOT NULL,
  `visina` double NOT NULL,
  `tezina` double NOT NULL,
  `krvni_pritisak` varchar(255) NOT NULL,
  `puls` int(11) NOT NULL,
  `alergije` varchar(255) NOT NULL,
  `istorija_bolesti` varchar(255) NOT NULL,
  `preporuke` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ocene`
--

CREATE TABLE `ocene` (
  `id` int(11) NOT NULL,
  `id_treniranja` int(11) NOT NULL,
  `ocena_treninga` int(11) NOT NULL,
  `napomena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plan_treninga`
--

CREATE TABLE `plan_treninga` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `datum_kreiranja` date NOT NULL,
  `datum_poslednje_izmene` date NOT NULL,
  `id_trenera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `termini`
--

CREATE TABLE `termini` (
  `id` int(11) NOT NULL,
  `dan_u_nedelji` varchar(255) NOT NULL,
  `vreme_pocetka` datetime NOT NULL,
  `vreme_zavrsetka` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treneri`
--

CREATE TABLE `treneri` (
  `id` int(11) NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `pol` tinyint(1) NOT NULL,
  `adresa` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `broj_telefona` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treninzi`
--

CREATE TABLE `treninzi` (
  `id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `id_igraca` int(11) NOT NULL,
  `id_trenera` int(11) NOT NULL,
  `id_termina` int(11) NOT NULL,
  `id_plana_treninga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `igraci`
--
ALTER TABLE `igraci`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicinski_pregledi`
--
ALTER TABLE `medicinski_pregledi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_igraca_fk` (`id_igraca`);

--
-- Indexes for table `ocene`
--
ALTER TABLE `ocene`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_treniranja_fk` (`id_treniranja`);

--
-- Indexes for table `plan_treninga`
--
ALTER TABLE `plan_treninga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_trenera_fk` (`id_trenera`);

--
-- Indexes for table `termini`
--
ALTER TABLE `termini`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treneri`
--
ALTER TABLE `treneri`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treninzi`
--
ALTER TABLE `treninzi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_termina_fk` (`id_termina`),
  ADD KEY `id_trenera_fk` (`id_trenera`) USING BTREE,
  ADD KEY `id_igraca_fk` (`id_igraca`) USING BTREE,
  ADD KEY `id_plana_treninga_fk` (`id_plana_treninga`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `igraci`
--
ALTER TABLE `igraci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicinski_pregledi`
--
ALTER TABLE `medicinski_pregledi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ocene`
--
ALTER TABLE `ocene`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_treninga`
--
ALTER TABLE `plan_treninga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `termini`
--
ALTER TABLE `termini`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treneri`
--
ALTER TABLE `treneri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treninzi`
--
ALTER TABLE `treninzi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `medicinski_pregledi`
--
ALTER TABLE `medicinski_pregledi`
  ADD CONSTRAINT `medicinski_pregledi_ibfk_1` FOREIGN KEY (`id_igraca`) REFERENCES `igraci` (`id`);

--
-- Constraints for table `ocene`
--
ALTER TABLE `ocene`
  ADD CONSTRAINT `ocene_ibfk_1` FOREIGN KEY (`id_treniranja`) REFERENCES `treninzi` (`id`);

--
-- Constraints for table `plan_treninga`
--
ALTER TABLE `plan_treninga`
  ADD CONSTRAINT `plan_treninga_ibfk_1` FOREIGN KEY (`id_trenera`) REFERENCES `treneri` (`id`);

--
-- Constraints for table `treninzi`
--
ALTER TABLE `treninzi`
  ADD CONSTRAINT `treninzi_ibfk_1` FOREIGN KEY (`id_igraca`) REFERENCES `igraci` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treninzi_ibfk_2` FOREIGN KEY (`id_trenera`) REFERENCES `treneri` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treninzi_ibfk_3` FOREIGN KEY (`id_termina`) REFERENCES `termini` (`id`),
  ADD CONSTRAINT `treninzi_ibfk_4` FOREIGN KEY (`id_plana_treninga`) REFERENCES `plan_treninga` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
