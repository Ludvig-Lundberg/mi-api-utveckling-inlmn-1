-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: bqsyskcsfccfrm3mbuae-mysql.services.clever-cloud.com:3306
-- Generation Time: Feb 08, 2023 at 09:39 AM
-- Server version: 8.0.22-13
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bqsyskcsfccfrm3mbuae`
--

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int UNSIGNED NOT NULL,
  `customer_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_postcode` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `customer_first_name`, `customer_last_name`, `customer_address`, `customer_postcode`, `customer_city`, `customer_email`, `customer_phone`, `order_total`) VALUES
(10, 'Ludvig', 'Lundberg', 'Adressgatan 12', '123 45', 'Malmö', 'example@mail.com', '', 132),
(11, 'Ludvig', 'Lundberg', 'Adressgatan 12', '123 45', 'Malmö', 'example@mail.com', '', 132),
(12, 'Ludvig', 'Lundberg', 'Adressgatan 12', '123 45', 'Malmö', 'example@mail.com', '', 132);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `qty` int UNSIGNED NOT NULL,
  `item_price` int UNSIGNED NOT NULL,
  `item_total` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `product_id`, `qty`, `item_price`, `item_total`, `order_id`) VALUES
(17, 21, 2, 8, 16, 10),
(18, 22, 6, 8, 48, 10),
(19, 26, 1, 8, 8, 10),
(20, 25, 3, 8, 24, 10),
(21, 20, 3, 12, 36, 10),
(22, 21, 2, 8, 16, 11),
(23, 22, 6, 8, 48, 11),
(24, 26, 1, 8, 8, 11),
(25, 25, 3, 8, 24, 11),
(26, 20, 3, 12, 36, 11),
(27, 21, 2, 8, 16, 12),
(28, 22, 6, 8, 48, 12),
(29, 26, 1, 8, 8, 12),
(30, 25, 3, 8, 24, 12),
(31, 20, 3, 12, 36, 12);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `images` json NOT NULL,
  `stock_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'instock',
  `stock_quantity` int UNSIGNED DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `images`, `stock_status`, `stock_quantity`) VALUES
(20, 'Gott & Blandat Giants', '<p>En mix av lakrits och gelé med fruktsmak</p>\n<p>Innehållsförteckning: Socker, glukossirap, glukos-fruktossirap, stärkelse, VETEMJÖL, melass, syra (citronsyra), fuktighetsbevarande medel (sorbitoler, glycerol), lakritsextrakt, salt, vegetabiliska oljor (kokos, palm), aromer, färgämnen (E153, E120, E100, E141), ytbehandlingsmedel (bivax), stabiliseringsmedel (E471).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 12, '{\"large\": \"/storage/products/1997509.png\", \"thumbnail\": \"/storage/products/thumbnails/1997509-300x300.png\"}', 'instock', 5),
(21, 'Banana Bubs', '<p>Banan/gräddkola</p>\n<p>Innehållsförteckning: Glukos-fruktossirap, socker, majsstärkelse, vatten, surhetsreglerande medel (äppelsyra, natriumcitrat), potatisprotein, aromämnen, färgämnen: (E150d, E100), kokosolja, ytbehandlingsmedel (karnaubavax).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"/storage/products/156622.png\", \"thumbnail\": \"/storage/products/thumbnails/156622-300x300.png\"}', 'instock', 8),
(22, 'Banana Splits', '<p>Fyllig vitchoklad med smak av kola krispig banan.</p>\n<p>Innehållsförteckning: Socker, kakaosmör, torkad banan, HELMJÖLKSPULVER, mjölksocker(LAKTOS), SKUMMJÖLKSPULVER, emulgeringsmedel E322 (SOJALECITIN), naturliga aromer, ytbehandlingsmedel (E414, E904).</p>\n<p>Kan innehålla spår av MANDEL, NÖTTER och VETE.</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"/storage/products/3827741.png\", \"thumbnail\": \"/storage/products/thumbnails/3827741-300x300.png\"}', 'instock', 6),
(23, 'Ananas', '<p>Ananas</p>\n<p>Innehållsförteckning: Glukosirap, socker, majsstärkelse, gelatin, syror: citronsyra, aromämnen, vegetabiliska oljor (kokosnöt, palmkärna), glansmedel: bivax, carnaubavax, färger: E100, E133.</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 9, '{\"large\": \"/storage/products/2147890-1.png\", \"thumbnail\": \"/storage/products/thumbnails/2147890-1-300x300.png\"}', 'outofstock', 0),
(24, 'Bubs Cool Cola Skalle', '<p>Sur cola</p>\n<p>Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"/storage/products/1595204.png\", \"thumbnail\": \"/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4),
(25, 'Bubs Cool Cola Skalle', '<p>Sur cola</p>\n<p>Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"/storage/products/1595204.png\", \"thumbnail\": \"/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4),
(26, 'Bubs Cool Cola Skalle', '<p>Sur cola</p>\n<p>Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"/storage/products/1595204.png\", \"thumbnail\": \"/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4),
(27, 'Bubs Cool Cola Skalle', '<p>Sur cola</p>\n<p>Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"/storage/products/1595204.png\", \"thumbnail\": \"/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4),
(28, 'Bubs Cool Cola Skalle', '<p>Sur cola</p>\n<p>Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"/storage/products/1595204.png\", \"thumbnail\": \"/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4),
(29, 'Bubs Cool Cola Skalle', '<p>Sur cola</p>\n<p>Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"/storage/products/1595204.png\", \"thumbnail\": \"/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4),
(30, 'Bubs Cool Cola Skalle', '<p>Sur cola</p>\n<p>Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"/storage/products/1595204.png\", \"thumbnail\": \"/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4),
(31, 'Bubs Cool Cola Skalle', '<p>Sur cola</p>\n<p>Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"/storage/products/1595204.png\", \"thumbnail\": \"/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4),
(32, 'Bubs Cool Cola Skalle', '<p>Sur cola</p>\n<p>Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"/storage/products/1595204.png\", \"thumbnail\": \"/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4),
(33, 'Bubs Cool Cola Skalle', '<p>Sur cola</p>\n<p>Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"/storage/products/1595204.png\", \"thumbnail\": \"/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4);

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `applied_steps_count`) VALUES
('c11be0d4-7c34-4c03-b6cb-7eb60ddb3ba6', 'cb5bebf7701f222494562a4463bf7b92939dde24d7313430d7755ddfc242abe7', '2023-02-07 10:26:24.680', '20230207102624_migrate_test', NULL, NULL, 1);

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
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
