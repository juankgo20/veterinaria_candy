-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-03-2022 a las 03:03:38
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ovas_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointment_list`
--

CREATE TABLE `appointment_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `schedule` date NOT NULL,
  `owner_name` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `category_id` int(30) NOT NULL,
  `breed` text NOT NULL,
  `age` varchar(50) NOT NULL,
  `service_ids` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `appointment_list`
--

INSERT INTO `appointment_list` (`id`, `code`, `schedule`, `owner_name`, `contact`, `email`, `address`, `category_id`, `breed`, `age`, `service_ids`, `status`, `date_created`, `date_updated`) VALUES
(10, 'OVAS-2022030001', '2022-03-21', 'Pedro Tijera', '2345678', 'pedro@tijera.com', 'Medellin, Bonito, No me la se', 7, 'Labrador', '6', '7,8', 1, '2022-03-21 18:19:22', '2022-03-21 18:21:33'),
(11, 'OVAS-2022030002', '2022-03-23', 'Jaime Garzon', '12345678', 'hola@haa', 'Itagui, Antioquia, No me la se', 8, 'Minino', '3', '8', 0, '2022-03-22 20:39:25', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Active, 1 = Delete',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Dogs', 1, '2022-01-04 10:31:11', NULL),
(2, 'Cats', 1, '2022-01-04 10:31:38', NULL),
(3, 'Hamsters', 1, '2022-01-04 10:32:02', NULL),
(4, 'Rabbits', 1, '2022-01-04 10:32:13', NULL),
(5, 'Birds', 1, '2022-01-04 10:32:47', NULL),
(6, 'test', 1, '2022-01-04 10:33:02', NULL),
(7, 'Perro', 0, '2022-03-21 16:56:12', NULL),
(8, 'Gato', 0, '2022-03-21 17:07:46', NULL),
(9, 'Conejo', 0, '2022-03-21 17:07:56', NULL),
(10, 'Caballos', 0, '2022-03-21 17:14:39', NULL),
(11, 'Tortuga', 0, '2022-03-21 17:14:46', NULL),
(12, 'Chivo', 0, '2022-03-21 18:22:03', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message_list`
--

CREATE TABLE `message_list` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `category_ids` text NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `fee` float NOT NULL DEFAULT 0,
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `service_list`
--

INSERT INTO `service_list` (`id`, `category_ids`, `name`, `description`, `fee`, `delete_flag`, `date_created`, `date_updated`) VALUES
(6, '4', 'deleted', '<p>test</p>', 123, 1, '2022-01-04 11:17:34', '2022-01-04 11:17:46'),
(7, '8,7', 'Peluqueria', '<p>Los profesionales eligen el champú adecuado y el corte de pelo correspondiente, realizan tratamientos anti pulgas, pedicura, tratamientos para la piel, hidratan e incluso pueden realizar masajes de relajación. Todo esto son los servicios necesarios para la salud de la mascota.<br></p>', 30000, 0, '2022-03-21 17:12:42', '2022-03-21 17:12:55'),
(8, '8,7', 'Vacunación', '<p><span style=\"color: rgb(12, 12, 12); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px; background-color: rgba(247, 247, 247, 0.65);\">Esta es una de las acciones para la prevención y control del virus de la rabia</span><br></p>', 10000, 0, '2022-03-21 17:14:14', NULL),
(9, '7', 'Paseo', '<p>El paseador recoge a la mascota en su casa (u otro lugar indicado) y le acompaña en sus caminatas por los parques y jardines cercanos, «donde podrá jugar o relacionarse con otros perros»<br></p>', 15000, 0, '2022-03-21 17:21:30', '2022-03-21 17:21:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Veterinaria Candy '),
(6, 'short_name', 'Candy'),
(11, 'logo', 'uploads/VetCandy.png'),
(13, 'user_avatar', 'uploads/avatar-1.png'),
(14, 'cover', 'uploads/pet-feliz.jpg'),
(15, 'content', 'Array'),
(16, 'email', 'info@veterinariacandy.com'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(23, 'max_appointment', '15'),
(24, 'clinic_schedule', '9:00 AM - 5:00 PM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrador', NULL, 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'uploads/avatar-1.png?v=1647897971', NULL, 1, 1, '2021-01-20 14:02:37', '2022-03-22 20:40:57'),
(6, 'Prueba', NULL, 'Prueba', 'Prueba', 'c893bad68927b457dbed39460e6afd62', 'uploads/avatar-6.png?v=1647903172', NULL, 1, 1, '2022-03-21 17:52:19', '2022-03-21 17:52:52');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appointment_list`
--
ALTER TABLE `appointment_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `message_list`
--
ALTER TABLE `message_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appointment_list`
--
ALTER TABLE `appointment_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `message_list`
--
ALTER TABLE `message_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appointment_list`
--
ALTER TABLE `appointment_list`
  ADD CONSTRAINT `appointment_list_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
