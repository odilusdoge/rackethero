-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2024 at 11:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rakethero`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `applications_id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `job_seeker_id` int(11) DEFAULT NULL,
  `jobId` int(11) DEFAULT NULL,
  `applicationDate` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `proposal` varchar(500) DEFAULT NULL,
  `valid_until` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`applications_id`, `userId`, `job_seeker_id`, `jobId`, `applicationDate`, `status`, `proposal`, `valid_until`) VALUES
(124, 16, 16, 115, '2024-12-18', 'Completed', 'sd', NULL),
(127, 16, 16, 114, '2024-12-20', 'Completed', 'csddcxcxcx', NULL),
(128, 16, 16, 116, '2024-12-20', 'Completed', 'ff', NULL),
(129, 16, 16, 113, '2024-12-20', 'Completed', 'sss', NULL),
(137, 16, 16, 117, '2024-12-21', 'Pending', 'w', NULL),
(138, 39, 39, 129, '2024-12-23', 'Negotiation', 'ss', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `jobs_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `employerId` int(11) DEFAULT NULL,
  `postedDate` date DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `payType` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `jobTypeID` int(11) DEFAULT NULL,
  `is_onlyavailable` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`jobs_id`, `title`, `description`, `employerId`, `postedDate`, `price`, `payType`, `duration`, `location`, `status`, `remarks`, `jobTypeID`, `is_onlyavailable`) VALUES
(113, 's', 'sss', 21, '2024-12-18', 2.00, 'Pay by hour', '1 month', 'ss', 'Closed', '', 2, 1),
(114, 'wwd', 'sadsad', 21, '2024-12-18', 1.00, 'Pay by day', '1 month', 'sadasd', 'Closed', '', 1, 1),
(115, 'sd', 'sd', 21, '2024-12-18', 112.00, 'Pay by week', '1 week', 'sd', 'Closed', '', 3, 1),
(116, 's', 's', 21, '2024-12-20', 123.00, 'Pay by day', '1 month', '123', 'Closed', '', 1, 1),
(117, 'wew', 'ewe', 21, '2024-12-20', 123.00, 'Pay by hour', 'wew', ' 123', 'Open', '', 1, 1),
(127, 's', 's', 35, '2024-12-20', 123.00, 'Pay by hour', '1 week', 'sdsd', 'Open', '', 1, 1),
(128, 's', 's', 21, '2024-12-20', 333.00, 'Pay by hour', '1 week', 's', 'Open', '', 2, 1),
(129, 'ss', 'ss', 42, '2024-12-22', 12.00, 'Pay by hour', '1 month', 'ss', 'Open', '', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_type`
--

CREATE TABLE `job_type` (
  `jobTypeID` int(11) NOT NULL,
  `jobType` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_type`
--

INSERT INTO `job_type` (`jobTypeID`, `jobType`, `description`) VALUES
(1, 'Carpenter', 'Woodscapes Builder'),
(2, 'Errand', 'Errand running eg: groceries'),
(3, 'bantay bata', NULL),
(4, 'panglaba', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `negotiations`
--

CREATE TABLE `negotiations` (
  `negotiation_id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `jobseeker_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `valid_until` date NOT NULL,
  `employer_accepted` tinyint(1) DEFAULT 0,
  `jobseeker_accepted` tinyint(1) DEFAULT 0,
  `status` enum('pending','partially_accepted','accepted','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` enum('employer','jobseeker') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` text DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `from_user_id`, `job_id`, `user_type`, `type`, `message`, `is_read`, `created_at`) VALUES
(75, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-16 11:03:09'),
(77, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-16 11:07:30'),
(78, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-16 11:08:00'),
(80, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-16 11:10:24'),
(82, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-16 11:15:41'),
(84, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-16 11:19:27'),
(86, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-16 11:21:00'),
(88, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-17 23:10:52'),
(89, 16, 21, 113, '', 'rejection', 'Your application has been rejected', 1, '2024-12-17 23:11:02'),
(90, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-17 23:20:09'),
(91, 16, 21, 114, '', 'rejection', 'Your application has been rejected', 1, '2024-12-17 23:20:14'),
(92, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-17 23:28:48'),
(93, 16, 21, 115, '', 'rejection', 'Your application has been rejected', 1, '2024-12-17 23:29:13'),
(94, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-17 23:29:28'),
(95, 21, 16, 115, '', 'negotiation', 'The jobseeker has made a counter-offer for their application', 0, '2024-12-18 07:36:33'),
(96, 16, 21, 115, '', 'negotiation', 'The employer has made a counter-offer for your application', 1, '2024-12-18 07:37:11'),
(97, 16, 21, 115, '', 'negotiation', 'The employer has made a counter-offer for your application', 1, '2024-12-18 07:39:37'),
(98, 16, 21, 115, '', 'negotiation', 'The employer has made a counter-offer for your application', 1, '2024-12-18 07:39:52'),
(99, 16, 21, 115, '', 'negotiation', 'The employer has made a counter-offer for your application', 1, '2024-12-18 07:40:03'),
(100, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-18 07:48:25'),
(101, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-20 03:10:12'),
(102, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-20 03:24:25'),
(103, 21, 16, 114, '', 'negotiation', 'The jobseeker has made a counter-offer for their application', 0, '2024-12-20 03:27:03'),
(104, 16, 21, 114, '', 'negotiation', 'The employer has made a counter-offer for your application', 1, '2024-12-20 03:27:12'),
(105, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-20 03:29:29'),
(106, 21, 16, 116, '', 'negotiation', 'The jobseeker has made a counter-offer for their application', 0, '2024-12-20 03:29:50'),
(107, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-20 03:37:38'),
(108, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-20 03:42:23'),
(109, 16, 21, 117, '', 'negotiation', 'The employer has made a counter-offer for your application', 1, '2024-12-20 03:47:53'),
(110, 21, 16, 117, '', 'negotiation', 'The jobseeker has made a counter-offer for their application', 0, '2024-12-20 03:49:19'),
(111, 16, 21, 117, '', 'negotiation', 'The employer has made a counter-offer for your application', 1, '2024-12-20 03:51:35'),
(112, 16, 21, 117, '', 'negotiation', 'The employer has made a counter-offer for your application', 1, '2024-12-20 03:54:33'),
(113, 16, 21, 117, '', 'negotiation', 'The employer has made a counter-offer for your application', 1, '2024-12-20 03:56:28'),
(114, 16, 21, 117, '', 'rejection', 'Your application has been rejected', 1, '2024-12-20 05:51:22'),
(115, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-20 05:58:25'),
(116, 16, 21, 117, '', 'rejection', 'Your application has been rejected', 1, '2024-12-20 21:45:52'),
(117, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-20 21:46:12'),
(118, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-20 21:53:46'),
(119, 35, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-20 21:55:01'),
(120, 16, 35, 127, '', 'rejection', 'Your application has been rejected', 1, '2024-12-20 21:55:17'),
(121, 16, 21, 117, '', 'rejection', 'Your application has been rejected', 0, '2024-12-20 21:58:46'),
(122, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-20 22:00:01'),
(123, 16, 21, 128, '', 'application_rejected', 'Your job application has been rejected', 0, '2024-12-20 22:00:07'),
(124, 21, NULL, NULL, '', 'application', 'New application received for your job posting', 0, '2024-12-20 22:02:43'),
(125, 21, 16, 117, '', 'new_application', 'New application received for your job posting', 0, '2024-12-20 22:03:32'),
(126, 42, 39, 129, '', 'new_application', 'New application received for your job posting', 0, '2024-12-22 22:33:00'),
(127, 42, 39, 129, '', 'negotiation', 'The jobseeker has made a counter-offer for their application', 0, '2024-12-22 22:35:45'),
(128, 39, 42, 129, '', 'negotiation', 'The employer has made a counter-offer for your application', 0, '2024-12-22 22:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `quotations_id` int(11) NOT NULL,
  `jobId` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `validUntil` date DEFAULT NULL,
  `status` enum('pending','accepted','rejected','expired','cancelled') NOT NULL,
  `DateCreated` date DEFAULT NULL,
  `applications_id` int(11) DEFAULT NULL,
  `valid_until` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`quotations_id`, `jobId`, `price`, `description`, `validUntil`, `status`, `DateCreated`, `applications_id`, `valid_until`) VALUES
(46, 115, 1.00, 's', '2024-12-17', 'accepted', '2024-12-18', 124, '2024-12-18'),
(48, 114, 3321323.00, 'sdsadsads', NULL, 'accepted', NULL, 127, '2024-12-20'),
(49, 116, 13233323.00, 'sadsad', NULL, 'accepted', NULL, 128, '2024-12-20'),
(50, 113, 123.00, 'sd', NULL, 'accepted', NULL, 129, '2025-01-03'),
(52, 129, 222222.00, 'ssadsa', NULL, '', NULL, 138, '2024-12-22');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `jobId` int(11) DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `reviewDate` date DEFAULT NULL,
  `quotation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviews_id`, `userId`, `jobId`, `rating`, `comment`, `reviewDate`, `quotation_id`) VALUES
(12, 16, 115, 3.00, 'bakod', '2024-12-18', 46);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transactions_id` int(11) NOT NULL,
  `employerId` int(11) DEFAULT NULL,
  `jobId` int(11) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `quotation_id` int(11) DEFAULT NULL,
  `jobseeker_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `transaction_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transactions_id`, `employerId`, `jobId`, `duration`, `status`, `quotation_id`, `jobseeker_id`, `amount`, `transaction_date`) VALUES
(7, 21, 115, '1 week', 'Active', 46, 16, 1.00, '2024-12-18 15:40:09'),
(8, 21, 114, '1 month', 'Active', 48, 16, 3321323.00, '2024-12-20 11:27:17'),
(9, 21, 114, '1 month', 'Active', 48, 16, 3321323.00, '2024-12-20 11:27:23'),
(10, 21, 116, '1 month', 'Active', 49, 16, 13233323.00, '2024-12-20 11:29:59'),
(11, 21, 116, '1 month', 'Active', 49, 16, 13233323.00, '2024-12-20 11:30:06'),
(12, 21, 113, '1 month', 'Active', 50, 16, 123.00, '2024-12-20 11:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `userType` enum('job seeker','employer') NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `userType`, `username`, `password`) VALUES
(10, '', 'wew', '$2y$10$SmijnPoxYKEUktqyz37fdeJHfExhIM45./RFFBmouO2frAFR3XnvO'),
(14, 'employer', 'wew2', '$2y$10$jYmeFhe.bB3BFw9l3g1Z0uzWzVBZtMGX.yFbWARNqBeAfEtbcLPNW'),
(15, 'employer', 'wew23', '$2y$10$wrcWbRw.EIEtMObQYCU6K.06XauN6CabXNKEvd8ICr12pvrVcU1ha'),
(16, '', 'haha', '$2y$10$baTpjlSOusVrD83q05P8B.i4wEIPw9pTwq2r15DE8U0PVIi9I5aE2'),
(17, '', 'haha2', '$2y$10$1KHz/kvT.Y0x1r90wuo1a.aHdqTUeXiNXBgBr2bVgoOxdCfiU3kX.'),
(18, '', 'haha23', '$2y$10$hEZ.94C9dmOII2LdLVPJbuGbEGNjYYLUaIgt.Fp1YNGieT5Ze.OLi'),
(19, 'employer', 'ge', '$2y$10$eqNi5Msy1DzDw0YxV4D9.ejq878wssQjLOz75L71eXCQemmTrIA1y'),
(20, 'employer', 'ga', '$2y$10$sTPh0kNJ.hHk3CEFCB0X0ueixQL0LGdWZbZ8VTIcWqG/OY12xsbfO'),
(21, 'employer', 'ibrt', '$2y$10$MpzqeLQregfTgAxW05FA1ua/jxXY.swRcrUoFgReFBKJnI2c5WXgK'),
(22, '', 'lo', '$2y$10$GMwVoOZVX5qnoPz71NhVYeIHDrId7FScbz7TCT217ykoAwCIlgB6e'),
(23, 'employer', 's', '$2y$10$R4ZcdhnWC74uh8Ez7YL7gOODV0GBqwMLLdD8wuFratqxUFbKR4AyO'),
(24, '', 'wiw', '$2y$10$auu/ip6D04kxargjoO/N3OcDvTqC4pX.MPjzEfSOqJ6rIifqnQ9nm'),
(25, '', 'hehe', '$2y$10$84dYEWBWUtuUgtdvLVEjm.gHl9RV70zacZMmCoKUXrtCsE3nfc4Ba'),
(26, '', 'wews', '$2y$10$4PWNVkqVGxx503.S3TktYeXt8hgWOckJIc14a76Qro1DtNgre/SEy'),
(27, 'employer', '12', '$2y$10$HZ2ak5Qtc490AJJqertjauvDt0gNJSgyd9tPrcpMj2DS9bi0SASxK'),
(28, 'employer', 'da', '$2y$10$vguSBQtS3U9WSdA1xG5YieF/8iqNNYcI0hFMRdTF2qI/eY/d.MROW'),
(29, '', 'andy', '$2y$10$1j7H3Rle2LjZLHhBlraqe.Cvl800vHosfZ89hXoZP5vej28J8YAIa'),
(31, '', 'new', '$2y$10$J7eToKUCYXgmJLGQkcExXeOJ0ZjzDtWRLHxGFcBnd4fyAD9VXu5lq'),
(32, 'employer', 'wen', '$2y$10$nWvLcK7glkH1i5lK.FUkken8R5dK.UKI5aTbxpyH7R7ugXnMRcmlq'),
(33, '', '123', '$2y$10$CTBAf10vwyNzdVFC3llpJOIlhqpp05AW7Qeb9xxUxLoVzBF8mCYQ2'),
(34, '', 'ew', '$2y$10$QBy5ukn/CUCmAIf0G8JhNuX/pGWbUqt5xbP.GZmqNtpvGh2iZQq6q'),
(35, 'employer', '1234', '$2y$10$XoCcGSO2vf2vNZ/M7un2wutm1FXVJ83ff42fmKYhmNZY.rsCLsD6.'),
(36, 'employer', '321', '$2y$10$sJd/vDQgXHFUfojzA0lVXuo4KJ1ouCHH7hxda7qwON9SyV7KQM4Ju'),
(37, 'employer', 'sas', '$2y$10$.httXkHEkypHaIN6JzWVIeSQo3jp4CdRhYNmLC9F1EsEoHxZAuVNi'),
(38, '', 'qqq', '$2y$10$eicLlFQ1l53GQUDEOWR94O1Btvz/3hXoi8jyoNuSurBBohfpNz5qm'),
(39, '', '767', '$2y$10$HVKxUOwQIS0LVLZhqq9p1Onrwbim1GndYkUK/FXBWirLoNL6NN54i'),
(42, 'employer', 'sad', '$2y$10$TVLTaGXWiDfxC36Dvjg7yOXGclgBGDJQ1uotF.QRGq7U1pPkjmfU2'),
(43, '', 'das', '$2y$10$T6pPNtxLdFw1orz.68eT1eQcWCLDtI.OTdcLEKq2pBQUqVa7pXugW'),
(44, 'employer', 'employer', '$2y$10$yXH4w4R1C26ecd9PLZGvWe1VeEWwMv.1Iu1VCp/iAsvlNuMSBqD72'),
(45, '', 'jobseeker', '$2y$10$fPcM0DIeL9tx21ZoB846Xe7Ydr1ofe6LYMdj6ORp1n1ctMWPJklNa');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `userinfo_id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `contactNo` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `middle_initial` varchar(5) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `image_path` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`userinfo_id`, `userid`, `contactNo`, `email`, `fname`, `lname`, `middle_initial`, `age`, `location`, `rating`, `skills`, `overview`, `title`, `image_path`) VALUES
(11, 16, '123921', 'andymjap@gmail.com', 'jawmedtechsss', 'batombakal rigor', 'B', 123, 'GRANADA', 4.00, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'pea shooter aq', 'uploads/profile_pictures/profile_16.jpg'),
(12, 26, '123921', 'andymjap@gmail.com', 'jawmeds', 'batombakls', 'B', 21, 'GRANADA', NULL, NULL, 'asdasdfsadsadaerawewaewacecwaewqewaec', 'Bantay bata', NULL),
(13, 21, '91998273', 'wew@gmail.com', 'wewwssssda', 'wews', 'B', 21, 'downtown', 4.00, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'wew', 'uploads/profile_pictures/profile_21.jpg'),
(14, 21, '91998273', 'wew@gmail.com', 'wewwssssda', 'wews', 'B', 21, 'downtown', 4.00, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'wew', 'uploads/profile_pictures/profile_21.jpg'),
(15, 21, '91998273', 'wew@gmail.com', 'wewwssssda', 'wews', 'B', 21, 'downtown', 4.00, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'wew', 'uploads/profile_pictures/profile_21.jpg'),
(16, 21, '91998273', 'wew@gmail.com', 'wewwssssda', 'wews', 'B', 21, 'downtown', 4.00, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'wew', 'uploads/profile_pictures/profile_21.jpg'),
(17, 27, '09949727601', 'andymjap@gmail.com', 'Lei', 'Ivert', NULL, NULL, 'Lacson', NULL, NULL, NULL, NULL, 'uploads/profile_pictures/profile_27.jpg'),
(18, 28, '09949727601', 'wew@gmail.com', 'Mark', 'Lo ', NULL, NULL, 'Alijis', NULL, NULL, NULL, NULL, 'uploads/profile_pictures/profile_28.png'),
(26, 31, '123921', 'w@gmail.com', 'w', 'w', 'w', 32, 'Alijis', NULL, NULL, 'sssss', 'ssss', 'uploads/profile_pictures/profile_31.jpg'),
(27, 33, '123', '123@gmail.com', '123', '123', '123', 123, '123', NULL, NULL, '123', '123', 'uploads/profile_pictures/profile_33.jpg'),
(28, 34, '123', 'ew@gmail.com', 'ew', 'ew', 'ew', 123, '123', NULL, NULL, '123', '123', 'uploads/profile_pictures/profile_34.png'),
(29, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 39, '2312321312', 'bogart@gmail.com', 'wew', 'wew', 'e', 21, 'bagol', NULL, NULL, 'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content12. It is also known as filler, dummy, or Greek copy134. It serves to fill a space and show how real words will look like in the final product14. It is often used by web page designers, content writers, and layout artists before the final written content and website designs receive client approval42.', 'wews', 'uploads/profile_pictures/profile_39.jpg'),
(31, 39, '2312321312', 'bogart@gmail.com', 'wew', 'wew', 'e', 21, 'bagol', NULL, NULL, 'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content12. It is also known as filler, dummy, or Greek copy134. It serves to fill a space and show how real words will look like in the final product14. It is often used by web page designers, content writers, and layout artists before the final written content and website designs receive client approval42.', 'wews', 'uploads/profile_pictures/profile_39.jpg'),
(34, 42, '8213838821', 'wew@gmail.coms', 'jawmedshaha', 'batombakls', NULL, NULL, 'balay', NULL, NULL, NULL, NULL, 'uploads/profile_pictures/profile_42.jpg'),
(35, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 42, '8213838821', 'wew@gmail.coms', 'jawmedshaha', 'batombakls', NULL, NULL, 'balay', NULL, NULL, NULL, NULL, 'uploads/profile_pictures/profile_42.jpg'),
(37, 42, '8213838821', 'wew@gmail.coms', 'jawmedshaha', 'batombakls', NULL, NULL, 'balay', NULL, NULL, NULL, NULL, 'uploads/profile_pictures/profile_42.jpg'),
(38, 39, '2312321312', 'bogart@gmail.com', 'wew', 'wew', 'e', 21, 'bagol', NULL, NULL, 'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content12. It is also known as filler, dummy, or Greek copy134. It serves to fill a space and show how real words will look like in the final product14. It is often used by web page designers, content writers, and layout artists before the final written content and website designs receive client approval42.', 'wews', 'uploads/profile_pictures/profile_39.jpg'),
(39, 44, '123921', 'piamontelendz21@gmail.com', 'jawmedtech', 'Gellecanao', NULL, NULL, 'GRANADA', NULL, NULL, NULL, NULL, 'uploads/profile_pictures/profile_44.jpg'),
(40, 45, '92929292', 'bogart@gmail.com', 'wew', 'wew', 'E', 123, 'bagol', NULL, NULL, 'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content12. It is also known as filler, dummy, or Greek copy134. It serves to fill a space and show how real words will look like in the final product14. It is often used by web page designers, content writers, and layout artists before the final written content and website designs receive client approval42.', 'wews', 'uploads/profile_pictures/profile_45.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_ratings`
--

CREATE TABLE `user_ratings` (
  `rating_id` int(11) NOT NULL,
  `rater_id` int(11) NOT NULL,
  `rated_user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_ratings`
--

INSERT INTO `user_ratings` (`rating_id`, `rater_id`, `rated_user_id`, `rating`, `comment`, `transaction_id`, `created_at`) VALUES
(8, 16, 21, 4, 'jisi diomed inc', 7, '2024-12-18 07:43:37'),
(9, 21, 16, 4, 'wwweeeeew', 7, '2024-12-20 02:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_skills`
--

CREATE TABLE `user_skills` (
  `skill_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `skill_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_skills`
--

INSERT INTO `user_skills` (`skill_id`, `userid`, `skill_name`) VALUES
(1, 10, 'wew'),
(43, 26, 'Caregiver'),
(44, 26, 'huo'),
(75, 21, 'IT'),
(76, 21, 'CHUCHU'),
(77, 21, 'BLALA'),
(78, 21, 'haha'),
(79, 21, 'ibrt'),
(80, 21, 'wew'),
(81, 21, 'haha'),
(82, 21, 'ibrt'),
(83, 21, 'wew'),
(84, 21, 'wews'),
(85, 21, '123'),
(86, 21, 'sas'),
(111, 31, 'haha'),
(112, 31, 'ibrt'),
(113, 31, 'wew'),
(115, 33, '123'),
(122, 34, 'graphic designer'),
(123, 34, 'video editor'),
(124, 34, 'social media manager'),
(134, 16, 'graphic designer'),
(135, 16, 'social media manager'),
(136, 16, 'video editor'),
(140, 42, 'LO'),
(141, 42, 'HA'),
(142, 42, 'HAS'),
(149, 39, 'haha'),
(150, 39, 'hahas'),
(151, 39, 'hahaz'),
(152, 45, 'jirom'),
(153, 45, 'jorms'),
(154, 45, 'bago');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`applications_id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `jobId` (`jobId`),
  ADD KEY `job_seeker_id` (`job_seeker_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`jobs_id`),
  ADD KEY `fk_jobType` (`jobTypeID`);

--
-- Indexes for table `job_type`
--
ALTER TABLE `job_type`
  ADD PRIMARY KEY (`jobTypeID`);

--
-- Indexes for table `negotiations`
--
ALTER TABLE `negotiations`
  ADD PRIMARY KEY (`negotiation_id`),
  ADD KEY `quotation_id` (`quotation_id`),
  ADD KEY `employer_id` (`employer_id`),
  ADD KEY `jobseeker_id` (`jobseeker_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`quotations_id`),
  ADD KEY `jobId` (`jobId`),
  ADD KEY `fk_quotation_application` (`applications_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviews_id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `jobId` (`jobId`),
  ADD KEY `quotation_id` (`quotation_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transactions_id`),
  ADD KEY `employerId` (`employerId`),
  ADD KEY `jobId` (`jobId`),
  ADD KEY `quotation_id` (`quotation_id`),
  ADD KEY `jobseeker_id` (`jobseeker_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`userinfo_id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `user_ratings`
--
ALTER TABLE `user_ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `rater_id` (`rater_id`),
  ADD KEY `rated_user_id` (`rated_user_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `user_skills`
--
ALTER TABLE `user_skills`
  ADD PRIMARY KEY (`skill_id`),
  ADD KEY `userid` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `applications_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `jobs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `job_type`
--
ALTER TABLE `job_type`
  MODIFY `jobTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `negotiations`
--
ALTER TABLE `negotiations`
  MODIFY `negotiation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `quotations_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviews_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transactions_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `userinfo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user_ratings`
--
ALTER TABLE `user_ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_skills`
--
ALTER TABLE `user_skills`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`jobId`) REFERENCES `jobs` (`jobs_id`),
  ADD CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`job_seeker_id`) REFERENCES `users` (`users_id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `fk_jobType` FOREIGN KEY (`jobTypeID`) REFERENCES `job_type` (`jobTypeID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `negotiations`
--
ALTER TABLE `negotiations`
  ADD CONSTRAINT `negotiations_ibfk_1` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`quotations_id`),
  ADD CONSTRAINT `negotiations_ibfk_2` FOREIGN KEY (`employer_id`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `negotiations_ibfk_3` FOREIGN KEY (`jobseeker_id`) REFERENCES `users` (`users_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`jobs_id`);

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `fk_quotation_application` FOREIGN KEY (`applications_id`) REFERENCES `applications` (`applications_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quotations_ibfk_1` FOREIGN KEY (`jobId`) REFERENCES `jobs` (`jobs_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`jobId`) REFERENCES `jobs` (`jobs_id`),
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`quotations_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`employerId`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`jobId`) REFERENCES `jobs` (`jobs_id`),
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`quotations_id`),
  ADD CONSTRAINT `transactions_ibfk_4` FOREIGN KEY (`jobseeker_id`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `transactions_ibfk_5` FOREIGN KEY (`employerId`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `transactions_ibfk_6` FOREIGN KEY (`jobId`) REFERENCES `jobs` (`jobs_id`);

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`users_id`);

--
-- Constraints for table `user_ratings`
--
ALTER TABLE `user_ratings`
  ADD CONSTRAINT `user_ratings_ibfk_1` FOREIGN KEY (`rater_id`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `user_ratings_ibfk_2` FOREIGN KEY (`rated_user_id`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `user_ratings_ibfk_3` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transactions_id`);

--
-- Constraints for table `user_skills`
--
ALTER TABLE `user_skills`
  ADD CONSTRAINT `user_skills_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`users_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
