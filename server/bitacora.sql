-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2023 at 10:46 PM
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
-- Database: `bitacora`
--

-- --------------------------------------------------------

--
-- Table structure for table `apertura`
--

CREATE TABLE `apertura` (
  `idSesion` int(11) NOT NULL,
  `opinionesExternas` tinytext DEFAULT NULL,
  `interesEnLosDemas` tinytext DEFAULT NULL,
  `escuchar` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cognitivo`
--

CREATE TABLE `cognitivo` (
  `idSesion` int(11) NOT NULL,
  `pensOrdenAlto` tinyint(4) DEFAULT NULL,
  `pensMinRequerido` tinyint(4) DEFAULT NULL,
  `pensNoRelacionado` tinyint(4) DEFAULT NULL,
  `pensDesconocidos` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comportamiento`
--

CREATE TABLE `comportamiento` (
  `idSesion` int(11) NOT NULL,
  `proactivo` tinytext DEFAULT NULL,
  `atento` tinytext DEFAULT NULL,
  `indiferente` tinytext DEFAULT NULL,
  `desinteresado` tinytext DEFAULT NULL,
  `disruptivo` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emocional`
--

CREATE TABLE `emocional` (
  `idSesion` int(11) NOT NULL,
  `emocionado_inspirado` tinytext DEFAULT NULL,
  `positivo_dispuesto` tinytext DEFAULT NULL,
  `atento_participativo` tinytext DEFAULT NULL,
  `frustrado_preocupado` tinytext DEFAULT NULL,
  `molesto_triste` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interacciones`
--

CREATE TABLE `interacciones` (
  `idSesion` int(11) NOT NULL,
  `conCompaneros` tinyint(4) DEFAULT NULL,
  `conImplementadores` tinyint(4) DEFAULT NULL,
  `disenadoresContenido` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `involucramiento`
--

CREATE TABLE `involucramiento` (
  `idSesion` int(11) NOT NULL,
  `involucradoYPropone` tinytext DEFAULT NULL,
  `involucrado` tinytext DEFAULT NULL,
  `cooperativo` tinytext DEFAULT NULL,
  `indiferente` tinytext DEFAULT NULL,
  `desinteresado` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `niveldeinteres`
--

CREATE TABLE `niveldeinteres` (
  `idSesion` int(11) NOT NULL,
  `pensandoProcesoAprendizaje` tinyint(4) DEFAULT NULL,
  `solucionadorProblemas` tinyint(4) DEFAULT NULL,
  `ideas` tinyint(4) DEFAULT NULL,
  `usoHerramientas` tinyint(4) DEFAULT NULL,
  `procedimiento` tinyint(4) DEFAULT NULL,
  `recordarCiertaInfo` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participantes`
--

CREATE TABLE `participantes` (
  `idParticipante` int(11) NOT NULL,
  `nombre` tinytext DEFAULT NULL,
  `implementador` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sesiones`
--

CREATE TABLE `sesiones` (
  `idSesion` int(11) NOT NULL,
  `cantParticipantes` tinyint(4) NOT NULL,
  `nombreAct` tinytext NOT NULL,
  `nombreEspacio` tinytext NOT NULL,
  `fecha` datetime NOT NULL,
  `notas` text DEFAULT NULL,
  `materialNecesario` tinyint(1) DEFAULT NULL,
  `internet` tinyint(1) DEFAULT NULL,
  `mobiliarioAdecuado` tinyint(1) DEFAULT NULL,
  `luzElectrica` tinyint(1) DEFAULT NULL,
  `banos` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sesiones`
--

INSERT INTO `sesiones` (`idSesion`, `cantParticipantes`, `nombreAct`, `nombreEspacio`, `fecha`, `notas`, `materialNecesario`, `internet`, `mobiliarioAdecuado`, `luzElectrica`, `banos`) VALUES
(1, 5, 'Prueba Actividad', 'Prueba Espacio', '2023-06-01 12:00:00', 'Prueba notas', 1, 0, 1, 0, 1),
(2, 6, 'Prueba Act', 'Prueba Espacio', '2023-06-04 22:45:13', 'dasgdfbthtr', 0, 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sesiones_participantes`
--

CREATE TABLE `sesiones_participantes` (
  `idSesion` int(11) NOT NULL,
  `idParticipante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apertura`
--
ALTER TABLE `apertura`
  ADD KEY `idSesion` (`idSesion`);

--
-- Indexes for table `cognitivo`
--
ALTER TABLE `cognitivo`
  ADD KEY `idSesion` (`idSesion`);

--
-- Indexes for table `comportamiento`
--
ALTER TABLE `comportamiento`
  ADD KEY `idSesion` (`idSesion`);

--
-- Indexes for table `emocional`
--
ALTER TABLE `emocional`
  ADD KEY `idSesion` (`idSesion`);

--
-- Indexes for table `interacciones`
--
ALTER TABLE `interacciones`
  ADD KEY `idSesion` (`idSesion`);

--
-- Indexes for table `involucramiento`
--
ALTER TABLE `involucramiento`
  ADD KEY `idSesion` (`idSesion`);

--
-- Indexes for table `niveldeinteres`
--
ALTER TABLE `niveldeinteres`
  ADD KEY `idSesion` (`idSesion`);

--
-- Indexes for table `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`idParticipante`);

--
-- Indexes for table `sesiones`
--
ALTER TABLE `sesiones`
  ADD PRIMARY KEY (`idSesion`);

--
-- Indexes for table `sesiones_participantes`
--
ALTER TABLE `sesiones_participantes`
  ADD PRIMARY KEY (`idSesion`,`idParticipante`),
  ADD KEY `idParticipante` (`idParticipante`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sesiones`
--
ALTER TABLE `sesiones`
  MODIFY `idSesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apertura`
--
ALTER TABLE `apertura`
  ADD CONSTRAINT `apertura_ibfk_1` FOREIGN KEY (`idSesion`) REFERENCES `sesiones` (`idSesion`);

--
-- Constraints for table `cognitivo`
--
ALTER TABLE `cognitivo`
  ADD CONSTRAINT `cognitivo_ibfk_1` FOREIGN KEY (`idSesion`) REFERENCES `sesiones` (`idSesion`);

--
-- Constraints for table `comportamiento`
--
ALTER TABLE `comportamiento`
  ADD CONSTRAINT `comportamiento_ibfk_1` FOREIGN KEY (`idSesion`) REFERENCES `sesiones` (`idSesion`);

--
-- Constraints for table `emocional`
--
ALTER TABLE `emocional`
  ADD CONSTRAINT `emocional_ibfk_1` FOREIGN KEY (`idSesion`) REFERENCES `sesiones` (`idSesion`);

--
-- Constraints for table `interacciones`
--
ALTER TABLE `interacciones`
  ADD CONSTRAINT `interacciones_ibfk_1` FOREIGN KEY (`idSesion`) REFERENCES `sesiones` (`idSesion`);

--
-- Constraints for table `involucramiento`
--
ALTER TABLE `involucramiento`
  ADD CONSTRAINT `involucramiento_ibfk_1` FOREIGN KEY (`idSesion`) REFERENCES `sesiones` (`idSesion`);

--
-- Constraints for table `niveldeinteres`
--
ALTER TABLE `niveldeinteres`
  ADD CONSTRAINT `niveldeinteres_ibfk_1` FOREIGN KEY (`idSesion`) REFERENCES `sesiones` (`idSesion`);

--
-- Constraints for table `sesiones_participantes`
--
ALTER TABLE `sesiones_participantes`
  ADD CONSTRAINT `sesiones_participantes_ibfk_1` FOREIGN KEY (`idSesion`) REFERENCES `sesiones` (`idSesion`),
  ADD CONSTRAINT `sesiones_participantes_ibfk_2` FOREIGN KEY (`idParticipante`) REFERENCES `participantes` (`idParticipante`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
