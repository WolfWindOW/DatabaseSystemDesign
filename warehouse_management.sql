-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2022 at 09:11 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warehouse_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` varchar(10) NOT NULL,
  `Cust_pass` varchar(30) NOT NULL,
  `Company_name` varchar(20) NOT NULL,
  `Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `emp_information`
--

CREATE TABLE `emp_information` (
  `Emp_ID` varchar(20) NOT NULL,
  `Emp_pass` varchar(30) NOT NULL,
  `Emp_name` varchar(70) NOT NULL,
  `emp_per_level` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone_num` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `Location_num` varchar(20) NOT NULL,
  `SKU` varchar(30) NOT NULL,
  `Count` int(11) NOT NULL,
  `Loc_piece_count` int(11) NOT NULL,
  `Warehouse_ID` varchar(10) NOT NULL,
  `Location_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pick`
--

CREATE TABLE `pick` (
  `Transaction_ID` varchar(10) NOT NULL,
  `Entered_by` varchar(20) NOT NULL,
  `Date` date NOT NULL,
  `Customer_ID` varchar(10) NOT NULL,
  `SKU` varchar(30) NOT NULL,
  `Count` int(11) NOT NULL,
  `Pick_piece_count` int(11) NOT NULL,
  `Partial_piece_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `SKU` varchar(30) NOT NULL,
  `Customer_ID` varchar(10) NOT NULL,
  `Total_count` int(11) DEFAULT NULL,
  `Piece_count` int(11) DEFAULT NULL,
  `Pallet_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Piece count is per pallet\nTotal count is total pallets in all warehouses.';

-- --------------------------------------------------------

--
-- Table structure for table `shipment_received`
--

CREATE TABLE `shipment_received` (
  `Receipt_ID` varchar(10) NOT NULL,
  `SKU` varchar(30) NOT NULL,
  `Count` int(11) NOT NULL,
  `Customer_ID` varchar(10) NOT NULL,
  `Date` date NOT NULL,
  `Entered_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `Warehouse_name` varchar(35) NOT NULL,
  `Warehouse_ID` varchar(10) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phone_num` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `emp_information`
--
ALTER TABLE `emp_information`
  ADD PRIMARY KEY (`Emp_ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Location_num`,`SKU`),
  ADD KEY `Location_Product` (`SKU`),
  ADD KEY `Location_Warehouse` (`Warehouse_ID`);

--
-- Indexes for table `pick`
--
ALTER TABLE `pick`
  ADD PRIMARY KEY (`Transaction_ID`,`SKU`),
  ADD KEY `Pick_Customer` (`Customer_ID`),
  ADD KEY `Pick_Product` (`SKU`),
  ADD KEY `Pick_Received_Emp_information` (`Entered_by`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`SKU`),
  ADD KEY `Product_Customer` (`Customer_ID`);

--
-- Indexes for table `shipment_received`
--
ALTER TABLE `shipment_received`
  ADD PRIMARY KEY (`Receipt_ID`,`SKU`),
  ADD KEY `Shipment_received_Customer` (`Customer_ID`),
  ADD KEY `Shipment_received_Emp_information` (`Entered_by`),
  ADD KEY `Shipment_received_Product` (`SKU`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`Warehouse_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `Location_Product` FOREIGN KEY (`SKU`) REFERENCES `product` (`SKU`),
  ADD CONSTRAINT `Location_Warehouse` FOREIGN KEY (`Warehouse_ID`) REFERENCES `warehouse` (`Warehouse_ID`);

--
-- Constraints for table `pick`
--
ALTER TABLE `pick`
  ADD CONSTRAINT `Pick_Customer` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `Pick_Product` FOREIGN KEY (`SKU`) REFERENCES `product` (`SKU`),
  ADD CONSTRAINT `Pick_Received_Emp_information` FOREIGN KEY (`Entered_by`) REFERENCES `emp_information` (`Emp_ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Product_Customer` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `shipment_received`
--
ALTER TABLE `shipment_received`
  ADD CONSTRAINT `Shipment_received_Customer` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `Shipment_received_Emp_information` FOREIGN KEY (`Entered_by`) REFERENCES `emp_information` (`Emp_ID`),
  ADD CONSTRAINT `Shipment_received_Product` FOREIGN KEY (`SKU`) REFERENCES `product` (`SKU`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
