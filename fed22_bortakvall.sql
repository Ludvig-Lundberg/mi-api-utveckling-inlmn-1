-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 07, 2023 at 08:32 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fed22_bortakvall`
--

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_postcode` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `customer_first_name`, `customer_last_name`, `customer_address`, `customer_postcode`, `customer_city`, `customer_email`, `customer_phone`, `order_total`) VALUES
(1, '123', '123', '123', '22468', '123', '123@23.com', '', 1600);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `item_price` int(10) UNSIGNED NOT NULL,
  `item_total` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `images` json NOT NULL,
  `stock_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'instock',
  `stock_quantity` int(10) UNSIGNED DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `images`, `stock_status`, `stock_quantity`) VALUES
(1, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(2, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(3, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(4, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(5, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(6, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(7, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(8, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(9, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(10, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(11, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(12, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(13, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(14, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(15, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(16, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10),
(17, 'hej på dig', 'detta är ett test objekt', 200, '{\"large\": \"large bild här\", \"thumbnail\": \"thumbnail här\"}', 'instock', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderitems_product_id_fkey` (`product_id`),
  ADD KEY `orderitems_order_id_fkey` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `orderitems_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orderitems_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
