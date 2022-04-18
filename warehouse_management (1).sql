-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2022 at 02:15 AM
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
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Cust_pass`, `Company_name`, `Address`) VALUES
('001', 'acindustrial01', 'A.C. Industrial', NULL),
('002', 'atn01', 'ATN', NULL),
('003', 'axalta01', 'Axalta', NULL),
('004', 'brandcastle01', 'Brand Castle', NULL),
('005', 'darko01', 'Darko', NULL),
('006', 'jbweld01', 'JB Weld', NULL),
('007', 'noco01', 'Noco', NULL),
('008', 'otis01', 'Otis', NULL),
('009', 'paintcle01', 'Paint Cle', NULL),
('010', 'portage01', 'Portage', NULL),
('011', 'radiantelectric01', 'Radiant Electric', NULL),
('012', 'ranpak01', 'Ranpak Corp', NULL),
('013', 'rochling01', 'Rochling', NULL),
('014', 'universalpack01', 'Universal Packaging', NULL);

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

--
-- Dumping data for table `emp_information`
--

INSERT INTO `emp_information` (`Emp_ID`, `Emp_pass`, `Emp_name`, `emp_per_level`, `Email`, `Phone_num`) VALUES
('1597896', 'CandorTrans01', 'Gino Chiudioni', 11, 'gtchiudi20@gmail.com', '440-665-5140');

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

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`SKU`, `Customer_ID`, `Total_count`, `Piece_count`, `Pallet_type`) VALUES
('#1', '001', 1, 48, 'Bag'),
('0 1/2', '001', 1, 48, 'Bag'),
('0 3/4', '001', 1, 48, 'Bag'),
('01676W', '002', 12, 48, 'Carton'),
('02-00001', '007', 20, 7500, 'Case'),
('02650', '002', 8, 340, 'Each'),
('03-00300-1', '007', 41, 135, 'Each'),
('03-00301-1', '007', 16, 405, 'Each'),
('03-00306-1', '007', 57, 135, 'Each'),
('03-00307-1', '007', 17, 405, 'Each'),
('03-00318-1', '007', 80, 104, 'Each'),
('03-00319-1', '007', 22, 324, 'Each'),
('03-00327-1', '007', 4, 108, 'Each'),
('03-00328-1', '007', 3, 324, 'Each'),
('03483W', '002', 3, 24, 'Carton'),
('04067W', '002', 2, 140, 'Carton'),
('04173W', '002', 40, 54, 'Carton'),
('04174', '002', 4, 84, 'Carton'),
('04185W', '002', 5, 54, 'Carton'),
('04286W', '002', 7, 364, 'Carton'),
('10000155', '012', 170, 1, 'Pallet'),
('10000186', '012', 26, 1, 'Pallet'),
('10000489', '012', 67, 12, 'Roll'),
('10000562', '012', 23, 1, 'Pallet'),
('10000566', '012', 35, 16, 'Roll'),
('10000670', '012', 396, 1, 'Pallet'),
('10001183', '012', 18, 1, 'Each'),
('10001220', '012', 5, 18, 'Each'),
('10001251', '012', 17, 15, 'Carton'),
('10001379', '012', 6, 24, 'Carton'),
('10001382', '012', 82, 12, 'Each'),
('1000X12', '010', 4, 504, 'Each'),
('100x12', '010', 3, 504, 'Each'),
('100X3', '010', 3, 1008, 'Each'),
('103', '008', 2, 83, 'Case'),
('1056-3.75', '003', 3, 62, 'Each'),
('1100', '010', 2, 910, 'Each'),
('11000970', '012', 322, 2, 'Each'),
('11000988', '012', 42, 25, 'Each'),
('11000999', '012', 100, 10, 'Each'),
('11002215', '012', 82, 36, 'Each'),
('11002480', '012', 10, 5, 'Carton'),
('11002656', '012', 1, 24, 'Carton'),
('11002977', '012', 23, 60, 'Carton'),
('11015385', '012', 15, 4, 'Each'),
('11018031', '012', 2, 1, 'Carton'),
('11023564', '012', 224, 1, 'Roll'),
('11023684', '012', 144, 1, 'Roll'),
('11023863', '012', 20, 1, 'Roll'),
('11025545', '012', 21, 45, 'Case'),
('1156-5', '003', 1, 19, 'Each'),
('1156-G', '003', 6, 192, 'Each'),
('1157-G', '003', 1, 32, 'Each'),
('1157-Q', '003', 1, 26, 'Each'),
('1158-5', '003', 2, 35, 'Each'),
('1158-G', '003', 1, 32, 'Each'),
('1158-Q', '003', 1, 285, 'Each'),
('1169-5', '003', 1, 32, 'Each'),
('1200x12', '010', 4, 360, 'Each'),
('1200X3', '010', 1, 60, 'Each'),
('12342-2', '008', 7, 270, 'Bag'),
('12345-4', '008', 39, 60, 'Case'),
('12345-7', '008', 22, 120, 'Case'),
('12349-6', '008', 2, 120, 'Case'),
('12355-7', '008', 1, 120, 'Case'),
('12367-9', '008', 1, 120, 'Case'),
('1250 x12', '010', 1, 150, 'Each'),
('125x12', '010', 2, 450, 'Each'),
('13017-400', '002', 3, 840, 'Each'),
('13740', '002', 7, 2160, 'Each'),
('14x10 Cor', '007', 30, 1, 'Pallet'),
('1500', '010', 1, 500, 'Each'),
('151800', '012', 8, 1, 'Pallet'),
('15274', '002', 16, 96, 'Each'),
('152760WS', '012', 20, 1, 'Pallet'),
('153311W', '012', 49, 80, 'Roll'),
('15724', '002', 22, 72, 'Each'),
('15776', '002', 48, 72, 'Each'),
('15824', '002', 26, 180, 'Each'),
('15876', '002', 47, 180, 'Each'),
('15976', '002', 78, 108, 'Each'),
('1600x12', '010', 3, 324, 'Each'),
('1624 BACK', '011', 0, 1, 'Pallet'),
('1624 BEZEL WHITE', '011', 1, 1, 'Pallet'),
('1648 BACK', '011', 4, 1, 'Pallet'),
('1648 BEZEL WHITE', '011', 8, 1, 'Pallet'),
('1648 CL-5MB-Backs', '011', 5, 1, 'Pallet'),
('1648CL-5MB-White', '011', 10, 1, 'Pallet'),
('1676-MOLD XP18', '013', 12, 1, 'Pallet'),
('18x12x16 Corr', '007', 9, 1, 'Pallet'),
('1KH', '006', 10, 27360, 'Tube'),
('1KR', '006', 7, 27360, 'Tube'),
('1MR', '006', 1, 25460, 'Pallet'),
('1WH', '006', 15, 27360, 'Tube'),
('1WR', '006', 19, 27360, 'Tube'),
('200000-C-028', '005', 3, 16250, 'Each'),
('200000-S-500', '005', 28, 1, 'Pallet'),
('20009-4', '008', 1, 17, 'Case'),
('200X12', '010', 7, 576, 'Each'),
('200X3', '010', 4, 1632, 'Each'),
('216180-C-011', '005', 2, 1320, 'Each'),
('216180-K-074', '005', 1, 2, 'Each'),
('216180-K-075', '005', 1, 46, 'Each'),
('216180-S-057', '005', 6, 112, 'Each'),
('216180-S-058', '005', 4, 52, 'Each'),
('216180-S-068', '005', 1, 2, 'Each'),
('217009-F-003', '005', 2, 9, 'Each'),
('217128K-211', '005', 6, 1, 'Pallet'),
('217230-C-005', '005', 5, 44, 'Each'),
('217230-C-005 X10', '005', 7, 560, 'Each'),
('217230-C-005 X2', '005', 2, 136, 'Each'),
('217230-C-006', '005', 3, 2640, 'Each'),
('217230-S-002', '005', 28, 36, 'Each'),
('217230-S-002X4', '005', 1, 8, 'Each'),
('217272-C-002', '005', 3, 308, 'Each'),
('217336-K-041', '005', 3, 167, 'Carton'),
('217385-C-808', '005', 8, 1, 'Pallet'),
('217385-F-010', '005', 4, 15, 'Carton'),
('217385-S-327', '005', 1, 1, 'Pallet'),
('218001-F-013', '005', 3, 20, 'Carton'),
('218020-C-004', '005', 2, 35, 'Carton'),
('218020-C-005', '005', 3, 30, 'Carton'),
('218020-C-006', '005', 2, 25, 'Carton'),
('218020-K-002', '005', 33, 16, 'Carton'),
('218020-K-004', '005', 8, 20, 'Carton'),
('218020-K-005', '005', 15, 40, 'Carton'),
('218020-K-008', '005', 38, 14, 'Carton'),
('218182-C-852', '005', 8, 1, 'Pallet'),
('218182-C-856', '005', 7, 1, 'Pallet'),
('218182-C-857', '005', 12, 1, 'Pallet'),
('218182-C-858', '005', 8, 1, 'Pallet'),
('218182-C-860', '005', 4, 1, 'Pallet'),
('218187-F-006', '005', 3, 6, 'Carton'),
('218248-C-056', '005', 1, 14, 'Each'),
('218267-F-001', '005', 3, 11, 'Each'),
('218268', '005', 7, 1, 'Pallet'),
('218268-F-002', '005', 2, 40, 'Carton'),
('218276-S-008', '005', 2, 1, 'Pallet'),
('219054-F-001', '005', 11, 48, 'Carton'),
('220007-5-050', '005', 4, 1, 'Pallet'),
('22009-I04', '002', 5, 864, 'Each'),
('22010-I04', '002', 5, 864, 'Each'),
('220121-C-087', '005', 1, 200, 'Carton'),
('220121-C-093', '005', 3, 72, 'Each'),
('220121-C-094', '005', 12, 68, 'Each'),
('220121-C-258', '005', 1, 150, 'Carton'),
('220121-C-266', '005', 2, 150, 'Carton'),
('220121-C-272', '005', 1, 281, 'Carton'),
('22013-200', '002', 6, 648, 'Each'),
('22040-200', '002', 49, 576, 'Each'),
('221040-C-067/068/069', '005', 5, 1, 'Pallet'),
('221040-F-001', '005', 13, 1, 'Pallet'),
('221040-S-001', '005', 6, 1, 'Pallet'),
('221040-S-002', '005', 6, 1, 'Pallet'),
('221065-F-002', '005', 4, 6, 'Each'),
('221083-F-001', '005', 4, 10, 'Carton'),
('225x12', '010', 5, 504, 'Each'),
('22670', '002', 48, 144, 'Each'),
('22942-400', '002', 4, 624, 'Each'),
('236109', '006', 28, 1, 'Pallet'),
('24003-999', '002', 2, 1008, 'Each'),
('24004-999', '002', 1, 29, 'Each'),
('25600', '002', 1, 72, 'Each'),
('27007-200', '002', 8, 432, 'Each'),
('27008-200', '002', 6, 648, 'Each'),
('300X12', '010', 1, 162, 'Each'),
('37510', '002', 4, 510, 'Each'),
('400x12', '010', 3, 552, 'Each'),
('42134', '013', 1, 1, 'Pallet'),
('44004-500', '002', 8, 180, 'Each'),
('46310', '002', 14, 1560, 'Each'),
('500', '010', 1, 1464, 'Each'),
('53300', '002', 3, 720, 'Each'),
('55000-300', '002', 3, 340, 'Each'),
('55001-400', '002', 6, 320, 'Each'),
('56004-300', '002', 3, 2400, 'Each'),
('56005-200', '002', 1, 3144, 'Each'),
('56006-201', '002', 2, 720, 'Each'),
('5KH', '006', 11, 3360, 'Tube'),
('5KR', '006', 11, 3360, 'Tube'),
('5WH', '006', 37, 3360, 'Tube'),
('5WR', '006', 32, 3360, 'Tube'),
('600', '010', 2, 360, 'Each'),
('610', '010', 2, 264, 'Each'),
('620', '010', 1, 264, 'Each'),
('630', '010', 1, 240, 'Each'),
('63470', '002', 3, 828, 'Each'),
('64677', '002', 1, 336, 'Each'),
('65078', '002', 5, 576, 'Each'),
('65210', '002', 29, 288, 'Each'),
('65278', '002', 3, 336, 'Each'),
('66400', '002', 2, 2160, 'Each'),
('66477', '002', 1, 468, 'Each'),
('7000X12', '010', 5, 576, 'Each'),
('7000X3', '010', 4, 1440, 'Each'),
('700x12', '010', 4, 1080, 'Each'),
('7200X12', '010', 4, 576, 'Each'),
('7200x3', '010', 2, 2016, 'Each'),
('7250X3', '010', 2, 2400, 'Each'),
('7400 x12', '010', 1, 396, 'Each'),
('7400x3', '010', 1, 240, 'Each'),
('74471', '002', 1, 1320, 'Each'),
('74571', '002', 2, 12, 'Each'),
('7500X3', '010', 2, 1008, 'Each'),
('7600X3', '010', 5, 2304, 'Each'),
('7800 x12', '010', 1, 348, 'Each'),
('7800x3', '010', 1, 384, 'Each'),
('78551000015', '008', 11, 50, 'Case'),
('7900 x3', '010', 2, 624, 'Each'),
('80-12066C', '002', 1, 42, 'Each'),
('80-15750', '002', 5, 288, 'Each'),
('80-3862', '002', 2, 1044, 'Each'),
('80-4555C', '002', 1, 84, 'Each'),
('80-5101P', '002', 6, 672, 'Each'),
('8000x12', '010', 11, 648, 'Each'),
('81-12059C', '002', 8, 360, 'Each'),
('81-17078', '002', 3, 1152, 'Each'),
('81-18945', '002', 31, 192, 'Each'),
('81-20368', '002', 4, 480, 'Each'),
('81-20382', '002', 6, 576, 'Each'),
('81-20399', '002', 3, 1224, 'Each'),
('81-20436', '002', 3, 972, 'Each'),
('81-22454', '002', 4, 972, 'Each'),
('81-22485', '002', 4, 1008, 'Each'),
('81-22881', '002', 2, 1800, 'Each'),
('81-22904', '002', 11, 160, 'Each'),
('81-23222', '002', 1, 1404, 'Each'),
('81-23260', '002', 1, 576, 'Each'),
('81-23277', '002', 2, 612, 'Each'),
('81-26148', '002', 1, 150, 'Each'),
('81-28388', '002', 6, 1080, 'Each'),
('81-28395', '002', 3, 1080, 'Each'),
('81-2968', '002', 25, 340, 'Each'),
('81-30237', '002', 1, 1620, 'Each'),
('81-3316', '002', 20, 272, 'Each'),
('81-3323', '002', 3, 380, 'Each'),
('81-3330', '002', 20, 272, 'Each'),
('81-33825', '002', 8, 2400, 'Each'),
('81-34112', '002', 3, 1224, 'Each'),
('81-34129', '002', 4, 1080, 'Each'),
('81-34259', '002', 14, 120, 'Each'),
('81-34440', '002', 9, 1152, 'Each'),
('81-35058', '002', 1, 2088, 'Each'),
('81-3804', '002', 1, 816, 'Each'),
('81-7888', '002', 1, 108, 'Each'),
('81-7956', '002', 1, 1044, 'Each'),
('81-8168', '002', 1, 720, 'Each'),
('8100', '010', 6, 1200, 'Each'),
('8100X3', '010', 1, 288, 'Each'),
('82209', '002', 4, 336, 'Each'),
('84692-0', '008', 0, 126, 'Carton'),
('84692-6', '008', 23, 126, 'Case'),
('85176', '002', 3, 1104, 'Each'),
('86075', '002', 1, 222, 'Each'),
('86124-4', '002', 8, 320, 'Each'),
('86175', '002', 14, 360, 'Each'),
('86375', '002', 8, 270, 'Each'),
('86376', '002', 11, 270, 'Each'),
('8800', '010', 1, 264, 'Each'),
('88276', '002', 3, 324, 'Each'),
('88376', '002', 31, 252, 'Each'),
('9082-P', '003', 1, 308, 'Each'),
('9082-Q', '003', 1, 95, 'Each'),
('9091-G', '003', 2, 40, 'Each'),
('9091-P', '003', 1, 19, 'Each'),
('9091-Q', '003', 1, 4, 'Each'),
('9092-G', '003', 2, 4, 'Each'),
('9092-P', '003', 3, 1000, 'Each'),
('9092-Q', '003', 2, 96, 'Each'),
('9093-P', '003', 3, 94, 'Each'),
('9093-Q', '003', 2, 88, 'Each'),
('9095-2.5', '003', 3, 284, 'Each'),
('9100', '010', 1, 10, 'Each'),
('9100 x24', '010', 2, 3024, 'Each'),
('91124', '002', 1, 18, 'Each'),
('9201-3.75', '003', 2, 14, 'Each'),
('9202-3.75', '003', 1, 144, 'Each'),
('9203-3.75', '003', 2, 160, 'Each'),
('9204-3.75', '003', 3, 210, 'Each'),
('9205-3.75', '003', 6, 144, 'Each'),
('9206-3.75', '003', 1, 144, 'Each'),
('9208-001', '003', 1, 163, 'Each'),
('9213-001', '003', 2, 136, 'Each'),
('9215-001', '003', 3, 509, 'Each'),
('9217-001', '003', 1, 8, 'Each'),
('9218-001', '003', 1, 312, 'Each'),
('9219-001', '003', 1, 104, 'Each'),
('9221-001', '003', 1, 9, 'Each'),
('9222-001', '003', 2, 498, 'Each'),
('9223-001', '003', 2, 526, 'Each'),
('9224-001', '003', 2, 422, 'Each'),
('9225-001', '003', 1, 84, 'Each'),
('9225-3.75', '003', 1, 47, 'Each'),
('9226-001', '003', 1, 4, 'Each'),
('9227-001', '003', 1, 325, 'Each'),
('9228-001', '003', 1, 264, 'Each'),
('9229-001', '003', 1, 9, 'Each'),
('9232-001', '003', 3, 509, 'Each'),
('9233-001', '003', 2, 452, 'Each'),
('9235-001', '003', 1, 211, 'Each'),
('9237-0.5', '003', 1, 634, 'Each'),
('9240-001', '003', 1, 90, 'Each'),
('9241-001', '003', 1, 251, 'Each'),
('9245-001', '003', 2, 270, 'Each'),
('9248-001', '003', 2, 287, 'Each'),
('9250-001', '003', 3, 374, 'Each'),
('9252-001', '003', 1, 78, 'Each'),
('9254-001', '003', 2, 350, 'Each'),
('9255-0.5', '003', 1, 277, 'Each'),
('9257-0.5', '003', 1, 51, 'Each'),
('9258-0.5', '003', 3, 396, 'Each'),
('9261-0.5', '003', 1, 242, 'Each'),
('9266-0.5', '003', 3, 592, 'Each'),
('9268-001', '003', 1, 13, 'Each'),
('9269-001', '003', 1, 8, 'Each'),
('9270-3.75', '003', 3, 158, 'Each'),
('9270-5', '003', 2, 36, 'Each'),
('9271-3.75', '003', 2, 119, 'Each'),
('9276-001', '003', 1, 6, 'Each'),
('9282-001', '003', 1, 137, 'Each'),
('9299-3.75', '003', 1, 12, 'Each'),
('9302-001', '003', 1, 207, 'Each'),
('9302-3.75', '003', 2, 102, 'Each'),
('9306-0.5', '003', 1, 38, 'Each'),
('9310-001', '003', 2, 301, 'Each'),
('9311-001', '003', 3, 609, 'Each'),
('9312-001', '003', 1, 272, 'Each'),
('9313-001', '003', 1, 411, 'Each'),
('9314-001', '003', 1, 21, 'Each'),
('9315-001', '003', 1, 452, 'Each'),
('9316-001', '003', 4, 630, 'Each'),
('9317-0.5', '003', 1, 5, 'Each'),
('9318-0.5', '003', 1, 3, 'Each'),
('9319-0.5', '003', 7, 512, 'Each'),
('9320-001', '003', 3, 540, 'Each'),
('9336-G', '003', 1, 35, 'Each'),
('9336-Q', '003', 1, 582, 'Each'),
('9337-G', '003', 2, 43, 'Each'),
('9337-Q', '003', 1, 2, 'Each'),
('9338-G', '003', 1, 73, 'Each'),
('9338-Q', '003', 1, 63, 'Each'),
('9341-G', '003', 1, 59, 'Each'),
('9347-G', '003', 1, 3, 'Each'),
('96570', '002', 1, 384, 'Each'),
('9700-G', '003', 2, 78, 'Each'),
('9701-G', '003', 4, 160, 'Each'),
('9701-Q', '003', 1, 50, 'Each'),
('9702-G', '003', 1, 61, 'Each'),
('9704-G', '003', 1, 8, 'Each'),
('9706-005', '003', 6, 144, 'Each'),
('9707-005', '003', 1, 52, 'Each'),
('99-00058', '007', 50, 1192, 'Lbs'),
('A15376', '002', 4, 18, 'Each'),
('A15676', '002', 10, 40, 'Each'),
('A17110', '002', 10, 176, 'Each'),
('A22020-200', '002', 10, 480, 'Each'),
('A22476', '002', 5, 3072, 'Each'),
('A23276', '002', 2, 360, 'Each'),
('A23376', '002', 7, 162, 'Each'),
('A23450', '002', 1, 210, 'Each'),
('A24250', '002', 16, 360, 'Each'),
('A24376', '002', 57, 144, 'Each'),
('A26550', '002', 8, 240, 'Each'),
('A28377', '002', 1, 384, 'Each'),
('A28800', '002', 96, 192, 'Each'),
('A28810', '002', 33, 192, 'Each'),
('A28824', '002', 14, 192, 'Each'),
('A28878', '002', 59, 192, 'Each'),
('A58376C', '002', 1, 12, 'Each'),
('A63776', '002', 8, 48, 'Each'),
('A75076', '002', 3, 160, 'Each'),
('A93313', '002', 13, 72, 'Each'),
('AB10-S', '010', 2, 248, 'Each'),
('AB10/20S', '010', 4, 315, 'Each'),
('AB2-S', '010', 9, 900, 'Each'),
('AB3/6-S', '010', 6, 1080, 'Each'),
('AB4/8', '010', 5, 900, 'Each'),
('AB4/8-S', '010', 3, 800, 'Each'),
('AB5/10S', '010', 8, 756, 'Each'),
('AB6/12S', '010', 2, 540, 'Each'),
('AB8-S', '010', 9, 378, 'Each'),
('BDRD01-G', '003', 1, 76, 'Each'),
('BDRD02-G', '003', 1, 153, 'Each'),
('Blue Boxes', '012', 21, 1, 'Pallet'),
('BP40', '012', 12, 1, 'Roll'),
('Brown Corrugated', '008', 14, 1, 'Pallet'),
('BULLNOSE SHELF W 11 HOOKS', '005', 1, 126, 'Carton'),
('BULLNOSE SHELF W 6 HOOKS 3 PEG', '005', 1, 126, 'Carton'),
('BULLNOSE SHELF W 7 HOOKS AND 3', '005', 1, 63, 'Carton'),
('BULLNOSE SHELF W 8 HOOKS', '005', 1, 63, 'Carton'),
('BULLNOSE SHELF W 8 HOOKS 3 PEG', '005', 1, 63, 'Carton'),
('BULLNOSE SHELF W 8/6 HOOKS', '005', 1, 126, 'Carton'),
('BULLNOSE SHELF W SKIN CARE', '005', 2, 136, 'Carton'),
('BULLNOSE W 6 HOOKS', '005', 1, 126, 'Carton'),
('C00253360', '012', 6, 1, 'Pallet'),
('C00272360S', '012', 1, 1, 'Pallet'),
('CAN1KH', '006', 3, 27360, 'Tube'),
('CAN1KR', '006', 3, 27360, 'Tube'),
('CAN1WH', '006', 4, 27360, 'Tube'),
('CAN1WR', '006', 4, 27360, 'Tube'),
('CL36-BL', '010', 3, 1516, 'Each'),
('CL48-BL', '010', 1, 792, 'Each'),
('Control Panels', '012', 1, 1, 'Pallet'),
('CORROGATED - 80-0079', '007', 28, 250, 'Each'),
('Corrugated', '012', 9, 1, 'Pallet'),
('Corrugated lg', '008', 31, 1, 'Case'),
('Corrugated med', '008', 29, 1, 'Case'),
('Corrugated sm', '008', 17, 1, 'Case'),
('Corrugated xlg', '008', 11, 1, 'Case'),
('CR22ACC-P', '003', 1, 24, 'Each'),
('CR22AF-Q', '003', 1, 177, 'Each'),
('CR22AM-Q', '003', 1, 53, 'Each'),
('CR22FEE-P', '003', 1, 229, 'Each'),
('CRV22-G', '003', 4, 144, 'Carton'),
('cups', '008', 3, 900, 'Bag'),
('DS-0541', '012', 3, 10, 'Each'),
('DS-0596', '012', 2, 2, 'Each'),
('DS-5144', '012', 3, 1, 'Pallet'),
('DS-5174', '012', 1, 1, 'Pallet'),
('DSCK8', '004', 23, 1, 'Pallet'),
('EMPTY CRATE', '012', 6, 1, 'Crate'),
('EZ317AN-Q', '003', 1, 4, 'Each'),
('EZ543-Q', '003', 1, 117, 'Carton'),
('EZ600B-Q', '003', 3, 227, 'Each'),
('EZ601A-G', '003', 3, 30, 'Each'),
('EZ603A-G', '003', 1, 2, 'Each'),
('F', '001', 1, 48, 'Bag'),
('FF', '001', 1, 48, 'Bag'),
('FFF', '001', 1, 48, 'Bag'),
('FP-0508', '012', 1, 1, 'Pallet'),
('FP-0537', '012', 1, 1, 'Pallet'),
('FPSL2N STAND AND FRAME', '012', 7, 1, 'Pallet'),
('Frames', '012', 4, 1, 'Pallet'),
('Gaylords', '005', 12, 1, 'Pallet'),
('GB10C', '007', 31, 48, 'Carton'),
('GB10S', '007', 329, 24, 'Carton'),
('GB150', '007', 4, 168, 'Each'),
('GB250', '007', 96, 24, 'Each'),
('GB251', '007', 124, 24, 'Each'),
('GB40', '007', 71, 768, 'Each'),
('GB70', '007', 2, 240, 'Each'),
('GBC013', '007', 86, 240, 'Each'),
('GBC014', '007', 165, 160, 'Each'),
('GBC015', '007', 145, 100, 'Each'),
('GBX45', '007', 6, 540, 'Each'),
('GBX55', '007', 43, 240, 'Each'),
('GBX75', '007', 84, 280, 'Each'),
('GC040', '007', 164, 128, 'Each'),
('GCOA-006-OH', '014', 19, 8, 'Carton'),
('GEAMIN3', '012', 1, 5, 'Carton'),
('Geamin4', '012', 3, 21, 'Carton'),
('GEN 5X2', '007', 30, 160, 'Each'),
('GEN 5X3', '007', 110, 160, 'Each'),
('GEN PRO 10X3', '007', 31, 100, 'Each'),
('GEN PRO 10X4', '007', 48, 90, 'Each'),
('GENIUS 1', '007', 512, 480, 'Each'),
('GENIUS 10', '007', 30, 280, 'Each'),
('GENIUS 2', '007', 167, 480, 'Each'),
('GENIUS 2X2', '007', 68, 240, 'Each'),
('GENIUS 2X4', '007', 107, 96, 'Each'),
('GENIUS 5', '007', 279, 336, 'Each'),
('GENIUS PRO 25', '007', 256, 32, 'Each'),
('GENIUS PRO 50', '007', 272, 24, 'Each'),
('GER1KH', '006', 1, 27360, 'Pallet'),
('GER1KR', '006', 1, 27360, 'Pallet'),
('GER1WH', '006', 2, 27360, 'Tube'),
('GER1WR', '006', 2, 27360, 'Pallet'),
('GWR400', '012', 20, 12, 'Roll'),
('GWR402B1', '012', 12, 36, 'Carton'),
('HEADER FRAME KIT', '005', 5, 220, 'Carton'),
('Header Graphic', '005', 1, 1, 'Pallet'),
('HM3-4022-OH', '014', 1, 90, 'Carton'),
('HV MACHINE AND PARTS', '012', 1, 1, 'Pallet'),
('JG1908-805', '010', 1, 760, 'Each'),
('JG1908-811', '010', 1, 1000, 'Each'),
('JG1908-813', '010', 1, 1000, 'Each'),
('JG1908-826', '010', 1, 960, 'Each'),
('JG6155-16', '010', 2, 500, 'Each'),
('JG6155-17', '010', 2, 500, 'Each'),
('JG6155-21', '010', 1, 500, 'Each'),
('JG6155-23', '010', 3, 340, 'Each'),
('JG6155-24', '010', 1, 200, 'Each'),
('JG8035-7810', '010', 1, 210, 'Each'),
('JG8035-7812', '010', 1, 210, 'Each'),
('JG8035-7821', '010', 1, 210, 'Each'),
('JG8035-7827', '010', 1, 210, 'Each'),
('KA-0026', '012', 1, 10, 'Pallet'),
('KA-0573', '012', 22, 4, 'Each'),
('KA-0683', '012', 6, 1, 'Pallet'),
('KA0030', '012', 10, 10, 'Each'),
('KLT18000507G5X306', '013', 7, 12, 'Roll'),
('KLTV13030505G', '013', 13, 9, 'Roll'),
('KP24B', '010', 1, 1792, 'Each'),
('KP24D', '010', 1, 1824, 'Each'),
('KP24L-3', '010', 2, 2688, 'Each'),
('KP24L-6', '010', 1, 40, 'Each'),
('KP35B', '010', 2, 576, 'Each'),
('KP35BB', '010', 1, 864, 'Each'),
('KP35BG', '010', 1, 928, 'Each'),
('KP35BW', '010', 1, 928, 'Each'),
('KP35D', '010', 1, 576, 'Each'),
('KP35DB', '010', 1, 928, 'Each'),
('KP35DG', '010', 1, 928, 'Each'),
('KP35DW', '010', 1, 928, 'Each'),
('KP35G', '010', 1, 640, 'Each'),
('KP35GB', '010', 1, 896, 'Each'),
('KP35GG', '010', 1, 928, 'Each'),
('KP35GW', '010', 1, 928, 'Each'),
('KP35L', '010', 1, 320, 'Each'),
('KP35LB', '010', 1, 928, 'Each'),
('KP35LG', '010', 1, 928, 'Each'),
('KP35LW', '010', 1, 928, 'Each'),
('KP50C', '012', 67, 1, 'Roll'),
('KS-0312', '012', 25, 10, 'Each'),
('KS0233', '012', 8, 28, 'Carton'),
('KS7006', '012', 8, 1, 'Each'),
('LITTLE DAVID', '012', 1, 1, 'Pallet'),
('MA-0602', '012', 13, 5, 'Carton'),
('MACHINES', '012', 2, 1, 'Pallet'),
('Misc Machine', '012', 13, 1, 'Pallet'),
('MP2175-2.5L', '003', 2, 600, 'Each'),
('MP2265-Q', '003', 1, 98, 'Each'),
('MP2275-Q', '003', 1, 64, 'Each'),
('MP2285-Q', '003', 1, 153, 'Each'),
('MP2445-Q', '003', 1, 58, 'Each'),
('MP2465-Q', '003', 2, 501, 'Each'),
('MP2475-Q', '003', 1, 37, 'Each'),
('MP4065-Q', '003', 1, 139, 'Each'),
('MP4075-Q', '003', 3, 332, 'Each'),
('MP4085-Q', '003', 3, 198, 'Each'),
('MUSTARG GALLON', '008', 7, 48, 'Case'),
('Noco Boost', '007', 3, 1, 'Pallet'),
('P-K50C', '012', 58, 1, 'Roll'),
('P-K50C15', '012', 13, 1, 'Roll'),
('PA3040E-G', '003', 2, 18, 'Each'),
('PAC11494', '012', 15, 12, 'Carton'),
('PC-0806', '012', 1, 1, 'Each'),
('PC-1013', '012', 1, 1, 'Pallet'),
('PC-1015', '012', 1, 1, 'Pallet'),
('PC-1074', '012', 1, 22, 'Each'),
('PC-1085', '012', 1, 6, 'Each'),
('PE1900-G', '003', 2, 18, 'Each'),
('PE2100-5L', '003', 2, 68, 'Each'),
('PE2200-G', '003', 2, 134, 'Each'),
('PE2400-G', '003', 29, 156, 'Each'),
('PE2442-G', '003', 2, 108, 'Each'),
('PE2600-5L', '003', 1, 1, 'Each'),
('PE4000-G', '003', 62, 153, 'Each'),
('PERFUME', '005', 12, 1, 'Pallet'),
('Plex Panels', '012', 1, 1, 'Pallet'),
('PPLC21', '012', 22, 4, 'Case'),
('PS3042-G', '003', 1, 78, 'Each'),
('PS3044-G', '003', 1, 2, 'Each'),
('PS5008B-Q', '003', 2, 95, 'Each'),
('PS5009A-G', '003', 1, 48, 'Each'),
('PSWP1', '012', 1, 1, 'Each'),
('Racking', '012', 5, 1, 'Pallet'),
('Red Corrugated', '008', 12, 1, 'Pallet'),
('Retro', '008', 4, 50, 'Carton'),
('RP-0201', '012', 2, 36, 'Roll'),
('SA-0510', '012', 9, 25, 'Each'),
('Samples', '008', 1, 16, 'Carton'),
('SIngle Serve Mustard', '008', 18, 120, 'Carton'),
('SW5001.EC0001', '012', 1, 1, 'Each'),
('TH0605-G', '003', 3, 4, 'Each'),
('TH07160-G', '003', 2, 192, 'Each'),
('TH07175-G', '003', 1, 26, 'Each'),
('TH07175-Q', '003', 1, 81, 'Each'),
('TH07185-G', '003', 2, 92, 'Each'),
('TH0860-5', '003', 2, 4, 'Each'),
('TH0870-G', '003', 1, 4, 'Each'),
('TH0885-G', '003', 3, 22, 'Each'),
('TH0895-G', '003', 2, 42, 'Each'),
('TH5950-G', '003', 1, 32, 'Each'),
('TV8901 005', '009', 4, 24, 'Each'),
('Ultra Pozz', '001', 1, 48, 'Bag'),
('UNPK-TGUN.3-OH', '014', 1, 6, 'Each'),
('Urn', '008', 2, 12, 'Each'),
('WHITE 5 GAL', '009', 7, 24, 'Pail'),
('WPCHCKORG4', '004', 11, 6000, 'Each'),
('WPCHCKWHT7', '004', 30, 3840, 'Each'),
('WPCHRED4', '004', 56, 1200, 'Each'),
('WPCHWHT2', '004', 35, 7200, 'Each'),
('WPCHWHT4-SP', '004', 56, 7200, 'Each'),
('WR2436.12 5.55.25HMLE', '013', 30, 5, 'Roll'),
('WR2448.25 5.55.25', '013', 191, 5, 'Roll'),
('WRAPPAKEX-BM', '012', 23, 40, 'Carton'),
('XGC4', '007', 43, 288, 'Each'),
('YELLOW 5 GAL', '009', 11, 24, 'Pail');

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
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`Warehouse_name`, `Warehouse_ID`, `Address`, `Phone_num`) VALUES
('HQWarehouse', '001', '22801 Aurora Rd Suite 1, Bedford Heights, OH 44146', '216-378-7100');

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
