-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2022 a las 03:27:13
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inmobiliaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedad`
--

CREATE TABLE `propiedad` (
  `id` int(11) NOT NULL,
  `tipo_propiedad_id` int(11) DEFAULT NULL,
  `direccion` varchar(200) NOT NULL,
  `habitaciones` int(11) DEFAULT NULL,
  `banios` int(1) DEFAULT 1,
  `patio` tinyint(1) NOT NULL,
  `tipo_contrato` varchar(200) NOT NULL DEFAULT 'alquiler',
  `moneda` varchar(20) NOT NULL,
  `precio` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `propiedad`
--

INSERT INTO `propiedad` (`id`, `tipo_propiedad_id`, `direccion`, `habitaciones`, `banios`, `patio`, `tipo_contrato`, `moneda`, `precio`, `imagen`) VALUES
(46, 3, 'Alem 378', 4, 1, 1, 'Alquiler', '$', 110000, 'images/casas/634def6b3a3a6.jpg'),
(47, 1, 'Rodriguez 1289', 3, 1, 1, 'Venta', 'USD', 45000, 'images/casas/634de462725ce.jpg'),
(58, 5, 'Haiti 890', 3, 1, 1, 'Alquiler', '$', 75000, 'images/casas/634dfd3e3fb1b.jpg'),
(76, 3, 'Pellegrini 345', 2, 1, 0, 'Alquiler', '$', 50000, 'images/casas/634df0a0418d1.jpg'),
(81, 1, 'PINTO 678', 3, 3, 1, 'Venta', 'USD', 110000, 'images/casas/634de5272bfbe.jpg'),
(82, 3, 'Las Heras 789', 5, 2, 1, 'Alquiler', '$', 99000, 'images/casas/634def9ac9121.jpeg'),
(83, 3, 'test', 12, 6, 1, 'Venta', 'USD', 59000, 'images/casas/634df04e63df2.jpeg'),
(84, 1, 'Montevideo 578', 4, 2, 1, 'Venta', 'USD', 120000, 'images/casas/634de2f551d28.jpg'),
(85, 1, 'Roca 765', 3, 1, 1, 'Alquiler', '$', 44, 'images/casas/634dfcc2cad0c.jpg'),
(87, 3, 'Saavedra 478', 3, 1, 1, 'Venta', 'USD', 59000, 'images/casas/634df10713ce4.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_propiedad`
--

CREATE TABLE `tipo_propiedad` (
  `id` int(11) NOT NULL,
  `tipo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_propiedad`
--

INSERT INTO `tipo_propiedad` (`id`, `tipo`) VALUES
(1, 'Chalet'),
(3, 'Departamento'),
(5, 'Duplex'),
(6, 'Triplex'),
(7, 'Loft');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `password`) VALUES
(2, 'admin@prueba.com', '$2a$12$B/C4M1XWJOhzDZwgvpuIcO/VxBZXrD2ZvMJ1/2pZZ6zHShul/V9Ne');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `propiedad`
--
ALTER TABLE `propiedad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo` (`tipo_propiedad_id`);

--
-- Indices de la tabla `tipo_propiedad`
--
ALTER TABLE `tipo_propiedad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `propiedad`
--
ALTER TABLE `propiedad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `tipo_propiedad`
--
ALTER TABLE `tipo_propiedad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `propiedad`
--
ALTER TABLE `propiedad`
  ADD CONSTRAINT `propiedad_ibfk_1` FOREIGN KEY (`tipo_propiedad_id`) REFERENCES `tipo_propiedad` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
