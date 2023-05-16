-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2023 at 09:40 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinecourse`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '12345', '2022-01-31 16:21:18', '0000-00-00 00:00:00'),
(2, 'AP', '121212', '2023-04-03 16:05:18', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_code` varchar(255) NOT NULL,
  `courseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `courseUnit` varchar(255) DEFAULT NULL,
  `noofSeats` int(11) DEFAULT NULL,
  `bucket_number` int(11) NOT NULL,
  `MCA` int(11) DEFAULT NULL COMMENT 'seats_for_MCA',
  `seats_for_IMTECH_3-4` int(11) DEFAULT NULL,
  `seats_for_IMTECH_5-6` int(11) DEFAULT NULL,
  `IMTECH_7-8` int(11) DEFAULT NULL COMMENT 'seats_for_IMTECH_7-8',
  `seats_for_MTECH_AI` int(11) DEFAULT NULL,
  `seats_for_MTECH_CS` int(11) DEFAULT NULL,
  `seats_for_MTECH_IT` int(11) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_code`, `courseName`, `courseUnit`, `noofSeats`, `bucket_number`, `MCA`, `seats_for_IMTECH_3-4`, `seats_for_IMTECH_5-6`, `IMTECH_7-8`, `seats_for_MTECH_AI`, `seats_for_MTECH_CS`, `seats_for_MTECH_IT`, `creationDate`, `updationDate`) VALUES
