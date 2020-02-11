-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2020 at 02:58 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_good`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `admin_id`) VALUES
('admin', 'e10adc3949ba59abbe56e057f20f883e', 2);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `is_deleted` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `is_deleted`) VALUES
(1, 'COM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `product_id` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `issue_amount` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `manufacturer_name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `is_deleted`, `manufacturer_name`) VALUES
(1, 0, 'PQM');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_description` varchar(500) NOT NULL,
  `product_barcode` varchar(50) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `selling_price` float NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `product_barcode`, `manufacturer_id`, `category_id`, `selling_price`, `is_deleted`) VALUES
(1, 'sdfsdf', 'sdfsdf', 'dsfsdf', 1, 1, 1, 0),
(2, 'asas', 'asasas', 'asas', 1, 1, 0.5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `total` float NOT NULL,
  `staff_id` varchar(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `total_sales` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sales_details`
--

CREATE TABLE `sales_details` (
  `quantity` float NOT NULL,
  `total` float NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `is_deleted` int(10) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `fname` varchar(200) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `zip` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`username`, `password`, `is_deleted`, `staff_id`, `fname`, `lname`, `email`, `phone_number`, `address`, `city`, `province`, `zip`) VALUES
('aka', '25d55ad283aa400af464c76d713c07ad', 0, 2, 'sdsad', 'sad', 'sadasd@fdfsd.com', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `stock_id` int(11) NOT NULL,
  `item_number` int(11) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `item_name` varchar(200) NOT NULL,
  `item_description` varchar(200) NOT NULL,
  `item_quantity` float NOT NULL,
  `cost_price` float NOT NULL,
  `selling_price` float NOT NULL,
  `supplier` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `size` float NOT NULL,
  `manufacturer` int(11) NOT NULL,
  `item_expiration` date NOT NULL,
  `location` varchar(100) NOT NULL,
  `taxed` varchar(50) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `product_expiration` date NOT NULL,
  `product_quantity` float NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`stock_id`, `item_number`, `product_id`, `item_name`, `item_description`, `item_quantity`, `cost_price`, `selling_price`, `supplier`, `category`, `size`, `manufacturer`, `item_expiration`, `location`, `taxed`, `is_deleted`, `product_expiration`, `product_quantity`, `supplier_id`) VALUES
(1, 0, '1', '', '', 0, 1, 1.2, 0, '', 0, 0, '2020-02-19', 'THAI', '', 0, '2020-02-13', 16, 1),
(2, 0, '1', '', '', 0, 0, 1.2, 0, '', 0, 0, '2020-02-18', 'THAI', '', 0, '2020-02-21', 20, 1),
(3, 0, '2', '', '', 0, 1, 1.2, 0, '', 0, 0, '2020-02-26', 'THAI', '', 0, '2020-02-14', 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `country` varchar(200) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `first_name`, `last_name`, `email`, `phone_number`, `address`, `city`, `zip`, `country`, `is_deleted`) VALUES
(1, 'asdasd', 'asdasd', 'asdasd', 'asda@FDSF.CO,', 'FDGDFG', 'DFG', 'DFGDFG', 'DFG', 'DFDFG', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `user_type` int(11) NOT NULL,
  `user_activity` varchar(200) NOT NULL,
  `date_logged` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`user_type`, `user_activity`, `date_logged`) VALUES
(1, 'username with admin  has logged in', '2020-02-11 14:17:28'),
(2, 'username with aka  has logged in', '2020-02-11 14:47:35'),
(3, 'username with aka  has logged in', '2020-02-11 14:48:33'),
(4, 'username with admin  has logged in', '2020-02-11 14:48:48'),
(5, 'username with admin  has logged in', '2020-02-11 14:48:48'),
(6, 'username with admin  has logged in', '2020-02-11 14:50:51'),
(7, 'username with admin  has logged in', '2020-02-11 14:50:51'),
(8, 'username with aka  has logged in', '2020-02-11 14:52:18'),
(9, 'username with admin  has logged in', '2020-02-11 14:53:27'),
(10, 'username with aka  has logged in', '2020-02-11 15:18:22'),
(11, 'username with admin  has logged in', '2020-02-11 15:24:27'),
(12, 'username with aka  has logged in', '2020-02-11 15:38:26'),
(13, 'username with admin  has logged in', '2020-02-11 15:54:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `sales_details`
--
ALTER TABLE `sales_details`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`user_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_details`
--
ALTER TABLE `sales_details`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `user_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
