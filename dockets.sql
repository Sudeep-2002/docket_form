-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2023 at 07:48 PM
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
-- Database: `dockets`
--

-- --------------------------------------------------------

--
-- Table structure for table `dockets`
--

CREATE TABLE `dockets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `hours_worked` int(11) DEFAULT NULL,
  `rate_per_hour` int(11) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `po_number` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dockets`
--

INSERT INTO `dockets` (`id`, `name`, `start_time`, `end_time`, `hours_worked`, `rate_per_hour`, `supplier`, `po_number`, `description`) VALUES
(1, 'Prajwal', '22:03:00', '23:04:00', 1, 500, 'Jobfit Health Group Pty Ltd', '3093/M00013', 'Jobfit Basic Medical - Michael Swadling\r\n'),
(2, 'Prajwal P Kashyap', '22:04:00', '23:04:00', 1, 550, 'Europcar WA', '3093/M00033', 'Hire 4x4 tray back for Jamie Taylor\r\n'),
(3, 'Raj', '23:12:00', '00:12:00', 1, 250, 'Tradeline Site Solutions', '3093/M00129', 'TSS/25633\r\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dockets`
--
ALTER TABLE `dockets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dockets`
--
ALTER TABLE `dockets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
