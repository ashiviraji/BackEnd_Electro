-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2021 at 08:25 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electro`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Cust_id` int(11) NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` varchar(20) NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Cust_id`, `First_name`, `Last_name`, `Email`, `Password`, `Role`) VALUES
(1019, 'buthsara', 'madhushanka', 'buthsaramadhushanka@gmail.com', '$2b$10$E/m1.N4WWEB02TM88A1SnuAudCnMell0cmwb1WwIQliAyBuAsD1B.', 'customer'),
(1020, 'Tharindu', 'Dulshan', 'twtdulshan@gmail.com', '$2b$10$GLExitPGWHXpIChzY.VKx.jCkzrDWjAX08nCwYYgzJ6YotxLIQSSO', 'customer'),
(1022, 'Ashika', 'Abeysuriya', 'ashika234@gmail.com', '$2b$10$MCo6b6AfuZoMiyMx/eng3epcr6WyYX88htBu302jfIWW4svRDcGXG', 'customer'),
(1023, 'asdf', 'dfgh', 'asdf@gmail.com', '$2b$10$Tb9EgftKYXqauciqkkBbj.k54BOBMmYQtUsz6dJWczBio2lgU09Re', 'customer'),
(1024, 'Minuri', 'Yasara', 'minuri@gmail.com', '$2b$10$NQ8SDF34XmpkcGHHxAdqM.hL3Nf.kqQxlc/nmpbqsXdJL7rEGOt2G', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `ebill_monthly_plan`
--

CREATE TABLE `ebill_monthly_plan` (
  `bill_id` int(11) NOT NULL,
  `Total_cost_tou` float NOT NULL,
  `Cost_day_time` float NOT NULL,
  `Cost_off_peak_time` float NOT NULL,
  `Cost_peak_time` float NOT NULL,
  `Total_cost_fixed` float NOT NULL,
  `Units_day_time` int(11) NOT NULL,
  `Units_off_peak_time` int(11) NOT NULL,
  `Units_peak_time` int(11) NOT NULL,
  `Total_units` int(11) NOT NULL,
  `Best_model` varchar(20) NOT NULL,
  `Cust_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ebill_monthly_plan`
--

INSERT INTO `ebill_monthly_plan` (`bill_id`, `Total_cost_tou`, `Cost_day_time`, `Cost_off_peak_time`, `Cost_peak_time`, `Total_cost_fixed`, `Units_day_time`, `Units_off_peak_time`, `Units_peak_time`, `Total_units`, `Best_model`, `Cust_id`) VALUES
(1, 25104, 7875, 5187, 11502, 37678.5, 315, 399, 213, 927, 'TOU', 1020),
(2, 807.6, 60, 78, 129.6, 57, 2, 6, 2, 11, 'Fixed', 1020);

-- --------------------------------------------------------

--
-- Table structure for table `ebill_special_event`
--

CREATE TABLE `ebill_special_event` (
  `bill_id` int(11) NOT NULL,
  `bill_plan_name` varchar(100) NOT NULL,
  `bill_model` varchar(50) NOT NULL,
  `Total_units` float NOT NULL,
  `Cust_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ebill_special_event`
--

INSERT INTO `ebill_special_event` (`bill_id`, `bill_plan_name`, `bill_model`, `Total_units`, `Cust_id`) VALUES
(1, 'Pirith Ceremony', 'fixed', 5.4, 1020),
(1, ' My Plan 1', '', 203.42, 1024),
(2, ' My Plan 2', '', 36.36, 1024),
(3, ' My Plan3', 'fixed', 162, 1024),
(4, 'TOU plan 1', 'TOU', 75.4667, 1024);

-- --------------------------------------------------------

--
-- Table structure for table `ebill_special_event_tou`
--

CREATE TABLE `ebill_special_event_tou` (
  `bill_id` int(11) NOT NULL,
  `Total_cost_tou` float NOT NULL,
  `Cost_day_time` float NOT NULL,
  `Cost_off_peak_time` float NOT NULL,
  `Cost_peak_time` float NOT NULL,
  `Units_day_time` float NOT NULL,
  `Units_off_peak_time` float NOT NULL,
  `Units_peak_time` float NOT NULL,
  `Cust_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ebill_special_event_tou`
--

INSERT INTO `ebill_special_event_tou` (`bill_id`, `Total_cost_tou`, `Cost_day_time`, `Cost_off_peak_time`, `Cost_peak_time`, `Units_day_time`, `Units_off_peak_time`, `Units_peak_time`, `Cust_id`) VALUES
(1, 543.71, 0.906667, 0.5083, 2.295, 0, 0, 0, 1022),
(1, 540, 0, 0, 0, 0, 0, 0, 1023),
(2, 540, 0, 0, 0, 0, 0, 0, 1023),
(3, 540, 0, 0, 0, 0, 0, 0, 1023),
(4, 540, 0, 0, 0, 0, 0, 0, 1023),
(4, 2597.3, 515.833, 279.933, 1801.53, 20.6333, 21.5333, 33.3, 1024),
(5, 558.07, 5.87833, 3.3384, 8.856, 0, 0, 0, 1023);

-- --------------------------------------------------------

--
-- Table structure for table `electric_device_mplan`
--

CREATE TABLE `electric_device_mplan` (
  `device_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `appliance` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `hPeak` int(11) DEFAULT NULL,
  `mPeak` int(11) DEFAULT NULL,
  `hOffPeak` int(11) DEFAULT NULL,
  `mOffPeak` int(11) DEFAULT NULL,
  `hDay` int(11) DEFAULT NULL,
  `mDay` int(11) DEFAULT NULL,
  `priority` varchar(20) NOT NULL,
  `using_minutes_peak_time` float NOT NULL,
  `using_minutes_off_peak_time` float NOT NULL,
  `using_minutes_day_time` float NOT NULL,
  `power` float NOT NULL,
  `total_units` float NOT NULL,
  `units_peak_time` float NOT NULL,
  `units_off_peak_time` float NOT NULL,
  `units_day_time` float NOT NULL,
  `total_cost_TOU` float NOT NULL,
  `cost_peak_time` float NOT NULL,
  `cost_off_peak_time` float NOT NULL,
  `cost_day_time` float NOT NULL,
  `Cust_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `electric_device_mplan`
--

INSERT INTO `electric_device_mplan` (`device_id`, `bill_id`, `appliance`, `quantity`, `hPeak`, `mPeak`, `hOffPeak`, `mOffPeak`, `hDay`, `mDay`, `priority`, `using_minutes_peak_time`, `using_minutes_off_peak_time`, `using_minutes_day_time`, `power`, `total_units`, `units_peak_time`, `units_off_peak_time`, `units_day_time`, `total_cost_TOU`, `cost_peak_time`, `cost_off_peak_time`, `cost_day_time`, `Cust_id`) VALUES
(1, 1, 'fan 1', 2, 3, 0, 6, 0, 7, 0, 'mid', 180, 360, 420, 200, 192, 36, 72, 84, 4980, 1944, 936, 2100, 1020),
(2, 1, 'TV', 2, 3, 0, 4, 0, 4, 0, 'low', 180, 240, 240, 150, 99, 27, 36, 36, 2826, 1458, 468, 900, 1020),
(3, 1, 'radio', 2, 2, 0, 3, 0, 2, 0, 'mid', 120, 180, 120, 250, 105, 30, 45, 30, 2955, 1620, 585, 750, 1020),
(4, 1, 'Tv2', 2, 3, 0, 0, 0, 0, 0, 'mid', 180, 0, 0, 200, 36, 36, 0, 0, 1944, 1944, 0, 0, 1020),
(5, 1, 'Table Lamp', 1, 4, 0, 5, 0, 11, 30, 'low', 240, 300, 690, 200, 123, 24, 30, 69, 3411, 1296, 390, 1725, 1020),
(6, 1, 'Fan3', 2, 2, 0, 7, 0, 3, 0, 'mid', 120, 420, 180, 500, 360, 60, 210, 90, 8220, 3240, 2730, 2250, 1020),
(7, 1, 'Light 2', 2, 0, 0, 5, 0, 5, 0, 'mid', 0, 300, 300, 20, 12, 0, 6, 6, 228, 0, 78, 150, 1020),
(8, 2, 'bg', 2, 0, 0, 3, 0, 0, 0, 'mid', 0, 180, 0, 20, 3.6, 0, 3.6, 0, 46.8, 0, 46.8, 0, 1020),
(9, 2, 'bbb', 2, 2, 0, 2, 0, 2, 0, 'mid', 120, 120, 120, 20, 7.2, 2.4, 2.4, 2.4, 220.8, 129.6, 31.2, 60, 1020);

-- --------------------------------------------------------

--
-- Table structure for table `electric_device_special_event_fixed`
--

CREATE TABLE `electric_device_special_event_fixed` (
  `device_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `appliance` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `hfixed` int(11) NOT NULL,
  `mfixed` int(11) NOT NULL,
  `using_minutes_fixed` int(11) NOT NULL,
  `power` float NOT NULL,
  `total_units_fixed` float NOT NULL,
  `numberOfDays` int(11) NOT NULL,
  `Cust_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `electric_device_special_event_fixed`
--

INSERT INTO `electric_device_special_event_fixed` (`device_id`, `bill_id`, `appliance`, `quantity`, `hfixed`, `mfixed`, `using_minutes_fixed`, `power`, `total_units_fixed`, `numberOfDays`, `Cust_id`) VALUES
(1, 1, 'Flash Light', 2, 2, 30, 150, 500, 5, 2, 1020),
(2, 1, 'fan', 2, 2, 0, 120, 50, 0.4, 2, 1020),
(3, 2, 'aaa', 2, 2, 0, 120, 20, 0.08, 1, 1020);

-- --------------------------------------------------------

--
-- Table structure for table `electric_device_special_event_tou`
--

CREATE TABLE `electric_device_special_event_tou` (
  `device_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `appliance` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `hPeak` int(11) NOT NULL,
  `mPeak` int(11) NOT NULL,
  `hOffPeak` int(11) NOT NULL,
  `mOffPeak` int(11) NOT NULL,
  `hDay` int(11) NOT NULL,
  `mDay` int(11) NOT NULL,
  `using_minutes_peak_time` float NOT NULL,
  `using_minutes_off_peak_time` float NOT NULL,
  `using_minutes_day_time` float NOT NULL,
  `power` int(11) NOT NULL,
  `units_peak_time` float NOT NULL,
  `units_off_peak_time` float NOT NULL,
  `units_day_time` float NOT NULL,
  `total_cost_TOU` float NOT NULL,
  `cost_peak_time` float NOT NULL,
  `cost_off_peak_time` float NOT NULL,
  `cost_day_time` float NOT NULL,
  `numberOfDays` int(11) NOT NULL,
  `total_units` float NOT NULL,
  `Cust_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Emp_id` int(10) NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Conatact_no` varchar(10) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Enrollment_date` date NOT NULL,
  `Role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Emp_id`, `First_name`, `Last_name`, `Email`, `Conatact_no`, `Password`, `NIC`, `Address`, `Enrollment_date`, `Role`) VALUES
(1, 'Tharindu', 'Withana', 'admin1@gmail.com', '0145467892', '$2b$10$43uMOMFsIfTp764xipnO3.wK9n4xv4M.ZZEm4FZjAmarGjKiql3oK', '68745123v', 'Matara', '2021-07-21', 'admin'),
(2, 'Buthsara', 'madhushanka', 'ceben@gmail.com', '+947834416', '$2b$10$ArvIXD20Joo.PMx71jFGlOJWDwqtZmJzsydMlk501CF/K.y2PY7rS', '974563217v', 'kasun', '2021-07-08', 'cebengineer'),
(6, 'kasun', 'kalhara', 'ceben1@gmail.com', '0702563485', '$2b$10$.00vTrBUL2vVxfhODRmB/OlK3UJyjFkMnI8Rv/3X/dndTuqBN7AKi', '974563217v', 'No 23,Galle', '2021-08-09', 'cebengineer');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_ucharge`
--

CREATE TABLE `fixed_ucharge` (
  `Unit_category` varchar(50) NOT NULL,
  `Unit_charge` float NOT NULL,
  `Update_unit_charges` float NOT NULL,
  `Update_ucharge_status` tinyint(1) NOT NULL,
  `Unit_charges_requested_date` varchar(20) DEFAULT NULL,
  `Unit_charges_accepted_date` varchar(20) DEFAULT NULL,
  `Fixed_charge` float NOT NULL,
  `Update_fixed_charges` float NOT NULL,
  `Update_fcharge_status` tinyint(1) NOT NULL,
  `Fixed_charges_requested_date` varchar(20) DEFAULT NULL,
  `Fixed_charges_accepted_date` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fixed_ucharge`
--

INSERT INTO `fixed_ucharge` (`Unit_category`, `Unit_charge`, `Update_unit_charges`, `Update_ucharge_status`, `Unit_charges_requested_date`, `Unit_charges_accepted_date`, `Fixed_charge`, `Update_fixed_charges`, `Update_fcharge_status`, `Fixed_charges_requested_date`, `Fixed_charges_accepted_date`) VALUES
('00-30', 2.5, 2.5, 0, '2021-09-03', '2021-09-03', 30, 30, 0, '2021-09-03', '2021-09-03'),
('00-60', 7.85, 7.86, 0, '2021-09-03', NULL, 0, 0, 0, '2021-09-03', '2021-09-03'),
('121-180', 32, 0, 0, NULL, NULL, 480, 0, 0, NULL, NULL),
('31-60', 4.85, 0, 0, NULL, NULL, 60, 0, 0, NULL, NULL),
('61-90', 10, 0, 0, NULL, NULL, 90, 0, 0, NULL, NULL),
('91-120', 27.75, 0, 0, NULL, NULL, 480, 0, 0, NULL, NULL),
('More than 180', 45, 0, 0, NULL, NULL, 540, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suggestions`
--

CREATE TABLE `suggestions` (
  `suggest_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `appliance` varchar(20) NOT NULL,
  `priority` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cur_time` varchar(20) NOT NULL,
  `change_time` varchar(20) NOT NULL,
  `can_change_hours` int(11) NOT NULL,
  `can_change_minutes` int(11) NOT NULL,
  `save_amount` float NOT NULL,
  `total_cost_TOU` float NOT NULL,
  `Cust_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suggestions`
--

INSERT INTO `suggestions` (`suggest_id`, `device_id`, `bill_id`, `appliance`, `priority`, `quantity`, `cur_time`, `change_time`, `can_change_hours`, `can_change_minutes`, `save_amount`, `total_cost_TOU`, `Cust_id`) VALUES
(1, 33, 3, 'Fan', 'mid', 2, 'peak', 'off peak', 0, 120, 98.4, 0, 1020),
(2, 33, 3, 'Fan', 'mid', 2, 'peak', 'day', 0, 120, 69.6, 0, 1020),
(3, 33, 3, 'Fan', 'mid', 2, 'day', 'off peak', 0, 120, 28.8, 0, 1020),
(4, 34, 4, 'vsdh', 'mid', 3, 'peak', 'off peak', 2, 0, 3763.8, 0, 1020),
(5, 34, 4, 'vsdh', 'mid', 3, 'peak', 'day', 2, 0, 2662.2, 0, 1020),
(6, 34, 4, 'vsdh', 'mid', 3, 'day', 'off peak', 2, 0, 1101.6, 0, 1020),
(7, 35, 4, 'jb ', 'mid', 2, 'peak', 'off peak', 3, 0, 369, 0, 1020),
(8, 35, 4, 'jb ', 'mid', 2, 'peak', 'day', 4, 0, 348, 0, 1020),
(9, 35, 4, 'jb ', 'mid', 2, 'day', 'off peak', 1, 0, 36, 0, 1020),
(10, 36, 4, 'fan2', 'mid', 2, 'peak', 'off peak', 2, 0, 984, 0, 1020),
(11, 36, 4, 'fan2', 'mid', 2, 'peak', 'day', 1, 30, 522, 0, 1020),
(12, 36, 4, 'fan2', 'mid', 2, 'day', 'off peak', 2, 0, 288, 0, 1020),
(13, 37, 4, 'sssss', 'low', 1, 'peak', 'off peak', 2, 0, 49.2, 0, 1020),
(14, 37, 4, 'sssss', 'low', 1, 'peak', 'day', 2, 0, 34.8, 0, 1020),
(15, 37, 4, 'sssss', 'low', 1, 'day', 'off peak', 2, 0, 14.4, 0, 1020),
(16, 38, 4, 'cccc', 'mid', 2, 'peak', 'off peak', 0, 30, 24.6, 0, 1020),
(17, 38, 4, 'cccc', 'mid', 2, 'peak', 'day', 1, 40, 58, 0, 1020),
(18, 38, 4, 'cccc', 'mid', 2, 'day', 'off peak', 0, 30, 7.2, 0, 1020),
(39, 1, 1, 'fan 1', 'mid', 2, 'peak', 'off peak', 1, 0, 492, 4980, 1020),
(40, 1, 1, 'fan 1', 'mid', 2, 'peak', 'day', 3, 0, 1044, 4980, 1020),
(41, 1, 1, 'fan 1', 'mid', 2, 'day', 'off peak', 1, 0, 144, 4980, 1020),
(42, 2, 1, 'TV', 'low', 2, 'peak', 'off peak', 3, 0, 1107, 2826, 1020),
(43, 2, 1, 'TV', 'low', 2, 'peak', 'day', 3, 0, 783, 2826, 1020),
(44, 2, 1, 'TV', 'low', 2, 'day', 'off peak', 3, 0, 324, 2826, 1020),
(45, 3, 1, 'radio', 'mid', 2, 'peak', 'off peak', 2, 0, 1230, 2955, 1020),
(46, 3, 1, 'radio', 'mid', 2, 'peak', 'day', 2, 0, 870, 2955, 1020),
(47, 3, 1, 'radio', 'mid', 2, 'day', 'off peak', 2, 0, 360, 2955, 1020),
(50, 4, 1, 'Tv2', 'mid', 2, 'peak', 'off peak', 3, 0, 1476, 1944, 1020),
(51, 4, 1, 'Tv2', 'mid', 2, 'peak', 'day', 3, 0, 1044, 1944, 1020),
(52, 5, 1, 'Table Lamp', 'low', 1, 'peak', 'off peak', 2, 0, 492, 3411, 1020),
(53, 5, 1, 'Table Lamp', 'low', 1, 'peak', 'day', 1, 30, 261, 3411, 1020),
(54, 5, 1, 'Table Lamp', 'low', 1, 'day', 'off peak', 2, 0, 144, 3411, 1020),
(55, 6, 1, 'Fan3', 'mid', 2, 'peak', 'day', 2, 0, 1740, 8220, 1020),
(56, 7, 1, 'Light 2', 'mid', 2, 'day', 'off peak', 2, 0, 28.8, 228, 1020),
(57, 9, 2, 'bbb', 'mid', 2, 'peak', 'off peak', 2, 0, 98.4, 220.8, 1020),
(58, 9, 2, 'bbb', 'mid', 2, 'peak', 'day', 2, 0, 69.6, 220.8, 1020),
(59, 9, 2, 'bbb', 'mid', 2, 'day', 'off peak', 2, 0, 28.8, 220.8, 1020);

-- --------------------------------------------------------

--
-- Table structure for table `tou_ucharge`
--

CREATE TABLE `tou_ucharge` (
  `Time_category` varchar(50) NOT NULL,
  `Unit_charge` float NOT NULL,
  `Update_unit_charges` float NOT NULL,
  `Update_ucharge_status` tinyint(1) NOT NULL,
  `Unit_charges_requested_date` varchar(20) DEFAULT NULL,
  `Unit_charges_accepted_date` varchar(20) DEFAULT NULL,
  `Fixed_charge` float NOT NULL,
  `Update_fixed_charges` float NOT NULL,
  `Update_fcharge_status` tinyint(1) NOT NULL,
  `Fixed_charges_requested_date` varchar(20) DEFAULT NULL,
  `Fixed_charges_accepted_date` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tou_ucharge`
--

INSERT INTO `tou_ucharge` (`Time_category`, `Unit_charge`, `Update_unit_charges`, `Update_ucharge_status`, `Unit_charges_requested_date`, `Unit_charges_accepted_date`, `Fixed_charge`, `Update_fixed_charges`, `Update_fcharge_status`, `Fixed_charges_requested_date`, `Fixed_charges_accepted_date`) VALUES
('Day', 25, 20, 0, NULL, NULL, 540, 540, 0, NULL, NULL),
('Off Peak', 13, 13, 0, NULL, NULL, 540, 0, 0, NULL, NULL),
('Peak', 54, 54, 0, '2021-09-03', '2021-09-03', 540, 540, 0, '2021-09-03', '2021-09-03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Cust_id`),
  ADD UNIQUE KEY `UK1` (`Email`);

--
-- Indexes for table `ebill_monthly_plan`
--
ALTER TABLE `ebill_monthly_plan`
  ADD PRIMARY KEY (`bill_id`,`Cust_id`),
  ADD KEY `FK1` (`Cust_id`);

--
-- Indexes for table `ebill_special_event`
--
ALTER TABLE `ebill_special_event`
  ADD PRIMARY KEY (`bill_id`,`Cust_id`) USING BTREE,
  ADD KEY `FK16` (`Cust_id`);

--
-- Indexes for table `ebill_special_event_tou`
--
ALTER TABLE `ebill_special_event_tou`
  ADD PRIMARY KEY (`bill_id`,`Cust_id`) USING BTREE,
  ADD KEY `FK_15` (`Cust_id`);

--
-- Indexes for table `electric_device_mplan`
--
ALTER TABLE `electric_device_mplan`
  ADD PRIMARY KEY (`device_id`,`bill_id`,`Cust_id`) USING BTREE,
  ADD KEY `FK4` (`Cust_id`);

--
-- Indexes for table `electric_device_special_event_fixed`
--
ALTER TABLE `electric_device_special_event_fixed`
  ADD PRIMARY KEY (`device_id`,`bill_id`,`Cust_id`) USING BTREE,
  ADD KEY `FK14` (`Cust_id`);

--
-- Indexes for table `electric_device_special_event_tou`
--
ALTER TABLE `electric_device_special_event_tou`
  ADD PRIMARY KEY (`device_id`,`bill_id`,`Cust_id`) USING BTREE,
  ADD KEY `FK13` (`Cust_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Emp_id`),
  ADD UNIQUE KEY `UK2` (`Email`) USING BTREE;

--
-- Indexes for table `fixed_ucharge`
--
ALTER TABLE `fixed_ucharge`
  ADD PRIMARY KEY (`Unit_category`);

--
-- Indexes for table `suggestions`
--
ALTER TABLE `suggestions`
  ADD PRIMARY KEY (`suggest_id`,`device_id`,`bill_id`),
  ADD KEY `FK10` (`device_id`),
  ADD KEY `FK12` (`bill_id`),
  ADD KEY `FK9` (`Cust_id`);

--
-- Indexes for table `tou_ucharge`
--
ALTER TABLE `tou_ucharge`
  ADD PRIMARY KEY (`Time_category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1025;
--
-- AUTO_INCREMENT for table `electric_device_mplan`
--
ALTER TABLE `electric_device_mplan`
  MODIFY `device_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `electric_device_special_event_fixed`
--
ALTER TABLE `electric_device_special_event_fixed`
  MODIFY `device_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `electric_device_special_event_tou`
--
ALTER TABLE `electric_device_special_event_tou`
  MODIFY `device_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `Emp_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `suggestions`
--
ALTER TABLE `suggestions`
  MODIFY `suggest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ebill_special_event`
--
ALTER TABLE `ebill_special_event`
  ADD CONSTRAINT `FK16` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`Cust_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `electric_device_special_event_fixed`
--
ALTER TABLE `electric_device_special_event_fixed`
  ADD CONSTRAINT `FK14` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`Cust_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `electric_device_special_event_tou`
--
ALTER TABLE `electric_device_special_event_tou`
  ADD CONSTRAINT `FK13` FOREIGN KEY (`Cust_id`) REFERENCES `customer` (`Cust_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
