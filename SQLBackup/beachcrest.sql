-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 17, 2019 at 05:46 AM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beachcrest`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `BookingID` int(10) unsigned NOT NULL,
  `NumberPerson` tinyint(4) NOT NULL,
  `DateBooking` datetime NOT NULL,
  `Note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tour_id` int(10) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `approved_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingID`, `NumberPerson`, `DateBooking`, `Note`, `State`, `created_at`, `updated_at`, `tour_id`, `user_id`, `approved_by`) VALUES
(66, 3, '2019-06-15 16:24:39', NULL, 0, '2019-06-15 09:24:39', '2019-06-15 09:24:39', 48, 2, NULL),
(67, 1, '2019-06-15 20:36:10', NULL, 0, '2019-06-15 13:36:10', '2019-06-15 13:36:10', 50, 2, NULL),
(68, 1, '2019-06-15 21:18:34', NULL, 0, '2019-06-15 14:18:34', '2019-06-15 14:18:34', 50, 2, NULL),
(69, 1, '2019-06-16 17:01:11', NULL, 0, '2019-06-16 10:01:11', '2019-06-16 10:01:11', 50, 2, NULL),
(70, 1, '2019-06-16 17:31:46', NULL, 0, '2019-06-16 10:31:46', '2019-06-16 10:31:46', 50, 2, NULL),
(71, 1, '2019-06-16 17:34:24', NULL, 0, '2019-06-16 10:34:24', '2019-06-16 10:34:24', 50, 2, NULL),
(72, 1, '2019-06-16 17:36:06', NULL, 0, '2019-06-16 10:36:06', '2019-06-16 10:36:06', 50, 2, NULL),
(73, 1, '2019-06-16 17:39:16', 'đasa', 0, '2019-06-16 10:39:16', '2019-06-16 10:39:16', 50, 2, NULL),
(74, 1, '2019-06-16 17:57:55', NULL, 0, '2019-06-16 10:57:55', '2019-06-16 10:57:55', 50, 2, NULL),
(75, 1, '2019-06-16 18:14:47', NULL, 0, '2019-06-16 11:14:47', '2019-06-16 11:14:47', 50, 2, NULL),
(76, 1, '2019-06-16 18:17:42', NULL, 0, '2019-06-16 11:17:42', '2019-06-16 11:17:42', 50, 2, NULL),
(77, 1, '2019-06-16 18:20:31', NULL, 0, '2019-06-16 11:20:31', '2019-06-16 11:20:31', 50, 2, NULL),
(78, 1, '2019-06-16 18:22:06', NULL, 0, '2019-06-16 11:22:06', '2019-06-16 11:22:06', 50, 2, NULL),
(79, 1, '2019-06-16 20:07:29', 'đá', 0, '2019-06-16 13:07:29', '2019-06-16 13:07:29', 50, 2, NULL),
(80, 3, '2019-06-16 21:00:37', NULL, 0, '2019-06-16 14:00:37', '2019-06-16 14:00:37', 51, 2, NULL),
(81, 1, '2019-06-16 21:13:36', 'dsad', 0, '2019-06-16 14:13:36', '2019-06-16 14:13:36', 51, 2, NULL),
(82, 1, '2019-06-16 21:16:12', 'dsad', 0, '2019-06-16 14:16:12', '2019-06-16 14:16:12', 51, 2, NULL),
(83, 1, '2019-06-16 21:18:45', NULL, 0, '2019-06-16 14:18:45', '2019-06-16 14:18:45', 51, 2, NULL),
(84, 1, '2019-06-17 12:44:59', 'das', 0, '2019-06-17 05:44:59', '2019-06-17 05:44:59', 51, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` int(10) unsigned NOT NULL,
  `CustomerName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Birthday` date DEFAULT NULL,
  `Gender` tinyint(1) NOT NULL,
  `Address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustomerType` tinyint(4) NOT NULL,
  `booking_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delegatePerson` tinyint(1) NOT NULL DEFAULT '0',
  `Email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PhoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `CustomerName`, `Birthday`, `Gender`, `Address`, `CustomerType`, `booking_id`, `created_at`, `updated_at`, `delegatePerson`, `Email`, `PhoneNumber`) VALUES
(132, 'Sang Vo', NULL, 0, 'Nha Trang', 0, 66, '2019-06-15 09:24:39', '2019-06-15 09:24:39', 1, 'sangvo111@gmail.com', '0979304304'),
(133, 'Vo Van Sang', '1997-01-01', 1, 'Nha Trang', 1, 66, '2019-06-15 09:24:39', '2019-06-15 09:24:39', 0, NULL, NULL),
(134, 'Vo Thi A', '1997-01-01', 0, 'Nha Trang', 1, 66, '2019-06-15 09:24:39', '2019-06-15 09:24:39', 0, NULL, NULL),
(135, 'Vo Van B', '2006-01-01', 1, 'Nha Trang', 0, 66, '2019-06-15 09:24:39', '2019-06-15 09:24:39', 0, NULL, NULL),
(136, 'Sang Vo', NULL, 0, 'Nha Trang', 0, 67, '2019-06-15 13:36:10', '2019-06-15 13:36:10', 1, 'sangvo111@gmail.com', '0979340304'),
(137, 'Võ Văn Sang', '2004-06-15', 1, 'Nha Trang', 1, 67, '2019-06-15 13:36:10', '2019-06-15 13:36:10', 0, NULL, NULL),
(138, 'Sang Vo', NULL, 0, 'nha tran', 0, 68, '2019-06-15 14:18:34', '2019-06-15 14:18:34', 1, 'sangvo111@gmail.com', '0979340304'),
(139, 'dsa', '2004-06-15', 0, 'nha tran', 1, 68, '2019-06-15 14:18:34', '2019-06-15 14:18:34', 0, NULL, NULL),
(140, 'Sang Vo', NULL, 0, 'Nha Trang', 0, 69, '2019-06-16 10:01:12', '2019-06-16 10:01:12', 1, 'sangvo111@gmail.com', '0979340304'),
(141, 'Võ Văn Sang', '2004-06-14', 1, 'Nha Trang', 1, 69, '2019-06-16 10:01:12', '2019-06-16 10:01:12', 0, NULL, NULL),
(142, 'Sang Vo', NULL, 0, 'Nha Trang', 0, 70, '2019-06-16 10:31:46', '2019-06-16 10:31:46', 1, 'sangvo111@gmail.com', '0979340304'),
(143, 'Võ Văn Sang', '2004-06-14', 1, 'Nha Trang', 1, 70, '2019-06-16 10:31:46', '2019-06-16 10:31:46', 0, NULL, NULL),
(144, 'Sang Vo', NULL, 0, 'Nha Trang', 0, 71, '2019-06-16 10:34:24', '2019-06-16 10:34:24', 1, 'sangvo111@gmail.com', '0979340304'),
(145, 'Võ Văn Sang', '2004-06-14', 1, 'Nha Trang', 1, 71, '2019-06-16 10:34:24', '2019-06-16 10:34:24', 0, NULL, NULL),
(146, 'Sang Vo', NULL, 0, 'Nha trang', 0, 72, '2019-06-16 10:36:06', '2019-06-16 10:36:06', 1, 'sangvo111@gmail.com', '0979340340'),
(147, 'Võ Văn A', '2004-06-14', 1, 'Nha trang', 1, 72, '2019-06-16 10:36:06', '2019-06-16 10:36:06', 0, NULL, NULL),
(148, 'Sang Vo', NULL, 0, 'Nha Trang', 0, 73, '2019-06-16 10:39:16', '2019-06-16 10:39:16', 1, 'sangvo111@gmail.com', '0979340304'),
(149, 'Võ Văn SAng', '2004-06-14', 1, 'Nha Trang', 1, 73, '2019-06-16 10:39:16', '2019-06-16 10:39:16', 0, NULL, NULL),
(150, 'Sang Vo', NULL, 0, 'Nha Trang', 0, 74, '2019-06-16 10:57:55', '2019-06-16 10:57:55', 1, 'sangvo111@gmail.com', '0979340304'),
(151, 'Võ Văn Sang', '2004-06-14', 1, 'Nha Trang', 1, 74, '2019-06-16 10:57:55', '2019-06-16 10:57:55', 0, NULL, NULL),
(152, 'Sang Vo', NULL, 0, 'Nha Tràng', 0, 75, '2019-06-16 11:14:47', '2019-06-16 11:14:47', 1, 'sangvo111@gmail.com', '0979340304'),
(153, 'Võ Văn Sang', '2004-06-14', 1, 'Nha Tràng', 1, 75, '2019-06-16 11:14:47', '2019-06-16 11:14:47', 0, NULL, NULL),
(154, 'Sang Vo', NULL, 0, 'dsadsad', 0, 76, '2019-06-16 11:17:42', '2019-06-16 11:17:42', 1, 'sangvo111@gmail.com', '0979340394'),
(155, 'võ văn SAng', '2004-06-14', 1, 'dsadsad', 1, 76, '2019-06-16 11:17:42', '2019-06-16 11:17:42', 0, NULL, NULL),
(156, 'Sang Vo', NULL, 0, 'nha trang', 0, 77, '2019-06-16 11:20:31', '2019-06-16 11:20:31', 1, 'sangvo111@gmail.com', '0979340304'),
(157, 'Võ Văn Sang', '2004-06-14', 1, 'nha trang', 1, 77, '2019-06-16 11:20:31', '2019-06-16 11:20:31', 0, NULL, NULL),
(158, 'Sang Vo', NULL, 0, 'dsadfr', 0, 78, '2019-06-16 11:22:06', '2019-06-16 11:22:06', 1, 'sangvo111@gmail.com', '0979340304'),
(159, 'Võ VĂn Sang', '2004-06-14', 1, 'dsadfr', 1, 78, '2019-06-16 11:22:07', '2019-06-16 11:22:07', 0, NULL, NULL),
(160, 'Sang Vo', NULL, 0, 'Nha Trang', 0, 79, '2019-06-16 13:07:30', '2019-06-16 13:07:30', 1, 'sangvo111@gmail.com', '0979340304'),
(161, 'Võ Văn Sang', '2004-06-14', 1, 'Nha Trang', 1, 79, '2019-06-16 13:07:30', '2019-06-16 13:07:30', 0, NULL, NULL),
(162, 'Sang Vo', NULL, 0, 'Nha Trang', 0, 80, '2019-06-16 14:00:37', '2019-06-16 14:00:37', 1, 'sangvo111@gmail.com', '0979340030'),
(163, 'Võ Văn Sang', '2004-06-14', 1, 'Nha Trang', 1, 80, '2019-06-16 14:00:37', '2019-06-16 14:00:37', 0, NULL, NULL),
(164, 'Võ văn B', '2007-06-14', 0, 'Nha Trang', 0, 80, '2019-06-16 14:00:37', '2019-06-16 14:00:37', 0, NULL, NULL),
(165, 'Võ Văn C', '2007-06-14', 1, 'Nha Trang', 0, 80, '2019-06-16 14:00:37', '2019-06-16 14:00:37', 0, NULL, NULL),
(166, 'Sang Vo', NULL, 0, 'Nha Trang', 0, 81, '2019-06-16 14:13:36', '2019-06-16 14:13:36', 1, 'sangvo111@gmail.com', '0979340304'),
(167, 'Võ Văn SAng', '2004-06-14', 1, 'Nha Trang', 1, 81, '2019-06-16 14:13:36', '2019-06-16 14:13:36', 0, NULL, NULL),
(168, 'Sang Vo', NULL, 0, 'Nha trang', 0, 82, '2019-06-16 14:16:12', '2019-06-16 14:16:12', 1, 'sangvo111@gmail.com', '0979340304'),
(169, 'Võ Văn An', '2004-06-14', 1, 'Nha trang', 1, 82, '2019-06-16 14:16:12', '2019-06-16 14:16:12', 0, NULL, NULL),
(170, 'Sang Vo', NULL, 0, 'nha trang', 0, 83, '2019-06-16 14:18:45', '2019-06-16 14:18:45', 1, 'sangvo111@gmail.com', '0979340304'),
(171, 'Võ Văn Sang', '2004-06-14', 1, 'nha trang', 1, 83, '2019-06-16 14:18:45', '2019-06-16 14:18:45', 0, NULL, NULL),
(172, 'Sang Vo', NULL, 0, 'nha trang', 0, 84, '2019-06-17 05:44:59', '2019-06-17 05:44:59', 1, 'sangvo111@gmail.com', '0979340304'),
(173, 'Võ Văn Sang', '2004-06-13', 1, 'nha trang', 1, 84, '2019-06-17 05:44:59', '2019-06-17 05:44:59', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `EventID` int(10) unsigned NOT NULL,
  `EventName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Contents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(45, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(46, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(47, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(48, '2016_06_01_000004_create_oauth_clients_table', 1),
(49, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(57, '2019_04_18_144843_create_permission_tables', 2),
(88, '2014_10_12_000000_create_users_table', 3),
(89, '2014_10_12_100000_create_password_resets_table', 3),
(90, '2019_04_13_044943_create_places_table', 3),
(91, '2019_04_13_045100_create_scenic__cultures_table', 3),
(92, '2019_05_03_213317_create_tour_guiders_table', 3),
(93, '2019_05_03_213341_create_promotions_table', 3),
(94, '2019_05_03_213516_create_reviews_table', 3),
(95, '2019_05_03_213917_create_bookings_table', 3),
(96, '2019_05_03_214155_create_tours_table', 3),
(114, '2019_05_03_214325_create_schedules_table', 4),
(115, '2019_05_03_214440_create_events_table', 4),
(116, '2019_05_03_214450_create_news_table', 4),
(117, '2019_05_06_141239_create_customers_table', 4),
(118, '2019_05_06_164540_create_payment_table', 4),
(119, '2019_05_06_165231_update_booking_table', 5),
(120, '2019_05_07_134447_update_booking_foreign_key_tour', 6),
(121, '2019_05_08_160735_update_place_table_image', 6),
(122, '2019_05_13_103720_add_colmun_gender_tourguider', 7),
(125, '2019_05_16_210130_add_column__scencic_name', 8),
(126, '2019_05_20_132042_create_table_scenic__culture_tour', 8),
(127, '2019_05_20_143111_create_promotion_tour_pivot_table', 9),
(128, '2019_05_22_193357_update_table_reviews_struct', 10),
(129, '2019_05_22_211017_update_table_reviews_with_tours', 11),
(130, '2019_05_23_135106_update_table_schedule__content', 12),
(131, '2019_05_23_180618_create_foreign_key_schedule_on_tour', 13),
(132, '2019_05_23_182216_delele_foreignkey_tou_id', 14),
(133, '2019_05_23_221916_delete_column_tour_id', 15),
(134, '2019_05_24_110011_update_table_schedule_to_many_many', 16),
(135, '2019_05_24_111008_create_schedule_tour_guider_pivot_table', 17),
(136, '2019_05_31_124104_create_table_social_networks', 18),
(137, '2019_06_03_103007_add_column_users_table_nullable', 19),
(138, '2019_06_04_175754_update_table_bookings_foreign_key', 20),
(141, '2019_06_08_231342_update_table_customer_booking', 21),
(142, '2019_06_11_171706_update_null_booking_table', 22),
(143, '2019_06_13_174849_update_table_payment_booking', 22);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\User', 2),
(3, 'App\\User', 2),
(1, 'App\\User', 3),
(2, 'App\\User', 3),
(4, 'App\\User', 3),
(1, 'App\\User', 4),
(1, 'App\\User', 5),
(1, 'App\\User', 6),
(1, 'App\\User', 7),
(1, 'App\\User', 8),
(4, 'App\\User', 8),
(1, 'App\\User', 11),
(1, 'App\\User', 12),
(1, 'App\\User', 13),
(1, 'App\\User', 41),
(1, '', 42),
(1, '', 43),
(1, '', 44),
(1, '', 45),
(1, '', 46);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `NewsID` bigint(20) unsigned NOT NULL,
  `Title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ImgUrl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Contents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `State` tinyint(4) NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `ApprovedBy` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` bigint(20) unsigned NOT NULL,
  `PaymentAmount` double NOT NULL,
  `booking_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `PaymentDate` datetime NOT NULL,
  `PaymentType` tinyint(4) NOT NULL,
  `PaypalPaymentID` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `PaymentAmount`, `booking_id`, `created_at`, `updated_at`, `PaymentDate`, `PaymentType`, `PaypalPaymentID`) VALUES
(7, 2800000, 66, '2019-06-15 09:24:39', '2019-06-15 09:24:39', '2019-06-15 16:24:39', 1, NULL),
(8, 1200000, 67, '2019-06-15 13:36:10', '2019-06-15 13:36:10', '2019-06-15 20:36:10', 1, NULL),
(9, 1200000, 68, '2019-06-15 14:18:34', '2019-06-15 14:18:34', '2019-06-15 21:18:34', 1, NULL),
(10, 1200000, 69, '2019-06-16 10:01:12', '2019-06-16 10:01:12', '2019-06-16 17:01:12', 1, NULL),
(11, 1200000, 70, '2019-06-16 10:31:46', '2019-06-16 10:31:46', '2019-06-16 17:31:46', 1, NULL),
(12, 1200000, 71, '2019-06-16 10:34:24', '2019-06-16 10:34:24', '2019-06-16 17:34:24', 1, NULL),
(13, 1200000, 72, '2019-06-16 10:36:06', '2019-06-16 10:36:06', '2019-06-16 17:36:06', 1, NULL),
(14, 1200000, 73, '2019-06-16 10:39:17', '2019-06-16 10:39:17', '2019-06-16 17:39:17', 1, NULL),
(15, 1200000, 74, '2019-06-16 10:57:58', '2019-06-16 10:57:58', '2019-06-16 17:57:58', 1, NULL),
(16, 1200000, 75, '2019-06-16 11:14:47', '2019-06-16 11:14:47', '2019-06-16 18:14:47', 1, NULL),
(17, 1200000, 76, '2019-06-16 11:17:42', '2019-06-16 11:17:42', '2019-06-16 18:17:42', 1, NULL),
(18, 1200000, 77, '2019-06-16 11:20:32', '2019-06-16 11:20:32', '2019-06-16 18:20:32', 1, NULL),
(19, 1200000, 78, '2019-06-16 11:22:07', '2019-06-16 11:22:07', '2019-06-16 18:22:07', 1, NULL),
(20, 1200000, 79, '2019-06-16 13:07:32', '2019-06-16 13:07:32', '2019-06-16 20:07:32', 1, NULL),
(21, 3500000, 80, '2019-06-16 14:00:45', '2019-06-16 14:00:45', '2019-06-16 21:00:45', 1, NULL),
(22, 1500000, 81, '2019-06-16 14:13:37', '2019-06-16 14:13:37', '2019-06-16 21:13:37', 1, NULL),
(23, 1500000, 82, '2019-06-16 14:16:12', '2019-06-16 14:16:12', '2019-06-16 21:16:12', 1, NULL),
(24, 1500000, 83, '2019-06-16 14:18:45', '2019-06-16 14:18:45', '2019-06-16 21:18:45', 1, NULL),
(25, 1500000, 84, '2019-06-17 05:45:03', '2019-06-17 05:45:41', '2019-06-17 12:45:03', 2, 'PAYID-LUDSR6Y4PV73478WH966815L');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Xem thông tin cá nhân', 'web', '2019-04-24 10:08:47', '2019-04-24 10:08:47'),
(2, 'create-users', 'web', '2019-04-24 10:08:48', '2019-04-24 10:08:48'),
(3, 'update-users', 'web', '2019-04-24 10:08:48', '2019-04-24 10:08:48'),
(4, 'delete-users', 'web', '2019-04-24 10:08:48', '2019-04-24 10:08:48'),
(5, 'Không kiểm duyệt bình luận', 'web', '2019-05-28 21:00:00', '2019-05-28 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE IF NOT EXISTS `places` (
  `PlaceID` int(10) unsigned NOT NULL,
  `PlaceName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Contents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Region` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ImgUrl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no-image.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`PlaceID`, `PlaceName`, `Description`, `Contents`, `Region`, `ImgUrl`, `created_at`, `updated_at`) VALUES
(52, 'Khánh hòa', 'Thành phố biển Nha Trang', 'Et eaque aut autem voluptate. Molestiae aut magnam nihil id ea. Eius beatae ut ut sequi aut nisi. Nesciunt rerum earum est ipsa ut temporibus.', 'MienTrung', 'https://lorempixel.com/800/600/city/?82147', '2019-05-15 06:20:15', '2019-05-16 05:33:20'),
(56, 'Đà nẵng', 'Thành phố đáng sống', '<p>L&agrave; một th&agrave;nh phố lớn của việt nam 😉</p>', 'MienNam', '2ea65e7104e213c795fd5159341892789ee838a0.jpeg', '2019-05-15 06:20:15', '2019-06-08 05:08:53'),
(59, 'Quảng Ngãi', 'Tình yêu về đất quảng', '<p>Cảm thấy vui i''m in love</p>', 'TayBac', 'https://lorempixel.com/800/600/city/?49577', '2019-05-15 06:20:15', '2019-06-08 05:10:18'),
(61, 'Arizona', 'abc da', '<p>Hohosada</p>', 'MienBac', 'https://lorempixel.com/800/600/city/?13754', '2019-05-15 06:20:15', '2019-06-08 05:17:42'),
(62, 'Georgia', 'Laborum alias sapiente maxime et quod molestiae deleniti. Voluptas doloremque autem earum et qui quia ex neque. Consequatur harum non omnis impedit.', 'Voluptas aut mollitia officiis sequi. Aut quas modi delectus ipsum earum. Architecto quis est magnam sint autem quibusdam consequatur esse. Fuga possimus libero qui minima numquam rerum.', 'TayBac', 'https://lorempixel.com/800/600/city/?33809', '2019-05-15 06:20:15', '2019-05-15 06:20:15'),
(63, 'Hawaii', 'Dignissimos omnis modi numquam rerum debitis ad optio maiores. Cupiditate iure exercitationem sapiente commodi ullam laudantium.', 'Ea est perspiciatis magnam in praesentium. Vel voluptatem non aperiam in repellat a atque. Aut consequatur soluta vel.', 'TayNguyen', 'https://lorempixel.com/800/600/city/?17308', '2019-05-15 06:20:15', '2019-05-15 06:20:15'),
(64, 'Rhode Island', 'Similique illo quis voluptas quia sit. Minima consequatur sit ipsam occaecati. Voluptate aut veniam qui in nisi asperiores esse a.', 'Dolorum exercitationem odio repudiandae aut sequi odit. Magnam est nulla qui et veritatis optio magnam. Voluptas aperiam iste exercitationem. Voluptatem nostrum ipsam aut qui tempore aut velit harum.', 'TayNguyen', 'https://lorempixel.com/800/600/city/?45024', '2019-05-15 06:20:15', '2019-05-15 06:20:15'),
(65, 'Texas', 'In aut aperiam voluptatem consequatur. Vero delectus voluptatem et accusantium. Quibusdam sint a enim excepturi consequatur.', 'Perferendis sapiente ut et labore nostrum. Deserunt repudiandae inventore nihil.', 'TayNguyen', 'https://lorempixel.com/800/600/city/?10922', '2019-05-15 06:20:15', '2019-05-15 06:20:15'),
(66, 'Cần thơ', 'Thủ phủ miền tây', 'Xin chào miền tây', 'MienTay', '5aaf17c6f5723981d480c0ec90c5113ec4a51a85.jpeg', '2019-05-16 05:10:49', '2019-05-16 05:10:49');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE IF NOT EXISTS `promotions` (
  `PromotionID` int(10) unsigned NOT NULL,
  `Contents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`PromotionID`, `Contents`, `created_at`, `updated_at`) VALUES
(24, 'khuyến mãi 30/04/2019', '2019-05-12 07:35:40', '2019-05-12 07:35:40'),
(25, 'Sinh nhật bác hồ', '2019-05-12 07:39:44', '2019-05-12 07:39:44'),
(26, 'quốc tế thiếu nhi', '2019-05-12 07:41:07', '2019-05-12 07:41:07'),
(27, 'Tết nguyên đán', '2019-05-15 05:29:11', '2019-05-15 05:29:11');

-- --------------------------------------------------------

--
-- Table structure for table `promotion_tour`
--

CREATE TABLE IF NOT EXISTS `promotion_tour` (
  `promotion_id` int(10) unsigned NOT NULL,
  `tour_id` int(10) unsigned NOT NULL,
  `Discount` double(8,2) NOT NULL,
  `ExpiredDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion_tour`
--

INSERT INTO `promotion_tour` (`promotion_id`, `tour_id`, `Discount`, `ExpiredDate`) VALUES
(24, 50, 7.00, '2019-06-14 22:50:56'),
(26, 49, 14.00, '2019-06-05 22:41:56'),
(26, 51, 10.00, '2019-06-15 16:08:16'),
(26, 52, 10.00, '2019-06-07 16:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `ReviewID` bigint(20) unsigned NOT NULL,
  `Rating` tinyint(4) NOT NULL,
  `Contents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `spam` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approve_by` int(11) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `tour_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`ReviewID`, `Rating`, `Contents`, `spam`, `created_at`, `updated_at`, `approve_by`, `user_id`, `tour_id`) VALUES
(1, 2, 'Repellendus voluptas nihil odio atque voluptatibus. Iure numquam pariatur aut. Aut ab sed quaerat quae occaecati nihil. Nobis odio consectetur et id.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', 2, 3, 48),
(3, 2, 'Consequatur minima numquam sed eius cupiditate aut. Illum sit esse quo explicabo. Facilis qui beatae error amet ratione.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 7, 48),
(4, 2, 'Delectus veniam aut maiores autem expedita. Quia sunt voluptatem vero eos architecto qui. Unde culpa totam quis explicabo ut rerum.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 6, 49),
(5, 1, 'Iusto architecto voluptatem consequatur. Culpa est est ullam tempore eius itaque veniam. A dolore praesentium nihil.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 2, 51),
(7, 1, 'Et sunt quaerat culpa maxime illum et ut. Sunt est rerum nisi ex non. Sed voluptas ratione ipsam veniam quo ducimus.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 8, 51),
(8, 4, 'Fugiat rerum ut sed soluta. Quis temporibus qui cum. Voluptatem omnis facere id voluptates earum. Dolores qui quia doloremque pariatur.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 8, 50),
(9, 1, 'Error eveniet est et et voluptate magnam nisi. Ea quia itaque voluptas est rem aperiam. Dolorum quasi vel nesciunt temporibus sed nam atque.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 6, 49),
(10, 5, 'Ipsum fugiat sed dolores eligendi ut vero. Dolores odio et est nam nostrum dolorem. Dolore omnis placeat suscipit velit placeat.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 3, 50),
(11, 3, 'Reprehenderit asperiores temporibus nihil ex est. Tenetur est facilis at et ut. Amet explicabo repellendus non nihil. Deserunt quis eum sit odit.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 8, 51),
(13, 2, 'Quia rem labore veritatis minima tenetur. Consequuntur illum sit maiores ut aut expedita vel iste. Deleniti laboriosam eum vel qui qui.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 6, 51),
(14, 1, 'Sed quia quisquam laboriosam et voluptatem asperiores cumque. Velit ut enim voluptas ea odit et sed. Cumque non voluptas a velit accusantium sunt.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 8, 51),
(15, 5, 'Est tenetur facere voluptate. Nisi minima in voluptates repellat temporibus sed rerum. Minima aspernatur ut in et.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 6, 48),
(16, 3, 'Consequatur nemo odit perspiciatis. Soluta omnis molestias maxime modi. Explicabo excepturi et odit similique non. Nulla doloribus ad possimus.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 3, 50),
(17, 3, 'Adipisci est ab dignissimos debitis aut quia sed. Dolore dolorum sint sint qui id libero alias aliquam. Qui aut officiis omnis quam similique.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 2, 50),
(18, 4, 'Quibusdam est modi ducimus voluptas. Distinctio id deleniti corrupti accusantium. Nam magni earum magni eius sapiente tempora.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 2, 50),
(19, 4, 'Quia in voluptatem voluptates aliquid. Numquam provident eaque quia.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 7, 50),
(20, 4, 'Magnam accusamus at fugit enim aut earum. Aspernatur et omnis non dolorem fuga. Laudantium tempora totam vel.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 6, 48),
(21, 5, 'Facere pariatur eveniet ut saepe non fuga quo. Consectetur vel iste velit. Ut alias consequatur reprehenderit harum. Aliquam totam et consectetur.', '1', '2019-05-24 15:50:15', '2019-05-24 15:50:15', NULL, 3, 50),
(22, 4, 'Est et nostrum suscipit quis. Non minima sint et. Et libero voluptas soluta quo tenetur laboriosam. Tenetur similique eos fugit at placeat dolores.', '0', '2019-05-24 15:50:16', '2019-06-15 03:40:46', 2, 2, 49),
(24, 5, 'Est qui provident ea consequatur. Excepturi magni omnis vitae odio ipsam.', '0', '2019-05-24 15:50:16', '2019-05-25 17:44:45', NULL, 3, 48),
(25, 2, 'Aut aut dolore qui. Accusamus nihil possimus eos et aut. Et et rem expedita dolorem molestiae esse reiciendis et. Autem alias qui quam.', '0', '2019-05-24 15:50:16', '2019-05-25 17:47:40', NULL, 7, 48),
(26, 1, 'Vitae aut consequatur eaque ex optio pariatur. Ut velit nobis suscipit numquam. In ut repellat incidunt. Sunt laboriosam veritatis adipisci fugit.', '1', '2019-05-24 15:50:16', '2019-05-24 15:50:16', NULL, 3, 50),
(27, 2, 'Id dolores architecto ab optio facilis quidem. Molestiae voluptas ea provident qui at dolorem quis. Perspiciatis quod et ut.', '0', '2019-05-24 15:50:16', '2019-05-25 17:52:28', 2, 7, 50),
(28, 1, 'Repellendus officiis nemo numquam quod iure. Et tempore exercitationem ex minima nulla. Deserunt earum voluptas sint nemo eaque non doloremque id.', '1', '2019-05-24 15:50:16', '2019-05-24 15:50:16', NULL, 7, 51),
(30, 2, 'Suscipit magni ipsum ex sed nihil fugiat. Dolore ut quam quasi ducimus. Hic veritatis non minima dolorum. Sunt optio natus illum dicta fugit ab.', '1', '2019-05-24 15:50:16', '2019-05-24 15:50:16', NULL, 6, 48),
(33, 5, 'Tour hấp dẫn cảm ơn những chuyến đi thật tuyệt', '0', '2019-05-30 09:01:06', '2019-05-30 09:01:06', 2, 2, 49),
(34, 5, 'đậu xanh', '0', '2019-05-30 09:11:45', '2019-05-30 09:11:45', 2, 2, 49),
(35, 5, 'test comment', '0', '2019-05-30 09:30:33', '2019-05-30 09:30:33', 2, 2, 49),
(37, 5, 'trending', '0', '2019-05-30 09:32:25', '2019-05-30 09:32:25', 2, 2, 49),
(45, 5, 'chán ghê', '0', '2019-05-30 10:20:12', '2019-05-30 10:20:12', 2, 2, 49),
(46, 5, 'Hiển thị ngay', '0', '2019-06-03 06:21:26', '2019-06-03 06:48:03', 2, 41, 49),
(47, 5, 'Xin chào anh', '0', '2019-06-10 16:55:26', '2019-06-10 16:55:26', 2, 2, 50),
(48, 5, 'Uk chào bạn', '0', '2019-06-11 11:03:58', '2019-06-11 11:03:58', 2, 2, 50),
(49, 5, 'test', '0', '2019-06-12 06:12:46', '2019-06-12 06:12:46', 2, 2, 48),
(50, 5, 'jhjhnj', '0', '2019-06-15 03:41:21', '2019-06-15 03:41:21', 2, 2, 51);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'member', 'web', '2019-04-24 10:08:48', '2019-04-24 10:08:48'),
(2, 'mod', 'web', '2019-04-24 10:08:48', '2019-04-24 10:08:48'),
(3, 'admin', 'web', '2019-04-24 10:08:48', '2019-04-24 10:08:48'),
(4, 'Partime', 'web', '2019-05-31 17:53:36', '2019-05-31 17:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(3, 1),
(1, 2),
(2, 2),
(5, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `scenic__cultures`
--

CREATE TABLE IF NOT EXISTS `scenic__cultures` (
  `ScenicID` int(10) unsigned NOT NULL,
  `place_id` int(10) unsigned NOT NULL,
  `Description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Contents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `HitCount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ImgUrl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ScenicName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scenic__cultures`
--

INSERT INTO `scenic__cultures` (`ScenicID`, `place_id`, `Description`, `Contents`, `HitCount`, `ImgUrl`, `state`, `created_at`, `updated_at`, `ScenicName`) VALUES
(31, 66, 'Dignissimos voluptas soluta vel tempora nihil. Ad placeat ratione reiciendis. Laudantium veritatis debitis eos quasi nisi qui.', 'Hic adipisci repudiandae culpa autem at ipsa et. Distinctio pariatur sequi eum minus tempore occaecati sint. Quidem tenetur et dolore sapiente assumenda facere.', 202, 'https://lorempixel.com/800/600/nature/?39072', 1, '2019-05-16 14:09:56', '2019-05-16 14:09:56', 'Netherlands Antilles'),
(32, 62, 'Voluptatem repellat omnis odio nihil. Et animi excepturi nesciunt asperiores commodi. Doloremque vero modi fugiat in.', 'Quia beatae veritatis facere. Ut porro sequi soluta. Tempore velit necessitatibus ratione quam voluptatem voluptas. Qui est consequatur consequatur iure.', 226, 'https://lorempixel.com/800/600/nature/?50902', 2, '2019-05-16 14:09:56', '2019-05-16 14:09:56', 'Guadeloupe'),
(33, 63, 'Reiciendis quod aut aperiam est. Et eum eum numquam optio voluptas minus. Nihil ea tempora aut delectus reprehenderit sit.', 'Sed maxime debitis sit occaecati cumque optio. Non aut accusantium sed possimus error consequatur nihil voluptas. Ex laboriosam exercitationem aut nostrum delectus porro reiciendis. Impedit voluptatem eos animi quia repudiandae inventore veniam.', 237, 'https://lorempixel.com/800/600/nature/?44494', 2, '2019-05-16 14:09:56', '2019-05-16 14:09:56', 'Oman'),
(34, 65, 'Sunt alias saepe et odio quam quis. Libero eius et et. Hic maiores accusamus neque recusandae hic ea mollitia. Eos aut ut officiis vero voluptas.', 'Enim ratione impedit labore labore mollitia modi. Eius architecto aliquam laborum ut asperiores quasi. Et eum qui et laudantium. Voluptas dolores eligendi dignissimos animi.', 590, 'https://lorempixel.com/800/600/nature/?46044', 2, '2019-05-16 14:09:56', '2019-05-16 14:09:56', 'Heard Island and McDonald Islands'),
(35, 65, 'Nisi id quod sequi ut. Molestiae et nesciunt quod et cum vel. Iste ab temporibus quidem pariatur eius voluptatum molestias.', 'Fugit dolorem aut sunt assumenda vel. Illo quasi numquam maiores similique nihil iure et blanditiis. Saepe laboriosam aliquid hic in placeat reiciendis praesentium. A necessitatibus et rerum. Nemo ea ipsam optio omnis voluptate maiores.', 666, 'https://lorempixel.com/800/600/nature/?14286', 0, '2019-05-16 14:09:56', '2019-05-16 14:09:56', 'Estonia'),
(37, 56, 'Illo doloremque sit nulla possimus quaerat excepturi tenetur. In officia aut culpa alias qui et. Non unde adipisci voluptatem.', 'Est unde quibusdam iure sit ut neque. Distinctio beatae ab saepe cumque id unde at accusamus. Culpa repellendus eum optio perspiciatis qui non accusantium. Enim distinctio repudiandae eum fugiat. Natus incidunt aspernatur consequuntur molestias.', 513, 'https://lorempixel.com/800/600/nature/?81681', 1, '2019-05-16 14:09:56', '2019-05-16 14:09:56', 'Kenya'),
(39, 59, 'Qui est quia recusandae dicta aut sed. Perspiciatis molestias repellendus est sunt voluptates rerum. Et id quaerat qui suscipit est aut quod.', 'Eaque debitis doloribus eum. Ratione minima fugit et perferendis est aliquid. Dignissimos magni aut velit accusantium.', 630, 'https://lorempixel.com/800/600/nature/?61760', 2, '2019-05-16 14:09:56', '2019-05-16 14:09:56', 'Iran'),
(40, 59, 'Pariatur autem repudiandae recusandae expedita excepturi mollitia. Laboriosam sunt hic animi qui nihil et quidem. Dolorum quo quia et.', 'Explicabo perferendis blanditiis pariatur eum. Tempore sit doloribus veritatis unde. Iure tenetur distinctio necessitatibus nemo possimus.', 153, 'https://lorempixel.com/800/600/nature/?33737', 2, '2019-05-16 14:09:56', '2019-05-16 14:09:56', 'Eritrea'),
(42, 52, 'Facilis magnam quia expedita natus eaque dolores deserunt earum. Et reprehenderit non necessitatibus nisi dignissimos molestiae et.', 'Voluptate deserunt aspernatur est voluptates non odio. Molestiae fugit dicta veritatis. Ut laboriosam vero occaecati eius dignissimos quia repudiandae. Magnam ipsam nostrum non est expedita pariatur totam.', 525, 'https://lorempixel.com/800/600/nature/?68880', 2, '2019-05-16 14:09:57', '2019-05-16 14:09:57', 'Honduras'),
(44, 64, 'Commodi quod rerum at voluptate ex. Esse earum fuga sed quos. Alias est vel molestias. Fuga placeat debitis perspiciatis in.', 'Qui ipsum vel est non consequatur sed aut. Magnam quidem exercitationem quis a. Delectus non molestias voluptatem enim esse facilis expedita voluptatibus.', 811, 'https://lorempixel.com/800/600/nature/?16051', 2, '2019-05-16 14:09:57', '2019-05-16 14:09:57', 'Gambia'),
(45, 65, 'Aut et illo consequatur doloremque aut natus quam accusamus. Vel minus omnis eum fugiat optio. Ducimus dolore quia sequi qui.', 'Vel voluptatem culpa commodi suscipit. Ipsa non repudiandae libero molestias.', 211, 'https://lorempixel.com/800/600/nature/?50355', 0, '2019-05-16 14:09:57', '2019-05-16 14:09:57', 'Iran'),
(46, 52, 'Fugit sunt molestias tempore fugiat est id. Non similique voluptas similique soluta. Quis autem aliquid cumque est vel.', 'Reiciendis quia modi doloremque deleniti enim placeat consectetur. Quis placeat sed et nam. Enim laudantium aut eius. Tempore quis pariatur asperiores est.', 458, 'https://lorempixel.com/800/600/nature/?68211', 1, '2019-05-16 14:09:57', '2019-05-16 14:09:57', 'Botswana'),
(48, 66, 'Quos mollitia veritatis tempora sunt. Ea temporibus saepe eius molestiae vero. Quo fuga occaecati in autem. Nemo ratione nisi magnam aut.', 'Perspiciatis facere est minus sint magnam quo. Alias qui dolores omnis id illum. Omnis ad sunt voluptatem.', 732, 'https://lorempixel.com/800/600/nature/?68629', 2, '2019-05-16 14:09:57', '2019-05-16 14:09:57', 'Nauru'),
(50, 65, 'Aut impedit id sit. Non aut excepturi eveniet rem sit ullam. Cum nam nemo et.', 'Cum reiciendis est voluptatem et a rem. Dolorum aut fuga sit at voluptas voluptatem. Aut quasi dolor expedita quas. Qui praesentium aliquid accusamus sit enim.', 21, 'https://lorempixel.com/800/600/nature/?21702', 1, '2019-05-16 14:09:57', '2019-05-16 14:09:57', 'Singapore'),
(51, 64, 'Doloremque quam deserunt maiores quia dignissimos quaerat minus. Dolores aut repellat ex. Rerum molestiae expedita quod dicta in natus odit.', 'Animi delectus debitis blanditiis impedit enim delectus nesciunt commodi. Nisi nobis sapiente nesciunt atque illo ipsam. Itaque cum labore et dolorem occaecati.', 727, 'https://lorempixel.com/800/600/nature/?35539', 2, '2019-05-16 14:09:57', '2019-05-16 14:09:57', 'Pitcairn Islands'),
(53, 52, 'Ut praesentium qui laborum deserunt. In consectetur aspernatur perspiciatis doloribus corporis. Aut et nemo voluptatem.', 'Rerum neque consequatur autem ut voluptatum. Ducimus tenetur porro voluptas sunt. Dolores quia aliquid dolorem temporibus pariatur perspiciatis error.', 14, 'https://lorempixel.com/800/600/nature/?18697', 0, '2019-05-16 14:09:57', '2019-05-16 14:09:57', 'Cayman Islands'),
(55, 62, 'Omnis laborum beatae molestiae. Culpa esse nisi veritatis sed excepturi qui dicta. Temporibus molestias libero qui molestiae et quia vel est.', 'Animi et qui dolor sed perferendis delectus. Et consequuntur est excepturi veritatis porro. Optio adipisci sit qui ab.', 273, 'https://lorempixel.com/800/600/nature/?72324', 1, '2019-05-16 14:09:57', '2019-05-16 14:09:57', 'Netherlands Antilles'),
(57, 59, 'Quod fugiat ea vitae rerum saepe. Qui dicta ut dolorum possimus hic. Laborum asperiores et non ipsa.', 'Repellendus aut debitis nihil blanditiis aut. Voluptas minima est et similique id. Mollitia aut autem minus sit ullam et laboriosam voluptates.', 574, 'https://lorempixel.com/800/600/nature/?99040', 1, '2019-05-16 14:09:57', '2019-05-16 14:09:57', 'Switzerland'),
(58, 63, 'Qui magni ipsum facere perferendis doloribus vel. Nostrum amet quia autem libero veritatis. Non sequi vero doloremque animi qui dolorem.', 'Autem minima nemo esse qui dolorem. Eos praesentium facere atque et ullam minus ex. Accusamus sed iste in qui. Et vel ipsa inventore voluptatem labore excepturi.', 836, 'https://lorempixel.com/800/600/nature/?21727', 2, '2019-05-16 14:09:57', '2019-05-16 14:09:57', 'Tajikistan'),
(59, 52, 'Numquam perferendis velit quia corrupti nulla quia ut aperiam. Possimus ullam reprehenderit omnis dolorem non placeat dignissimos impedit.', 'Et pariatur quia quia placeat libero animi. Eos quibusdam ipsum magnam.', 815, 'https://lorempixel.com/800/600/nature/?45603', 1, '2019-05-16 14:09:57', '2019-05-16 14:09:57', 'Thailand'),
(60, 62, 'Est accusamus tempora provident eum dolore dolor atque. Et dicta rerum eum soluta. Fugiat omnis quidem perferendis voluptates tempore magni.', 'Sint est praesentium corrupti nesciunt est in. Quasi quam at possimus ea cum totam vitae. Natus aperiam ex voluptate omnis quo ad et eos.', 759, 'https://lorempixel.com/800/600/nature/?47212', 1, '2019-05-16 14:09:57', '2019-05-16 14:09:57', 'Belarus'),
(61, 63, 'Sa Pa được mọi người biết đến là một thị trấn vùng cao. Sapa là một khu nghỉ dưỡng nổi tiếng bậc nhất huyện Sa Pa, thành phố Lào Cai, Việt Nam.', '<p>Nơi đ&acirc;y mang bao nhiều điều tuyệt diệu của tự nhi&ecirc;n, phong cảnh thi&ecirc;n nhi&ecirc;n với sự kết hợp h&agrave;i h&ograve;a giữa n&uacute;i, tuyết, thi&ecirc;n nhi&ecirc;n v&agrave; con người, vẻ đẹp của Sapa c&oacute; cả đường n&eacute;t, h&igrave;nh khối thơ mộng, cảnh quan của v&ugrave;ng đất trời T&acirc;y Bắc sẽ khiến c&aacute;c bạn th&iacute;ch m&ecirc; lu&ocirc;n đ&oacute;. Khi đến với Sapa, bạn c&oacute; thể ngắm tuyết rơi, c&ugrave;ng nhau uống rượu cần, ăn những m&oacute;n ăn l&agrave; đặc sản của v&ugrave;ng cao. Bạn sẽ v&ocirc; c&ugrave;ng th&iacute;ch th&uacute; với việc ngắm hoa mận nở trắng x&oacute;a đẹp một c&aacute;ch thơ mộng tại Sapa. Với những ưu &aacute;i m&agrave; thi&ecirc;n nhi&ecirc;n ban tặng, Sapa chắc chắn sẽ khiến cho du kh&aacute;ch cảm nhận được vẻ đẹp thực sự của Sapa thơ mộng, những vẻ đẹp tiềm ẩn m&agrave; chỉ tại Sapa mới c&oacute;. Đ&acirc;y được đ&aacute;nh gi&aacute; l&agrave; một trong những thắng cảnh đẹp nhất Việt Nam.</p>\n<p><img src="https://toplist.vn/images/800px/sapa-lao-cai-16084.jpg" alt="Sapa" width="613" height="402" /></p>\n<p>&nbsp;</p>', 0, '5bc6af81a07c3b4eb98a299e1ed90b40c13022db.jpeg', 1, '2019-06-10 17:56:59', '2019-06-10 18:19:12', 'Sapa - Lào Cai 2019');

-- --------------------------------------------------------

--
-- Table structure for table `scenic__culture_tour`
--

CREATE TABLE IF NOT EXISTS `scenic__culture_tour` (
  `id` int(10) unsigned NOT NULL,
  `scenic_id` int(10) unsigned NOT NULL,
  `tour_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scenic__culture_tour`
--

INSERT INTO `scenic__culture_tour` (`id`, `scenic_id`, `tour_id`) VALUES
(1, 33, 50),
(2, 32, 50),
(3, 31, 50),
(4, 58, 49),
(5, 37, 52),
(6, 34, 52),
(9, 32, 48),
(10, 31, 48),
(11, 32, 53),
(12, 31, 53);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE IF NOT EXISTS `schedules` (
  `id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Contents` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `created_at`, `updated_at`, `Contents`) VALUES
(51, '2019-05-24 04:23:33', '2019-05-28 09:35:17', 'Lịch trình du lịch đà lạt'),
(52, '2019-05-24 04:23:33', '2019-05-24 12:07:09', 'Lịch trình'),
(53, '2019-05-24 04:23:33', '2019-05-24 04:23:33', 'Iure dolor ut cupiditate temporibus eos. In temporibus deleniti culpa nostrum. Quasi id aut et. Rem consequuntur id facere et natus.'),
(55, '2019-05-24 04:23:33', '2019-05-24 04:23:33', 'Occaecati atque minima deserunt eum non nemo porro. Neque saepe totam tenetur hic sed ut.'),
(56, '2019-05-24 06:26:00', '2019-05-24 06:26:00', 'Thăm quan khu du lịch lý sơn');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_tour_guider`
--

CREATE TABLE IF NOT EXISTS `schedule_tour_guider` (
  `schedule_id` int(10) unsigned NOT NULL,
  `tour_guider_id` int(10) unsigned NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `Contents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedule_tour_guider`
--

INSERT INTO `schedule_tour_guider` (`schedule_id`, `tour_guider_id`, `StartTime`, `EndTime`, `Contents`, `created_at`, `updated_at`) VALUES
(51, 10, '2019-05-30 07:00:00', '2019-05-30 11:00:00', 'Xe và HDV đón quý khách tại văn phòng công ty Bazan Travel và các điểm hẹn khác trong chương trình đón. Sau đó, xe khởi hành đưa đoàn đến Nha Trang. Trên xe quý khách nghỉ ngơi và thư giãn tại các trạm dừng chân trên cung đường đoàn đi qua.', '2019-05-29 08:12:37', '2019-05-29 08:12:37'),
(51, 32, '2019-05-30 13:00:00', '2019-05-30 15:00:00', 'Đoàn nhận ghế dù tham quan tắm biển Bãi Dài, quý khách sẽ bị chinh phục ngay bởi một bãi cát dài mịn màng dưới chân kèm với đó là một nét hoang sơ còn chưa được con người khai phá. Biển cạn, nước chỉ khoảng tới đầu gối, bạn có thể nô đùa cùng sóng biển hay thả mình trong làn nước trong xanh, cảm giác thật thú vị và vô cùng dễ chịu.', '2019-05-29 08:13:15', '2019-05-29 08:13:15'),
(51, 33, '2019-05-30 15:15:00', '2019-05-30 17:00:00', 'Quý khách tham quan mua sắm Yến sào Nha Trang tốt nhất, giá cả rẻ nhất. Được dùng trà Yến miễn phí và nếm vị Yến sào Nha Trang chính hiệu. Kế đến, quý khách sẽ tận mắt nhìn thấy các quy trình sơ chế tổ Yến, được phổ biển tỉ mỉ kỹ thuật xây dựng nhà chim và nghệ thuật dẫn dụ chim Yến vào nhà. Quý khách sẽ được nghe thuyết minh sâu sắc vòng đời chim Yến. Hấp dẫn nhất là quý khách được vào bên trong nhà chim, được sờ thấy những chiếc tổ Yến và nhìn thấy chim Yến cư ngụ trong môi trường nhà phố.', '2019-05-29 08:13:59', '2019-05-29 08:13:59');

-- --------------------------------------------------------

--
-- Table structure for table `social_networks`
--

CREATE TABLE IF NOT EXISTS `social_networks` (
  `id` int(10) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_networks`
--

INSERT INTO `social_networks` (`id`, `user_id`, `type`, `social_id`, `created_at`, `updated_at`) VALUES
(8, 41, 1, '1739974119439311', '2019-06-03 04:52:31', '2019-06-03 04:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE IF NOT EXISTS `tours` (
  `TourID` int(10) unsigned NOT NULL,
  `TourName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TourDescription` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateDeparture` datetime NOT NULL,
  `DateBack` datetime NOT NULL,
  `Note` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ImageUrl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumberPerson` int(11) NOT NULL,
  `PriceAdult` bigint(20) NOT NULL,
  `PriceKid` bigint(20) NOT NULL,
  `Unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `schedule_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tours`
--

INSERT INTO `tours` (`TourID`, `TourName`, `TourDescription`, `DateDeparture`, `DateBack`, `Note`, `ImageUrl`, `NumberPerson`, `PriceAdult`, `PriceKid`, `Unit`, `created_at`, `updated_at`, `schedule_id`) VALUES
(48, 'Tour Nha Trang máy bay khách lẻ', 'Nói đến Nha Trang, hẳn ai cũng hình dung ngay đến những bờ cát trắng, những ánh sóng bàng bạc khi nắng lên, nơi những vùng biển xanh trong như ngọc', '2019-05-24 11:29:37', '2019-05-27 11:29:37', 'Thành phố biển của Nam Trung Bộ này, lúc nào cũng nhanh chóng mang lại cho du khách những hình ảnh tuyệt vời như thế, khi vừa được nghe nhắc, gọi tên', '["d797592ea70aaf578fae6891af909ff537275ec2.jpeg","68d4d4f5cc7b61c83328c0d30e49d90e7db89ab6.jpeg"]', 6, 1000000, 800000, 'VND', '2019-05-24 04:30:14', '2019-06-12 06:11:58', 53),
(49, 'Tour Nha Trang - Vinpearl Land - Suối Hoa Lan - Buffet Hải sản', 'Hành trình tuyệt vời này cùng Bazan Travel sẽ mang đến cho khách thời gian thật sảng khoái khi dừng chân ở Bãi Dài cát trắng', '2019-05-25 06:00:00', '2019-05-25 20:00:00', 'Khách còn có dịp tham quan Chùa Long Sơn nổi tiếng, tắm bùn tốt cho sức khỏe', '["a2f89ffd4e49cc41d367e056cb6064ac547d6442.jpeg"]', 11, 800000, 500000, 'VND', '2019-05-24 13:00:15', '2019-05-24 13:00:15', 51),
(50, 'Du Lịch Đà Lạt: Siêu Giảm Giá TP.HCM - Đà Lạt Thành Phố Ngàn Hoa 3 Ngày 3 Đêm', 'Nơi mà mỗi khi người ta nhắc đến Đà Lạt người ta nghĩ ngay đến thành phố của những thung lũng, ngọn đồi, dòng suối và hồ', '2019-05-24 22:31:39', '2019-05-25 22:31:39', 'Nơi mà mỗi khi người ta nhắc đến Đà Lạt người ta nghĩ ngay đến thành phố của những thung lũng, ngọn đồi, dòng suối và hồ', '["fa856add79bdc761478aa8c0727b045550142824.jpeg","d55afb27bd772c429f3fc36d8b241cc44132631e.jpeg","d55afb27bd772c429f3fc36d8b241cc44132631e.jpeg"]', 13, 1200000, 800000, 'VND', '2019-05-24 15:35:12', '2019-05-24 15:35:12', 51),
(51, 'Du Lịch Quy Nhơn - Phú Yên - Nha Trang', 'Du lịch Phú Yên là một sự lựa chọn hết sức sáng suốt và độc đáo bởi Phú Yên là một tỉnh ven biển Duyên hải Nam Trung Bộ', '2019-05-25 22:36:17', '2019-05-30 22:36:17', 'Quý khách lên Cano qua Đảo Kì Co nằm dưới chân dãy núi Phương Mai sừng sững thuộc bán đảo Nhơn Lý, TP Quy Nhơn', '["8b7ba9bba21631a206386bb5650dc192ec607ac8.jpeg","cd11a507282b399786554deaf32b915362871b38.jpeg"]', 10, 1500000, 1000000, 'VND', '2019-05-24 15:38:10', '2019-05-24 15:38:47', 51),
(52, 'Tour Hà Nội đi Nha Trang Điệp Sơn bằng máy bay', 'Tour Hà Nội đi Nha Trang Điệp Sơn bằng máy bay', '2019-06-15 13:28:29', '2019-07-19 13:28:29', 'Tour Hà Nội đi Nha Trang Điệp Sơn bằng máy bay', '["1057c775797df6e1a05f4830fac5c22b915c0835.jpeg"]', 6, 5, 6, 'VND', '2019-06-05 06:28:54', '2019-06-05 06:28:54', 51),
(53, 'Tour Hà Nội đi Nha Trang Điệp Sơn bằng máy bay', 'Tour Hà Nội đi Nha Trang Điệp Sơn bằng máy bay', '2019-06-15 13:28:29', '2019-07-19 13:28:29', 'Tour Hà Nội đi Nha Trang Điệp Sơn bằng máy bay', '["7ec9e08ff05bdc1a849dc0ab1735febf0fb78337.jpeg"]', 6, 500000, 400000, 'VND', '2019-06-05 06:30:48', '2019-06-12 06:18:41', 51);

-- --------------------------------------------------------

--
-- Table structure for table `tour_guiders`
--

CREATE TABLE IF NOT EXISTS `tour_guiders` (
  `GuiderID` int(10) unsigned NOT NULL,
  `GuiderName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Birthday` date NOT NULL,
  `Address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PhoneNumner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ImgUrl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Gender` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tour_guiders`
--

INSERT INTO `tour_guiders` (`GuiderID`, `GuiderName`, `Birthday`, `Address`, `PhoneNumner`, `ImgUrl`, `created_at`, `updated_at`, `Gender`) VALUES
(10, 'Võ Văn Sang', '1997-04-28', 'Nha Trang Khánh hòa', '+8293681396201', 'https://lorempixel.com/640/480/people/?34671', '2019-05-13 04:02:36', '2019-05-17 09:10:04', 0),
(11, 'Ngon', '2019-05-15', '5943 Pouros Village Suite 164', '+3993201504240', 'https://lorempixel.com/640/480/people/?38550', '2019-05-13 04:02:36', '2019-05-15 10:28:13', 1),
(32, 'Võ Quang Khanh', '2019-05-15', 'HCM', '094344533', 'dba0caa01b10eb4e809047bb6376d62171f7ac39.jpeg', '2019-05-13 09:50:36', '2019-05-15 10:32:50', 1),
(33, 'Phạm Nguyên', '2019-05-14', 'Khánh hòa', '0959443344', 'ceea3205c09cb8e076a2ef897e4198480675f58c.png', '2019-05-14 05:37:47', '2019-05-14 05:37:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'profile.png',
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `activation_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `active`, `photo`, `bio`, `activation_token`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Sang Vo', 'sangvo111@gmail.com', '$2y$10$3liB8sJYyBQ8Z0Gyaj9Csu0c8yYaIpetcVTppgLCZ9eblgqVM.W6y', 1, 'customer-support.png', NULL, '', '2019-05-06 07:35:28', NULL, '2019-05-06 07:34:26', '2019-05-06 07:35:28', NULL),
(3, 'Demo', 'test@gmail.com', '$2y$10$jiJZ22tpfjgh7VCwc66Cued9Yg2chPZ0llGMg6Rx/NmIjaesO0f0S', 0, 'profile.png', NULL, 'y6mzdV9xszV6zN4xBHGlfWfQS8gED8NgMSrNbGwg5Pkql8VFX8BfzzDMRe7I', NULL, NULL, '2019-05-07 04:32:57', '2019-05-07 04:32:57', NULL),
(6, 'Vo Van Sang', 'sangvo99@gmail.com', '$2y$10$q4kPLSzSoLRDxhx6JcQpKObtuJK/Plyn..Z7ZA3RfwNIpxZRXcGle', 0, 'profile.png', NULL, 'nxxUq9E7FIrllAtLnwYOihWHHHl2FkOyEhoWD1vGhydWxuKfLO7hGxDJLvtb', NULL, NULL, '2019-05-15 14:17:35', '2019-05-15 14:17:35', NULL),
(7, 'Võ Văn An', 'sangvo100@gmail.com', '$2y$10$m21807vUzwsU4ckldOxHAeRZi0n1/wNMazqbrbIaTTzTwmcCRPz2C', 0, 'profile.png', NULL, 'tFmvge8uu7YTNqvNdGIQIj2AGKXElJQIGsQn4UNASuCqv1xKWyK4qUfywrAW', NULL, NULL, '2019-05-15 14:18:40', '2019-05-15 14:18:40', NULL),
(8, 'testuser11', 'user11@gmail.com', '$2y$10$U0N7m6u1kazcAURBnZ/zUeakd3tUCUGkA4unSj9j5/Eku.6cZA3I.', 0, 'profile.png', NULL, 'NvilsNAjVV7xQZOVPjLRQRXHd9gZAeonHWzop3JMuYWClijBqAQnBTxvtdTa', NULL, NULL, '2019-05-15 14:19:31', '2019-06-12 06:35:22', '2019-06-12 06:35:22'),
(9, 'ddddd đasad', 'trddD@gmail.com', '$2y$10$7BpF67EPmf9bt18sFoUREO/heGE77oI4yqWVeEpClCJzHuRQrvC9K', 0, 'profile.png', NULL, 'D5KpnSzWXrOsO34RGwBEF7juopPU540967J1sQn32zlIxQaExMKi7tCQexD6', NULL, NULL, '2019-06-01 17:51:01', '2019-06-02 12:28:18', '2019-06-02 12:28:18'),
(10, 'ddddd đasad', 'trddDsss@gmail.com', '$2y$10$5wvciVsRgu0leEs7yYge4ujw2HslN6/wg6mxCPkAk1xtycyMc8FIi', 0, 'profile.png', NULL, 'xZKKCxitRTuCLRwf8jL8GQjeNHqG84JUi6rBLOn7kTnZE6lQ1iSxpBShCsPj', NULL, NULL, '2019-06-01 17:52:04', '2019-06-02 16:51:31', '2019-06-02 16:51:31'),
(11, 'Test user 100', 'test111@gmail.com', '$2y$10$EqGXJvL.9/EiIJUfWsrJgO.LLE9xV4SZswkcV97PktK.b5spaj6yq', 0, 'profile.png', NULL, 'dSfzGOxJQCu0rvqyMqpOdEyIAhKPvyK3hNiJz2slyroNF8CIBgAZ3NUiJPvT', NULL, NULL, '2019-06-02 10:28:50', '2019-06-12 06:32:27', '2019-06-12 06:32:27'),
(12, 'Võ Thị Hường', 'huongvo111@gmail.com', '$2y$10$ubBNG/QLui2fxoTxig372O9VyVA0wgHnjolDI3ewmyJl3pSeQpM3G', 0, 'profile.png', NULL, 'gYqNwz6Pdm80kGmvNTtK2Eilf3k5h4e2Cl2T65WOwKeWApUTjVc6NOU9c1ct', NULL, NULL, '2019-06-02 10:33:52', '2019-06-02 12:01:08', '2019-06-02 12:01:08'),
(13, 'test dev 2019', 'devress@gmail.com', '$2y$10$9sSm9xtQAr1srCRPGXF4de9XApokGF0s9kFv7xgb090VEAq2UW.na', 0, 'profile.png', NULL, 'KkyBQF1Io85alhsoemm3hNO9QHcrkKtG0XRyZU8fzor5iVhjrpUmY2EfN6hK', NULL, NULL, '2019-06-02 10:36:43', '2019-06-02 11:59:46', '2019-06-02 11:59:46'),
(41, 'Sang Võ', 'sangvo.info@gmail.com', '', 1, 'https://graph.facebook.com/v3.0/1739974119439311/picture?type=normal', NULL, '', NULL, NULL, '2019-06-03 04:52:30', '2019-06-03 04:52:30', NULL),
(43, 'Nguyễn Văn Toàn', 'sang.vv.57cntt@gmail.com', '$2y$10$oTwObUH5KWYzAZaukZPZ1eLGroytskbxUZq0IAZKC548i/b4gg1Fu', 0, 'profile.png', NULL, 'sBgu2HT6ZGgGvAvlkiJ2Qx5ofSa6WDFQf2DpfClJhjcASyhnxfso4mSgJCo5', NULL, NULL, '2019-06-03 08:56:07', '2019-06-11 18:16:56', '2019-06-11 18:16:56'),
(46, 'Nguyễn Văn Toàn', 'sang.vv.57cntt@ntu.edu.vn', '$2y$10$.9csGWUUIf9GMfwRZGpr/e/NiMveefxbyhStaasERQ2uM7YhKf/ui', 1, 'profile.png', NULL, '', '2019-06-03 09:08:14', NULL, '2019-06-03 09:07:31', '2019-06-03 09:08:14', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `bookings_tour_id_index` (`tour_id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `customers_booking_id_foreign` (`booking_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`EventID`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`NewsID`),
  ADD KEY `news_event_id_foreign` (`event_id`),
  ADD KEY `news_approvedby_foreign` (`ApprovedBy`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_booking_id_foreign` (`booking_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`PlaceID`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`PromotionID`);

--
-- Indexes for table `promotion_tour`
--
ALTER TABLE `promotion_tour`
  ADD PRIMARY KEY (`promotion_id`,`tour_id`),
  ADD KEY `promotion_tour_promotion_id_index` (`promotion_id`),
  ADD KEY `promotion_tour_tour_id_index` (`tour_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_tour_id_foreign` (`tour_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `scenic__cultures`
--
ALTER TABLE `scenic__cultures`
  ADD PRIMARY KEY (`ScenicID`),
  ADD KEY `scenic__cultures_place_id_index` (`place_id`);

--
-- Indexes for table `scenic__culture_tour`
--
ALTER TABLE `scenic__culture_tour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scenic__culture_tour_scenic_id_foreign` (`scenic_id`),
  ADD KEY `scenic__culture_tour_tour_id_foreign` (`tour_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_tour_guider`
--
ALTER TABLE `schedule_tour_guider`
  ADD PRIMARY KEY (`schedule_id`,`tour_guider_id`),
  ADD KEY `schedule_tour_guider_schedule_id_index` (`schedule_id`),
  ADD KEY `schedule_tour_guider_tour_guider_id_index` (`tour_guider_id`);

--
-- Indexes for table `social_networks`
--
ALTER TABLE `social_networks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_networks_user_id_foreign` (`user_id`);

--
-- Indexes for table `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`TourID`),
  ADD KEY `tours_schedule_id_foreign` (`schedule_id`);

--
-- Indexes for table `tour_guiders`
--
ALTER TABLE `tour_guiders`
  ADD PRIMARY KEY (`GuiderID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `BookingID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=174;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `EventID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=144;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `NewsID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `PlaceID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `PromotionID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `ReviewID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `scenic__cultures`
--
ALTER TABLE `scenic__cultures`
  MODIFY `ScenicID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `scenic__culture_tour`
--
ALTER TABLE `scenic__culture_tour`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `social_networks`
--
ALTER TABLE `social_networks`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE `tours`
  MODIFY `TourID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `tour_guiders`
--
ALTER TABLE `tour_guiders`
  MODIFY `GuiderID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_tour_id_foreign` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`TourID`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`BookingID`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_approvedby_foreign` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `news_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`EventID`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`BookingID`) ON DELETE CASCADE;

--
-- Constraints for table `promotion_tour`
--
ALTER TABLE `promotion_tour`
  ADD CONSTRAINT `promotion_tour_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`PromotionID`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotion_tour_tour_id_foreign` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`TourID`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_tour_id_foreign` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`TourID`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `scenic__cultures`
--
ALTER TABLE `scenic__cultures`
  ADD CONSTRAINT `scenic__cultures_place_id_foreign` FOREIGN KEY (`place_id`) REFERENCES `places` (`PlaceID`) ON DELETE CASCADE;

--
-- Constraints for table `scenic__culture_tour`
--
ALTER TABLE `scenic__culture_tour`
  ADD CONSTRAINT `scenic__culture_tour_scenic_id_foreign` FOREIGN KEY (`scenic_id`) REFERENCES `scenic__cultures` (`ScenicID`) ON DELETE CASCADE,
  ADD CONSTRAINT `scenic__culture_tour_tour_id_foreign` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`TourID`) ON DELETE CASCADE;

--
-- Constraints for table `schedule_tour_guider`
--
ALTER TABLE `schedule_tour_guider`
  ADD CONSTRAINT `schedule_tour_guider_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedule_tour_guider_tour_guider_id_foreign` FOREIGN KEY (`tour_guider_id`) REFERENCES `tour_guiders` (`GuiderID`) ON DELETE CASCADE;

--
-- Constraints for table `social_networks`
--
ALTER TABLE `social_networks`
  ADD CONSTRAINT `social_networks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tours`
--
ALTER TABLE `tours`
  ADD CONSTRAINT `tours_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
