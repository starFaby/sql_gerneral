-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-03-2020 a las 18:36:00
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `eurekakits`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` char(50) DEFAULT NULL,
  `image` char(50) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombre`, `image`, `estado`) VALUES
(1, 'herramientas mecanicas', '/uploads/1583430725929.jpg', 1),
(2, 'importacion de materiales', '/uploads/1583430771767.jpg', 1),
(3, 'sensores industriales', '/uploads/1583430826421.jpg', 1),
(4, 'medidores electricos', '/uploads/1583431002221.jpg', 1),
(5, 'herramientas electricas', '/uploads/1583431031756.jpg', 1),
(6, 'targetas de arduino', '/uploads/1583431054899.jpg', 1),
(7, 'equipo de proteccion personal', '/uploads/1583431154951.jpg', 1),
(8, 'elementos electronicos', '/uploads/1583431179167.jpg', 1),
(9, 'equipos de medicion', '/uploads/1583431200101.jpg', 1),
(10, 'libros de electronica practica', '/uploads/1583433092117.jpg', 1),
(11, 'folletos de kits para armar', '/uploads/1583433205927.jpg', 1),
(12, 'herramientas para suelda electronica', '/uploads/1583433240928.jpg', 1),
(13, 'modulos para arduino', '/uploads/1583433267717.jpg', 1),
(14, 'proyectos de desarrollo', '/uploads/1583433300774.jpg', 1),
(15, 'sensores y actuadores', '/uploads/1583433353237.jpg', 1),
(16, 'cables', '/uploads/1583433479451.jpg', 1),
(17, 'equipo de seguridad industrial', '/uploads/1583433504180.jpg', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
