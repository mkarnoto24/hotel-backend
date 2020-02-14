-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2020 at 03:35 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_si_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `fullname` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `fullname`, `no_hp`, `email`, `password`, `alamat`) VALUES
(1, 'Moh Karnoto', '085735800182', 'mohkarnoto@gmail.com', '12345', 'Ciputat Tangerang, Banten');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `payment_deadline` datetime NOT NULL,
  `room_id` int(11) NOT NULL,
  `jml_order_room` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_date`, `payment_deadline`, `room_id`, `jml_order_room`, `id_customer`, `check_in`, `check_out`, `total_bayar`, `status`) VALUES
(1, '2020-02-12 14:00:00', '2020-02-12 14:30:00', 1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'confirmed'),
(2, '2020-02-12 00:00:00', '2020-02-12 00:30:00', 2, 1, 1, '2020-02-12 13:00:00', '2020-02-13 13:00:00', 0, ''),
(3, '2020-01-01 10:00:00', '0000-00-00 00:00:00', 1, 1, 1, '2020-01-01 10:00:00', '2020-01-01 10:00:00', 500000, 'pending'),
(5, '2020-02-12 14:00:00', '2020-02-12 14:30:00', 2, 1, 1, '2020-02-12 14:00:00', '2020-02-13 14:00:00', 1000000, 'pending'),
(6, '2020-02-12 14:00:00', '2020-02-12 14:30:00', 2, 1, 1, '2020-02-12 14:00:00', '2020-02-13 14:00:00', 1000000, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `jml_bayar` int(11) NOT NULL,
  `nm_bank` varchar(40) NOT NULL,
  `no_rek` varchar(100) NOT NULL,
  `nm_rek` varchar(100) NOT NULL,
  `attachment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `order_id`, `id_customer`, `jml_bayar`, `nm_bank`, `no_rek`, `nm_rek`, `attachment`) VALUES
(1, 1, 1, 1000000, 'mandiri', '12121212', 'noto', 'undefined'),
(2, 1, 1, 500000, 'Mandiri', '121212121', 'undefined', 'bukti_pembayaran.png');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `id_room_type` int(11) NOT NULL,
  `jml_room` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `id_room_type`, `jml_room`, `price`) VALUES
(1, 1, 12, 500000),
(2, 2, 10, 400000),
(3, 3, 5, 800000);

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`id`, `name`, `img`) VALUES
(1, 'single', 'https://q-cf.bstatic.com/images/hotel/max1024x768/209/209596263.jpg'),
(2, 'double', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRebh1St5KhVz15aGeiNsFRGitc4iqZlassgri6ZBwwYTs8JcOx'),
(3, 'deluxe', 'https://media-cdn.holidaycheck.com/w_1280,h_720,c_fill,q_80/ugc/images/2eb54bf9-de3d-3c13-8db3-34edc55ccc91'),
(5, 'test1', 'test1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_room_type` (`id_room_type`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`id_room_type`) REFERENCES `room_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
