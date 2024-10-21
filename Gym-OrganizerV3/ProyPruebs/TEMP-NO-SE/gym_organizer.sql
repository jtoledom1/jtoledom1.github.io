-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2024 a las 02:27:03
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
-- Base de datos: `gym_organizer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id_consulta` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `mensaje` text DEFAULT NULL,
  `fecha_consulta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mediciones`
--

CREATE TABLE `mediciones` (
  `id_medicion` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_medicion` date DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `estatura` decimal(5,2) DEFAULT NULL,
  `grasa_corporal` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetivos`
--

CREATE TABLE `objetivos` (
  `id_objetivo` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros_ejercicios`
--

CREATE TABLE `registros_ejercicios` (
  `id_registro` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `ejercicio` varchar(100) DEFAULT NULL,
  `peso_cargado` decimal(6,2) DEFAULT NULL,
  `repeticiones` int(11) DEFAULT NULL,
  `series` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutinas`
--

CREATE TABLE `rutinas` (
  `id_rutina` int(11) NOT NULL,
  `nombre_rutina` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `dificultad` enum('principiante','intermedio','avanzado') DEFAULT NULL,
  `categoria` enum('cardio','fuerza','flexibilidad','otro') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutinas_usuario`
--

CREATE TABLE `rutinas_usuario` (
  `id_usuario_rutina` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_rutina` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_consulta`);

--
-- Indices de la tabla `mediciones`
--
ALTER TABLE `mediciones`
  ADD PRIMARY KEY (`id_medicion`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `objetivos`
--
ALTER TABLE `objetivos`
  ADD PRIMARY KEY (`id_objetivo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `registros_ejercicios`
--
ALTER TABLE `registros_ejercicios`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `rutinas`
--
ALTER TABLE `rutinas`
  ADD PRIMARY KEY (`id_rutina`);

--
-- Indices de la tabla `rutinas_usuario`
--
ALTER TABLE `rutinas_usuario`
  ADD PRIMARY KEY (`id_usuario_rutina`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_rutina` (`id_rutina`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mediciones`
--
ALTER TABLE `mediciones`
  MODIFY `id_medicion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `objetivos`
--
ALTER TABLE `objetivos`
  MODIFY `id_objetivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registros_ejercicios`
--
ALTER TABLE `registros_ejercicios`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rutinas`
--
ALTER TABLE `rutinas`
  MODIFY `id_rutina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rutinas_usuario`
--
ALTER TABLE `rutinas_usuario`
  MODIFY `id_usuario_rutina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mediciones`
--
ALTER TABLE `mediciones`
  ADD CONSTRAINT `mediciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `objetivos`
--
ALTER TABLE `objetivos`
  ADD CONSTRAINT `objetivos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `registros_ejercicios`
--
ALTER TABLE `registros_ejercicios`
  ADD CONSTRAINT `registros_ejercicios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `rutinas_usuario`
--
ALTER TABLE `rutinas_usuario`
  ADD CONSTRAINT `rutinas_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `rutinas_usuario_ibfk_2` FOREIGN KEY (`id_rutina`) REFERENCES `rutinas` (`id_rutina`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
