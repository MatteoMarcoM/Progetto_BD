-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 28, 2022 alle 13:58
-- Versione del server: 10.4.24-MariaDB
-- Versione PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `catena_librerie`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `CodiceFiscale` varchar(20) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `DataNascita` date DEFAULT NULL,
  `Eta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`CodiceFiscale`, `Nome`, `Cognome`, `DataNascita`, `Eta`) VALUES
('FVOCGH46B28I170R', 'Francesco', 'Gialli', NULL, NULL),
('GLTHHC81H54G197T', 'Sara', 'Olivetti', '1989-06-15', NULL),
('HGMGBJ83T66B853P', 'Matteo', 'Olivetti', NULL, NULL),
('LXINBP82T16I917Q', 'Luca', 'Bianchi', '1997-09-05', 25),
('RNDYPH35C42L439C', 'Mario', 'Rossi', '1999-06-15', 23),
('SDURPP53P44C654Z', 'Paolo', 'Marietti', NULL, NULL),
('VGKPCW35S58A354Z', 'Ercole', 'Rossi', NULL, NULL),
('XBDWHH28C24E326G', 'Lucia', 'Verdi', '1998-09-05', NULL),
('YRTSZF31A07L310R', 'Giacomo', 'Verdi', NULL, NULL),
('ZDRLHD73R11I219Z', 'Lea', 'Marietti', '2002-09-15', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `comprato`
--

CREATE TABLE `comprato` (
  `CodDipendente` varchar(20) NOT NULL,
  `CodNegozio` varchar(20) NOT NULL,
  `OrarioTransazione` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ISBNLibro` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `comprato`
--

INSERT INTO `comprato` (`CodDipendente`, `CodNegozio`, `OrarioTransazione`, `ISBNLibro`) VALUES
('DDCHNS82B01G985Z', 'ACI983', '2022-06-18 15:30:23', '1427365976431'),
('DDCHNS82B01G985Z', 'FTC379', '2022-06-18 15:29:00', '2397612493568'),
('DDCHNS82B01G985Z', 'FTC379', '2022-06-18 15:41:26', '1346728549613'),
('DDCHNS82B01G985Z', 'MTU189', '2022-06-18 15:41:05', '1243679586432'),
('DDCHNS82B01G985Z', 'PYO948', '2022-06-18 15:29:31', '2397612493568'),
('DDCHNS82B01G985Z', 'PYO948', '2022-06-18 15:32:23', '1427365976431'),
('MCNMDV63R63D998P', 'BTI146', '2022-06-18 15:30:23', '3461372986437'),
('MCNMDV63R63D998P', 'BTI146', '2022-06-18 15:31:54', '2397612413568'),
('MCNMDV63R63D998P', 'LPQ209', '2022-06-18 15:31:19', '1346986542365'),
('MCNMDV63R63D998P', 'LPQ209', '2022-06-18 15:31:37', '2397612493588'),
('MCNMDV63R63D998P', 'LPQ209', '2022-06-18 15:39:49', '3461372986437'),
('MCNMDV63R63D998P', 'MTU189', '2022-06-18 15:39:15', '3461372986437'),
('NJPSZS33A71H541D', 'FTC379', '2022-06-18 15:40:05', '2431673421542'),
('NJPSZS33A71H541D', 'FTC379', '2022-06-18 15:40:35', '1346986542365'),
('NJPSZS33A71H541D', 'MTU189', '2022-06-18 15:41:05', '2397612413568'),
('NJPSZS33A71H541D', 'PYN019', '2022-06-18 15:40:21', '2397612493568'),
('NJPSZS33A71H541D', 'PYO948', '2022-06-18 15:40:05', '2397612493568'),
('NJPSZS33A71H541D', 'UNE421', '2022-06-18 15:39:49', '2397612493568'),
('TDJWQN36L48B580M', 'FTC379', '2022-06-18 15:31:19', '2397612413568'),
('TDJWQN36L48B580M', 'PYN019', '2022-06-18 15:32:08', '2397612493588'),
('TDJWQN36L48B580M', 'PYN019', '2022-06-18 15:41:38', '1427365976431'),
('TDJWQN36L48B580M', 'PYO948', '2022-06-18 15:40:49', '1427365976431'),
('TDJWQN36L48B580M', 'PYO948', '2022-06-18 15:41:54', '2397612493588'),
('TDJWQN36L48B580M', 'UNE421', '2022-06-18 15:41:38', '1427365976431'),
('VSVZPA38L63C919N', 'BTI146', '2022-06-18 15:29:00', '1346728549613'),
('VSVZPA38L63C919N', 'BTI146', '2022-06-18 15:40:35', '1346986542365'),
('VSVZPA38L63C919N', 'LPQ209', '2022-06-18 15:31:03', '3461372986437'),
('VSVZPA38L63C919N', 'LPQ209', '2022-06-18 15:32:23', '2431673421542'),
('VSVZPA38L63C919N', 'MTU189', '2022-06-18 15:32:08', '2397612493588'),
('VSVZPA38L63C919N', 'PYN019', '2022-06-18 15:40:49', '2397612413568'),
('VSVZPA38L63C919N', 'PYO948', '2022-06-18 15:41:26', '1346986542365'),
('VSVZPA38L63C919N', 'UNE421', '2022-06-18 15:29:31', '2397612493568'),
('VSVZPA38L63C919N', 'UNE421', '2022-06-18 15:33:34', '2397612413568'),
('WZPYWG35H69H712G', 'ACI983', '2022-06-18 15:31:54', '1427365976431'),
('WZPYWG35H69H712G', 'BTI146', '2022-06-18 15:40:21', '2397612499568'),
('WZPYWG35H69H712G', 'FTC379', '2022-06-18 15:33:34', '1346986542365'),
('WZPYWG35H69H712G', 'FTC379', '2022-06-18 15:41:54', '1346986542365'),
('WZPYWG35H69H712G', 'MTU189', '2022-06-18 15:39:15', '2397612413568'),
('WZPYWG35H69H712G', 'PYN019', '2022-06-18 15:31:03', '1346728549613'),
('WZPYWG35H69H712G', 'PYO948', '2022-06-18 15:31:37', '2397612413568');

