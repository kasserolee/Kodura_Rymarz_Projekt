-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2024 at 10:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `magazynmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `dostawa`
--

CREATE TABLE `dostawa` (
  `nr_dostawy` int(10) NOT NULL,
  `adres` varchar(50) NOT NULL,
  `status` varchar(15) NOT NULL,
  `oczekiwana_data_dostawy` date NOT NULL,
  `id_samochodu` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `dostawa`
--

INSERT INTO `dostawa` (`nr_dostawy`, `adres`, `status`, `oczekiwana_data_dostawy`, `id_samochodu`) VALUES
(1, 'Dzialowa', 'Dostarczone', '2024-01-17', 1),
(5, 'adres', 'Dostarczone', '2024-01-13', NULL),
(6, 'adres', 'W realizacji', '2024-01-13', NULL),
(7, 'lekarska 2', 'Dostarczone', '2024-01-14', NULL),
(8, 'Testowa', 'Dostarczone', '2024-01-14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `klient`
--

CREATE TABLE `klient` (
  `id_klienta` int(10) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `adres` varchar(100) NOT NULL,
  `telefon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `klient`
--

INSERT INTO `klient` (`id_klienta`, `imie`, `nazwisko`, `email`, `adres`, `telefon`) VALUES
(19, 'test', 'test', 'test@test.com', 'test', 'test'),
(21, 'test2', 'test2', 'test2@th.com', 'test2', 'test2'),
(22, 'test3', 'test3', 'test3@th.com', 'test3', '12361324');

-- --------------------------------------------------------

--
-- Table structure for table `konto`
--

