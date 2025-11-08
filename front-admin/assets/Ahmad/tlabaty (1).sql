-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07 أكتوبر 2025 الساعة 17:35
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tlabaty`
--

-- --------------------------------------------------------

--
-- بنية الجدول `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_usersid` int(11) NOT NULL,
  `address_city` varchar(255) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_lat` double NOT NULL,
  `address_long` double NOT NULL,
  `address_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `address`
--

INSERT INTO `address` (`address_id`, `address_usersid`, `address_city`, `address_street`, `address_lat`, `address_long`, `address_name`) VALUES
(2, 19, 'ازرع', 'المدرسة', 51.9958725, 4.210845, 'المنزل');

-- --------------------------------------------------------

--
-- بنية الجدول `advertisements`
--

CREATE TABLE `advertisements` (
  `Advertisements_id` int(11) NOT NULL,
  `Advertisements_title` varchar(500) NOT NULL,
  `Advertisements_body` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `advertisements`
--

INSERT INTO `advertisements` (`Advertisements_id`, `Advertisements_title`, `Advertisements_body`) VALUES
(1, 'محمصه القمة', 'تعلن عن توفر بطاطه بسعر مغري'),
(3, 'متجر الفشتكي', 'يعلن عن توفر كافة المواد الغذائية وبأسعار مناسبة للجميع');

-- --------------------------------------------------------

--
-- بنية الجدول `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_users` int(11) NOT NULL,
  `orders_state` int(11) NOT NULL,
  `orders_createdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `orders_editdate` timestamp NULL DEFAULT NULL,
  `orders_text` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_users`, `orders_state`, `orders_createdate`, `orders_editdate`, `orders_text`) VALUES
(9, 17, 2, '2025-10-02 13:26:55', NULL, 'يؤس'),
(13, 18, 0, '2025-10-04 15:01:30', NULL, 'بطاطه وبسكوت'),
(14, 19, 0, '2025-10-05 14:33:46', NULL, 'جبنة وبطاطة');

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_password` varchar(255) NOT NULL,
  `users_phone` varchar(100) NOT NULL,
  `users_verfiycode` int(11) NOT NULL,
  `users_approve` tinyint(4) NOT NULL DEFAULT 0,
  `users_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `users_email`, `users_password`, `users_phone`, `users_verfiycode`, `users_approve`, `users_create`) VALUES
(17, 'ahmad', 'ahmad@gmail.com', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', '1111111111', 80068, 1, '2025-10-02 12:18:27'),
(18, 'alaa', 'alaa@gmail.com', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', '1111111112', 98150, 1, '2025-10-04 16:00:36'),
(19, 'abd', 'abd@gmail.com', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', '1111111113', 75042, 1, '2025-10-05 15:32:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_usersid` (`address_usersid`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`Advertisements_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`),
  ADD KEY `orders_users` (`orders_users`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `Advertisements_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- قيود الجداول المُلقاة.
--

--
-- قيود الجداول `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`orders_users`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
