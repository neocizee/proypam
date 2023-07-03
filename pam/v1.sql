-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql207.unaux.com
-- Generation Time: May 29, 2023 at 07:36 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unaux_34169854_arperga`
--

-- --------------------------------------------------------

--
-- Table structure for table `altura`
--

CREATE TABLE `altura` (
  `id` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `id_altura` int(11) DEFAULT NULL,
  `alturacol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `arbolado`
--

CREATE TABLE `arbolado` (
  `fid` int(11) NOT NULL,
  `ele` float DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `name` varchar(4) DEFAULT NULL,
  `modulo` int(2) DEFAULT NULL,
  `id_gps` int(2) DEFAULT NULL,
  `id_asociad` int(4) DEFAULT NULL,
  `observacion` longtext DEFAULT NULL,
  `planilla` int(4) DEFAULT NULL,
  `altura_ini` int(4) DEFAULT NULL,
  `altura_fin` int(4) DEFAULT NULL,
  `lado` int(1) DEFAULT NULL,
  `id_bbdd` int(5) DEFAULT NULL,
  `obs_data` longtext DEFAULT NULL,
  `circunsf` float DEFAULT NULL,
  `diametro` float DEFAULT NULL,
  `numeracion_aproximada` float DEFAULT NULL,
  `rare_elements` tinyint(4) DEFAULT NULL,
  `rare_elements_type` int(1) DEFAULT NULL,
  `desc_rare_elements` longtext DEFAULT NULL,
  `ancho_vereda` tinyint(4) DEFAULT NULL,
  `vereda_damage` tinyint(4) DEFAULT NULL,
  `vereda_levantada` tinyint(4) DEFAULT NULL,
  `actualizacion` date DEFAULT NULL,
  `calle_id` int(11) NOT NULL,
  `altura_id` int(11) NOT NULL,
  `especie_arbol_id` int(11) NOT NULL,
  `vereda_id` int(11) NOT NULL,
  `estado_gen_id` int(11) NOT NULL,
  `rare_elements_id` int(11) NOT NULL,
  `espacio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `calle`
--

CREATE TABLE `calle` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `id_calle` int(11) DEFAULT NULL,
  `callecol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `espacio`
--

CREATE TABLE `espacio` (
  `id` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `id_espacio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `especie_arbol`
--

CREATE TABLE `especie_arbol` (
  `id` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `id_especie_arbol` int(11) DEFAULT NULL,
  `especie_arbolcol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `estado_gen`
--

CREATE TABLE `estado_gen` (
  `id` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `estado_gencol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rare_elements`
--

CREATE TABLE `rare_elements` (
  `id` int(11) NOT NULL,
  `tipo` varchar(25) DEFAULT NULL,
  `id_rare_elements` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `idusuario` varchar(45) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vereda`
--

CREATE TABLE `vereda` (
  `id` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `id_vereda` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `altura`
--
ALTER TABLE `altura`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arbolado`
--
ALTER TABLE `arbolado`
  ADD PRIMARY KEY (`fid`,`calle_id`,`altura_id`,`especie_arbol_id`,`vereda_id`,`estado_gen_id`,`rare_elements_id`,`espacio_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`fid`),
  ADD KEY `fk_arbolado_calle_idx` (`calle_id`),
  ADD KEY `fk_arbolado_altura1_idx` (`altura_id`),
  ADD KEY `fk_arbolado_especie_arbol1_idx` (`especie_arbol_id`),
  ADD KEY `fk_arbolado_vereda1_idx` (`vereda_id`),
  ADD KEY `fk_arbolado_estado_gen1_idx` (`estado_gen_id`),
  ADD KEY `fk_arbolado_rare_elements1_idx` (`rare_elements_id`),
  ADD KEY `fk_arbolado_espacio1_idx` (`espacio_id`);

--
-- Indexes for table `calle`
--
ALTER TABLE `calle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `espacio`
--
ALTER TABLE `espacio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `especie_arbol`
--
ALTER TABLE `especie_arbol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `estado_gen`
--
ALTER TABLE `estado_gen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `rare_elements`
--
ALTER TABLE `rare_elements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`,`idusuario`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `idusuario_UNIQUE` (`idusuario`);

--
-- Indexes for table `vereda`
--
ALTER TABLE `vereda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `altura`
--
ALTER TABLE `altura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `arbolado`
--
ALTER TABLE `arbolado`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calle`
--
ALTER TABLE `calle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `espacio`
--
ALTER TABLE `espacio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `especie_arbol`
--
ALTER TABLE `especie_arbol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estado_gen`
--
ALTER TABLE `estado_gen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rare_elements`
--
ALTER TABLE `rare_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vereda`
--
ALTER TABLE `vereda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arbolado`
--
ALTER TABLE `arbolado`
  ADD CONSTRAINT `fk_arbolado_altura1` FOREIGN KEY (`altura_id`) REFERENCES `altura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_arbolado_calle` FOREIGN KEY (`calle_id`) REFERENCES `calle` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_arbolado_espacio1` FOREIGN KEY (`espacio_id`) REFERENCES `espacio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_arbolado_especie_arbol1` FOREIGN KEY (`especie_arbol_id`) REFERENCES `especie_arbol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_arbolado_estado_gen1` FOREIGN KEY (`estado_gen_id`) REFERENCES `estado_gen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_arbolado_rare_elements1` FOREIGN KEY (`rare_elements_id`) REFERENCES `rare_elements` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_arbolado_vereda1` FOREIGN KEY (`vereda_id`) REFERENCES `vereda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
