-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 31, 2024 at 11:05 PM
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
-- Database: `proyectoeg`
--

-- --------------------------------------------------------

--
-- Table structure for table `locales`
--

CREATE TABLE `locales` (
  `codLocal` int(11) NOT NULL,
  `nombreLocal` varchar(100) NOT NULL,
  `ubicacionLocal` varchar(50) NOT NULL,
  `rubroLocal` varchar(20) NOT NULL,
  `codUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locales`
--

INSERT INTO `locales` (`codLocal`, `nombreLocal`, `ubicacionLocal`, `rubroLocal`, `codUsuario`) VALUES
(12, 'Empanadas Rosario', 'Calle Córdoba 1234, Rosario, Santa Fe', 'gastronomia', 55),
(13, 'Perfumería Bella', 'Avenida Pellegrini 5678, Rosario, Santa Fe', 'perfumeria', 59),
(14, 'Moda Urbana', 'Boulevard Oroño 910, Rosario, Santa Fe', 'indumentaria', 62),
(15, 'Delicias del Centro', 'Calle San Martín 345, Rosario, Santa Fe', 'gastronomia', 10),
(16, 'Estilo y Elegancia', 'Calle Santa Fe 6789, Rosario, Santa Fe', 'indumentaria', 19),
(17, 'Aromas de Rosario', 'Avenida Alberdi 123, Rosario, Santa Fe', 'perfumeria', 20),
(18, 'Sabores de Barrio', 'Calle Italia 456, Rosario, Santa Fe', 'gastronomia', 21),
(19, 'La Parrillita', 'Av. Pellegrini 1234', 'gastronomia', 56),
(20, 'El Rincon de las Empanadas', 'Calle San Martín 567', 'gastronomia', 57),
(21, 'Perfumes de la Rosa', 'Bv. Oroño 890', 'perfumeria', 58),
(22, 'Fashion Shop', 'Calle Córdoba 456', 'indumentaria', 56),
(23, 'La Sartén Feliz', 'Av. Alberdi 789', 'gastronomia', 57),
(24, 'Aromas Exclusivos', 'Calle Italia 234', 'perfumeria', 58),
(25, 'Ropa a la Moda', 'Bv. Oroño 567', 'indumentaria', 56),
(26, 'Delicias de la Abuela', 'Av. Pellegrini 890', 'gastronomia', 57),
(27, 'Fragancias Elegantes', 'Calle San Martín 123', 'perfumeria', 58),
(28, 'Estilo Urbano', 'Av. Alberdi 456', 'indumentaria', 56);

-- --------------------------------------------------------

--
-- Table structure for table `novedades`
--

CREATE TABLE `novedades` (
  `codNovedad` int(11) NOT NULL,
  `textoNovedad` varchar(200) NOT NULL,
  `fechaDesdeNovedad` date NOT NULL,
  `fechaHastaNovedad` date NOT NULL,
  `tipoUsuario` enum('administrador','dueno de local','Premium','Medium','Inicial') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `novedades`
--

INSERT INTO `novedades` (`codNovedad`, `textoNovedad`, `fechaDesdeNovedad`, `fechaHastaNovedad`, `tipoUsuario`) VALUES
(1, 'Primera Novedadd!', '2024-05-15', '2024-06-08', 'Premium'),
(3, 'Primera novedad para dueños!!!', '2024-05-15', '2024-05-16', 'dueno de local'),
(4, 'Primera novedad para administradores!!!', '2024-05-15', '2024-05-25', 'administrador'),
(5, 'deeeee\r\n', '2024-05-16', '2024-05-31', 'dueno de local'),
(6, 'Not medium', '2024-05-17', '2024-05-24', 'Medium');

-- --------------------------------------------------------

--
-- Table structure for table `promociones`
--

CREATE TABLE `promociones` (
  `codPromo` int(11) NOT NULL,
  `textoPromo` varchar(200) NOT NULL,
  `fechaDesdePromo` date NOT NULL,
  `fechaHastaPromo` date NOT NULL,
  `categoria_cliente` enum('Inicial','Medium','Premium') NOT NULL,
  `diasSemana` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`diasSemana`)),
  `estadoPromo` enum('pendiente','aprobada','denegada') NOT NULL,
  `codLocal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promociones`
--

INSERT INTO `promociones` (`codPromo`, `textoPromo`, `fechaDesdePromo`, `fechaHastaPromo`, `categoria_cliente`, `diasSemana`, `estadoPromo`, `codLocal`) VALUES
(61, 'Descuento en empanadas', '2024-06-01', '2024-06-30', 'Premium', '[\"Monday\", \"Tuesday\"]', 'pendiente', 12),
(62, 'Oferta en perfumes', '2024-06-05', '2024-06-15', 'Medium', '[\"Wednesday\", \"Thursday\"]', 'pendiente', 13),
(63, 'Descuento en ropa', '2024-06-10', '2024-06-20', 'Inicial', '[\"Friday\", \"Saturday\"]', 'pendiente', 14),
(64, '2x1 en pizzas', '2024-06-15', '2024-06-25', 'Premium', '[\"Monday\", \"Tuesday\"]', 'pendiente', 19),
(65, 'Descuento en fragancias', '2024-06-20', '2024-06-30', 'Medium', '[\"Wednesday\", \"Thursday\"]', 'pendiente', 21),
(66, 'Descuento en empanadas', '2024-05-24', '2024-06-30', 'Premium', '[\"Monday\", \"Tuesday\"]', 'pendiente', 12),
(67, 'Oferta en perfumes', '2024-05-29', '2024-06-15', 'Medium', '[\"Wednesday\", \"Thursday\"]', 'pendiente', 13),
(68, 'Descuento en ropa', '2024-05-30', '2024-06-20', 'Inicial', '[\"Friday\", \"Saturday\"]', 'pendiente', 14),
(69, '2x1 en pizzas', '2024-05-31', '2024-06-25', 'Premium', '[\"Monday\", \"Tuesday\"]', 'pendiente', 19),
(70, 'Descuento en fragancias', '2024-06-03', '2024-06-30', 'Medium', '[\"Wednesday\", \"Thursday\"]', 'pendiente', 21),
(71, 'Descuento en indumentaria urbana', '2024-05-24', '2024-06-30', 'Premium', '[\"Monday\", \"Tuesday\"]', 'pendiente', 22),
(72, 'Promo del día: hamburguesa + gaseosa', '2024-05-29', '2024-06-15', 'Medium', '[\"Wednesday\", \"Thursday\"]', 'pendiente', 23),
(73, 'Descuento en productos de hogar', '2024-05-30', '2024-06-20', 'Inicial', '[\"Friday\", \"Saturday\"]', 'pendiente', 24),
(74, 'Happy hour: 2x1 en tragos', '2024-05-31', '2024-06-25', 'Premium', '[\"Monday\", \"Tuesday\"]', 'pendiente', 25),
(75, 'Promo especial en postres', '2024-06-03', '2024-06-30', 'Medium', '[\"Wednesday\", \"Thursday\"]', 'pendiente', 26),
(76, 'Descuento en hamburguesas gourmet', '2024-06-05', '2024-06-15', 'Inicial', '[\"Friday\", \"Saturday\"]', 'pendiente', 27),
(77, 'Oferta en perfumes importados', '2024-06-10', '2024-06-20', 'Premium', '[\"Monday\", \"Tuesday\"]', 'pendiente', 28),
(79, 'Liquidación de temporada en ropa', '2024-06-15', '2024-06-25', 'Medium', '[\"Wednesday\", \"Thursday\"]', 'pendiente', 23),
(80, 'Descuento en productos para el hogar', '2024-06-20', '2024-06-30', 'Inicial', '[\"Friday\", \"Saturday\"]', 'pendiente', 24),
(81, 'Promo de invierno: 2x1 en sopas', '2024-06-24', '2024-07-05', 'Premium', '[\"Monday\", \"Tuesday\"]', 'pendiente', 25),
(82, 'Descuento en pizzas grandes', '2024-06-01', '2024-06-15', 'Medium', '[\"Monday\", \"Wednesday\", \"Friday\"]', 'pendiente', 19),
(83, 'Oferta en fragancias florales', '2024-06-05', '2024-06-20', 'Inicial', '[\"Tuesday\", \"Thursday\"]', 'pendiente', 20),
(84, 'Liquidación de jeans de moda', '2024-06-10', '2024-06-25', 'Medium', '[\"Monday\", \"Wednesday\", \"Friday\"]', 'pendiente', 21),
(85, 'Promo especial en postres italianos', '2024-06-15', '2024-06-30', 'Premium', '[\"Tuesday\", \"Thursday\"]', 'pendiente', 22),
(86, 'Descuento en productos de limpieza', '2024-06-20', '2024-07-05', 'Inicial', '[\"Monday\", \"Wednesday\", \"Friday\"]', 'pendiente', 26),
(87, 'Happy hour: 2x1 en tragos de autor', '2024-06-25', '2024-07-10', 'Medium', '[\"Thursday\", \"Saturday\"]', 'pendiente', 27),
(88, 'Oferta en perfumes de verano', '2024-06-30', '2024-07-15', 'Premium', '[\"Tuesday\", \"Friday\"]', 'pendiente', 28),
(89, 'Promo del día: empanadas + cerveza', '2024-07-05', '2024-07-20', 'Inicial', '[\"Monday\", \"Wednesday\", \"Friday\"]', 'pendiente', 19),
(90, 'Descuento en vestidos de noche', '2024-07-10', '2024-07-25', 'Medium', '[\"Tuesday\", \"Thursday\", \"Saturday\"]', 'pendiente', 20),
(91, 'Liquidación de fragancias masculinas', '2024-07-15', '2024-07-30', 'Premium', '[\"Monday\", \"Wednesday\", \"Friday\"]', 'pendiente', 21);

-- --------------------------------------------------------

--
-- Table structure for table `usos_promociones`
--

CREATE TABLE `usos_promociones` (
  `codCliente` int(11) NOT NULL,
  `codPromo` int(11) NOT NULL,
  `fechaUsoPromo` date NOT NULL,
  `estado` enum('enviada','aceptada','rechazada') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `codUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(100) NOT NULL,
  `claveUsuario` varchar(8) NOT NULL,
  `tipoUsuario` enum('administrador','dueno de local','cliente') NOT NULL,
  `categoria_cliente` varchar(10) NOT NULL,
  `token_activation` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`codUsuario`, `nombreUsuario`, `claveUsuario`, `tipoUsuario`, `categoria_cliente`, `token_activation`) VALUES
(10, 'tomdueno@gmail.com', '123', 'dueno de local', '', NULL),
(11, 'tomcliente@gmail.com', '123', 'cliente', 'Premium', NULL),
(19, 'tomduenito@gmail.com', '123', 'dueno de local', '', NULL),
(20, 'tomduenaso@gmail.com', '123', 'dueno de local', '', NULL),
(21, 'tomduenotoken@gmail.com', '123', 'dueno de local', '', NULL),
(22, 'tomclientetoken@gmail.com', '123', 'cliente', 'Inicial', NULL),
(41, 'tomadmin@gmail.com', '123', 'administrador', '', NULL),
(50, 'tomprue@gmail.com', '123', 'cliente', 'Inicial', '2c4xkz'),
(52, 'tomaspinolini2003@gmail.com', '123', 'cliente', 'Inicial', NULL),
(53, 'alice.smith@example.com', 'pass123', 'cliente', 'Inicial', NULL),
(54, 'bob.jones@example.com', 'pass123', 'cliente', 'Medium', NULL),
(55, 'carol.wilson@example.com', 'pass123', 'cliente', 'Premium', NULL),
(56, 'dave.brown@example.com', 'pass123', 'dueno de local', '', NULL),
(57, 'eve.davis@example.com', 'pass123', 'dueno de local', '', NULL),
(58, 'frank.miller@example.com', 'pass123', 'dueno de local', '', NULL),
(59, 'grace.moore@example.com', 'pass123', 'administrador', '', NULL),
(60, 'harry.taylor@example.com', 'pass123', 'administrador', '', NULL),
(61, 'irene.anderson@example.com', 'pass123', 'cliente', 'Inicial', NULL),
(62, 'jack.thomas@example.com', 'pass123', 'cliente', 'Medium', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`codLocal`),
  ADD KEY `locales_ibfk_1` (`codUsuario`);

--
-- Indexes for table `novedades`
--
ALTER TABLE `novedades`
  ADD PRIMARY KEY (`codNovedad`);

--
-- Indexes for table `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`codPromo`),
  ADD KEY `promociones_ibfk_1` (`codLocal`);

--
-- Indexes for table `usos_promociones`
--
ALTER TABLE `usos_promociones`
  ADD KEY `codPromo` (`codPromo`),
  ADD KEY `usos_promociones_ibfk_1` (`codCliente`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`codUsuario`),
  ADD UNIQUE KEY `nombreUsuairo` (`nombreUsuario`),
  ADD UNIQUE KEY `nombreUsuario` (`nombreUsuario`),
  ADD UNIQUE KEY `token_activation` (`token_activation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `locales`
--
ALTER TABLE `locales`
  MODIFY `codLocal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `novedades`
--
ALTER TABLE `novedades`
  MODIFY `codNovedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `promociones`
--
ALTER TABLE `promociones`
  MODIFY `codPromo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `codUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `locales`
--
ALTER TABLE `locales`
  ADD CONSTRAINT `locales_ibfk_1` FOREIGN KEY (`codUsuario`) REFERENCES `usuarios` (`codUsuario`) ON DELETE CASCADE;

--
-- Constraints for table `promociones`
--
ALTER TABLE `promociones`
  ADD CONSTRAINT `promociones_ibfk_1` FOREIGN KEY (`codLocal`) REFERENCES `locales` (`codLocal`) ON DELETE CASCADE;

--
-- Constraints for table `usos_promociones`
--
ALTER TABLE `usos_promociones`
  ADD CONSTRAINT `usos_promociones_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `usuarios` (`codUsuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `usos_promociones_ibfk_2` FOREIGN KEY (`codPromo`) REFERENCES `promociones` (`codPromo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
