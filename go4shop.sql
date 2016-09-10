-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 10, 2016 at 08:27 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `go4shop`
--

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Seminars'),
(2, 'Bootcamps'),
(3, 'Hot Seat'),
(4, 'Full Weekend ');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `forname` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `add1` varchar(50) NOT NULL,
  `add2` varchar(50) NOT NULL,
  `add3` varchar(50) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `registered` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_addresses`
--

CREATE TABLE `delivery_addresses` (
  `id` int(11) NOT NULL,
  `forname` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `add1` varchar(50) NOT NULL,
  `add2` varchar(50) NOT NULL,
  `add3` varchar(50) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
CREATE TABLE `logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `trn_date` datetime NOT NULL,
  `access_level` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
SET FOREIGN_KEY_CHECKS=1;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`id`, `customer_id`, `username`, `email`, `password`, `trn_date`, `access_level`) VALUES
(0, 'rafa', 'rafa@hotmail.com', '35cd2d0d62d9bc5e60a3ca9f7593b05b', '2016-09-09 21:07:29', 1),
(0, 'rafa1', 'rafa1@hotmail.com', '9c00ae25f7d4dd6a6a332f60804d0841', '2016-09-10 14:10:49', 1);
(0, 'admin', 'admin@go4shop.com', '21232f297a57a5a743894a0e4a801fc3', '2016-09-10 14:10:49', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `registered` int(11) NOT NULL,
  `delivery_add_id` int(11) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `session` varchar(100) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `registered`, `delivery_add_id`, `payment_type`, `date`, `status`, `session`, `total`) VALUES
(1, 0, 0, 0, 1, '2016-09-08 15:25:12', 2, 'mpsmhot40tc937bati0ep65ac1', 950),
(2, 0, 0, 0, 0, '2016-09-09 21:02:18', 1, '9cmtjarlhp0f5g4nr7rsc5hat5', 150),
(3, 0, 0, 0, 0, '2016-09-10 16:07:25', 0, '9cmtjarlhp0f5g4nr7rsc5hat5', 600),
(4, 0, 0, 0, 0, '2016-09-10 17:23:59', 0, '9cmtjarlhp0f5g4nr7rsc5hat5', 0),
(5, 0, 0, 0, 0, '2016-09-10 17:38:03', 0, '9cmtjarlhp0f5g4nr7rsc5hat5', 0),
(6, 0, 0, 0, 0, '2016-09-10 17:49:42', 0, '9cmtjarlhp0f5g4nr7rsc5hat5', 50),
(7, 0, 0, 0, 0, '2016-09-10 17:50:38', 0, '9cmtjarlhp0f5g4nr7rsc5hat5', 0),
(8, 0, 0, 0, 0, '2016-09-10 17:53:33', 0, '9cmtjarlhp0f5g4nr7rsc5hat5', 50);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `cat_id` tinyint(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(30) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `cat_id`, `name`, `description`, `image`, `price`) VALUES
(1, 1, 'Friday September 23rd 7:00 PM', 'Short Introduction to what it''s going to be taught during the weekend, FREE ENTRY no strings attached', '', 0),
(2, 1, 'Saturday September 24rd 10:00 AM ', 'Here begins our theoretical part of the weekend. You''ll everything there is to know, from cold approach, kino, number closing, and other subjects', '', 50),
(3, 2, 'Friday September 23rd Around Midnight', 'We go out to see what you got and show you and teach infield what you are capable of. What''s your sticking point? A.A., kino escalating, closing? we''ll go through all of those in detail and show you first hand how to overcome them', '', 50),
(4, 2, 'Saturday September 24rd 9:00 PM', 'Now that you''ve learned some theory it''s time to put up to the test. We''ll hit several bars, night clubs and try some street game to practice what we''ve learn (clubs cover entry included in price) ', '', 150),
(5, 3, 'Sunday September 25th 12:00 M', 'We got a lot of new information in this weekend so now to calm things down and give your brain a rest I''m gonna show you hours and hours of footage that my team and I put together over the years, this will show what you can get over with with the right frame and calibration. I''ll pause and explain spontaneously what is going down and happened before or after behind the cameras. You''ll also get a USB drive with all the footage so you can check it out at home all the times you want', '', 150),
(6, 4, 'Early Bird Weekend', 'Since you''re trusting us blindly we''ll say ''thank you'' by giving you a special price and front row reserved seats to all seminars and hot seats. As well as priority special treatment in the bootcamps (don''t tell anybody)', '', 300),
(7, 4, 'At the Door Weekend', 'Still not convinced? No problem, join us for the free intro seminar and finally make up your mind to turn your life around and take action!\r\n ', '', 350);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
