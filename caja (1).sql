-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-08-2024 a las 23:49:24
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `caja`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE `egresos` (
  `idEgreso` int(11) NOT NULL,
  `monto` decimal(11,2) NOT NULL,
  `fecha` date NOT NULL,
  `detalle` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `idIngreso` int(11) NOT NULL,
  `monto` decimal(11,2) NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `metodo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`idIngreso`, `monto`, `fecha`, `tipo`, `metodo`) VALUES
(11, 5000.00, '2024-08-12', 'Ingreso', 'Efectivo'),
(12, 6000.00, '2024-08-12', 'Ingreso', 'Efectivo'),
(13, 5000.00, '2024-08-12', 'Egreso', 'Efectivo'),
(14, 5000.00, '2024-08-12', 'Ingreso', 'Tarjeta'),
(15, 5000.00, '2024-08-12', 'Ingreso', 'Efectivo'),
(16, 6000.00, '2024-08-12', 'Ingreso', 'Efectivo'),
(17, 9000.00, '2024-08-12', 'Ingreso', 'Efectivo'),
(18, 5000.00, '2024-08-12', 'Ingreso', 'Efectivo'),
(19, 800.00, '2024-08-12', 'Ingreso', 'Efectivo'),
(20, 800.00, '2024-08-12', 'Ingreso', 'Efectivo'),
(21, 6000.00, '2024-08-12', 'Ingreso', 'Efectivo'),
(22, 9000.00, '2024-08-12', 'Ingreso', 'Efectivo'),
(23, 5200.00, '2024-08-12', 'Ingreso', 'Mercado Pago'),
(24, 50000.00, '2024-08-12', 'Ingreso', 'Efectivo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD PRIMARY KEY (`idEgreso`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`idIngreso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `egresos`
--
ALTER TABLE `egresos`
  MODIFY `idEgreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `idIngreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