('ACN – V Radha*', 'ACN', NULL, NULL, 6, 0, NULL, 50, 50, 50, 50, 50, '2023-04-11 10:44:17', NULL),
('AdvAlgo-RPL', 'Advance Algo', NULL, NULL, 3, 0, NULL, 50, 50, 50, 50, 50, '2023-04-11 10:44:17', NULL),
('Biometrics – MVNK *', 'Biometrics', NULL, NULL, 5, 0, NULL, 0, 0, 0, 0, 0, '2023-04-11 10:44:17', NULL),
('CC – RW', 'Cloud Computing', NULL, NULL, 1, 8, NULL, 5, 5, 5, 50, 0, '2023-04-11 10:44:17', NULL),
('CIP – CB', 'CIP', NULL, NULL, 6, 5, NULL, 5, 15, 10, 15, 5, '2023-04-11 10:44:17', NULL),
('Data Comp – VCV', 'Data Compression', NULL, NULL, 3, 50, NULL, 50, 50, 50, 50, 50, '2023-04-11 10:44:17', NULL),
('DDPC-SNS', 'DDPC', NULL, NULL, 4, 0, NULL, 50, 50, 50, 50, 50, '2023-04-11 10:44:17', NULL),
('DL – AN', 'DL', NULL, NULL, 5, 0, NULL, 0, 50, 50, 50, 50, '2023-04-11 10:44:17', NULL),
('EHCF – DP', 'EHFC', NULL, NULL, 4, 0, NULL, 50, 50, 50, 50, 50, '2023-04-11 10:44:17', NULL),
('IoT – NKS', 'Internet of Things', NULL, NULL, 3, 10, NULL, 0, 15, 5, 15, 5, '2023-04-11 10:44:17', NULL),
('Meta Heuristics – AS', 'Meta Heuristics', NULL, NULL, 4, 0, NULL, 50, 50, 50, 50, 50, '2023-04-11 10:44:17', NULL),
('ML – VN', 'Machine Learning', NULL, NULL, 2, 0, NULL, 0, 0, 50, 0, 0, '2023-04-11 10:44:17', NULL),
('NWSec – WN', 'Network Security', NULL, NULL, 2, 0, NULL, 50, 50, 50, 50, 50, '2023-04-11 10:44:17', NULL),
('SM – CRR', 'SM', NULL, NULL, 5, 0, NULL, 0, 0, 0, 0, 0, '2023-04-11 10:44:17', NULL),
('SNA – SDB', 'SNA', NULL, NULL, 6, 0, NULL, 50, 50, 50, 50, 50, '2023-04-11 10:44:17', NULL),
('SocSys-HM', 'Social System', NULL, NULL, 6, 50, NULL, 50, 50, 50, 50, 50, '2023-04-11 10:44:17', NULL),
('SP-MNM', 'SP', NULL, NULL, 3, 0, NULL, 0, 0, 0, 0, 0, '2023-04-11 10:44:17', NULL),
('SysSec-BMM*', 'System Security', NULL, NULL, 1, 0, NULL, 50, 50, 50, 50, 50, '2023-04-11 10:44:16', NULL),
('Virtualization- PSK *', 'Virtualization', NULL, NULL, 2, 0, NULL, 50, 50, 50, 50, 50, '2023-04-11 10:44:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courseenrolls`
--

CREATE TABLE `courseenrolls` (
  `id` int(11) NOT NULL,
  `studentRegno` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `session` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `enrollDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courseenrolls`
--

INSERT INTO `courseenrolls` (`id`, `studentRegno`, `pincode`, `session`, `department`, `level`, `semester`, `course`, `enrollDate`) VALUES
(1, '10806121', '822894', 1, 1, 2, 3, 1, '2022-02-11 00:59:33'),
(2, '10806121', '822894', 1, 1, 1, 2, 2, '2022-02-11 01:01:07'),
(3, '12356', '181793', 1, 1, 2, 3, 2, '2023-04-02 10:05:59'),
(5, '12356', '181793', 1, 1, 1, 2, 1, '2023-04-02 10:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `courses_allocated`
--

CREATE TABLE `courses_allocated` (
  `courses_allocated_id` int(11) NOT NULL,
  `student_reg_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `course_code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `course_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses_allocated`
--

INSERT INTO `courses_allocated` (`courses_allocated_id`, `student_reg_no`, `course_code`, `course_name`, `course_type`) VALUES
(207, '18MCME03', 'Data Comp – VCV', 'Data Compression', 'optional_Core'),
(208, '18MCME03', 'SysSec-BMM*', 'System Security', 'optional_Core'),
(209, '18MCME04', 'IoT – NKS', 'Internet of Things', 'optional_Core'),
(210, '18MCME04', 'SysSec-BMM*', 'System Security', 'optional_Core'),
(211, '18MCME02', 'DDPC-SNS', 'DDPC', 'optional_Core'),
(212, '18MCME02', 'Data Comp – VCV', 'Data Compression', 'optional_Core'),
(213, '18MCME03', 'DDPC-SNS', 'DDPC', 'Elective'),
(214, '18MCME03', 'NWSec – WN', 'Network Security', 'Elective'),
(215, '18MCME03', 'SNA – SDB', 'SNA', 'Elective'),
(216, '18MCME04', 'CIP – CB', 'CIP', 'Elective'),
(217, '18MCME04', 'Virtualization- PSK *', 'Virtualization', 'Elective'),
(218, '18MCME04', 'EHCF – DP', 'EHFC', 'Elective'),
(219, '18MCME02', 'Virtualization- PSK *', 'Virtualization', 'Elective'),
(220, '18MCME02', 'Meta Heuristics – AS', 'Meta Heuristics', 'Elective'),
(221, '18MCME02', 'CIP – CB', 'CIP', 'Elective');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department`, `creationDate`) VALUES
(1, 'IT', '2022-02-10 17:23:04'),
(2, 'HR', '2022-02-10 17:23:09');

-- --------------------------------------------------------

--
-- Table structure for table `elective_preference`
--

CREATE TABLE `elective_preference` (
  `elective_preference_id` int(11) NOT NULL,
  `studentRegno` varchar(255) NOT NULL,
  `E1` varchar(255) DEFAULT NULL,
  `E2` varchar(255) DEFAULT NULL,
  `E3` varchar(255) DEFAULT NULL,
  `E4` varchar(255) DEFAULT NULL,
  `E5` varchar(255) DEFAULT NULL,
  `E6` varchar(255) DEFAULT NULL,
  `E7` varchar(255) DEFAULT NULL,
  `E8` varchar(255) DEFAULT NULL,
  `E9` varchar(255) DEFAULT NULL,
  `E10` varchar(255) DEFAULT NULL,
  `E11` varchar(255) DEFAULT NULL,
  `E12` varchar(255) DEFAULT NULL,
  `E13` varchar(255) DEFAULT NULL,
  `E14` varchar(255) DEFAULT NULL,
  `E15` varchar(255) DEFAULT NULL,
  `E16` varchar(255) DEFAULT NULL,
  `E17` varchar(255) DEFAULT NULL,
  `E18` varchar(255) DEFAULT NULL,
  `E19` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `elective_preference`
--

INSERT INTO `elective_preference` (`elective_preference_id`, `studentRegno`, `E1`, `E2`, `E3`, `E4`, `E5`, `E6`, `E7`, `E8`, `E9`, `E10`, `E11`, `E12`, `E13`, `E14`, `E15`, `E16`, `E17`, `E18`, `E19`) VALUES
(1, '18MCME02', 'Advance Algo', 'DL', 'Virtualization', 'Machine Learning', 'Meta Heuristics', 'CIP', 'SP', 'System Security', 'ACN', 'Biometrics', 'Cloud Computing', 'EHFC', 'Internet of Things', 'Network Security', 'SM', 'SNA', 'Social System', 'NULL', 'NULL'),
(2, '18MCME03', 'DDPC', 'SM', 'Network Security', 'SNA', 'Social System', 'SP', 'Virtualization', 'DL', 'Machine Learning', 'Internet of Things', 'CIP', 'ACN', 'EHFC', 'Meta Heuristics', 'Advance Algo', 'Biometrics', 'Cloud Computing', 'NULL', 'NULL'),
(3, '18MCME04', 'CIP', 'SM', 'SNA', 'Social System', 'Virtualization', 'DL', 'EHFC', 'Advance Algo', 'SP', 'Data Compression', 'Network Security', 'Machine Learning', 'Meta Heuristics', 'DDPC', 'Biometrics', 'Cloud Computing', 'ACN', 'NULL', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `eligible_optional_core`
--

CREATE TABLE `eligible_optional_core` (
  `id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `stream_name` varchar(255) NOT NULL,
  `courseName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eligible_optional_core`
--

INSERT INTO `eligible_optional_core` (`id`, `stream_id`, `stream_name`, `courseName`) VALUES
(16, 1, 'MCA', 'Advance Algo'),
(21, 1, 'MCA', 'Virtualization'),
(22, 5, 'IMTECH 3-4', 'DL'),
(23, 5, 'IMTECH 3-4', 'SP'),
(24, 3, 'MTECH_CS', 'DL'),
(25, 3, 'MTECH_CS', 'EHFC'),
(26, 1, 'MCA', 'Network Security'),
(27, 1, 'MCA', 'SM'),
(28, 1, 'MCA', 'SNA'),
(29, 1, 'MCA', 'Social System'),
(34, 1, 'MCA', 'ACN'),
(37, 1, 'MCA', 'SP'),
(38, 1, 'MCA', 'System Security'),
(46, 7, 'IMTECH 7-8', 'CIP'),
(47, 7, 'IMTECH 7-8', 'Data Compression'),
(48, 7, 'IMTECH 7-8', 'DDPC'),
(49, 7, 'IMTECH 7-8', 'DL'),
(50, 7, 'IMTECH 7-8', 'EHFC'),
(51, 7, 'IMTECH 7-8', 'Internet of Things'),
(52, 7, 'IMTECH 7-8', 'Meta Heuristics'),
(53, 7, 'IMTECH 7-8', 'System Security'),
(54, 7, 'IMTECH 7-8', 'Virtualization');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `level`, `creationDate`) VALUES
(1, '1', '2022-02-11 00:59:02'),
(2, '2', '2022-02-11 00:59:02'),
(3, '3', '2022-02-11 00:59:09');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `newstitle` varchar(255) DEFAULT NULL,
  `newsDescription` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `newstitle`, `newsDescription`, `postingDate`) VALUES
(2, 'Test News', 'This is for testing. This is for testing.This is for testing.This is for testing.This is for testing.This is for testing.This is for testing.This is for testing.This is for testing.This is for testing.', '2022-02-10 17:36:50'),
(3, 'New Course Started C#', 'This is sample text for testing.', '2022-02-11 00:54:38'),
(4, 'Deadline', 'Today is the last date to register for OC', '2023-04-06 10:46:59'),
(5, '', '', '2023-04-17 06:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `id` int(11) NOT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id`, `semester`, `creationDate`, `updationDate`) VALUES
(1, '8', '2022-02-10 17:22:49', NULL),
(2, '4', '2022-02-10 17:22:55', NULL),
(3, '3', '2022-02-11 00:51:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `session` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `session`, `creationDate`) VALUES
(1, '2022', '2022-02-10 17:10:59');

-- --------------------------------------------------------

--
-- Table structure for table `stream`
--

CREATE TABLE `stream` (
  `stream_id` int(11) NOT NULL,
  `stream_name` varchar(50) NOT NULL,
  `optional_core_count` int(20) NOT NULL COMMENT 'value cannot be greater than 3',
  `elective_count` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stream`
--

INSERT INTO `stream` (`stream_id`, `stream_name`, `optional_core_count`, `elective_count`) VALUES
(1, 'MCA', 3, 3),
(2, 'MTECH_AI', 2, 3),
(3, 'MTECH_CS', 2, 3),
(4, 'MTECH_IT', 3, 3),
(5, 'IMTECH 3-4', 2, 3),
(6, 'IMTECH 5-6', 2, 3),
(7, 'IMTECH 7-8', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `studentRegno` varchar(255) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `studentPhoto` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT 'Test@123',
  `studentName` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `cgpa` decimal(10,2) DEFAULT NULL,
  `courses_allocated_id` int(11) NOT NULL COMMENT 'course codes',
  `enrolment_status_optional` tinyint(1) NOT NULL,
  `enrolment_status_elective` tinyint(1) NOT NULL,
  `optional_core_choice_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `optional_core_choice_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `optional_core_choice_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password_status` tinyint(1) NOT NULL DEFAULT 0,
  `creationdate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`studentRegno`, `stream_id`, `studentPhoto`, `password`, `studentName`, `pincode`, `session`, `department`, `semester`, `cgpa`, `courses_allocated_id`, `enrolment_status_optional`, `enrolment_status_elective`, `optional_core_choice_1`, `optional_core_choice_2`, `optional_core_choice_3`, `password_status`, `creationdate`, `updationDate`) VALUES
('12356', 1, '', '123456', 'ayushi', '181793', NULL, NULL, NULL, '0.00', 0, 0, 0, 'SM', 'Advance Algo', 'Virtualization', 1, '2023-04-02 09:58:10', '02-04-2023 04:22:17 PM'),
('18MCME02', 7, NULL, '12345', 'Amruta Jandhyala', NULL, NULL, NULL, '8', '9.00', 0, 1, 1, 'DDPC', 'Data Compression', 'NULL', 1, '2023-05-06 07:15:44', '06-05-2023 12:49:51 PM'),
('18MCME03', 7, NULL, '12345', 'Arun Kumar Dharavath', NULL, NULL, NULL, '8', '9.60', 0, 1, 1, 'Data Compression', 'System Security', 'NULL', 1, '2023-05-06 07:15:44', '06-05-2023 12:52:36 PM'),
('18MCME04', 7, NULL, '12345', 'Gayathri G', NULL, NULL, NULL, '8', '9.50', 0, 1, 1, 'Internet of Things', 'System Security', 'NULL', 1, '2023-05-06 07:15:44', '06-05-2023 12:54:48 PM'),
('18MCME07', 7, NULL, '12345', 'Preethi Kajjayam', NULL, NULL, NULL, '8', '4.50', 0, 1, 0, 'EHFC', 'CIP', 'NULL', 1, '2023-05-06 07:15:44', '06-05-2023 12:55:28 PM'),
('18MCME09', 7, NULL, 'GiSuX', 'Challa Subramanyam', NULL, NULL, NULL, '8', '2.50', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('18MCME10', 7, NULL, 'OzEiX', 'K. Parikshit Rao', NULL, NULL, NULL, '8', '9.40', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('18MCME11', 7, NULL, 'LeQwY', 'P Sai Teja', NULL, NULL, NULL, '8', '6.80', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('18MCME13', 7, NULL, 'SlNpS', 'A.Pavan kumar', NULL, NULL, NULL, '8', '5.40', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('18MCME14', 7, NULL, 'JsGtB', 'Harshitha Bingi', NULL, NULL, NULL, '8', '2.10', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('18MCME15', 7, NULL, 'SoJpE', 'Mallu Rakesh Reddy', NULL, NULL, NULL, '8', '7.00', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('18MCME16', 7, NULL, 'KnEqH', 'Rohan', NULL, NULL, NULL, '8', '8.40', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('18MCME17', 7, NULL, 'YzLpQ', 'V. Sai Koushik', NULL, NULL, NULL, '8', '8.80', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('18MCME18', 7, NULL, 'KqSiE', 'K. Roopa Yashaswini', NULL, NULL, NULL, '8', '6.00', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('18MCME19', 7, NULL, 'WiQyY', 'Chinthakindi Tarun', NULL, NULL, NULL, '8', '7.60', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('21MCMI05', 2, NULL, 'TdAqO', 'Ch Saiman Naidu', NULL, NULL, NULL, '4', '5.70', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('21MCMI09', 2, NULL, 'KwAeY', 'Sai Sanjana Madaram', NULL, NULL, NULL, '4', '8.20', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('21MCMI14', 2, NULL, 'XmOsW', 'Rajesh Thalla', NULL, NULL, NULL, '4', '6.50', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('21MCMI16', 2, NULL, 'IhNbO', 'R P Yashasvi', NULL, NULL, NULL, '4', '9.10', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('21MCMI18', 2, NULL, 'LxGlC', 'Dipyaman Mukhopadhyay', NULL, NULL, NULL, '4', '10.00', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('21MCMI20', 2, NULL, 'OgAfQ', 'Drishty gupta', NULL, NULL, NULL, '4', '5.80', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL),
('21MCMI25', 2, NULL, 'KvJvC', 'Pralhad Kolambkar', NULL, NULL, NULL, '4', '9.90', 0, 0, 0, NULL, NULL, NULL, 0, '2023-05-06 07:15:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `total_no_of_seats`
--

CREATE TABLE `total_no_of_seats` (
  `stream_id` int(255) NOT NULL,
  `stream_name` varchar(255) NOT NULL,
  `System Security` int(255) DEFAULT NULL,
  `Cloud Computing` int(255) DEFAULT NULL,
  `Machine Learning` int(255) DEFAULT NULL,
  `Network Security` int(255) DEFAULT NULL,
  `Virtualization` int(255) DEFAULT NULL,
  `Advance Algo` int(255) DEFAULT NULL,
  `Internet of Things` int(255) DEFAULT NULL,
  `SP` int(255) DEFAULT NULL,
  `Data Compression` int(255) DEFAULT NULL,
  `Meta Heuristics` int(255) DEFAULT NULL,
  `EHFC` int(255) DEFAULT NULL,
  `DDPC` int(255) DEFAULT NULL,
  `DL` int(255) DEFAULT NULL,
  `Biometrics` int(255) DEFAULT NULL,
  `SM` int(255) DEFAULT NULL,
  `CIP` int(255) DEFAULT NULL,
  `ACN` int(255) DEFAULT NULL,
  `SNA` int(255) DEFAULT NULL,
  `Social System` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `total_no_of_seats`
--

INSERT INTO `total_no_of_seats` (`stream_id`, `stream_name`, `System Security`, `Cloud Computing`, `Machine Learning`, `Network Security`, `Virtualization`, `Advance Algo`, `Internet of Things`, `SP`, `Data Compression`, `Meta Heuristics`, `EHFC`, `DDPC`, `DL`, `Biometrics`, `SM`, `CIP`, `ACN`, `SNA`, `Social System`) VALUES
(1, 'MCA', 0, 8, 0, 0, 0, 0, 10, 0, 50, 0, 0, 0, 0, 0, 0, 5, 0, 0, 50),
(2, 'MTECH-AI', 50, 5, 50, 50, 50, 50, 5, 0, 50, 50, 50, 50, 50, 0, 0, 5, 50, 50, 50),
(3, 'MTECH-CS', 50, 50, 0, 50, 50, 50, 15, 0, 50, 50, 50, 50, 50, 0, 0, 15, 50, 50, 50),
(4, 'MTECH_IT', 50, 0, 0, 50, 50, 50, 5, 0, 50, 50, 50, 50, 50, 0, 0, 5, 50, 50, 50),
(6, 'IMTECH 5-6', 50, 5, 0, 50, 50, 50, 0, 0, 50, 50, 50, 50, 0, 0, 0, 5, 50, 50, 50),
(7, 'IMTECH 7-8', 29, 17, 39, 25, 1, -1, 41, 28, 46, 13, 14, 13, 0, 33, -8029, 4, 28, 16, 28);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `studentRegno` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `studentRegno`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, '10806121', 0x3a3a3100000000000000000000000000, '2022-02-11 00:55:07', NULL, 1),
(2, '10806121', 0x3a3a3100000000000000000000000000, '2022-02-11 00:57:00', NULL, 1),
(3, '10806121', 0x3a3a3100000000000000000000000000, '2022-02-11 00:57:22', '11-02-2022 06:31:26 AM', 1),
(4, '10806121', 0x3a3a3100000000000000000000000000, '2023-03-31 19:12:45', NULL, 1),
(5, '10806121', 0x3a3a3100000000000000000000000000, '2023-04-02 09:21:13', '02-04-2023 02:55:53 PM', 1),
(6, '10806121', 0x3a3a3100000000000000000000000000, '2023-04-02 09:36:15', NULL, 1),
(7, '10806121', 0x3a3a3100000000000000000000000000, '2023-04-02 09:37:49', '02-04-2023 03:10:25 PM', 1),
(8, '10806121', 0x3a3a3100000000000000000000000000, '2023-04-02 09:41:29', '02-04-2023 03:13:21 PM', 1),
(9, '10806121', 0x3a3a3100000000000000000000000000, '2023-04-02 09:49:02', '02-04-2023 03:20:10 PM', 1),
(10, '10806121', 0x3a3a3100000000000000000000000000, '2023-04-02 09:50:15', '02-04-2023 03:27:21 PM', 1),
(11, '10806121', 0x3a3a3100000000000000000000000000, '2023-04-02 09:58:47', '02-04-2023 03:32:00 PM', 1),
(12, '12356', 0x3a3a3100000000000000000000000000, '2023-04-02 10:02:41', '02-04-2023 03:33:04 PM', 1),
(13, '12356', 0x3a3a3100000000000000000000000000, '2023-04-02 10:03:13', '02-04-2023 03:35:10 PM', 1),
(14, '12356', 0x3a3a3100000000000000000000000000, '2023-04-02 10:05:23', '02-04-2023 03:41:56 PM', 1),
(15, '12356', 0x3a3a3100000000000000000000000000, '2023-04-02 10:19:40', NULL, 1),
(16, '12356', 0x3a3a3100000000000000000000000000, '2023-04-02 10:20:05', NULL, 1),
(17, '12356', 0x3a3a3100000000000000000000000000, '2023-04-02 10:23:31', '02-04-2023 04:01:41 PM', 1),
(18, '12356', 0x3a3a3100000000000000000000000000, '2023-04-02 10:31:50', '02-04-2023 04:05:45 PM', 1),
(19, '10806121', 0x3a3a3100000000000000000000000000, '2023-04-02 10:46:35', '02-04-2023 04:21:57 PM', 1),
(20, '12356', 0x3a3a3100000000000000000000000000, '2023-04-02 10:52:06', '02-04-2023 04:22:21 PM', 1),
(21, '12356', 0x3a3a3100000000000000000000000000, '2023-04-02 10:52:43', '02-04-2023 04:23:57 PM', 1),
(22, '12356', 0x3a3a3100000000000000000000000000, '2023-04-02 10:59:53', '02-04-2023 04:31:06 PM', 1),
(23, '12356', 0x3a3a3100000000000000000000000000, '2023-04-02 11:01:13', '02-04-2023 05:11:23 PM', 1),
(24, '12356', 0x3a3a3100000000000000000000000000, '2023-04-02 11:41:30', '02-04-2023 05:11:37 PM', 1),
(25, '21mcmc12', 0x3a3a3100000000000000000000000000, '2023-04-03 16:34:30', '03-04-2023 10:04:55 PM', 1),
(26, '21mcmc12', 0x3a3a3100000000000000000000000000, '2023-04-03 16:35:24', '03-04-2023 10:07:22 PM', 1),
(27, '21mcmc12', 0x3a3a3100000000000000000000000000, '2023-04-05 17:17:11', '05-04-2023 10:49:45 PM', 1),
(28, '21mcmc12', 0x3a3a3100000000000000000000000000, '2023-04-06 05:56:17', NULL, 1),
(29, '21mcmc12', 0x3a3a3100000000000000000000000000, '2023-04-06 10:26:52', '06-04-2023 03:57:57 PM', 1),
(30, '21mcmc12', 0x3a3a3100000000000000000000000000, '2023-04-06 10:47:49', '06-04-2023 04:18:34 PM', 1),
(31, '12356', 0x3a3a3100000000000000000000000000, '2023-04-08 20:10:27', NULL, 1),
(32, '12356', 0x3a3a3100000000000000000000000000, '2023-04-10 08:01:57', '10-04-2023 02:14:33 PM', 1),
(33, '12356', 0x3a3a3100000000000000000000000000, '2023-04-10 08:44:38', '10-04-2023 02:51:59 PM', 1),
(34, '12356', 0x3a3a3100000000000000000000000000, '2023-04-10 09:22:04', NULL, 1),
(35, '12356', 0x3a3a3100000000000000000000000000, '2023-04-10 15:40:42', NULL, 1),
(36, '16MCME02', 0x3a3a3100000000000000000000000000, '2023-04-11 06:20:46', NULL, 1),
(37, '18MCME01', 0x3a3a3100000000000000000000000000, '2023-04-11 10:48:48', NULL, 1),
(38, '12356', 0x3a3a3100000000000000000000000000, '2023-04-16 18:12:29', NULL, 1),
(39, '12356', 0x3a3a3100000000000000000000000000, '2023-04-16 19:06:38', NULL, 1),
(40, '12356', 0x3a3a3100000000000000000000000000, '2023-04-17 06:34:02', NULL, 1),
(41, '12356', 0x3a3a3100000000000000000000000000, '2023-04-17 11:12:47', '17-04-2023 04:54:29 PM', 1),
(42, '12356', 0x3a3a3100000000000000000000000000, '2023-04-17 11:25:24', '17-04-2023 05:08:28 PM', 1),
(43, '12356', 0x3a3a3100000000000000000000000000, '2023-04-18 05:29:12', NULL, 1),
(44, '12356', 0x3a3a3100000000000000000000000000, '2023-04-18 11:02:28', NULL, 1),
(45, '12356', 0x3a3a3100000000000000000000000000, '2023-04-22 12:39:35', '22-04-2023 11:26:03 PM', 1),
(46, '12356', 0x3a3a3100000000000000000000000000, '2023-04-22 17:56:11', '23-04-2023 12:08:03 AM', 1),
(47, '12356', 0x3a3a3100000000000000000000000000, '2023-04-22 18:45:43', NULL, 1),
(48, '12356', 0x3a3a3100000000000000000000000000, '2023-04-23 16:53:07', NULL, 1),
(49, '12356', 0x3a3a3100000000000000000000000000, '2023-04-25 04:40:40', NULL, 1),
(50, '12356', 0x3a3a3100000000000000000000000000, '2023-04-26 16:13:02', '26-04-2023 11:25:14 PM', 1),
(51, '12356', 0x3a3a3100000000000000000000000000, '2023-04-26 18:00:47', NULL, 1),
(52, '12356', 0x3a3a3100000000000000000000000000, '2023-04-29 17:47:37', NULL, 1),
(53, '12356', 0x3a3a3100000000000000000000000000, '2023-04-30 17:07:53', NULL, 1),
(54, '18MCME02', 0x3a3a3100000000000000000000000000, '2023-05-06 07:19:39', '06-05-2023 12:50:27 PM', 1),
(55, '18MCME02', 0x3a3a3100000000000000000000000000, '2023-05-06 07:21:05', '06-05-2023 12:52:19 PM', 1),
(56, '18MCME03', 0x3a3a3100000000000000000000000000, '2023-05-06 07:22:28', '06-05-2023 12:53:51 PM', 1),
(57, '18MCME04', 0x3a3a3100000000000000000000000000, '2023-05-06 07:24:35', '06-05-2023 12:55:03 PM', 1),
(58, '18MCME07', 0x3a3a3100000000000000000000000000, '2023-05-06 07:25:19', '06-05-2023 12:55:51 PM', 1),
(59, '18MCME02', 0x3a3a3100000000000000000000000000, '2023-05-06 16:52:03', '06-05-2023 10:39:53 PM', 1),
(60, '18MCME03', 0x3a3a3100000000000000000000000000, '2023-05-06 17:09:59', '06-05-2023 10:40:52 PM', 1),
(61, '18MCME04', 0x3a3a3100000000000000000000000000, '2023-05-06 17:11:03', NULL, 1),
(62, '12356', 0x3a3a3100000000000000000000000000, '2023-05-11 06:18:15', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_code`);

--
-- Indexes for table `courseenrolls`
--
ALTER TABLE `courseenrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses_allocated`
--
ALTER TABLE `courses_allocated`
  ADD PRIMARY KEY (`courses_allocated_id`),
  ADD KEY `student_reg_no` (`student_reg_no`),
  ADD KEY `course_code` (`course_code`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `elective_preference`
--
ALTER TABLE `elective_preference`
  ADD PRIMARY KEY (`elective_preference_id`);

--
-- Indexes for table `eligible_optional_core`
--
ALTER TABLE `eligible_optional_core`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stream_id` (`stream_id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stream`
--
ALTER TABLE `stream`
  ADD PRIMARY KEY (`stream_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studentRegno`),
  ADD KEY `stream_id` (`stream_id`);

--
-- Indexes for table `total_no_of_seats`
--
ALTER TABLE `total_no_of_seats`
  ADD PRIMARY KEY (`stream_id`),
  ADD KEY `stream_id` (`stream_id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `courseenrolls`
--
ALTER TABLE `courseenrolls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `courses_allocated`
--
ALTER TABLE `courses_allocated`
  MODIFY `courses_allocated_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `elective_preference`
--
ALTER TABLE `elective_preference`
  MODIFY `elective_preference_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `eligible_optional_core`
--
ALTER TABLE `eligible_optional_core`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stream`
--
ALTER TABLE `stream`
  MODIFY `stream_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses_allocated`
--
ALTER TABLE `courses_allocated`
  ADD CONSTRAINT `courses_allocated_ibfk_1` FOREIGN KEY (`student_reg_no`) REFERENCES `students` (`studentRegno`),
  ADD CONSTRAINT `courses_allocated_ibfk_2` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`);

--
-- Constraints for table `eligible_optional_core`
--
ALTER TABLE `eligible_optional_core`
  ADD CONSTRAINT `eligible_optional_core_ibfk_1` FOREIGN KEY (`stream_id`) REFERENCES `stream` (`stream_id`),
  ADD CONSTRAINT `eligible_optional_core_ibfk_2` FOREIGN KEY (`stream_id`) REFERENCES `stream` (`stream_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`stream_id`) REFERENCES `stream` (`stream_id`);

--
-- Constraints for table `total_no_of_seats`
--
ALTER TABLE `total_no_of_seats`
  ADD CONSTRAINT `total_no_of_seats_ibfk_1` FOREIGN KEY (`stream_id`) REFERENCES `stream` (`stream_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
