-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2021 at 03:32 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctorreport`
--

CREATE TABLE `doctorreport` (
  `id` int(11) NOT NULL,
  `doctor_username` varchar(50) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorreport`
--

INSERT INTO `doctorreport` (`id`, `doctor_username`, `patient_id`, `date`, `month`, `year`) VALUES
(1, 'Teja', 2, 24, 10, 2021),
(2, 'srikanth', 1, 27, 10, 2021);

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

CREATE TABLE `medication` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `symptoms` longtext NOT NULL,
  `tests` longtext NOT NULL,
  `test_results` longtext NOT NULL,
  `medical` longtext NOT NULL,
  `doctor_type` varchar(20) NOT NULL,
  `doctor_price` int(11) NOT NULL,
  `test_price` int(11) NOT NULL,
  `medical_price` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medication`
--

INSERT INTO `medication` (`id`, `patient_id`, `status`, `symptoms`, `tests`, `test_results`, `medical`, `doctor_type`, `doctor_price`, `test_price`, `medical_price`, `date`, `month`, `year`) VALUES
(1, 1, 'laboratory', 'khcfgfgh', 'fgytthsry', '', '', 'NormalDoctor', 20000, 0, 0, 24, 10, 2021),
(2, 1, 'finish', 'Brain damage', 'Go back to zoo...', 'Finally brain removed...', '2 days rest', 'WomenDoctor', 40000, 500, 578, 24, 10, 2021);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` int(11) NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`id`, `medicine_name`, `price`) VALUES
(1, 'paracetimol', 2),
(2, 'Headache', 150);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `sname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `bloodgroup` varchar(5) NOT NULL,
  `birthyear` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `fname`, `sname`, `email`, `address`, `phone`, `sex`, `bloodgroup`, `birthyear`) VALUES
(1, 'anil', 'd', 'anild@gmail.com', '12-451-872-54', '8599674613', 'Male', 'B', 1971);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_no` int(11) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `patientsinroom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `fname` varchar(40) NOT NULL,
  `sname` varchar(40) NOT NULL,
  `type` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `fname`, `sname`, `type`) VALUES
('Admin', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'Admin', '', 'Admin'),
('anu', 'fde74bb0c10fb90a6e8d90a8a889e81e3aed1152', 'Anusha', 'G', 'Laboratory'),
('bursar', 'c2ae336b1775a9de8818e8d037a9c8528958e2a2', 'bursar', 'bursar', 'Bursar'),
('sravani', 'f58675b479a379a23183544ac8a78fbc323da2e9', 'Sravani', 'B', 'Pharmacy'),
('sri', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Srikanth', 'Gatla', 'Reception'),
('srikanth', '9be1bc64c37db5184ffbf06c48619ae95cc100f4', 'Srikanth', 'Gatla', 'NormalDoctor'),
('teja', 'baad627c7446453203af601b43ae0c5462888b1c', 'Teja', 'Kandakatla', 'WomenDoctor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctorreport`
--
ALTER TABLE `doctorreport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctorreport`
--
ALTER TABLE `doctorreport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medication`
--
ALTER TABLE `medication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
