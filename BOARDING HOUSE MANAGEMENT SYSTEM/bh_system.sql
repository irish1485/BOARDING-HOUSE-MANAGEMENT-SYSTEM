-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2025 at 12:58 PM
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
-- Database: `bh_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `room_number` varchar(10) DEFAULT NULL,
  `bed_number` varchar(10) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `role`, `room_number`, `bed_number`, `month`, `name`, `username`, `password`, `active`) VALUES
(20, 'owner', NULL, NULL, NULL, 'Irish Dizo', 'i', '111', 0),
(22, 'tenant', '1', '1', 'JANUARY, 2025', 'Kim Euihyun', 'eui', '222', 1),
(26, 'tenant', '1', '2', 'JANUARY, 2025', 'Mhaantot', 'antot', '333', 1),
(29, 'tenant', '1', '3', 'MAY, 2025', 'Yoo Taeju', 'tae', '444', 1),
(30, 'tenant', '2', '2', 'MARCH, 2025', 'dfgh', 'll', '000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('irish', '123');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `month` varchar(50) NOT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `total_bill` int(11) NOT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `account_id`, `month`, `remarks`, `total_bill`, `amount_paid`, `payment_method`, `payment_date`, `balance`) VALUES
(23, 22, 'JANUARY, 2025', 'FULLY PAID', 1500, 1500.00, 'CASH', '2025-01-02', 0.00),
(31, 22, 'FEBRUARY, 2025', 'FULLY PAID', 1500, 1500.00, 'CASH', '2025-02-11', 0.00),
(33, 22, 'MARCH, 2025', 'FULLY PAID', 1500, 1500.00, 'CASH', '2025-03-17', 0.00),
(34, 22, 'APRIL, 2025', 'FULLY PAID', 1500, 1500.00, 'CASH', '2025-04-06', 0.00),
(35, 26, 'JANUARY, 2025', 'FULLY PAID', 1500, 1500.00, 'CASH', '2025-01-05', 0.00),
(36, 26, 'FEBRUARY, 2025', 'PARTIAL', 1500, 650.00, 'CARD', '2025-02-11', 850.00),
(38, 22, 'MAY, 2025', 'UNPAID', 1500, 0.00, NULL, NULL, 1500.00),
(40, 29, 'MAY, 2025', 'PARTIAL', 1500, 500.00, 'GCASH', '2025-05-14', 1000.00),
(41, 30, 'MARCH, 2025', 'PARTIAL', 1500, 500.00, 'CASH', '2025-03-08', 1000.00),
(42, 30, 'APRIL, 2025', 'PARTIAL', 1500, 500.00, 'CASH', '2025-04-07', 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `room_number` varchar(10) DEFAULT NULL,
  `bed_number` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_phone_number` varchar(20) DEFAULT NULL,
  `guardian_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `account_id`, `gender`, `phone_number`, `address`, `guardian_name`, `guardian_phone_number`, `guardian_address`) VALUES
(16, 22, 'male', '121234567890', 'qasdfghjkl', 'gasdfghjk', '12345678908', 'ASDFGHLKJYTRED'),
(24, 26, 'female', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_id` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `tenants`
--
ALTER TABLE `tenants`
  ADD CONSTRAINT `tenants_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