CREATE TABLE `konto` (
  `nr_konta` int(10) NOT NULL,
  `login` varchar(25) NOT NULL,
  `haslo` varchar(100) NOT NULL,
  `id_klienta` int(10) DEFAULT NULL,
  `id_pracownika` int(10) DEFAULT NULL,
  `rola` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `konto`
--

INSERT INTO `konto` (`nr_konta`, `login`, `haslo`, `id_klienta`, `id_pracownika`, `rola`) VALUES
(2, 'admin', '$2a$12$ro2PUUA0zb2gk90LxTtKDOD7urp/anZ.kSVNsJLqemitZMoOMAIF6', NULL, 1, 'ADMIN'),
(12, 'test', '$2a$10$LxgXg.jYsCggXX5w1JBrl.0WtKvInqrDVvKDFOO5c5tQfWFnhlDbq', 19, NULL, 'USER'),
(14, 'test2', '$2a$10$/qXJucdHXLI.Ifq01b14xOMMe5gYqesb1PEi4/ZLKX.RPBld5QcbC', 21, NULL, 'USER'),
(15, 'manager', '$2a$12$HOL908UXHkdnUzR7epMpWuZiSEDzVProjXBVCwKHkE0p.ZmUnjtt6', NULL, 2, 'MANAGER'),
(17, 'pracownik11', '$2a$10$Vb/lbXMWQJ6.9EhSlQgkoOg1L5xLsbIGe9NANU/C4wWfT.Erdk71S', NULL, 4, 'PRACOWNIK'),
(19, 'manager21', '$2a$10$9Pd/JDcLpnVWYCvFCUA/DubkmFRWHnoeS2P7jVFAoWrOQ18U/pWS6', NULL, 6, 'MANAGER'),
(20, 'pracownik21', '$2a$10$qd/TsFwTT39B4/ecZaQuquH2sTM8jH6VnGJ9bjjB0GEFsdRUph.Se', NULL, 7, 'PRACOWNIK'),
(21, 'manager31', '$2a$10$9JYl3FxGXc5dYIA3derDyuSBKsQksWFdPu1.YbrrppQTY/YP39JsW', NULL, 8, 'MANAGER'),
(24, 'pracownik31', '$2a$10$5wVhAKnb8rLfTiejROxMRePmaueWInLLjebg/2aSLsD9cMuWVf7G.', NULL, 11, 'PRACOWNIK'),
(25, 'test3', '$2a$10$Ac8xxzYh0odOQRfq7I6ac..tfakwgJWPWFR3cwxUTe9aL5z7XDml2', 22, NULL, 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `magazyn`
--

CREATE TABLE `magazyn` (
  `id_magazynu` int(10) NOT NULL,
  `adres` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `magazyn`
--

INSERT INTO `magazyn` (`id_magazynu`, `adres`) VALUES
(1, 'Przykładowy Adres'),
(2, 'Przyklad2'),
(3, 'Przyklad3');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `id_produktu` int(10) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `producent` varchar(255) NOT NULL,
  `cena` decimal(10,2) NOT NULL,
  `typ` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`id_produktu`, `nazwa`, `producent`, `cena`, `typ`) VALUES
(1, 'Cegła Klinkierowa Ręcznie Formowana', 'Wienerberger', 2.50, 'Cegła'),
(2, 'Tikkurila Harmony', 'Tikkurila', 120.00, 'Farba'),
(3, 'Gres Szkliwiony Atlas Concorde Marvel Stone', 'Atlas Concorde', 90.00, 'Płytki ceramiczne'),
(4, 'Drewno Konstrukcyjne Sosnowe', 'Drewno Z Natury', 3.50, 'Drewno'),
(5, 'Stalowy Profil I-beam', 'Example Steel Company', 150.00, 'Stal'),
(7, 'EkoBrick Pro', 'GreenTech Building Solutions', 129.99, 'Płyta izolacyjna');

-- --------------------------------------------------------

--
-- Table structure for table `pracownik`
--

CREATE TABLE `pracownik` (
  `id_pracownika` int(10) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `id_magazynu` int(10) NOT NULL,
  `pensja` decimal(10,2) NOT NULL,
  `stanowisko` varchar(30) NOT NULL,
  `adres` varchar(100) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pracownik`
--

INSERT INTO `pracownik` (`id_pracownika`, `imie`, `nazwisko`, `id_magazynu`, `pensja`, `stanowisko`, `adres`, `telefon`, `email`) VALUES
(1, 'admin', 'admin', 1, 0.00, 'Administrator', 'brak', 'brak', 'brak'),
(2, 'manager1', 'manager1', 1, 0.00, 'Manager', 'brak', 'brak', 'brakmanager'),
(4, 'pracownik11', 'pracownik11', 1, 5000.00, 'Pracownik', 'asdgasf', '32162314', 'pracownik11@th.com'),
(6, 'manager21', 'manager21', 2, 7000.00, 'Manager', 'asdfsadf', '312534', 'manager21@th.com'),
(7, 'pracownik21', 'pracownik21', 2, 5500.00, 'Pracownik', 'asdasdf', '215123', 'pracownik21@th.com'),
(8, 'manager31', 'manager31', 3, 8000.00, 'Manager', 'asdgasf', '1253241234', 'manager31@gmail.com'),
(11, 'pracownik31', 'pracownik31', 3, 5000.00, 'Pracownik', 'asdfasdf', '12356123', 'pracownik31@th.com');

-- --------------------------------------------------------

--
-- Table structure for table `rozpiska`
--

CREATE TABLE `rozpiska` (
  `id_rozpiski` int(10) NOT NULL,
  `adres` varchar(100) NOT NULL,
  `data` date NOT NULL,
  `idpracownika` int(10) DEFAULT NULL,
  `nr_zamowienia` int(10) NOT NULL,
  `id_samochodu` int(10) DEFAULT NULL,
  `wykonane` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rozpiska`
--

INSERT INTO `rozpiska` (`id_rozpiski`, `adres`, `data`, `idpracownika`, `nr_zamowienia`, `id_samochodu`, `wykonane`) VALUES
(1, 'Dzialowa', '2024-01-17', 4, 1, 1, 1),
(2, 'Lesna', '2024-01-19', 4, 5, NULL, 1),
(3, 'Lesna', '2024-01-19', 4, 1, NULL, 1),
(4, 'lekarska 2', '2024-01-14', 4, 7, 1, 1),
(5, 'Testowa', '2024-01-14', 4, 8, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `samochoddostawczy`
--

CREATE TABLE `samochoddostawczy` (
  `id_samochodu` int(10) NOT NULL,
  `max_waga` int(10) NOT NULL,
  `id_magazynu` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `samochoddostawczy`
--

INSERT INTO `samochoddostawczy` (`id_samochodu`, `max_waga`, `id_magazynu`) VALUES
(1, 2000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sektor`
--

CREATE TABLE `sektor` (
  `id_sektora` int(10) NOT NULL,
  `id_magazynu` int(10) NOT NULL,
  `nazwa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sektor`
--

INSERT INTO `sektor` (`id_sektora`, `id_magazynu`, `nazwa`) VALUES
(1, 1, 'Materiały murarskie'),
(2, 1, 'Materiały wykończeniowe'),
(3, 1, 'Materiały podłogowe'),
(5, 1, 'Materiały konstrukcyjne'),
(6, 1, 'Materiały stalowe'),
(7, 2, 'Materiały murarskie'),
(8, 2, 'Materiały wykończeniowe'),
(9, 2, 'Materiały podłogowe'),
(10, 2, 'Materiały konstrukcyjne'),
(11, 2, 'Materiały stalowe'),
(12, 3, 'Materiały konstrukcyjne');

-- --------------------------------------------------------

--
-- Table structure for table `skladzamowienia`
--

CREATE TABLE `skladzamowienia` (
  `nr_zamowienia` int(10) NOT NULL,
  `id_produktu` int(10) NOT NULL,
  `ilosc` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `skladzamowienia`
--

INSERT INTO `skladzamowienia` (`nr_zamowienia`, `id_produktu`, `ilosc`) VALUES
(5, 1, 5),
(6, 1, 5),
(6, 3, 2),
(7, 1, 1),
(8, 2, 2),
(8, 3, 100);

-- --------------------------------------------------------

--
-- Table structure for table `stanmagazynu`
--

CREATE TABLE `stanmagazynu` (
  `id_magazynu` int(10) NOT NULL,
  `id_produktu` int(10) NOT NULL,
  `ilosc` int(10) NOT NULL,
  `id_sektora` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `stanmagazynu`
--

INSERT INTO `stanmagazynu` (`id_magazynu`, `id_produktu`, `ilosc`, `id_sektora`) VALUES
(1, 1, 20006, 1),
(1, 2, 500, 2),
(1, 3, 10000, 3),
(1, 4, 500, 5),
(1, 5, 500, 6),
(1, 7, 2100, 5);

-- --------------------------------------------------------

--
-- Table structure for table `zamowienie`
--

CREATE TABLE `zamowienie` (
  `nr_zamowienia` int(10) NOT NULL,
  `kwota` decimal(10,2) NOT NULL,
  `data_zlozenia` date NOT NULL,
  `nr_dostawy` int(10) NOT NULL,
  `id_klienta` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `zamowienie`
--

INSERT INTO `zamowienie` (`nr_zamowienia`, `kwota`, `data_zlozenia`, `nr_dostawy`, `id_klienta`) VALUES
(1, 12.00, '2024-01-10', 1, 19),
(5, 12.50, '2024-01-10', 5, 19),
(6, 192.50, '2024-01-10', 6, 21),
(7, 2.50, '2024-01-11', 7, 19),
(8, 9240.00, '2024-01-11', 8, 22);

-- --------------------------------------------------------

--
-- Table structure for table `zaopatrzenie`
--

CREATE TABLE `zaopatrzenie` (
  `id_zaopatrzenia` int(10) NOT NULL,
  `id_magazynu` int(10) NOT NULL,
  `id_produktu` int(10) NOT NULL,
  `ilosc` int(10) NOT NULL,
  `idpracownika` int(10) NOT NULL,
  `wykonane` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zaopatrzenie`
--

INSERT INTO `zaopatrzenie` (`id_zaopatrzenia`, `id_magazynu`, `id_produktu`, `ilosc`, `idpracownika`, `wykonane`) VALUES
(1, 1, 1, 1, 4, 1),
(2, 1, 1, 2, 4, 1),
(6, 1, 1, 50, 4, 1),
(7, 1, 7, 2000, 4, 1),
(8, 1, 7, 100, 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dostawa`
--
ALTER TABLE `dostawa`
  ADD PRIMARY KEY (`nr_dostawy`),
  ADD KEY `idSamochodu` (`id_samochodu`);

--
-- Indexes for table `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`id_klienta`);

--
-- Indexes for table `konto`
--
ALTER TABLE `konto`
  ADD PRIMARY KEY (`nr_konta`),
  ADD KEY `idKlienta` (`id_klienta`),
  ADD KEY `idPracownika` (`id_pracownika`);

--
-- Indexes for table `magazyn`
--
ALTER TABLE `magazyn`
  ADD PRIMARY KEY (`id_magazynu`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id_produktu`);

--
-- Indexes for table `pracownik`
--
ALTER TABLE `pracownik`
  ADD PRIMARY KEY (`id_pracownika`),
  ADD KEY `idMagazynu` (`id_magazynu`);

--
-- Indexes for table `rozpiska`
--
ALTER TABLE `rozpiska`
  ADD PRIMARY KEY (`id_rozpiski`),
  ADD KEY `id_pracownika` (`idpracownika`),
  ADD KEY `nr_zamowienia` (`nr_zamowienia`),
  ADD KEY `id_samochodu` (`id_samochodu`);

--
-- Indexes for table `samochoddostawczy`
--
ALTER TABLE `samochoddostawczy`
  ADD PRIMARY KEY (`id_samochodu`),
  ADD KEY `idMagazynu` (`id_magazynu`);

--
-- Indexes for table `sektor`
--
ALTER TABLE `sektor`
  ADD PRIMARY KEY (`id_sektora`),
  ADD KEY `id_magazynu` (`id_magazynu`);

--
-- Indexes for table `skladzamowienia`
--
ALTER TABLE `skladzamowienia`
  ADD PRIMARY KEY (`nr_zamowienia`,`id_produktu`),
  ADD KEY `idProduktu` (`id_produktu`);

--
-- Indexes for table `stanmagazynu`
--
ALTER TABLE `stanmagazynu`
  ADD PRIMARY KEY (`id_magazynu`,`id_produktu`),
  ADD KEY `idProduktu` (`id_produktu`),
  ADD KEY `id_sektora` (`id_sektora`);

--
-- Indexes for table `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`nr_zamowienia`),
  ADD KEY `idKlienta` (`id_klienta`),
  ADD KEY `nrDostawy` (`nr_dostawy`);

--
-- Indexes for table `zaopatrzenie`
--
ALTER TABLE `zaopatrzenie`
  ADD PRIMARY KEY (`id_zaopatrzenia`),
  ADD KEY `id_magazynu` (`id_magazynu`),
  ADD KEY `id_pracownika` (`idpracownika`),
  ADD KEY `id_produktu` (`id_produktu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dostawa`
--
ALTER TABLE `dostawa`
  MODIFY `nr_dostawy` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `klient`
--
ALTER TABLE `klient`
  MODIFY `id_klienta` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `konto`
--
ALTER TABLE `konto`
  MODIFY `nr_konta` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `magazyn`
--
ALTER TABLE `magazyn`
  MODIFY `id_magazynu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id_produktu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pracownik`
--
ALTER TABLE `pracownik`
  MODIFY `id_pracownika` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rozpiska`
--
ALTER TABLE `rozpiska`
  MODIFY `id_rozpiski` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `samochoddostawczy`
--
ALTER TABLE `samochoddostawczy`
  MODIFY `id_samochodu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sektor`
--
ALTER TABLE `sektor`
  MODIFY `id_sektora` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `nr_zamowienia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `zaopatrzenie`
--
ALTER TABLE `zaopatrzenie`
  MODIFY `id_zaopatrzenia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dostawa`
--
ALTER TABLE `dostawa`
  ADD CONSTRAINT `dostawa_ibfk_1` FOREIGN KEY (`id_samochodu`) REFERENCES `samochoddostawczy` (`id_samochodu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konto`
--
ALTER TABLE `konto`
  ADD CONSTRAINT `konto_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `klient` (`id_klienta`),
  ADD CONSTRAINT `konto_ibfk_2` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownik` (`id_pracownika`);

--
-- Constraints for table `pracownik`
--
ALTER TABLE `pracownik`
  ADD CONSTRAINT `pracownik_ibfk_1` FOREIGN KEY (`id_magazynu`) REFERENCES `magazyn` (`id_magazynu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rozpiska`
--
ALTER TABLE `rozpiska`
  ADD CONSTRAINT `rozpiska_ibfk_1` FOREIGN KEY (`idpracownika`) REFERENCES `pracownik` (`id_pracownika`),
  ADD CONSTRAINT `rozpiska_ibfk_2` FOREIGN KEY (`nr_zamowienia`) REFERENCES `zamowienie` (`nr_zamowienia`),
  ADD CONSTRAINT `rozpiska_ibfk_3` FOREIGN KEY (`id_samochodu`) REFERENCES `samochoddostawczy` (`id_samochodu`);

--
-- Constraints for table `samochoddostawczy`
--
ALTER TABLE `samochoddostawczy`
  ADD CONSTRAINT `samochoddostawczy_ibfk_1` FOREIGN KEY (`id_magazynu`) REFERENCES `magazyn` (`id_magazynu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sektor`
--
ALTER TABLE `sektor`
  ADD CONSTRAINT `sektor_ibfk_1` FOREIGN KEY (`id_magazynu`) REFERENCES `magazyn` (`id_magazynu`) ON DELETE CASCADE;

--
-- Constraints for table `skladzamowienia`
--
ALTER TABLE `skladzamowienia`
  ADD CONSTRAINT `skladzamowienia_ibfk_1` FOREIGN KEY (`id_produktu`) REFERENCES `material` (`id_produktu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `skladzamowienia_ibfk_2` FOREIGN KEY (`nr_zamowienia`) REFERENCES `zamowienie` (`nr_zamowienia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stanmagazynu`
--
ALTER TABLE `stanmagazynu`
  ADD CONSTRAINT `stanmagazynu_ibfk_1` FOREIGN KEY (`id_produktu`) REFERENCES `material` (`id_produktu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stanmagazynu_ibfk_2` FOREIGN KEY (`id_magazynu`) REFERENCES `magazyn` (`id_magazynu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stanmagazynu_ibfk_3` FOREIGN KEY (`id_sektora`) REFERENCES `sektor` (`id_sektora`) ON DELETE SET NULL;

--
-- Constraints for table `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `zamowienie_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `klient` (`id_klienta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zamowienie_ibfk_2` FOREIGN KEY (`nr_dostawy`) REFERENCES `dostawa` (`nr_dostawy`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zaopatrzenie`
--
ALTER TABLE `zaopatrzenie`
  ADD CONSTRAINT `zaopatrzenie_ibfk_1` FOREIGN KEY (`id_magazynu`) REFERENCES `magazyn` (`id_magazynu`),
  ADD CONSTRAINT `zaopatrzenie_ibfk_2` FOREIGN KEY (`idpracownika`) REFERENCES `pracownik` (`id_pracownika`),
  ADD CONSTRAINT `zaopatrzenie_ibfk_3` FOREIGN KEY (`id_produktu`) REFERENCES `material` (`id_produktu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