-- --------------------------------------------------------

--
-- Struttura della tabella `dipendente`
--

CREATE TABLE `dipendente` (
  `CodDipendente` varchar(20) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `DataNascita` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `dipendente`
--

INSERT INTO `dipendente` (`CodDipendente`, `Nome`, `Cognome`, `DataNascita`) VALUES
('CTWHFY61P19L857B', 'Giacomo', 'Verdi', NULL),
('DDCHNS82B01G985Z', 'Mario', 'Rossi', NULL),
('MCNMDV63R63D998P', 'Sara', 'Rossi', '2002-08-19'),
('NJPSZS33A71H541D', 'Giacomo', 'Pio', '2000-01-01'),
('TDJWQN36L48B580M', 'Lucia', 'Bianchi', NULL),
('VSVZPA38L63C919N', 'Giacomo', 'Rossi', NULL),
('WZPYWG35H69H712G', 'Paolo', 'Marietti', '1997-09-05'),
('ZPHHLN44E51I609U', 'Luca', 'Olivetti', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `lavora`
--

CREATE TABLE `lavora` (
  `CodNegozio` varchar(20) NOT NULL,
  `CodDipendente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `lavora`
--

INSERT INTO `lavora` (`CodNegozio`, `CodDipendente`) VALUES
('ACI983', 'NJPSZS33A71H541D'),
('ACI983', 'TDJWQN36L48B580M'),
('BTI146', 'CTWHFY61P19L857B'),
('BTI146', 'MCNMDV63R63D998P'),
('BTI146', 'VSVZPA38L63C919N'),
('FTC379', 'CTWHFY61P19L857B'),
('FTC379', 'VSVZPA38L63C919N'),
('LPQ209', 'CTWHFY61P19L857B'),
('LPQ209', 'DDCHNS82B01G985Z'),
('LPQ209', 'VSVZPA38L63C919N'),
('MTU189', 'NJPSZS33A71H541D'),
('MTU189', 'TDJWQN36L48B580M'),
('MTU189', 'VSVZPA38L63C919N'),
('PYN019', 'CTWHFY61P19L857B'),
('PYN019', 'ZPHHLN44E51I609U'),
('PYO948', 'VSVZPA38L63C919N'),
('PYO948', 'WZPYWG35H69H712G'),
('UNE421', 'VSVZPA38L63C919N');

-- --------------------------------------------------------

--
-- Struttura della tabella `libro`
--

CREATE TABLE `libro` (
  `ISBN` varchar(13) NOT NULL,
  `Titolo` varchar(30) NOT NULL,
  `Autori` varchar(30) NOT NULL,
  `Edizione` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `libro`
--

INSERT INTO `libro` (`ISBN`, `Titolo`, `Autori`, `Edizione`) VALUES
('1243652362457', 'Il rosso e il nero', 'Stendhal', 'Garzanti'),
('1243679586432', '1984', 'George Orwell', 'Feltrinelli'),
('1243765983764', 'Ulisse', 'James Joyce', 'Mondadori'),
('1346273198573', 'I miserabili', 'Victor Hugo', 'Feltrinelli'),
('1346728549613', 'Il nome della rosa', 'Umberto Eco', 'Bompiani'),
('1346986542365', 'La coscienza di Zeno', 'Italo Svevo', 'Mondadori'),
('1427365976431', 'Il piccolo principe', 'Antoine De Saint Exupery', 'Bompiani'),
('2397612413568', 'Edipo re', 'Sofocle', 'Rizzoli'),
('2397612493568', 'Divina Commedia', 'Dante Alighieri', 'Mondadori'),
('2397612493588', 'La metamorfosi', 'Franz Kafka', 'Bompiani'),
('2397612499568', 'Il fu mattia pascal', 'Luigi Pirandello', 'Feltrinelli'),
('2431672834212', 'Così parlò Zaratustra', 'Friedrich Nietzsche', 'Mondadori'),
('2431672834912', 'La fattoria degli animali', 'George Orwell', 'Feltrinelli'),
('2431673421542', 'Orgoglio e pregiudizio', 'Jane Austen', 'Rizzoli'),
('2431673429542', 'I fiori del male', 'Charles Baudelaire', 'Feltrinelli'),
('3461372986437', 'Il signore degli anelli', 'J. R. R. Tolkien', 'Bompiani');

-- --------------------------------------------------------

--
-- Struttura della tabella `listalibri`
--

CREATE TABLE `listalibri` (
  `ISBNLibro` varchar(13) NOT NULL,
  `CodNegozio` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `listalibri`
--

INSERT INTO `listalibri` (`ISBNLibro`, `CodNegozio`) VALUES
('1243652362457', 'ACI983'),
('1243652362457', 'LPQ209'),
('1243652362457', 'PYN019'),
('1243652362457', 'PYO948'),
('1243679586432', 'LPQ209'),
('1243765983764', 'BTI146'),
('1243765983764', 'FTC379'),
('1243765983764', 'PYN019'),
('1243765983764', 'UNE421'),
('1346273198573', 'ACI983'),
('1346273198573', 'FTC379'),
('1346273198573', 'LPQ209'),
('1346273198573', 'UNE421'),
('1346728549613', 'BTI146'),
('1346728549613', 'LPQ209'),
('1346728549613', 'MTU189'),
('1346728549613', 'PYN019'),
('1346986542365', 'FTC379'),
('1346986542365', 'MTU189'),
('1346986542365', 'PYN019'),
('1346986542365', 'PYO948'),
('1427365976431', 'MTU189'),
('1427365976431', 'PYO948'),
('2397612413568', 'FTC379'),
('2397612413568', 'MTU189'),
('2397612493568', 'BTI146'),
('2397612493588', 'LPQ209'),
('2397612493588', 'MTU189'),
('2397612493588', 'PYN019'),
('2397612493588', 'PYO948'),
('2397612499568', 'PYO948'),
('2431672834212', 'UNE421'),
('2431672834912', 'UNE421'),
('2431673421542', 'MTU189'),
('2431673429542', 'MTU189'),
('3461372986437', 'PYN019');

-- --------------------------------------------------------

--
-- Struttura della tabella `negozio`
--

CREATE TABLE `negozio` (
  `CodNegozio` varchar(20) NOT NULL,
  `Indirizzo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `negozio`
--

INSERT INTO `negozio` (`CodNegozio`, `Indirizzo`) VALUES
('ACI983', 'Via Vittorio Emanuele 7, Pesar'),
('BTI146', 'Via G. Rossini 20, Pesaro (PU)'),
('FTC379', 'Via Roma 45, Roma (RM)'),
('LPQ209', 'Piazza della Repubblica, Urbin'),
('MTU189', 'Via Aldo Moro 24, Urbino (PU)'),
('PYN019', 'Via Chiesa 11, Firenze (FI)'),
('PYO948', 'Viale Romagna 12, Milano (MI)'),
('UNE421', 'Viale Europa 67, Torino (TO)');

-- --------------------------------------------------------

--
-- Struttura della tabella `stampato`
--

CREATE TABLE `stampato` (
  `ISBNLibro` varchar(13) NOT NULL,
  `CodTipografia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `stampato`
--

INSERT INTO `stampato` (`ISBNLibro`, `CodTipografia`) VALUES
('1243652362457', 'PO1038'),
('1243679586432', 'MN3890'),
('1243679586432', 'PO1038'),
('1243679586432', 'UI3409'),
('1243765983764', 'PO1038'),
('1243765983764', 'UI3409'),
('1243765983764', 'UT1934'),
('1346273198573', 'MN3890'),
('1346273198573', 'WE1209'),
('1346728549613', 'TY2309'),
('1346986542365', 'PO1038'),
('1346986542365', 'TY2309'),
('1346986542365', 'WE1209'),
('1427365976431', 'UI3409'),
('1427365976431', 'UT1934'),
('2397612413568', 'WE1209'),
('2397612493568', 'UI3409'),
('2397612493588', 'WE1209'),
('2397612499568', 'PO1038'),
('2397612499568', 'UI3409'),
('2397612499568', 'UT1934'),
('2397612499568', 'WE1209'),
('2431672834212', 'MN3890'),
('2431672834212', 'UT1934'),
('2431673421542', 'UI3409'),
('2431673421542', 'UT1934'),
('2431673429542', 'TY2309'),
('2431673429542', 'UI3409'),
('3461372986437', 'UT1934');

-- --------------------------------------------------------

--
-- Struttura della tabella `tipografia`
--

CREATE TABLE `tipografia` (
  `CodTipografia` varchar(20) NOT NULL,
  `Indirizzo` varchar(30) NOT NULL,
  `PrezzoContratto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `tipografia`
--

INSERT INTO `tipografia` (`CodTipografia`, `Indirizzo`, `PrezzoContratto`) VALUES
('MN3890', 'Via Aldo Moro 24, Urbino', 12.001),
('PO1038', 'Piazza della Repubblica, Urbin', NULL),
('TY2309', 'Via Roma 45, Roma (RM)', NULL),
('UI3409', 'Via G. Rossini 20, Pesaro (PU)', NULL),
('UT1934', 'Via Chiesa 11, Firenze (FI)', NULL),
('WE1209', 'Via Vittorio Emanuele 10, Pesa', 12.278);

-- --------------------------------------------------------

--
-- Struttura della tabella `transazione`
--

CREATE TABLE `transazione` (
  `CodDipendente` varchar(20) NOT NULL,
  `CodNegozio` varchar(20) NOT NULL,
  `Orario` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CodCliente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `transazione`
--

INSERT INTO `transazione` (`CodDipendente`, `CodNegozio`, `Orario`, `CodCliente`) VALUES
('VSVZPA38L63C919N', 'UNE421', '2022-06-18 15:29:31', 'FVOCGH46B28I170R'),
('MCNMDV63R63D998P', 'BTI146', '2022-06-18 15:30:23', 'GLTHHC81H54G197T'),
('MCNMDV63R63D998P', 'LPQ209', '2022-06-18 15:31:37', 'GLTHHC81H54G197T'),
('DDCHNS82B01G985Z', 'FTC379', '2022-06-18 15:29:00', 'HGMGBJ83T66B853P'),
('MCNMDV63R63D998P', 'LPQ209', '2022-06-18 15:31:19', 'HGMGBJ83T66B853P'),
('VSVZPA38L63C919N', 'MTU189', '2022-06-18 15:32:08', 'HGMGBJ83T66B853P'),
('VSVZPA38L63C919N', 'LPQ209', '2022-06-18 15:32:23', 'LXINBP82T16I917Q'),
('TDJWQN36L48B580M', 'PYN019', '2022-06-18 15:32:08', 'RNDYPH35C42L439C'),
('VSVZPA38L63C919N', 'BTI146', '2022-06-18 15:29:00', 'RNDYPH35C42L439C'),
('VSVZPA38L63C919N', 'LPQ209', '2022-06-18 15:31:03', 'RNDYPH35C42L439C'),
('VSVZPA38L63C919N', 'UNE421', '2022-06-18 15:33:34', 'RNDYPH35C42L439C'),
('DDCHNS82B01G985Z', 'ACI983', '2022-06-18 15:30:23', 'SDURPP53P44C654Z'),
('MCNMDV63R63D998P', 'BTI146', '2022-06-18 15:31:54', 'SDURPP53P44C654Z'),
('WZPYWG35H69H712G', 'ACI983', '2022-06-18 15:31:54', 'SDURPP53P44C654Z'),
('DDCHNS82B01G985Z', 'PYO948', '2022-06-18 15:29:31', 'VGKPCW35S58A354Z'),
('DDCHNS82B01G985Z', 'PYO948', '2022-06-18 15:32:23', 'VGKPCW35S58A354Z'),
('TDJWQN36L48B580M', 'FTC379', '2022-06-18 15:31:19', 'VGKPCW35S58A354Z'),
('WZPYWG35H69H712G', 'FTC379', '2022-06-18 15:33:34', 'VGKPCW35S58A354Z'),
('WZPYWG35H69H712G', 'PYN019', '2022-06-18 15:31:03', 'YRTSZF31A07L310R'),
('WZPYWG35H69H712G', 'PYO948', '2022-06-18 15:31:37', 'YRTSZF31A07L310R');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CodiceFiscale`);

--
-- Indici per le tabelle `comprato`
--
ALTER TABLE `comprato`
  ADD PRIMARY KEY (`CodDipendente`,`CodNegozio`,`OrarioTransazione`,`ISBNLibro`),
  ADD KEY `libro` (`ISBNLibro`),
  ADD KEY `negozio3` (`CodNegozio`);

--
-- Indici per le tabelle `dipendente`
--
ALTER TABLE `dipendente`
  ADD PRIMARY KEY (`CodDipendente`);

--
-- Indici per le tabelle `lavora`
--
ALTER TABLE `lavora`
  ADD PRIMARY KEY (`CodNegozio`,`CodDipendente`),
  ADD KEY `dipendente` (`CodDipendente`);

--
-- Indici per le tabelle `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indici per le tabelle `listalibri`
--
ALTER TABLE `listalibri`
  ADD PRIMARY KEY (`ISBNLibro`,`CodNegozio`),
  ADD KEY `negozio2` (`CodNegozio`);

--
-- Indici per le tabelle `negozio`
--
ALTER TABLE `negozio`
  ADD PRIMARY KEY (`CodNegozio`);

--
-- Indici per le tabelle `stampato`
--
ALTER TABLE `stampato`
  ADD PRIMARY KEY (`ISBNLibro`,`CodTipografia`),
  ADD KEY `stampa` (`CodTipografia`);

--
-- Indici per le tabelle `tipografia`
--
ALTER TABLE `tipografia`
  ADD PRIMARY KEY (`CodTipografia`);

--
-- Indici per le tabelle `transazione`
--
ALTER TABLE `transazione`
  ADD PRIMARY KEY (`CodDipendente`,`CodNegozio`,`Orario`),
  ADD KEY `clientela` (`CodCliente`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `comprato`
--
ALTER TABLE `comprato`
  ADD CONSTRAINT `dipendente2` FOREIGN KEY (`CodDipendente`) REFERENCES `dipendente` (`CodDipendente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `libro` FOREIGN KEY (`ISBNLibro`) REFERENCES `libro` (`ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `negozio3` FOREIGN KEY (`CodNegozio`) REFERENCES `negozio` (`CodNegozio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `lavora`
--
ALTER TABLE `lavora`
  ADD CONSTRAINT `dipendente` FOREIGN KEY (`CodDipendente`) REFERENCES `dipendente` (`CodDipendente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `negozio` FOREIGN KEY (`CodNegozio`) REFERENCES `negozio` (`CodNegozio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `listalibri`
--
ALTER TABLE `listalibri`
  ADD CONSTRAINT `libro2` FOREIGN KEY (`ISBNLibro`) REFERENCES `libro` (`ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `negozio2` FOREIGN KEY (`CodNegozio`) REFERENCES `negozio` (`CodNegozio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `stampato`
--
ALTER TABLE `stampato`
  ADD CONSTRAINT `stampa` FOREIGN KEY (`CodTipografia`) REFERENCES `tipografia` (`CodTipografia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `stampaLibro` FOREIGN KEY (`ISBNLibro`) REFERENCES `libro` (`ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `transazione`
--
ALTER TABLE `transazione`
  ADD CONSTRAINT `clientela` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`CodiceFiscale`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
