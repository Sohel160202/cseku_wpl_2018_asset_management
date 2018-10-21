-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 18, 2018 at 06:01 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cseku`
--

-- --------------------------------------------------------

--
-- Table structure for table `ams_asset`
--

DROP TABLE IF EXISTS `ams_asset`;
CREATE TABLE IF NOT EXISTS `ams_asset` (
  `id` varchar(40) NOT NULL,
  `type_id` int(11) NOT NULL,
  `serialNo` varchar(256) NOT NULL,
  `modelNo` varchar(256) NOT NULL,
  `brand` varchar(256) NOT NULL,
  `purchaseDate` date NOT NULL,
  `status` varchar(256) NOT NULL,
  `configuration` text NOT NULL,
  `stuff_id` varchar(40) NOT NULL,
  `purchasedFrom` varchar(256) NOT NULL,
  `cost` double NOT NULL,
  `warrantyLimit` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serialNo` (`serialNo`),
  KEY `type_id` (`type_id`),
  KEY `user_id` (`stuff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ams_asset`
--

INSERT INTO `ams_asset` (`id`, `type_id`, `serialNo`, `modelNo`, `brand`, `purchaseDate`, `status`, `configuration`, `stuff_id`, `purchasedFrom`, `cost`, `warrantyLimit`) VALUES
('{333CBE50-5443-4329-B824-789082D64549}', 1, 'ROG01', 'G-551VW', 'ASUS', '2015-12-30', 'On Repair', 'Core i7\r\nNVIDIA GEFORCE GTX 960M', 'zahid@gmail.com', 'Global Brand', 100000, '2017-12-30'),
('{3EAF698D-2FC9-4F07-8C9C-0F0D778EECBE}', 3, 'c101', 'GKU97', 'uhl', '2017-12-31', 'Working', 'sadhk', 'test@test.com', 'asd', 21, '2018-12-31'),
('{4AA59D87-B0CC-4229-80A8-E35430DEF68D}', 6, 'r101', 'FEU89', 'TP-Link', '2016-12-31', 'Damaged', 'Configuration', 'test@test.com', 'New Tech', 1300, '2017-12-31'),
('{60587C04-FDD2-47EB-96BD-40C2C108F509}', 4, 'm101', 'wqwe', 'dasd', '2017-11-01', 'On Repair', 'asd', 'test@test.com', 'sad', 4, '2017-11-02'),
('{BBA16347-A695-4CAC-A918-336B382596C4}', 1, 't101', 'a', 'q', '2017-11-01', 'On Repair', 'sda', 'test@test.com', 'awds', 2, '2017-11-02'),
('{DF6F512E-62DF-4142-B758-6EFA68F9E3BF}', 1, 'l102', '89OIJND', 'Dell', '2016-12-31', 'Working', 'Configuration', 'test@test.com', 'Shop', 60000, '2017-08-01'),
('{E50C8FEC-D088-4BAD-BF0E-6CC98378C368}', 1, 'l101', '213DWSA', 'ASUS', '2016-12-31', 'Working', 'Ram: 8GB \r\nProcessor: Intel Core i5 \r\nGeneration: 6th', 'test@test.com', 'Rayans', 70000, '2017-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `ams_asset_type`
--

DROP TABLE IF EXISTS `ams_asset_type`;
CREATE TABLE IF NOT EXISTS `ams_asset_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ams_asset_type`
--

INSERT INTO `ams_asset_type` (`id`, `name`) VALUES
(1, 'Laptop'),
(3, 'CPU'),
(4, 'Monitor'),
(5, 'Projector'),
(6, 'Router');

-- --------------------------------------------------------

--
-- Table structure for table `ams_repair`
--

DROP TABLE IF EXISTS `ams_repair`;
CREATE TABLE IF NOT EXISTS `ams_repair` (
  `id` varchar(40) NOT NULL,
  `asset_id` varchar(40) NOT NULL,
  `problem` text NOT NULL,
  `sendingDate` date NOT NULL,
  `receivingDate` date DEFAULT NULL,
  `status` varchar(256) DEFAULT NULL,
  `sent_by` varchar(40) NOT NULL,
  `received_by` varchar(40) DEFAULT NULL,
  `repaired_from` varchar(256) NOT NULL,
  `cost` double DEFAULT NULL,
  `onWarranty` tinyint(1) NOT NULL,
  `isReceived` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sent_by` (`sent_by`),
  KEY `received_by` (`received_by`),
  KEY `asset_id` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ams_repair`
--

INSERT INTO `ams_repair` (`id`, `asset_id`, `problem`, `sendingDate`, `receivingDate`, `status`, `sent_by`, `received_by`, `repaired_from`, `cost`, `onWarranty`, `isReceived`) VALUES
('{29009978-4607-482C-A1EA-4D839462DDCB}', '{BBA16347-A695-4CAC-A918-336B382596C4}', 'asds', '2018-01-01', '2017-12-01', 'Partially Repaired', 'test@test.com', 'test@test.com', 'Alu', 3, 0, 1),
('{49C0FA6A-2EE6-4AFA-A136-BEF245FA0BA4}', '{333CBE50-5443-4329-B824-789082D64549}', 'Over Heat', '2018-08-21', NULL, NULL, 'zahid@gmail.com', NULL, 'Global Brand', NULL, 0, 0),
('{61C0676A-03C2-41A0-81A2-720B0396CF31}', '{BBA16347-A695-4CAC-A918-336B382596C4}', 'klm', '2016-12-31', NULL, NULL, 'test@test.com', NULL, 'asd', NULL, 1, 0),
('{79A79983-1481-47DE-8C0F-3AEE1E3B0C07}', '{4AA59D87-B0CC-4229-80A8-E35430DEF68D}', 'dawd', '2019-12-31', '2017-01-31', 'Not Repaired', 'test@test.com', 'test@test.com', 'sdasd', 2, 0, 1),
('{9D4B2838-6CC6-46C7-87EE-4A01DB495A6B}', '{E50C8FEC-D088-4BAD-BF0E-6CC98378C368}', 'LLII', '2018-12-31', '2019-12-01', 'Partially Repaired', 'test@test.com', 'test@test.com', 'Alu', 5, 0, 1),
('{DE303E22-31B5-4B2D-8BE4-2FF7FDA1EA48}', '{DF6F512E-62DF-4142-B758-6EFA68F9E3BF}', 'Shutdown Problem', '2016-12-01', '2017-12-01', 'Repaired', 'test@test.com', 'test@test.com', 'Alu', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ams_user_asset`
--

DROP TABLE IF EXISTS `ams_user_asset`;
CREATE TABLE IF NOT EXISTS `ams_user_asset` (
  `id` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `asset_id` varchar(40) NOT NULL,
  `lendingDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `asset_id` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ems_email`
--

DROP TABLE IF EXISTS `ems_email`;
CREATE TABLE IF NOT EXISTS `ems_email` (
  `id` varchar(40) NOT NULL,
  `firstName` varchar(256) NOT NULL,
  `lastName` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `contact` varchar(256) NOT NULL,
  `contactEmail` varchar(256) NOT NULL,
  `address` text NOT NULL,
  `created_at` date NOT NULL,
  `expire_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ems_email`
--

INSERT INTO `ems_email` (`id`, `firstName`, `lastName`, `email`, `contact`, `contactEmail`, `address`, `created_at`, `expire_at`) VALUES
('{4C022864-729A-49FD-804B-38D8340BC459}', 'Sheikh Sohel', 'Moon', 'shlsbbr@gmail.com', '01977662888', 'shlsbbr@gmail.com', 'Khulna', '2018-08-17', '2020-08-20');

-- --------------------------------------------------------

--
-- Table structure for table `pms_link_project`
--

DROP TABLE IF EXISTS `pms_link_project`;
CREATE TABLE IF NOT EXISTS `pms_link_project` (
  `id` varchar(40) NOT NULL,
  `link` text NOT NULL,
  `project_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_link_project`
--

INSERT INTO `pms_link_project` (`id`, `link`, `project_id`) VALUES
('{32D64873-5C27-4B1E-A90A-CD262D4A706B}', 'https://stackoverflow.com/questions/26727581/how-to-remove-default-padding-from-bootstrap-nav-bar', '{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}'),
('{42F54C4C-5925-4667-B058-9FF70FA1459B}', 'https://stackoverflow.com/questions/34500423/remove-top-padding-on-bootstrap-navbar', '{F33491F4-516A-40B3-8D03-557F9A244D1E}'),
('{43A54675-59FC-468C-B928-CD32B2C94ED7}', 'https://stackoverflow.com/questions/26727581/how-to-remove-default-padding-from-bootstrap-nav-bar', '{66B187F3-123B-46C7-A2DB-84C26C40DCBB}'),
('{70017732-32D7-4688-BFDD-53878DE6ACB7}', 'http://cse.ku.dgted.com/', '{E0DDFBEC-EB89-472D-9802-03E322A59281}'),
('{9BE1DB6E-F7E1-4D2D-B3CA-CF7F2A704013}', 'https://stackoverflow.com/questions/34500423/remove-top-padding-on-bootstrap-navbar', '{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}'),
('{A7054D61-1F25-469A-A37E-07BE3058239B}', 'https://www.youtube.com/watch?v=PjcRfTnI0kU&pbjreload=10', '{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}'),
('{FA964E29-1FC8-403A-81DD-405E732771F4}', 'https://stackoverflow.com/questions/26727581/how-to-remove-default-padding-from-bootstrap-nav-bar', '{66B187F3-123B-46C7-A2DB-84C26C40DCBB}');

-- --------------------------------------------------------

--
-- Table structure for table `pms_project`
--

DROP TABLE IF EXISTS `pms_project`;
CREATE TABLE IF NOT EXISTS `pms_project` (
  `id` varchar(40) NOT NULL,
  `thumbnail` text NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `language` varchar(256) NOT NULL,
  `year_id` varchar(40) NOT NULL,
  `term_id` varchar(40) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  `discipline_id` varchar(40) NOT NULL,
  `teacher_id` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `year_id` (`year_id`),
  KEY `term_id` (`term_id`),
  KEY `course_id` (`course_id`),
  KEY `discipline_id` (`discipline_id`),
  KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_project`
--

INSERT INTO `pms_project` (`id`, `thumbnail`, `title`, `description`, `language`, `year_id`, `term_id`, `course_id`, `discipline_id`, `teacher_id`, `created_at`, `updated_at`) VALUES
('{0C262E4E-80F5-436-AF8C-48FA39EAE4C0}', './resources/img/thumbnails/Transport Management System.png', 'Transport Management System', '\"Create vehicles as assets. Assign drivers, helpers to bus along with their contact information. \r\n\r\nCreate routes and the stopage along with the google map options \r\n\r\nAdd more features to it, be creative\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-10-10 15:12:20', '2017-10-10 15:12:20'),
('{0C262E4E-80F5-4367-AF8C-48FA39EAE4C0}', './resources/img/thumbnails/Transport Management System.png', 'Transport Management System', '\"Create vehicles as assets. Assign drivers, helpers to bus along with their contact information. \r\n\r\nCreate routes and the stopage along with the google map options \r\n\r\nAdd more features to it, be creative\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 10:35:47', '2017-08-28 10:35:47'),
('{0C262E4E-80F5-437-AF8C-48FA39EAE4C0}', './resources/img/thumbnails/Transport Management System.png', 'Transport Management System', '\"Create vehicles as assets. Assign drivers, helpers to bus along with their contact information. \r\n\r\nCreate routes and the stopage along with the google map options \r\n\r\nAdd more features to it, be creative\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-10-10 15:11:48', '2017-10-10 15:11:48'),
('{0C62E4E-80F5-4367-AF8C-48FA39EAE4C0}', './resources/img/thumbnails/Transport Management System.png', 'Transport Management System', '\"Create vehicles as assets. Assign drivers, helpers to bus along with their contact information. \r\n\r\nCreate routes and the stopage along with the google map options \r\n\r\nAdd more features to it, be creative\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-10-10 15:12:14', '2017-10-10 15:12:14'),
('{66B187F3-123B-46C7-A2DB-84C26C40DCBB}', './resources/img/thumbnails/Improved CSE Discipline website (OOP).png', 'Improved CSE Discipline website (OOP)', '\"refresh current website with the given template. \r\n\r\none group work with the new templating. \r\n\r\nOther group work with the admin part for the current database\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 08:09:20', '2017-10-11 19:54:45'),
('{6F28DF7E-D7D4-4305-B116-D7466C8CDE03}', './resources/img/thumbnails/Meal Management.png', 'Meal Management', 'dsf', 'PHP', '2', '{298E9628-8DE2-4742-8F93-0491C01BB152}', '2', '{AF41CC9F-3BCD-4952-9D02-17184CC40C79}', 'teacher@gmail.com', '2017-10-12 05:36:43', '2017-10-12 05:36:43'),
('{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}', './resources/img/thumbnails/Improved file-folder management system..png', 'Improved file-folder management system.', '\"improve the available SimTire file folder system, File allocation, file versioning, file relation should be present\r\n\r\nCreate a beatiful file browsing system\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 10:09:17', '2017-08-28 10:09:17'),
('{7D42DF-3EE9-43CE-B2F9-A63051D028E3}', './resources/img/thumbnails/Improved file-folder management system..png', 'Improved file-folder management system.', '\"improve the available SimTire file folder system, File allocation, file versioning, file relation should be present\r\n\r\nCreate a beatiful file browsing system\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-10-10 15:12:01', '2017-10-10 15:12:01'),
('{A5298EE6-822A-4ABF-981D-825CE0FE189B}', './resources/img/thumbnails/Meal Management.png', 'Meal Management', '\"Meal system where you create meal at different times of the day, create menu, cost, SimTire user can subscribe and unsuscribe and pay for the meal to consume it\r\n\r\nIdeally it should be related to the housing. So a meal would created on a housing and consumed from there\r\n\r\nDaily, weekly, monthly consumption report, most likely menus, ranking of the meal should be also present\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 10:08:43', '2017-10-13 04:52:12'),
('{A94A0ABA-1AFA-461E-A09D-808A4FB8B522}', './resources/img/thumbnails/Payment Management System.png', 'Payment Management System', '\"First of all user can load his account with money. This is just dummy money\r\n\r\nPayment can be done by SimTire user related to different things may be medical bill, library fine, buying stuffs from canteen.\r\n\r\nThere will be a store of items and their price will be there. User can buy things from that store and pay using their balance from the account. \r\n\r\nFor buying something (e.g. book) from the store user will get credit and later credit can be converted to a balance using some forumla.\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 10:11:12', '2017-08-28 10:11:12'),
('{CEC76C2B-FA03-4B33-AB9A-B523B7334145}', './resources/img/thumbnails/Improved advanced event calendar.png', 'Improved advanced event calendar', '\"apply SimTire on the available event calendar code and new features to it\r\n\r\nVarious types of searching\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 10:06:10', '2017-09-14 06:27:31'),
('{D283BD24-F48F-45FA-A397-ACFABF690E9C}', './resources/img/thumbnails/Project Archieve.png', 'Project Archieve', '\"improve current project module to SimTire based project. Project should also inclue member names and their partnership in the project\r\n\r\nA front page for the project module where all the projects along with their thumnail pictures and title are shown using pagination. You select one project and you can see the details of the project and the members of the project. Also, the partneship of project if applicable\r\n\r\nPersone wise project lists should also be there\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 10:10:39', '2017-08-28 10:10:39'),
('{E0DDFBEC-EB89-472D-9802-03E322A59281}', './resources/img/thumbnails/Library Management.png', 'Library Management', 'create library, create books, create shelfs, assing book to shelfs to a specific library, search books different ways, student can take books and return bookscreate library, create books, create shelfs, assing book to shelfs to a specific library, search books different ways, student can take books and return bookscreate library, create books, create shelfs, assing book to shelfs to a specific library, search books different ways, student can take books and return books', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 10:09:46', '2017-09-12 06:00:55'),
('{F33491F4-516A-40B3-8D03-557F9A244D1E}', './resources/img/thumbnails/Student Hall Dorm Teacher Staff housing Management.png', 'Student Hall Dorm Teacher Staff housing Management', '\"CRUD of hall/dorm/teacher/staff housing, every hall/others will have rooms, each room will have seats. a student will be selected from the SimTire user and will be assigned to a seat\r\nVarious types of searching \"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 10:07:55', '2017-10-11 20:13:08'),
('{FB511786-370C-4AA9-9686-59EA7C8D1B2B}', './resources/img/thumbnails/Medical Service Management.ico', 'Medical Service Management', '\"create doctors, nurse, medicine stock, university people assigned to doctor, doctor see patient, write prescriptions, and medicine \r\nthen medicine is given to a person and stock gets updated\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 10:10:17', '2017-08-28 10:10:17');

-- --------------------------------------------------------

--
-- Table structure for table `pms_student_project`
--

DROP TABLE IF EXISTS `pms_student_project`;
CREATE TABLE IF NOT EXISTS `pms_student_project` (
  `id` varchar(40) NOT NULL,
  `student_id` varchar(40) NOT NULL,
  `project_id` varchar(40) NOT NULL,
  `contribution` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_student_project`
--

INSERT INTO `pms_student_project` (`id`, `student_id`, `project_id`, `contribution`) VALUES
('{0058AF12-CF2A-4CC3-97C9-34A23FA11457}', 'zubayer@gmail.com', '{CEC76C2B-FA03-4B33-AB9A-B523B7334145}', 65),
('{0DFA6FE8-A794-46AD-8736-92D62F47C8F0}', 'imran@gmail.com', '{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}', 0),
('{0EC59379-2D22-41D0-B04A-B3019DFD0753}', 'pranta.cse@gmail.com', '{D283BD24-F48F-45FA-A397-ACFABF690E9C}', 0),
('{11232E59-FF84-4B74-AA65-2168888FBD07}', 'shuvo@gmail.com', '{66B187F3-123B-46C7-A2DB-84C26C40DCBB}', 0),
('{22CC1D41-8C86-4C65-AE8E-AD5D13227B2E}', 'imran@gmail.com', '{FB511786-370C-4AA9-9686-59EA7C8D1B2B}', 0),
('{330E2402-9EAB-4694-A532-31238064EE88}', 'imran@gmail.com', '{CEC76C2B-FA03-4B33-AB9A-B523B7334145}', 23),
('{3B20A933-25D7-4FCF-8FDE-9D8DBECBE9C8}', 'sakeef@gmail.com', '{D283BD24-F48F-45FA-A397-ACFABF690E9C}', 0),
('{6928ED6C-7DF1-43AF-8DD4-F54D3C769D60}', 'zubayer@gmail.com', '{FB511786-370C-4AA9-9686-59EA7C8D1B2B}', 0),
('{7399A4CE-258D-4F7C-8CA9-C59DBA7795F4}', 'imran@gmail.com', '{F33491F4-516A-40B3-8D03-557F9A244D1E}', 23),
('{7D2A676A-875C-4B96-8D57-6B0D0FF3151F}', 'azoadahnaf@gmail.com', '{A5298EE6-822A-4ABF-981D-825CE0FE189B}', 0),
('{9277AD4B-2FBD-462B-B132-54DA763DD22D}', 'durjoy@gmail.com', '{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}', 0),
('{A3F7A699-E6CF-4377-9711-602D503C5D76}', 'imran@gmail.com', '{66B187F3-123B-46C7-A2DB-84C26C40DCBB}', 0),
('{A9BC0288-1DF9-4026-AEE1-D734AF2350AD}', 'shahidul@gmail.com', '{66B187F3-123B-46C7-A2DB-84C26C40DCBB}', 0),
('{B6CBE46F-0CE4-4831-B61F-F74DAFD700E0}', 'swajon@gmail.com', '{FB511786-370C-4AA9-9686-59EA7C8D1B2B}', 0),
('{BF747D37-653E-4D0B-AFA5-608D8BC41D13}', 'shahidul@gmail.com', '{E0DDFBEC-EB89-472D-9802-03E322A59281}', 100),
('{C18347DC-0769-445E-8FF3-BFA1499664E2}', 'pranta.cse@gmail.com', '{66B187F3-123B-46C7-A2DB-84C26C40DCBB}', 0),
('{C231CCBA-DD44-462B-9094-033A79B5580F}', 'tanmai@gmail.com', '{D283BD24-F48F-45FA-A397-ACFABF690E9C}', 0),
('{CAD5408B-AB81-4445-BF3B-3B1BE2229536}', 'zubayer@gmail.com', '{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}', 0),
('{E2377C13-3040-4DF3-B858-CFE5774761FE}', 'alamin@gmail.com', '{F33491F4-516A-40B3-8D03-557F9A244D1E}', 33);

-- --------------------------------------------------------

--
-- Table structure for table `reg_course`
--

DROP TABLE IF EXISTS `reg_course`;
CREATE TABLE IF NOT EXISTS `reg_course` (
  `ID` varchar(40) NOT NULL,
  `CourseNo` varchar(40) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Credit` double NOT NULL,
  `CourseTypeID` varchar(40) NOT NULL,
  `DisciplineID` varchar(40) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course`
--

INSERT INTO `reg_course` (`ID`, `CourseNo`, `Title`, `Credit`, `CourseTypeID`, `DisciplineID`, `IsDeleted`) VALUES
('{2A038C6A-B6DA-408D-8458-7493D4EE5D6C}', 'cse-3200', 'Web Programming Lab', 1.5, '{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 0),
('{53650FB7-D76E-459D-8B56-BC7A4919C0F6}', 'cse-4112', 'Computer Networks Lab', 1.5, '{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5} ', 0),
('{683A3D91-D124-44AF-82A3-FB43837A4392}', 'cse-4111', 'Computer Networks', 3, '{3DC4DDE5-514F-4BE4-8682-37EA32C3FDB7}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 0),
('{B17BDB32-6D88-4537-9545-65D940E17EEF}', 'cse-2115', 'Advanced Programming Lab', 1.5, '{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5} ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_resource`
--

DROP TABLE IF EXISTS `reg_course_resource`;
CREATE TABLE IF NOT EXISTS `reg_course_resource` (
  `CourseID` varchar(40) NOT NULL,
  `ResourceID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_sessional_type`
--

DROP TABLE IF EXISTS `reg_course_sessional_type`;
CREATE TABLE IF NOT EXISTS `reg_course_sessional_type` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_sessional_type`
--

INSERT INTO `reg_course_sessional_type` (`ID`, `Name`) VALUES
('{126156BB-18ED-4CAB-8DB9-1C0F72BB63C1}', 'N/A'),
('{45B2147F-5FE0-4CC9-880C-C19EB6323955}', 'physics'),
('{4B342686-B38E-449C-AAD2-1F7DD77E6594}', 'chemistry'),
('{D1E54E03-CDEB-4155-AD0C-27C70A3A490C}', 'ece'),
('{D3F895D3-7389-487F-A604-0BD546DCC764}', 'software'),
('{F1D0443A-EC5D-41C4-94BA-D6F0D9AB1691}', 'hardware');

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_student_registration`
--

DROP TABLE IF EXISTS `reg_course_student_registration`;
CREATE TABLE IF NOT EXISTS `reg_course_student_registration` (
  `ID` varchar(40) NOT NULL,
  `Regs_TeacherID` varchar(40) DEFAULT NULL,
  `StudentID` varchar(40) NOT NULL,
  `CourseID` varchar(40) NOT NULL,
  `SessionID` varchar(40) DEFAULT NULL,
  `YearID` varchar(40) DEFAULT NULL,
  `TermID` varchar(40) DEFAULT NULL,
  `IsRetake` tinyint(1) DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_student_registration`
--

INSERT INTO `reg_course_student_registration` (`ID`, `Regs_TeacherID`, `StudentID`, `CourseID`, `SessionID`, `YearID`, `TermID`, `IsRetake`, `Status`) VALUES
('{31FDEF1E-F280-436A-AFD3-A48BA772D23D}', 'mkazi078@uottawa.ca', 'kashif@gmail.com', '{683A3D91-D124-44AF-82A3-FB43837A4392}', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', NULL, 'registered'),
('{3CA3ABF7-7FF8-4A32-B328-235861061B72}', NULL, 'zahid@gmail.com', '{683A3D91-D124-44AF-82A3-FB43837A4392}', NULL, NULL, NULL, NULL, 'pending'),
('{B7F17833-430E-489A-9CA6-E9BBE0EFA0FD}', 'mkazi078@uottawa.ca', 'kashif@gmail.com', '{53650FB7-D76E-459D-8B56-BC7A4919C0F6}', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', NULL, 'registered'),
('{B8B362F3-D164-4082-AA6C-08F3EC73E2A8}', 'mkazi078@uottawa.ca', 'aysha@gmail.com', '{53650FB7-D76E-459D-8B56-BC7A4919C0F6}', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', NULL, 'registered'),
('{C8AE75F9-1644-48C5-87D0-4AFEC777C122}', NULL, 'zahid@gmail.com', '{53650FB7-D76E-459D-8B56-BC7A4919C0F6}', NULL, NULL, NULL, NULL, 'pending'),
('{DBE4ED93-4A97-41CF-B8E3-5E42AEC0246F}', 'mkazi078@uottawa.ca', 'aysha@gmail.com', '{683A3D91-D124-44AF-82A3-FB43837A4392}', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', NULL, 'registered');

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_teacher`
--

DROP TABLE IF EXISTS `reg_course_teacher`;
CREATE TABLE IF NOT EXISTS `reg_course_teacher` (
  `ID` varchar(40) NOT NULL,
  `CourseID` varchar(40) NOT NULL,
  `TeacherID` varchar(40) NOT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  `NoOfTests` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_teacher`
--

INSERT INTO `reg_course_teacher` (`ID`, `CourseID`, `TeacherID`, `SessionID`, `YearID`, `TermID`, `NoOfTests`) VALUES
('{0BA78ECC-A6E7-4EA8-9BFA-6C599F88F76D}', '{53650FB7-D76E-459D-8B56-BC7A4919C0F6}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', 5),
('{C4490FFA-154B-45FE-9773-744B3E6FDFF7}', '{683A3D91-D124-44AF-82A3-FB43837A4392}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', 3);

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_teacher_registration`
--

DROP TABLE IF EXISTS `reg_course_teacher_registration`;
CREATE TABLE IF NOT EXISTS `reg_course_teacher_registration` (
  `ID` varchar(40) NOT NULL,
  `TeacherID` varchar(40) NOT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_teacher_registration`
--

INSERT INTO `reg_course_teacher_registration` (`ID`, `TeacherID`, `SessionID`, `YearID`, `TermID`) VALUES
('{4D389527-643B-4B05-80AB-E05A6EF8DE2A}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{EA335D18-A1A8-4D15-9C7B-4A4700AD4543}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}');

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_type`
--

DROP TABLE IF EXISTS `reg_course_type`;
CREATE TABLE IF NOT EXISTS `reg_course_type` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `SessionalTypeID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_type`
--

INSERT INTO `reg_course_type` (`ID`, `Name`, `SessionalTypeID`) VALUES
('{3DC4DDE5-514F-4BE4-8682-37EA32C3FDB7}', 'Theory', '{126156BB-18ED-4CAB-8DB9-1C0F72BB63C1}'),
('{5F886686-4EB1-48C8-A801-8D46233739D1}', 'Thesis', '{126156BB-18ED-4CAB-8DB9-1C0F72BB63C1}'),
('{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', 'Sessional', '{126156BB-18ED-4CAB-8DB9-1C0F72BB63C1}');

-- --------------------------------------------------------

--
-- Table structure for table `reg_registration_session`
--

DROP TABLE IF EXISTS `reg_registration_session`;
CREATE TABLE IF NOT EXISTS `reg_registration_session` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_registration_session`
--

INSERT INTO `reg_registration_session` (`ID`, `Name`) VALUES
('{65C2BA57-7231-497A-A5A7-90912259684C}', '2011-2012'),
('{05DA37EB-6C62-45E9-A0E3-7C5C6943F6AD}', '2012-2013'),
('{A36A7057-CDB5-4E10-9E61-CCC85C74460E}', '2013-2014'),
('{1399EEA3-B939-4155-B9F3-4DAD4928C4D5}', '2014-2015'),
('{DFF9E45F-6954-46A1-9088-D930EE460C3F}', '2015-2016'),
('{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '2016-2017');

-- --------------------------------------------------------

--
-- Table structure for table `reg_term`
--

DROP TABLE IF EXISTS `reg_term`;
CREATE TABLE IF NOT EXISTS `reg_term` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_term`
--

INSERT INTO `reg_term` (`ID`, `Name`) VALUES
('{6DE3CF58-3A1A-4D6A-88CF-83F22C27E0BA}', 'Special'),
('{AF8B217E-4E76-41B8-A02A-7115BD4A6BE6}', '2nd'),
('{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '1st');

-- --------------------------------------------------------

--
-- Table structure for table `reg_year`
--

DROP TABLE IF EXISTS `reg_year`;
CREATE TABLE IF NOT EXISTS `reg_year` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_year`
--

INSERT INTO `reg_year` (`ID`, `Name`) VALUES
('{1FAC0F1A-9D60-43F6-AB07-C933D5A4AA30}', 'Phd 1st'),
('{326B168F-58CC-42F3-B71A-DFE8DBBC05E8}', 'MSc 1st'),
('{6780C884-E112-4F58-9503-E2110B615547}', '4th'),
('{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '1st'),
('{A21965E4-4FE4-43AC-A77F-DABAC9B356F2}', '3rd'),
('{ADBEDD3E-D8EA-47AA-A068-C4C703DB4AE6}', 'MSc 2nd'),
('{B9D6CC05-7AD4-4666-80AB-80797A872743}', 'Phd 2nd'),
('{CBE08035-94CD-4610-B4E2-A0E844184056}', 'Phd 4th'),
('{E3823AA6-6BE5-4A07-93EA-FA59DE4F616F}', 'Phd 3rd'),
('{EA335D18-A1A8-4D15-9C7B-4A4700AD4543}', '2nd');

-- --------------------------------------------------------

--
-- Table structure for table `rms_course_marks_result`
--

DROP TABLE IF EXISTS `rms_course_marks_result`;
CREATE TABLE IF NOT EXISTS `rms_course_marks_result` (
  `ID` varchar(40) NOT NULL,
  `CourseNo` varchar(40) NOT NULL,
  `TeacherID` varchar(40) DEFAULT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  `StudentID` varchar(40) NOT NULL,
  `MarksID` varchar(40) NOT NULL,
  `MarksValue` varchar(200) NOT NULL,
  `Status` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_course_marks_result`
--

INSERT INTO `rms_course_marks_result` (`ID`, `CourseNo`, `TeacherID`, `SessionID`, `YearID`, `TermID`, `StudentID`, `MarksID`, `MarksValue`, `Status`) VALUES
('{44C3C858-AFC6-4592-B160-10B921BF381C}', 'cse-4111', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '020202', '{7E24DC07-CD2C-4360-A6E9-05A363C2EA08}', '10,25,25,25', '');

-- --------------------------------------------------------

--
-- Table structure for table `rms_course_marks_result_publish`
--

DROP TABLE IF EXISTS `rms_course_marks_result_publish`;
CREATE TABLE IF NOT EXISTS `rms_course_marks_result_publish` (
  `ID` varchar(40) NOT NULL,
  `CourseNo` varchar(40) NOT NULL,
  `TeacherID` varchar(40) DEFAULT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  `StudentID` varchar(40) NOT NULL,
  `HeaderID` varchar(200) NOT NULL,
  `HeaderName` varchar(200) NOT NULL,
  `HeaderMax` varchar(200) NOT NULL,
  `MarksValue` varchar(200) NOT NULL,
  `MarksTotal` varchar(20) NOT NULL,
  `Grades` varchar(200) NOT NULL,
  `GradeRanges` varchar(300) NOT NULL,
  `FinalGrade` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rms_course_marks_tests`
--

DROP TABLE IF EXISTS `rms_course_marks_tests`;
CREATE TABLE IF NOT EXISTS `rms_course_marks_tests` (
  `ID` varchar(40) NOT NULL,
  `CourseNo` varchar(40) NOT NULL,
  `TeacherID` varchar(40) NOT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  `StudentID` varchar(40) NOT NULL,
  `MarksValue` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_course_marks_tests`
--

INSERT INTO `rms_course_marks_tests` (`ID`, `CourseNo`, `TeacherID`, `SessionID`, `YearID`, `TermID`, `StudentID`, `MarksValue`) VALUES
('{222F2596-5F55-442C-80EA-F5AE7F466C70}', 'cse-4111', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '020202', '17,25,0'),
('{71D63076-9096-4CAA-8D6D-782A25B076A7}', 'cse-4111', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '020208', '25,20,0'),
('{B6BB339D-E40B-4CC4-8D34-07017EE2BE44}', 'cse-4112', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '020208', '10,30,30,0,0'),
('{DBF1823F-0DF9-4E8F-9233-5AB1545BC1B7}', 'cse-4112', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '020202', '20,20,20,0,0');

-- --------------------------------------------------------

--
-- Table structure for table `rms_grade_setup`
--

DROP TABLE IF EXISTS `rms_grade_setup`;
CREATE TABLE IF NOT EXISTS `rms_grade_setup` (
  `ID` varchar(40) NOT NULL,
  `Grades` varchar(200) NOT NULL,
  `Ranges` varchar(300) NOT NULL,
  `IsDefault` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_grade_setup`
--

INSERT INTO `rms_grade_setup` (`ID`, `Grades`, `Ranges`, `IsDefault`) VALUES
('{FC3DBA75-AF9C-4533-825E-D8A01D076F60}', 'F,E,D,C,C+,B,B+,A-,A,A+', '0-39,40-44,45-49,50-54,55-59,60-64,65-69,70-74,75-79,80-100', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rms_marks_setup`
--

DROP TABLE IF EXISTS `rms_marks_setup`;
CREATE TABLE IF NOT EXISTS `rms_marks_setup` (
  `ID` varchar(40) NOT NULL,
  `CourseTypeID` varchar(40) NOT NULL,
  `HeaderID` varchar(200) NOT NULL,
  `HeaderName` varchar(200) NOT NULL,
  `HeaderMax` varchar(200) NOT NULL,
  `IsDefault` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_marks_setup`
--

INSERT INTO `rms_marks_setup` (`ID`, `CourseTypeID`, `HeaderID`, `HeaderName`, `HeaderMax`, `IsDefault`) VALUES
('{236BBFE8-E4CF-4EEF-9C54-AD83FEF42ADB}', '{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', 'att,assess,viva', 'Attendance,Assessment,Viva', '10,60,30', 1),
('{7E24DC07-CD2C-4360-A6E9-05A363C2EA08}', '{3DC4DDE5-514F-4BE4-8682-37EA32C3FDB7}', 'att,assess,seca,secb', 'Attendance,Assessment,Section A,Section B', '10,30,30,30,30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tms_link_thesis`
--

DROP TABLE IF EXISTS `tms_link_thesis`;
CREATE TABLE IF NOT EXISTS `tms_link_thesis` (
  `id` varchar(40) NOT NULL,
  `link` text NOT NULL,
  `thesis_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `thesis_id` (`thesis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_link_thesis`
--

INSERT INTO `tms_link_thesis` (`id`, `link`, `thesis_id`) VALUES
('{992CDFDF-98CE-45C4-B5B6-4EFD77EB530A}', 'https://stackoverflow.com/questions/34500423/remove-top-padding-on-bootstrap-navbar', '{A905A916-1B2C-4F31-BBC2-094E4B199569}'),
('{C811FFEC-3F7F-4C8A-AE5D-4030E85AA25F}', 'https://stackoverflow.com/questions/34500423/remove-top-padding-on-bootstrap-navbar', '{77590E83-76A0-4725-A4C0-48B4DFC34D4D}'),
('{E0103054-7585-4A1E-896C-F035AB4FBCB0}', 'https://stackoverflow.com/questions/26727581/how-to-remove-default-padding-from-bootstrap-nav-bar', '{77590E83-76A0-4725-A4C0-48B4DFC34D4D}');

-- --------------------------------------------------------

--
-- Table structure for table `tms_student_thesis`
--

DROP TABLE IF EXISTS `tms_student_thesis`;
CREATE TABLE IF NOT EXISTS `tms_student_thesis` (
  `id` varchar(40) NOT NULL,
  `student_id` varchar(40) NOT NULL,
  `thesis_id` varchar(40) NOT NULL,
  `contribution` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `thesis_id` (`thesis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_student_thesis`
--

INSERT INTO `tms_student_thesis` (`id`, `student_id`, `thesis_id`, `contribution`) VALUES
('{046A0615-5600-4AD9-BB83-4C452A94074D}', 'imran@gmail.com', '{A54D497B-C365-43F7-855D-233AC4FE4B9C}', 25),
('{3F64CF68-E345-45B0-A13D-6C7A2A7B4AC4}', 'imran@gmail.com', '{A905A916-1B2C-4F31-BBC2-094E4B199569}', 34),
('{4362D91E-5A5C-4BE0-A96D-A0D5733B2462}', 'alamin@gmail.com', '{326303FD-7149-4F45-95CB-858B96C81508}', 0),
('{5A72C6F2-2B66-457A-81BA-91992305D4B1}', 'imran@gmail.com', '{77590E83-76A0-4725-A4C0-48B4DFC34D4D}', 34),
('{5BE6D7B7-0D11-49FD-B5CF-88F38A0F3F92}', 'ratul@gamil.com', '{6FBA3E23-0106-443A-A703-C29AC3F7FDDE}', 0),
('{6EE98A15-9690-4858-AF9B-D52160B1632F}', 'swajon@gmail.com', '{7CB1DE81-EF72-4BDA-98C5-D281D2FAAA23}', 0),
('{BD303286-9BBE-4F84-B961-D16297CD900C}', 'shahidul@gmail.com', '{A54D497B-C365-43F7-855D-233AC4FE4B9C}', 75),
('{C2D55D2B-3959-485E-8989-A6137AB17D9B}', 'sayed@gmail.com', '{7CB1DE81-EF72-4BDA-98C5-D281D2FAAA23}', 0),
('{C3D560A4-FDE3-4D4C-AB08-A36C0214D479}', 'shahidul@gmail.com', '{647F6FA4-CB2E-42BA-951C-B8A2F3F4D7FD}', 0),
('{E4905276-59E2-41B0-90E9-7D0894276E17}', 'zubayer@gmail.com', '{647F6FA4-CB2E-42BA-951C-B8A2F3F4D7FD}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tms_supervisor_thesis`
--

DROP TABLE IF EXISTS `tms_supervisor_thesis`;
CREATE TABLE IF NOT EXISTS `tms_supervisor_thesis` (
  `id` varchar(40) NOT NULL,
  `supervisor_id` varchar(40) NOT NULL,
  `thesis_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `supervisor_id` (`supervisor_id`),
  KEY `thesis_id` (`thesis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_supervisor_thesis`
--

INSERT INTO `tms_supervisor_thesis` (`id`, `supervisor_id`, `thesis_id`) VALUES
('{0402A89D-09B7-4FBB-AFE7-0279F713335A}', 'dean@gmail.com', '{7CB1DE81-EF72-4BDA-98C5-D281D2FAAA23}'),
('{11A059D4-A5D5-47CD-AD54-234DF28F6953}', 'teacher@gmail.com', '{6FBA3E23-0106-443A-A703-C29AC3F7FDDE}'),
('{1A164A80-37FC-48E9-ABED-EDE2A7C1AF4D}', 'teacher@gmail.com', '{647F6FA4-CB2E-42BA-951C-B8A2F3F4D7FD}'),
('{1FB59F5F-00C9-45A2-8B68-44048033ABA2}', 'teacher@gmail.com', '{326303FD-7149-4F45-95CB-858B96C81508}'),
('{22070EEE-C342-40CF-A82C-83D4DD39642F}', 'teacher@gmail.com', '{7CB1DE81-EF72-4BDA-98C5-D281D2FAAA23}'),
('{39992637-55E3-4C2F-B186-7BC34BC242A5}', 'teacher@gmail.com', '{77590E83-76A0-4725-A4C0-48B4DFC34D4D}'),
('{3ABC21EF-FD90-4E02-A893-A5497FBD321C}', 'teacher@gmail.com', '{A54D497B-C365-43F7-855D-233AC4FE4B9C}'),
('{A9336057-E97E-48A4-8573-888A8EA6BBA9}', 'teacher@gmail.com', '{A905A916-1B2C-4F31-BBC2-094E4B199569}');

-- --------------------------------------------------------

--
-- Table structure for table `tms_thesis`
--

DROP TABLE IF EXISTS `tms_thesis`;
CREATE TABLE IF NOT EXISTS `tms_thesis` (
  `id` varchar(40) NOT NULL,
  `thumbnail` text NOT NULL,
  `title` varchar(256) NOT NULL,
  `pdf_link` text,
  `description` text NOT NULL,
  `year_id` varchar(40) NOT NULL,
  `term_id` varchar(40) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  `discipline_id` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `year_id` (`year_id`),
  KEY `term_id` (`term_id`),
  KEY `course_id` (`course_id`),
  KEY `discipline_id` (`discipline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_thesis`
--

INSERT INTO `tms_thesis` (`id`, `thumbnail`, `title`, `pdf_link`, `description`, `year_id`, `term_id`, `course_id`, `discipline_id`, `created_at`, `updated_at`) VALUES
('{326303FD-7149-4F45-95CB-858B96C81508}', './resources/img/thumbnails/Study of bank customers and employee in 4 local bank of malaysia.ico', 'Study of bank customers and employee in 4 local bank of malaysia', './resources/pdf/report/Study of bank customers and employee in 4 local bank of malaysia.pdf', 'Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-25 04:11:29', '2017-10-12 06:57:38'),
('{647F6FA4-CB2E-42BA-951C-B8A2F3F4D7FD}', './resources/img/thumbnails/Analytical study of premium CREDIT card.ico', 'Analytical study of premium CREDIT card', './resources/pdf/report/Analytical study of premium CREDIT card.pdf', 'Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-25 04:17:41', '2017-10-05 04:34:52'),
('{6FBA3E23-0106-443A-A703-C29AC3F7FDDE}', './resources/img/thumbnails/Analysis on equity share price behaviour.png', 'Analysis on equity share price behaviour', './resources/pdf/report/Analysis on equity share price behaviour.pdf', 'Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-25 04:15:53', '2017-10-05 04:32:32'),
('{77590E83-76A0-4725-A4C0-48B4DFC34D4D}', './resources/img/thumbnails/Evolution of mgt technique.png', 'Evolution of mgt technique', './resources/pdf/report/Evolution of mgt technique.pdf', 'Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-25 04:30:28', '2017-10-05 04:34:15'),
('{7CA833C5-AD32-432E-BA00-4D8562CE37E8}', './resources/img/thumbnails/hall management.png', 'hall management', './resources/pdf/report/hall management.pdf', 'huadhfud', '3', '{19B15CDF-264C-4924-8608-258673BCC448}', '6', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-11-04 05:20:36', '2017-11-04 05:20:36'),
('{7CB1DE81-EF72-4BDA-98C5-D281D2FAAA23}', './resources/img/thumbnails/Exchange traded fund.png', 'Exchange traded fund', './resources/pdf/report/Exchange traded fund.pdf', 'Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-25 04:32:57', '2017-10-05 04:32:47'),
('{A54D497B-C365-43F7-855D-233AC4FE4B9C}', './resources/img/thumbnails/Study on effectiveness of training programme.png', 'Study on effectiveness of training programme', './resources/pdf/report/Study on effectiveness of training programme.pdf', 'Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-25 04:15:03', '2017-10-13 05:33:50'),
('{A905A916-1B2C-4F31-BBC2-094E4B199569}', './resources/img/thumbnails/Study on customer perception towards UTI mutual fund.png', 'Study on customer perception towards UTI mutual fund', '', 'Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-25 04:14:00', '2017-10-13 05:33:58'),
('{D02FDF5E-0705-4563-BC62-13E13997D0AE}', './resources/img/thumbnails/Analysis of the trade finance pattern.ico', 'Analysis of the trade finance pattern', './resources/pdf/report/Analysis of the trade finance pattern.pdf', 'Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-25 04:16:48', '2017-10-05 04:34:30'),
('{DA4F1E3B-CCBA-4801-8CB9-47E5467D5035}', './resources/img/thumbnails/Health & welfare measures in WOVEN TEXTILE COMPANY.png', 'Health & welfare measures in WOVEN TEXTILE COMPANY', './resources/pdf/report/Health & welfare measures in WOVEN TEXTILE COMPANY.pdf', 'Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-25 04:31:57', '2017-10-13 05:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `ums_discipline`
--

DROP TABLE IF EXISTS `ums_discipline`;
CREATE TABLE IF NOT EXISTS `ums_discipline` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ShortCode` varchar(20) DEFAULT NULL,
  `SchoolID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_discipline`
--

INSERT INTO `ums_discipline` (`ID`, `Name`, `ShortCode`, `SchoolID`) VALUES
('{0CF37516-06FE-41CD-93AD-D2D1652509D6}', 'Mathematics', 'MATH', '{39DDC0C2-CFC2-4246-8748-8812B1751A5C}'),
('{560A0FC0-6221-497D-8D41-E584EE4BBEE3}', 'Architecture', 'ARCH', '{39DDC0C2-CFC2-4246-8748-8812B1751A5C}'),
('{63F3C00B-6168-4FBD-AB01-7A1FE413BDDE}', 'Forestry and Wood Technology', 'FWT', '{4D46079B-AFA3-40F1-B8D1-6CC9E9F56812}'),
('{AF41CC9F-3BCD-4952-9D02-17184CC40C79}', 'Urban and Rural Planning', 'URP', '{4D46079B-AFA3-40F1-B8D1-6CC9E9F56812}'),
('{E065BBA7-D0C5-4DFA-9768-81B6F056EB4A}', 'Foresty and Marine Resource Technology', 'FMRT', '{4D46079B-AFA3-40F1-B8D1-6CC9E9F56812}'),
('{E7280448-E379-424E-A11D-357F4334AC8D}', 'Physics', 'PHY', '{39DDC0C2-CFC2-4246-8748-8812B1751A5C}'),
('{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'Computer Science and Engineering', 'CSE', '{39DDC0C2-CFC2-4246-8748-8812B1751A5C}');

-- --------------------------------------------------------

--
-- Table structure for table `ums_permission`
--

DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE IF NOT EXISTS `ums_permission` (
  `TableID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Category` varchar(100) NOT NULL,
  PRIMARY KEY (`TableID`)
) ENGINE=InnoDB AUTO_INCREMENT=2817 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_permission`
--

INSERT INTO `ums_permission` (`TableID`, `ID`, `Name`, `Category`) VALUES
(2681, 'COURSE_C', 'COURSE_C', 'COURSE'),
(2682, 'COURSE_R', 'COURSE_R', 'COURSE'),
(2683, 'COURSE_U', 'COURSE_U', 'COURSE'),
(2684, 'COURSE_D', 'COURSE_D', 'COURSE'),
(2685, 'COURSE_TYPE_C', 'COURSE_TYPE_C', 'COURSE TYPE'),
(2686, 'COURSE_TYPE_R', 'COURSE_TYPE_R', 'COURSE TYPE'),
(2687, 'COURSE_TYPE_U', 'COURSE_TYPE_U', 'COURSE TYPE'),
(2688, 'COURSE_TYPE_D', 'COURSE_TYPE_D', 'COURSE TYPE'),
(2689, 'COURSE_SESSIONAL_TYPE_C', 'COURSE_SESSIONAL_TYPE_C', 'COURSE SESSIONAL TYPE'),
(2690, 'COURSE_SESSIONAL_TYPE_R', 'COURSE_SESSIONAL_TYPE_R', 'COURSE SESSIONAL TYPE'),
(2691, 'COURSE_SESSIONAL_TYPE_U', 'COURSE_SESSIONAL_TYPE_U', 'COURSE SESSIONAL TYPE'),
(2692, 'COURSE_SESSIONAL_TYPE_D', 'COURSE_SESSIONAL_TYPE_D', 'COURSE SESSIONAL TYPE'),
(2693, 'CLUB_C', 'CLUB_C', 'CLUB'),
(2694, 'CLUB_R', 'CLUB_R', 'CLUB'),
(2695, 'CLUB_U', 'CLUB_U', 'CLUB'),
(2696, 'CLUB_D', 'CLUB_D', 'CLUB'),
(2697, 'DISCUSSION_C', 'DISCUSSION_C', 'DISCUSSION'),
(2698, 'DISCUSSION_R', 'DISCUSSION_R', 'DISCUSSION'),
(2699, 'DISCUSSION_U', 'DISCUSSION_U', 'DISCUSSION'),
(2700, 'DISCUSSION_D', 'DISCUSSION_D', 'DISCUSSION'),
(2701, 'DISCUSSION_CAT_C', 'DISCUSSION_CAT_C', 'DISCUSSION CATEGORY'),
(2702, 'DISCUSSION_CAT_R', 'DISCUSSION_CAT_R', 'DISCUSSION CATEGORY'),
(2703, 'DISCUSSION_CAT_U', 'DISCUSSION_CAT_U', 'DISCUSSION CATEGORY'),
(2704, 'DISCUSSION_CAT_D', 'DISCUSSION_CAT_D', 'DISCUSSION CATEGORY'),
(2705, 'DISCUSSION_COMMENT_C', 'DISCUSSION_COMMENT_C', 'DISCUSSION COMMENT'),
(2706, 'DISCUSSION_COMMENT_R', 'DISCUSSION_COMMENT_R', 'DISCUSSION COMMENT'),
(2707, 'DISCUSSION_COMMENT_U', 'DISCUSSION_COMMENT_U', 'DISCUSSION COMMENT'),
(2708, 'DISCUSSION_COMMENT_D', 'DISCUSSION_COMMENT_D', 'DISCUSSION COMMENT'),
(2709, 'DISCIPLINE_C', 'DISCIPLINE_C', 'DISCIPLINE'),
(2710, 'DISCIPLINE_R', 'DISCIPLINE_R', 'DISCIPLINE'),
(2711, 'DISCIPLINE_U', 'DISCIPLINE_U', 'DISCIPLINE'),
(2712, 'DISCIPLINE_D', 'DISCIPLINE_D', 'DISCIPLINE'),
(2713, 'FILE_C', 'FILE_C', 'FILE'),
(2714, 'FILE_R', 'FILE_R', 'FILE'),
(2715, 'FILE_U', 'FILE_U', 'FILE'),
(2716, 'FILE_D', 'FILE_D', 'FILE'),
(2717, 'PERMISSION_C', 'PERMISSION_C', 'PERMISSION'),
(2718, 'PERMISSION_R', 'PERMISSION_R', 'PERMISSION'),
(2719, 'PERMISSION_U', 'PERMISSION_U', 'PERMISSION'),
(2720, 'PERMISSION_D', 'PERMISSION_D', 'PERMISSION'),
(2721, 'POSITION_C', 'POSITION_C', 'POSITION'),
(2722, 'POSITION_R', 'POSITION_R', 'POSITION'),
(2723, 'POSITION_U', 'POSITION_U', 'POSITION'),
(2724, 'POSITION_D', 'POSITION_D', 'POSITION'),
(2725, 'PROJECT_C', 'PROJECT_C', 'PROJECT'),
(2726, 'PROJECT_R', 'PROJECT_R', 'PROJECT'),
(2727, 'PROJECT_U', 'PROJECT_U', 'PROJECT'),
(2728, 'PROJECT_D', 'PROJECT_D', 'PROJECT'),
(2729, 'QUESTION_C', 'QUESTION_C', 'QUESTION'),
(2730, 'QUESTION_R', 'QUESTION_R', 'QUESTION'),
(2731, 'QUESTION_U', 'QUESTION_U', 'QUESTION'),
(2732, 'QUESTION_D', 'QUESTION_D', 'QUESTION'),
(2733, 'REGISTRATION_C', 'REGISTRATION_C', 'REGISTRATION'),
(2734, 'REGISTRATION_R', 'REGISTRATION_R', 'REGISTRATION'),
(2735, 'REGISTRATION_U', 'REGISTRATION_U', 'REGISTRATION'),
(2736, 'REGISTRATION_D', 'REGISTRATION_D', 'REGISTRATION'),
(2737, 'RESULT_C', 'RESULT_C', 'RESULT'),
(2738, 'RESULT_R', 'RESULT_R', 'RESULT'),
(2739, 'RESULT_U', 'RESULT_U', 'RESULT'),
(2740, 'RESULT_D', 'RESULT_D', 'RESULT'),
(2741, 'ATTENDANCE_C', 'ATTENDANCE_C', 'ATTENDANCE'),
(2742, 'ATTENDANCE_R', 'ATTENDANCE_R', 'ATTENDANCE'),
(2743, 'ATTENDANCE_U', 'ATTENDANCE_U', 'ATTENDANCE'),
(2744, 'ATTENDANCE_D', 'ATTENDANCE_D', 'ATTENDANCE'),
(2745, 'MARKS_SETUP_C', 'MARKS_SETUP_C', 'MARKS_SETUP'),
(2746, 'MARKS_SETUP_R', 'MARKS_SETUP_R', 'MARKS_SETUP'),
(2747, 'MARKS_SETUP_U', 'MARKS_SETUP_U', 'MARKS_SETUP'),
(2748, 'MARKS_SETUP_D', 'MARKS_SETUP_D', 'MARKS_SETUP'),
(2749, 'GRADE_SETUP_C', 'GRADE_SETUP_C', 'GRADE_SETUP'),
(2750, 'GRADE_SETUP_R', 'GRADE_SETUP_R', 'GRADE_SETUP'),
(2751, 'GRADE_SETUP_U', 'GRADE_SETUP_U', 'GRADE_SETUP'),
(2752, 'GRADE_SETUP_D', 'GRADE_SETUP_D', 'GRADE_SETUP'),
(2753, 'ROLE_C', 'ROLE_C', 'ROLE'),
(2754, 'ROLE_R', 'ROLE_R', 'ROLE'),
(2755, 'ROLE_U', 'ROLE_U', 'ROLE'),
(2756, 'ROLE_D', 'ROLE_D', 'ROLE'),
(2757, 'SCHOOL_C', 'SCHOOL_C', 'SCHOOL'),
(2758, 'SCHOOL_R', 'SCHOOL_R', 'SCHOOL'),
(2759, 'SCHOOL_U', 'SCHOOL_U', 'SCHOOL'),
(2760, 'SCHOOL_D', 'SCHOOL_D', 'SCHOOL'),
(2761, 'SESSION_C', 'SESSION_C', 'SESSION'),
(2762, 'SESSION_R', 'SESSION_R', 'SESSION'),
(2763, 'SESSION_U', 'SESSION_U', 'SESSION'),
(2764, 'SESSION_D', 'SESSION_D', 'SESSION'),
(2765, 'SURVEY_C', 'SURVEY_C', 'SURVEY'),
(2766, 'SURVEY_R', 'SURVEY_R', 'SURVEY'),
(2767, 'SURVEY_U', 'SURVEY_U', 'SURVEY'),
(2768, 'SURVEY_D', 'SURVEY_D', 'SURVEY'),
(2769, 'SURVEY_QUESTION_C', 'SURVEY_QUESTION_C', 'SURVEY QUESTION'),
(2770, 'SURVEY_QUESTION_R', 'SURVEY_QUESTION_R', 'SURVEY QUESTION'),
(2771, 'SURVEY_QUESTION_U', 'SURVEY_QUESTION_U', 'SURVEY QUESTION'),
(2772, 'SURVEY_QUESTION_D', 'SURVEY_QUESTION_D', 'SURVEY QUESTION'),
(2773, 'SURVEY_QUESTION_TYPE_C', 'SURVEY_QUESTION_TYPE_C', 'SURVEY QUESTION TYPE'),
(2774, 'SURVEY_QUESTION_TYPE_R', 'SURVEY_QUESTION_TYPE_R', 'SURVEY QUESTION TYPE'),
(2775, 'SURVEY_QUESTION_TYPE_U', 'SURVEY_QUESTION_TYPE_U', 'SURVEY QUESTION TYPE'),
(2776, 'SURVEY_QUESTION_TYPE_D', 'SURVEY_QUESTION_TYPE_D', 'SURVEY QUESTION TYPE'),
(2777, 'SURVEY_QUESTION_FILLUP_C', 'SURVEY_QUESTION_FILLUP_C', 'SURVEY QUESTION FILLUP'),
(2778, 'SURVEY_QUESTION_FILLUP_R', 'SURVEY_QUESTION_FILLUP_R', 'SURVEY QUESTION FILLUP'),
(2779, 'SURVEY_QUESTION_FILLUP_U', 'SURVEY_QUESTION_FILLUP_U', 'SURVEY QUESTION FILLUP'),
(2780, 'SURVEY_QUESTION_FILLUP_D', 'SURVEY_QUESTION_FILLUP_D', 'SURVEY QUESTION FILLUP'),
(2781, 'TERM_C', 'TERM_C', 'TERM'),
(2782, 'TERM_R', 'TERM_R', 'TERM'),
(2783, 'TERM_U', 'TERM_U', 'TERM'),
(2784, 'TERM_D', 'TERM_D', 'TERM'),
(2785, 'USER_C', 'USER_C', 'USER'),
(2786, 'USER_R', 'USER_R', 'USER'),
(2787, 'USER_U', 'USER_U', 'USER'),
(2788, 'USER_D', 'USER_D', 'USER'),
(2789, 'YEAR_C', 'YEAR_C', 'YEAR'),
(2790, 'YEAR_R', 'YEAR_R', 'YEAR'),
(2791, 'YEAR_U', 'YEAR_U', 'YEAR'),
(2792, 'YEAR_D', 'YEAR_D', 'YEAR'),
(2793, 'VIDEO_C', 'VIDEO_C', 'VIDEO'),
(2794, 'VIDEO_R', 'VIDEO_R', 'VIDEO'),
(2795, 'VIDEO_U', 'VIDEO_U', 'VIDEO'),
(2796, 'VIDEO_D', 'VIDEO_D', 'VIDEO'),
(2797, 'VIDEO_COMMENT_C', 'VIDEO_COMMENT_C', 'VIDEO COMMENT'),
(2798, 'VIDEO_COMMENT_R', 'VIDEO_COMMENT_R', 'VIDEO COMMENT'),
(2799, 'VIDEO_COMMENT_U', 'VIDEO_COMMENT_U', 'VIDEO COMMENT'),
(2800, 'VIDEO_COMMENT_D', 'VIDEO_COMMENT_D', 'VIDEO COMMENT'),
(2801, 'JOB_C', 'JOB_C', 'JOB'),
(2802, 'JOB_R', 'JOB_R', 'JOB'),
(2803, 'JOB_U', 'JOB_U', 'JOB'),
(2804, 'JOB_D', 'JOB_D', 'JOB'),
(2805, 'ASSET_C', 'ASSET_C', 'ASSET'),
(2806, 'ASSET_R', 'ASSET_R', 'ASSET'),
(2807, 'ASSET_U', 'ASSET_U', 'ASSET'),
(2808, 'ASSET_D', 'ASSET_D', 'ASSET'),
(2809, 'THESIS_C', 'THESIS_C', 'THESIS'),
(2810, 'THESIS_R', 'THESIS_R', 'THESIS'),
(2811, 'THESIS_U', 'THESIS_U', 'THESIS'),
(2812, 'THESIS_D', 'THESIS_D', 'THESIS'),
(2813, 'EMAIL_C', 'EMAIL_C', 'EMAIL'),
(2814, 'EMAIL_R', 'EMAIL_R', 'EMAIL'),
(2815, 'EMAIL_U', 'EMAIL_U', 'EMAIL'),
(2816, 'EMAIL_D', 'EMAIL_D', 'EMAIL');

-- --------------------------------------------------------

--
-- Table structure for table `ums_position`
--

DROP TABLE IF EXISTS `ums_position`;
CREATE TABLE IF NOT EXISTS `ums_position` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_position`
--

INSERT INTO `ums_position` (`ID`, `Name`) VALUES
('{1BFE76DB-C2AA-4FAA-A23B-F43E6150A2F6}', 'Section Officer'),
('{2E024DF5-BD45-4EF2-A5E3-43BCA3E9777F}', 'Pro-vice Chancellor'),
('{64D25DDA-16B6-47B8-BBFC-4E2AAF5680C7}', 'Assistant Professor'),
('{7CDA1F32-A2F8-4469-B5A8-C2038FCE1F9A}', 'Lecturer'),
('{818DE12F-60CC-42E4-BAEC-48EAAED65179}', 'Dean of School'),
('{928EE9FF-E02D-470F-9A6A-AD0EB38B848F}', 'Vice Chancellor'),
('{92FDDA3F-1E91-4AA3-918F-EB595F85790C}', 'Daywise Worker'),
('{932CB0EE-76C2-448E-A40E-2D167EECC479}', 'Registrar'),
('{ADA027D3-21C1-47AF-A21D-759CAFCFE58D}', 'Assistant Registrar'),
('{B76EB035-EA26-4CEB-B029-1C6129574D98}', 'Librarian'),
('{B78C7A7B-4D38-4025-8170-7B8C9F291946}', 'Head of Discipline'),
('{C27B6BCF-FB83-4F3D-85CA-B7870D8B12D0}', 'Associate Professor'),
('{EB4880E2-01B3-4C6E-A2C9-89B6E5427C0A}', 'Professor');

-- --------------------------------------------------------

--
-- Table structure for table `ums_role`
--

DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE IF NOT EXISTS `ums_role` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_role`
--

INSERT INTO `ums_role` (`ID`, `Name`) VALUES
('administrator', 'Administrator'),
('registration coordinator', 'Registration Coordinator'),
('student', 'Student'),
('stuff', 'Stuff'),
('tabulator', 'Tabulator'),
('teacher', 'Teacher');

-- --------------------------------------------------------

--
-- Table structure for table `ums_role_permission`
--

DROP TABLE IF EXISTS `ums_role_permission`;
CREATE TABLE IF NOT EXISTS `ums_role_permission` (
  `Row` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` varchar(40) NOT NULL,
  `PermissionID` varchar(100) NOT NULL,
  PRIMARY KEY (`Row`)
) ENGINE=InnoDB AUTO_INCREMENT=3676 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_role_permission`
--

INSERT INTO `ums_role_permission` (`Row`, `RoleID`, `PermissionID`) VALUES
(1453, 'teacher', 'COURSE_C'),
(1454, 'teacher', 'COURSE_D'),
(1455, 'teacher', 'COURSE_R'),
(1456, 'teacher', 'COURSE_U'),
(1457, 'teacher', 'DISCUSSION_C'),
(1458, 'teacher', 'DISCUSSION_D'),
(1459, 'teacher', 'DISCUSSION_R'),
(1460, 'teacher', 'DISCUSSION_U'),
(1461, 'teacher', 'DISCUSSION_CAT_C'),
(1462, 'teacher', 'DISCUSSION_CAT_D'),
(1463, 'teacher', 'DISCUSSION_CAT_R'),
(1464, 'teacher', 'DISCUSSION_CAT_U'),
(1465, 'teacher', 'DISCUSSION_COMMENT_C'),
(1466, 'teacher', 'DISCUSSION_COMMENT_D'),
(1467, 'teacher', 'DISCUSSION_COMMENT_R'),
(1468, 'teacher', 'DISCUSSION_COMMENT_U'),
(1469, 'teacher', 'FILE_C'),
(1470, 'teacher', 'FILE_D'),
(1471, 'teacher', 'FILE_R'),
(1472, 'teacher', 'FILE_U'),
(1473, 'teacher', 'PROJECT_C'),
(1474, 'teacher', 'PROJECT_D'),
(1475, 'teacher', 'PROJECT_R'),
(1476, 'teacher', 'PROJECT_U'),
(1477, 'teacher', 'QUESTION_C'),
(1478, 'teacher', 'QUESTION_D'),
(1479, 'teacher', 'QUESTION_R'),
(1480, 'teacher', 'QUESTION_U'),
(1481, 'teacher', 'REGISTRATION_C'),
(1482, 'teacher', 'REGISTRATION_D'),
(1483, 'teacher', 'REGISTRATION_R'),
(1484, 'teacher', 'REGISTRATION_U'),
(1485, 'teacher', 'RESULT_C'),
(1486, 'teacher', 'RESULT_D'),
(1487, 'teacher', 'RESULT_R'),
(1488, 'teacher', 'RESULT_U'),
(3514, 'administrator', 'ASSET_C'),
(3515, 'administrator', 'ASSET_R'),
(3516, 'administrator', 'ASSET_U'),
(3517, 'administrator', 'ASSET_D'),
(3518, 'administrator', 'ATTENDANCE_C'),
(3519, 'administrator', 'ATTENDANCE_R'),
(3520, 'administrator', 'ATTENDANCE_U'),
(3521, 'administrator', 'ATTENDANCE_D'),
(3522, 'administrator', 'CLUB_C'),
(3523, 'administrator', 'CLUB_R'),
(3524, 'administrator', 'CLUB_U'),
(3525, 'administrator', 'CLUB_D'),
(3526, 'administrator', 'COURSE_C'),
(3527, 'administrator', 'COURSE_R'),
(3528, 'administrator', 'COURSE_U'),
(3529, 'administrator', 'COURSE_D'),
(3530, 'administrator', 'COURSE_SESSIONAL_TYPE_C'),
(3531, 'administrator', 'COURSE_SESSIONAL_TYPE_R'),
(3532, 'administrator', 'COURSE_SESSIONAL_TYPE_U'),
(3533, 'administrator', 'COURSE_SESSIONAL_TYPE_D'),
(3534, 'administrator', 'COURSE_TYPE_C'),
(3535, 'administrator', 'COURSE_TYPE_R'),
(3536, 'administrator', 'COURSE_TYPE_U'),
(3537, 'administrator', 'COURSE_TYPE_D'),
(3538, 'administrator', 'DISCIPLINE_C'),
(3539, 'administrator', 'DISCIPLINE_R'),
(3540, 'administrator', 'DISCIPLINE_U'),
(3541, 'administrator', 'DISCIPLINE_D'),
(3542, 'administrator', 'DISCUSSION_C'),
(3543, 'administrator', 'DISCUSSION_R'),
(3544, 'administrator', 'DISCUSSION_U'),
(3545, 'administrator', 'DISCUSSION_D'),
(3546, 'administrator', 'DISCUSSION_CAT_C'),
(3547, 'administrator', 'DISCUSSION_CAT_R'),
(3548, 'administrator', 'DISCUSSION_CAT_U'),
(3549, 'administrator', 'DISCUSSION_CAT_D'),
(3550, 'administrator', 'DISCUSSION_COMMENT_C'),
(3551, 'administrator', 'DISCUSSION_COMMENT_R'),
(3552, 'administrator', 'DISCUSSION_COMMENT_U'),
(3553, 'administrator', 'DISCUSSION_COMMENT_D'),
(3554, 'administrator', 'EMAIL_C'),
(3555, 'administrator', 'EMAIL_R'),
(3556, 'administrator', 'EMAIL_U'),
(3557, 'administrator', 'EMAIL_D'),
(3558, 'administrator', 'FILE_C'),
(3559, 'administrator', 'FILE_R'),
(3560, 'administrator', 'FILE_U'),
(3561, 'administrator', 'FILE_D'),
(3562, 'administrator', 'GRADE_SETUP_C'),
(3563, 'administrator', 'GRADE_SETUP_R'),
(3564, 'administrator', 'GRADE_SETUP_U'),
(3565, 'administrator', 'GRADE_SETUP_D'),
(3566, 'administrator', 'JOB_C'),
(3567, 'administrator', 'JOB_R'),
(3568, 'administrator', 'JOB_U'),
(3569, 'administrator', 'JOB_D'),
(3570, 'administrator', 'MARKS_SETUP_C'),
(3571, 'administrator', 'MARKS_SETUP_R'),
(3572, 'administrator', 'MARKS_SETUP_U'),
(3573, 'administrator', 'MARKS_SETUP_D'),
(3574, 'administrator', 'PERMISSION_C'),
(3575, 'administrator', 'PERMISSION_R'),
(3576, 'administrator', 'PERMISSION_U'),
(3577, 'administrator', 'PERMISSION_D'),
(3578, 'administrator', 'POSITION_C'),
(3579, 'administrator', 'POSITION_R'),
(3580, 'administrator', 'POSITION_U'),
(3581, 'administrator', 'POSITION_D'),
(3582, 'administrator', 'PROJECT_C'),
(3583, 'administrator', 'PROJECT_R'),
(3584, 'administrator', 'PROJECT_U'),
(3585, 'administrator', 'PROJECT_D'),
(3586, 'administrator', 'QUESTION_C'),
(3587, 'administrator', 'QUESTION_R'),
(3588, 'administrator', 'QUESTION_U'),
(3589, 'administrator', 'QUESTION_D'),
(3590, 'administrator', 'REGISTRATION_C'),
(3591, 'administrator', 'REGISTRATION_R'),
(3592, 'administrator', 'REGISTRATION_U'),
(3593, 'administrator', 'REGISTRATION_D'),
(3594, 'administrator', 'RESULT_C'),
(3595, 'administrator', 'RESULT_R'),
(3596, 'administrator', 'RESULT_U'),
(3597, 'administrator', 'RESULT_D'),
(3598, 'administrator', 'ROLE_C'),
(3599, 'administrator', 'ROLE_R'),
(3600, 'administrator', 'ROLE_U'),
(3601, 'administrator', 'ROLE_D'),
(3602, 'administrator', 'SCHOOL_C'),
(3603, 'administrator', 'SCHOOL_R'),
(3604, 'administrator', 'SCHOOL_U'),
(3605, 'administrator', 'SCHOOL_D'),
(3606, 'administrator', 'SESSION_C'),
(3607, 'administrator', 'SESSION_R'),
(3608, 'administrator', 'SESSION_U'),
(3609, 'administrator', 'SESSION_D'),
(3610, 'administrator', 'SURVEY_C'),
(3611, 'administrator', 'SURVEY_R'),
(3612, 'administrator', 'SURVEY_U'),
(3613, 'administrator', 'SURVEY_D'),
(3614, 'administrator', 'SURVEY_QUESTION_C'),
(3615, 'administrator', 'SURVEY_QUESTION_R'),
(3616, 'administrator', 'SURVEY_QUESTION_U'),
(3617, 'administrator', 'SURVEY_QUESTION_D'),
(3618, 'administrator', 'SURVEY_QUESTION_FILLUP_C'),
(3619, 'administrator', 'SURVEY_QUESTION_FILLUP_R'),
(3620, 'administrator', 'SURVEY_QUESTION_FILLUP_U'),
(3621, 'administrator', 'SURVEY_QUESTION_FILLUP_D'),
(3622, 'administrator', 'SURVEY_QUESTION_TYPE_C'),
(3623, 'administrator', 'SURVEY_QUESTION_TYPE_R'),
(3624, 'administrator', 'SURVEY_QUESTION_TYPE_U'),
(3625, 'administrator', 'SURVEY_QUESTION_TYPE_D'),
(3626, 'administrator', 'TERM_C'),
(3627, 'administrator', 'TERM_R'),
(3628, 'administrator', 'TERM_U'),
(3629, 'administrator', 'TERM_D'),
(3630, 'administrator', 'THESIS_C'),
(3631, 'administrator', 'THESIS_R'),
(3632, 'administrator', 'THESIS_U'),
(3633, 'administrator', 'THESIS_D'),
(3634, 'administrator', 'USER_C'),
(3635, 'administrator', 'USER_R'),
(3636, 'administrator', 'USER_U'),
(3637, 'administrator', 'USER_D'),
(3638, 'administrator', 'VIDEO_C'),
(3639, 'administrator', 'VIDEO_R'),
(3640, 'administrator', 'VIDEO_U'),
(3641, 'administrator', 'VIDEO_D'),
(3642, 'administrator', 'VIDEO_COMMENT_C'),
(3643, 'administrator', 'VIDEO_COMMENT_R'),
(3644, 'administrator', 'VIDEO_COMMENT_U'),
(3645, 'administrator', 'VIDEO_COMMENT_D'),
(3646, 'administrator', 'YEAR_C'),
(3647, 'administrator', 'YEAR_R'),
(3648, 'administrator', 'YEAR_U'),
(3649, 'administrator', 'YEAR_D'),
(3650, 'student', 'ASSET_R'),
(3651, 'student', 'CLUB_C'),
(3652, 'student', 'CLUB_R'),
(3653, 'student', 'CLUB_U'),
(3654, 'student', 'CLUB_D'),
(3655, 'student', 'DISCUSSION_C'),
(3656, 'student', 'DISCUSSION_R'),
(3657, 'student', 'DISCUSSION_U'),
(3658, 'student', 'DISCUSSION_D'),
(3659, 'student', 'DISCUSSION_COMMENT_C'),
(3660, 'student', 'DISCUSSION_COMMENT_R'),
(3661, 'student', 'DISCUSSION_COMMENT_U'),
(3662, 'student', 'DISCUSSION_COMMENT_D'),
(3663, 'student', 'PROJECT_R'),
(3664, 'student', 'QUESTION_C'),
(3665, 'student', 'QUESTION_R'),
(3666, 'student', 'QUESTION_U'),
(3667, 'student', 'QUESTION_D'),
(3668, 'student', 'REGISTRATION_R'),
(3669, 'student', 'RESULT_R'),
(3670, 'student', 'THESIS_R'),
(3671, 'student', 'USER_R'),
(3672, 'student', 'VIDEO_C'),
(3673, 'student', 'VIDEO_R'),
(3674, 'student', 'VIDEO_U'),
(3675, 'student', 'VIDEO_D');

-- --------------------------------------------------------

--
-- Table structure for table `ums_school`
--

DROP TABLE IF EXISTS `ums_school`;
CREATE TABLE IF NOT EXISTS `ums_school` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `DeanID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_school`
--

INSERT INTO `ums_school` (`ID`, `Name`, `DeanID`) VALUES
('{39DDC0C2-CFC2-4246-8748-8812B1751A5C}', 'Science Engineering and Technology', ''),
('{4D46079B-AFA3-40F1-B8D1-6CC9E9F56812}', 'Life Science', ''),
('{86E0F021-B30D-48D2-B177-247180633C5E}', 'Social Science', ''),
('{879375F7-0A15-4705-AC90-C6786D279EF1}', 'Law and Humanities', ''),
('{CE09AA38-205B-4F50-A0E0-14DB8686C912}', 'Fine Arts', '');

-- --------------------------------------------------------

--
-- Table structure for table `ums_user`
--

DROP TABLE IF EXISTS `ums_user`;
CREATE TABLE IF NOT EXISTS `ums_user` (
  `ID` varchar(40) NOT NULL,
  `UniversityID` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `IsLogged` varchar(10) DEFAULT NULL,
  `IsArchived` varchar(10) DEFAULT NULL,
  `IsDeleted` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `UniversityID` (`UniversityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user`
--

INSERT INTO `ums_user` (`ID`, `UniversityID`, `Email`, `Password`, `FirstName`, `LastName`, `Status`, `IsLogged`, `IsArchived`, `IsDeleted`) VALUES
('aysha@gmail.com', '020208', 'aysha@gmail.com', '$2y$10$0RhEvNvghEBguw.tGOGHOuF8.tdBZKVPIxA9.OaWZ8v7Di7miDVC2', 'Aysha', 'Akther', 'approved', NULL, NULL, NULL),
('kashif@gmail.com', '020202', 'kashif@gmail.com', '$2y$10$VoB44xY6tRG8YaFk8L320eCR.AGT73RCiYaoOJLwU3ITKkgxliHV6', 'Kashif Nizam', 'Khan', 'approved', NULL, NULL, NULL),
('mkazi078@uottawa.ca', '020229', 'mkazi078@uottawa.ca', '$2y$10$ib9eyLWjPMvZn8iGFf3CEOqvkd/pUHO2pOqksMkJBdk2.4eKX0H1q', 'Kazi Masudul', 'Alam ', 'approved', NULL, NULL, NULL),
('zahid@gmail.com', '020203', 'zahid@gmail.com', '$2y$10$Ej0FnJB7WqL4j7fRI99AWuC8z5a7M4VUC/jGlgudSAneSKEy3uXCW', 'Zahidul', 'Islam', 'approved', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ums_user_details`
--

DROP TABLE IF EXISTS `ums_user_details`;
CREATE TABLE IF NOT EXISTS `ums_user_details` (
  `ID` varchar(40) NOT NULL,
  `FatherName` varchar(100) DEFAULT NULL,
  `MotherName` varchar(100) DEFAULT NULL,
  `PermanentAddress` varchar(200) DEFAULT NULL,
  `HomePhone` varchar(20) DEFAULT NULL,
  `CurrentAddress` varchar(200) DEFAULT NULL,
  `MobilePhone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user_details`
--

INSERT INTO `ums_user_details` (`ID`, `FatherName`, `MotherName`, `PermanentAddress`, `HomePhone`, `CurrentAddress`, `MobilePhone`) VALUES
('aysha@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('kashif@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('mkazi078@uottawa.ca', 'Kazi Shahidul Alam', 'Hosneara Jahan', '49/2, Rokon Uddin Sarak, East Baniakhamar, Khulna', '0417223344', 'Same', '01711149360 '),
('zahid@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ums_user_discipline`
--

DROP TABLE IF EXISTS `ums_user_discipline`;
CREATE TABLE IF NOT EXISTS `ums_user_discipline` (
  `UserID` varchar(40) NOT NULL,
  `DisciplineID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ums_user_position`
--

DROP TABLE IF EXISTS `ums_user_position`;
CREATE TABLE IF NOT EXISTS `ums_user_position` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(40) NOT NULL,
  `PositionID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user_position`
--

INSERT INTO `ums_user_position` (`ID`, `UserID`, `PositionID`) VALUES
(43, 'mkazi078@uottawa.ca', '{64D25DDA-16B6-47B8-BBFC-4E2AAF5680C7}');

-- --------------------------------------------------------

--
-- Table structure for table `ums_user_role`
--

DROP TABLE IF EXISTS `ums_user_role`;
CREATE TABLE IF NOT EXISTS `ums_user_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(40) NOT NULL,
  `RoleID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user_role`
--

INSERT INTO `ums_user_role` (`ID`, `UserID`, `RoleID`) VALUES
(112, 'mkazi078@uottawa.ca', 'administrator'),
(113, 'mkazi078@uottawa.ca', 'teacher'),
(115, 'kashif@gmail.com', 'student'),
(119, 'zahid@gmail.com', 'administrator'),
(120, 'aysha@gmail.com', 'administrator');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tms_link_thesis`
--
ALTER TABLE `tms_link_thesis`
  ADD CONSTRAINT `tms_link_thesis_ibfk_1` FOREIGN KEY (`thesis_id`) REFERENCES `tms_thesis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
