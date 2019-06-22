-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 22, 2019 at 06:09 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingID`, `NumberPerson`, `DateBooking`, `Note`, `State`, `created_at`, `updated_at`, `tour_id`, `user_id`, `approved_by`) VALUES
(66, 3, '2019-06-15 16:24:39', NULL, 0, '2019-06-15 09:24:39', '2019-06-15 09:24:39', 48, 2, 2),
(67, 1, '2019-06-15 20:36:10', NULL, 0, '2019-06-15 13:36:10', '2019-06-17 14:15:42', 50, 2, 2),
(68, 1, '2019-06-15 21:18:34', NULL, 0, '2019-06-15 14:18:34', '2019-06-17 14:17:35', 50, 2, 2),
(69, 1, '2019-06-16 17:01:11', NULL, 0, '2019-06-16 10:01:11', '2019-06-17 15:15:46', 50, 2, 2),
(70, 1, '2019-06-16 17:31:46', NULL, 0, '2019-06-16 10:31:46', '2019-06-17 15:16:43', 50, 2, 2),
(71, 1, '2019-06-16 17:34:24', NULL, 0, '2019-06-16 10:34:24', '2019-06-17 15:20:16', 50, 2, 2),
(72, 1, '2019-06-16 17:36:06', NULL, 0, '2019-06-16 10:36:06', '2019-06-16 10:36:06', 50, 2, NULL),
(73, 1, '2019-06-16 17:39:16', 'đasa', 0, '2019-06-16 10:39:16', '2019-06-16 10:39:16', 50, 2, NULL),
(74, 1, '2019-06-16 17:57:55', NULL, 0, '2019-06-16 10:57:55', '2019-06-16 10:57:55', 50, 2, NULL),
(75, 1, '2019-06-16 18:14:47', NULL, 0, '2019-06-16 11:14:47', '2019-06-16 11:14:47', 50, 2, NULL),
(76, 1, '2019-06-16 18:17:42', NULL, 0, '2019-06-16 11:17:42', '2019-06-17 15:14:32', 50, 2, 2),
(81, 1, '2019-06-16 21:13:36', 'dsad', 0, '2019-06-16 14:13:36', '2019-06-17 14:52:16', 51, 2, 2),
(82, 1, '2019-06-16 21:16:12', 'dsad', 0, '2019-06-16 14:16:12', '2019-06-17 14:14:02', 51, 2, 2),
(85, 1, '2019-06-17 17:43:41', 'Nha Trang', 1, '2019-06-17 10:43:41', '2019-06-17 14:11:10', 51, 2, 2),
(86, 1, '2019-06-22 13:28:25', 'da', 2, '2019-06-22 06:28:25', '2019-06-22 06:29:19', 49, 2, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(166, 'Sang Vo', NULL, 0, 'Nha Trang', 0, 81, '2019-06-16 14:13:36', '2019-06-16 14:13:36', 1, 'sangvo111@gmail.com', '0979340304'),
(167, 'Võ Văn SAng', '2004-06-14', 1, 'Nha Trang', 1, 81, '2019-06-16 14:13:36', '2019-06-16 14:13:36', 0, NULL, NULL),
(168, 'Sang Vo', NULL, 0, 'Nha trang', 0, 82, '2019-06-16 14:16:12', '2019-06-16 14:16:12', 1, 'sangvo111@gmail.com', '0979340304'),
(169, 'Võ Văn An', '2004-06-14', 1, 'Nha trang', 1, 82, '2019-06-16 14:16:12', '2019-06-16 14:16:12', 0, NULL, NULL),
(174, 'Sang Vo', NULL, 0, 'Quảng ngãi', 0, 85, '2019-06-17 10:43:42', '2019-06-17 10:43:42', 1, 'sangvo111@gmail.com', '0979340304'),
(175, 'Võ Văn Sang', '2004-06-13', 1, 'Quảng ngãi', 1, 85, '2019-06-17 10:43:42', '2019-06-17 10:43:42', 0, NULL, NULL),
(176, 'Sang Vo', NULL, 0, 'nha trang', 0, 86, '2019-06-22 06:28:25', '2019-06-22 06:28:25', 1, 'sangvo111@gmail.com', '0979340304'),
(177, 'Vo Van Sang', '2004-06-08', 1, 'nha trang', 1, 86, '2019-06-22 06:28:25', '2019-06-22 06:28:25', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(143, '2019_06_13_174849_update_table_payment_booking', 22),
(144, '2019_06_14_164539_update_table_paymnet_method', 23),
(145, '2019_06_22_001420_update_news_table_key', 24);

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
(1, 'App\\User', 4),
(1, 'App\\User', 5),
(1, 'App\\User', 6),
(1, 'App\\User', 7),
(1, 'App\\User', 8),
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
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`NewsID`, `Title`, `ImgUrl`, `Contents`, `State`, `user_id`, `created_at`, `updated_at`) VALUES
(18, 'Sôi động hè cùng Vinpearl Nha Trang vui không giới hạn', '/images/news/c9dac65db04b6eee7c0ceca75f0c0d41eabf2840.jpeg', '<p>s&ocirc;i động h&egrave; 2018 c&ugrave;ng&nbsp;<strong>Vinpearl Nha Trang</strong>, với chương tr&igrave;nh si&ecirc;u khuyến m&atilde;i &ldquo;<strong>H&egrave; 2018 Vinpearl vui kh&ocirc;ng giới hạn</strong>&rdquo;! Vinpearl sẽ trở th&agrave;nh thi&ecirc;n đường &ldquo;hạnh ph&uacute;c kh&ocirc;ng giới hạn&rdquo; khi du kh&aacute;ch được trải nghiệm kỳ nghỉ đẳng cấp tại những địa danh du lịch Nha Trang v&agrave; tham gia c&aacute;c hoạt động v&ocirc; c&ugrave;ng th&uacute; vị. Tuyệt vời hơn, lưu tr&uacute; tối thiểu 2 đ&ecirc;m li&ecirc;n tiếp từ nay tới 23/5/2018 với đặc quyền vui chơi miễn ph&iacute; bất tận tại Vinpearl Land v&agrave; Vinpearl Safari.<br /><img title="S&ocirc;i động h&egrave; c&ugrave;ng Vinpearl Nha Trang vui kh&ocirc;ng giới hạn - Ảnh 1" src="https://nhatrangsensetravel.com/view/at_soi-dong-he-cung-vinpearl-nha-trang-vui-khong-gioi-han_98698dfa74e6c422c3b1098a756a95db.jpg" alt="S&ocirc;i động h&egrave; c&ugrave;ng Vinpearl Nha Trang vui kh&ocirc;ng giới hạn - Ảnh 1" /><br />Đến với Vinpearl Nha Trang dịp h&egrave; n&agrave;y, du kh&aacute;ch sẽ được:</p>\n<ul>\n<li><strong>Nghỉ ngơi kh&ocirc;ng giới hạn</strong>, tự thưởng cho bản th&acirc;n với trải nghiệm nghỉ dưỡng 5 sao tại Vinpearl</li>\n<li><strong>Vui kh&ocirc;ng giới hạn</strong>: Tham gia c&aacute;c tr&ograve; chơi giải tr&iacute; hấp dẫn nhất tại Vinpearl Land</li>\n<li><strong>Kh&aacute;m ph&aacute; kh&ocirc;ng giới hạn:</strong>&nbsp;C&aacute;c hoạt động tour kh&aacute;m ph&aacute; biển Nha Trang v&agrave; Vinpearl Safari</li>\n<li><strong>Thưởng thức kh&ocirc;ng giới hạn</strong>&nbsp;những tinh hoa ẩm thực bốn phương tại c&aacute;c nh&agrave; h&agrave;ng trong quần thể nghỉ dưỡng Vinpearl</li>\n<li><strong>Kết nối kh&ocirc;ng giới hạn</strong>:&nbsp; Kh&ocirc;ng gian tuyệt vời để gặp gỡ bạn b&egrave; v&agrave; đối t&aacute;c tại Vinpearl</li>\n</ul>\n<p><img title="S&ocirc;i động h&egrave; c&ugrave;ng Vinpearl Nha Trang vui kh&ocirc;ng giới hạn - Ảnh 2" src="https://nhatrangsensetravel.com/view/at_soi-dong-he-cung-vinpearl-nha-trang-vui-khong-gioi-han_95b4f9e60023e64680de3c84945c12dd.jpg" alt="S&ocirc;i động h&egrave; c&ugrave;ng Vinpearl Nha Trang vui kh&ocirc;ng giới hạn - Ảnh 2" /><br />Với lợi thế sở hữu chuỗi kh&aacute;ch sạn, resort v&agrave; tổ hợp vui chơi giải tr&iacute; lớn nhất cả nước, Vinpearl tự h&agrave;o mang đến những trải nghiệm đẳng cấp quốc tế ngay tại Việt Nam.<br /><br />Du kh&aacute;ch đến với chương tr&igrave;nh &ldquo;H&egrave; Vinpearl Nha Trang vui kh&ocirc;ng giới hạn&rdquo; sẽ được tham gia trọn g&oacute;i c&aacute;c tr&ograve; chơi hấp dẫn nhất như: t&agrave;u lượn si&ecirc;u tốc, l&agrave;n trượt tốc độ Alpine Coaster, B&aacute;nh xe bầu trời Vinpearl Skywheel hay tham quan Đồi Vạn Hoa, Vườn Qu&yacute; Vương, kh&aacute;m ph&aacute; vườn th&uacute; Vinpearl Safari tr&ecirc;n đảo v&agrave; b&ecirc;n s&ocirc;ng độc đ&aacute;o&hellip;<br /><img title="S&ocirc;i động h&egrave; c&ugrave;ng Vinpearl Nha Trang vui kh&ocirc;ng giới hạn - Ảnh 3" src="https://nhatrangsensetravel.com/view/at_soi-dong-he-cung-vinpearl-nha-trang-vui-khong-gioi-han_de0ea4cca48df8ac86f95281d0b4bfe4.jpg" alt="S&ocirc;i động h&egrave; c&ugrave;ng Vinpearl Nha Trang vui kh&ocirc;ng giới hạn - Ảnh 3" /><br />Từ nay tới&nbsp;<strong>23/5/2018</strong>, khi đặt ph&ograve;ng trực tiếp tại trang web Vinpearl, chỉ với 4.075.000 VNĐ, du kh&aacute;ch sẽ nhận được ưu đ&atilde;i ăn s&aacute;ng v&agrave; ăn tối cho 2 người lớn v&agrave; miễn ph&iacute; cho 2 trẻ em dưới 12 tuổi, c&ugrave;ng trải nghiệm kh&ocirc;ng giới hạn tại Vinpearl Land v&agrave; Vinpearl Safari.<br /><img title="S&ocirc;i động h&egrave; c&ugrave;ng Vinpearl Nha Trang vui kh&ocirc;ng giới hạn - Ảnh 4" src="https://nhatrangsensetravel.com/view/at_soi-dong-he-cung-vinpearl-nha-trang-vui-khong-gioi-han_4cce057c327128c3b05c42e90cd436ee.jpg" alt="S&ocirc;i động h&egrave; c&ugrave;ng Vinpearl Nha Trang vui kh&ocirc;ng giới hạn - Ảnh 4" /><br />Vậy h&atilde;y c&ugrave;ng Vinpearl trải nghiệm h&egrave; vui kh&ocirc;ng giới hạn ngay h&ocirc;m nay, đặt ph&ograve;ng qua c&aacute;c k&ecirc;nh tại vinpearl, hoặc li&ecirc;n hệ cho ch&uacute;ng t&ocirc;i theo số m&aacute;y 0918 716 239 để được tư vấn cụ thể hơn.<br /><img title="S&ocirc;i động h&egrave; c&ugrave;ng Vinpearl Nha Trang vui kh&ocirc;ng giới hạn - Ảnh 5" src="https://nhatrangsensetravel.com/view/at_soi-dong-he-cung-vinpearl-nha-trang-vui-khong-gioi-han_e3eea92b99a557242c0a74546afc9fda.jpg" alt="S&ocirc;i động h&egrave; c&ugrave;ng Vinpearl Nha Trang vui kh&ocirc;ng giới hạn - Ảnh 5" /><br /><strong>Điều kiện &aacute;p dụng:</strong><br />&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Du kh&aacute;ch c&oacute; quốc tịch Việt Nam, hoặc c&oacute; thẻ lưu tr&uacute;/ thường tr&uacute; tại Việt Nam.<br />&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ưu đ&atilde;i chương tr&igrave;nh: từ nay đến hết ng&agrave;y 23/5/2018 (ng&agrave;y check-out)<br />&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ở tối thiểu 2 đ&ecirc;m li&ecirc;n tiếp tại c&aacute;c cơ sở: Vinpearl Nha Trang.</p>', 1, 2, '2019-06-22 15:00:50', '2019-06-22 15:00:50'),
(19, 'Tham Quan Đảo Tôm Hùm Bình Ba Khánh Hòa', '/images/news/a0cab45fb9c093862dc7c5bb47eb12a314053f0d.jpeg', '<p><strong>Du lich Nha Trang</strong>- M&ugrave;a h&egrave; đ&atilde; đến, d&agrave;nh hai ng&agrave;y nghỉ ở đảo B&igrave;nh Ba (Kh&aacute;nh H&ograve;a) sẽ khiến nh&oacute;m bạn c&oacute; những khoảng thời gian vui vẻ b&ecirc;n nhau. Điểm đến mới lạ, đặc sản phong ph&uacute; c&ugrave;ng chi ph&iacute; kh&ocirc;ng qu&aacute; đắt đỏ l&agrave; những điểm cộng cho chuyến du lịch B&igrave;nh Ba v&agrave;o m&ugrave;a h&egrave; n&agrave;y.</p>\n<div><strong>Địa điểm</strong></div>\n<div>Đảo B&igrave;nh Ba thuộc x&atilde; Cam B&igrave;nh, th&agrave;nh phố Cam Ranh, tỉnh Kh&aacute;nh H&ograve;a. Đ&acirc;y l&agrave; một h&ograve;n đảo nhỏ, được v&iacute; như bức tường chắn s&oacute;ng, gi&oacute; cho to&agrave;n khu vực eo vịnh Cam Ranh. Những năm trước đ&acirc;y, h&ograve;n đảo chuy&ecirc;n nu&ocirc;i t&ocirc;m h&ugrave;m được v&iacute; như hoang đảo Robinson. Nhưng gần đ&acirc;y, dịch vụ du lịch tr&ecirc;n đảo đ&atilde; ph&aacute;t triển, nhiều người t&igrave;m đến B&igrave;nh Ba để kh&aacute;m ph&aacute;, nhất l&agrave; c&aacute;c nh&oacute;m du lịch đ&ocirc;ng người.</div>\n<div>&nbsp;</div>\n<div><strong>Di chuyển</strong></div>\n<div>Từ TP HCM c&oacute; thể di chuyển tới B&igrave;nh Ba bằng xe kh&aacute;ch chất lượng cao (Phương Trang, C&uacute;c T&ugrave;ng, Mai Linh&hellip;) đến bến xe Cam Ranh hoặc đi t&agrave;u hỏa đến ga Nha Trang rồi bắt xe bu&yacute;t tới Cam Ranh. Nếu c&oacute; &iacute;t thời gian di chuyển, c&oacute; thể chọn đường h&agrave;ng kh&ocirc;ng tớ s&acirc;n bay Cam Ranh.</div>\n<div>&nbsp;</div>\n<div>Để ra đảo, thuyền ở cảng Ba Ng&ograve;i (c&aacute;ch bến xe Cam Ranh 5 km) c&oacute; 4 chuyến mỗi ng&agrave;y, xuất bến v&agrave;o 7h, 10h, 13h v&agrave; 16h; t&agrave;u từ đảo về đất liền khởi h&agrave;nh l&uacute;c 5h, 9h, 12h v&agrave; 16h30 h&agrave;ng ng&agrave;y.</div>\n<div>&nbsp;</div>\n<div><strong>Nghỉ ngơi</strong></div>\n<div>Tr&ecirc;n đảo c&oacute; c&aacute;c nh&agrave; nghỉ, homestay ph&ograve;ng lớn cho kh&aacute;ch đi theo nh&oacute;m. Nhớ li&ecirc;n hệ trước khoảng một tuần để đặt chỗ v&agrave; h&atilde;y thương lượng mượn bếp than, dụng cụ nướng, b&aacute;t đũa&hellip; để c&oacute; thể l&agrave;m n&ecirc;n bữa tiệc BBQ hải sản.</div>\n<div>&nbsp;</div>\n<div><strong>C&aacute;c điểm tham quan, tắm biển</strong></div>\n<div>B&atilde;i Nồm l&agrave; b&atilde;i tắm đẹp nhất đảo, c&oacute; b&atilde;i c&aacute;t h&igrave;nh c&aacute;nh cung, hai đầu l&agrave; những ghềnh đ&aacute; nhiều h&igrave;nh th&ugrave; kỳ vĩ. Bạn sẽ thỏa th&iacute;ch v&ugrave;ng v&atilde;y trong v&ugrave;ng nước biển xanh ngắt trải d&agrave;i đến đường ch&acirc;n trời.</div>\n<div>&nbsp;</div>\n<div><img title="Tham Quan Đảo T&ocirc;m H&ugrave;m B&igrave;nh Ba - Kh&aacute;nh H&ograve;a - Ảnh 1" src="https://nhatrangsensetravel.com/view/at_tham-quan-dao-tom-hum-binh-ba-khanh-hoa_561d7dc0114873380690149bd1808643.jpg" alt="Tham Quan Đảo T&ocirc;m H&ugrave;m B&igrave;nh Ba - Kh&aacute;nh H&ograve;a - Ảnh 1" /></div>\n<div><em>Biển trời xanh thẳm ở B&igrave;nh Ba.</em></div>\n<div>&nbsp;</div>\n<div>B&atilde;i Nh&agrave; Cũ c&oacute; những rạn san h&ocirc; d&agrave;y đặc. H&atilde;y mang theo k&iacute;nh lặn, chỉ cần c&uacute;i m&igrave;nh xuống l&agrave;n nước l&agrave; sẽ thấy sự tươi đẹp của đại dương, với những đ&agrave;n c&aacute; nhiều m&agrave;u tung tăng bơi lội.</div>\n<div>&nbsp;</div>\n<div>B&atilde;i Chướng l&agrave; nơi l&yacute; tưởng để ngắm b&igrave;nh minh tr&ecirc;n đảo. Mặt trời nh&ocirc; l&ecirc;n dần dần, đỏ rực cả một v&ugrave;ng nước v&ugrave;ng trời, tạo n&ecirc;n những khoảnh khắc ảo diệu.</div>\n<div>&nbsp;</div>\n<div>Chợ B&igrave;nh Ba mang đặc trưng của chợ l&agrave;ng ch&agrave;i, b&aacute;n nhiều đồ ăn vặt ngon v&agrave; rẻ như: thịt xi&ecirc;n, b&aacute;nh flan, b&aacute;nh r&aacute;n, ch&egrave;&hellip;</div>\n<div>&nbsp;</div>\n<div><strong>Những trải nghiệm th&uacute; vị</strong></div>\n<div>Lang thang c&ugrave;ng chiếc m&aacute;y ảnh, kh&aacute;m ph&aacute; mọi ng&oacute;c ng&aacute;ch của h&ograve;n đảo nhỏ, chạy l&ecirc;n đỉnh đồi để ngắm to&agrave;n bộ quang cảnh nơi đ&acirc;y. Vẫn c&ograve;n những di t&iacute;ch từ thời Ph&aacute;p thuộc như bệ s&uacute;ng thần c&ocirc;ng, l&ocirc; cốt&hellip;</div>\n<div>&nbsp;</div>\n<div>Tiệc BBQ hải sản ở ven biển c&ugrave;ng nh&oacute;m bạn, h&atilde;y hỏi người d&acirc;n để mua t&ocirc;m h&ugrave;m, mực, c&aacute;&hellip; v&agrave; tổ chức một bữa tiệc vui vẻ ngay s&aacute;t b&atilde;i biển, tiếng guitar h&ograve;a v&agrave;o tiếng s&oacute;ng mơn man bờ c&aacute;t.</div>\n<div>&nbsp;</div>\n<div>Theo ch&acirc;n một gia đ&igrave;nh d&acirc;n ch&agrave;i đi bắt ốc, soi c&ograve;ng, c&acirc;u mực, thưởng thức t&ocirc;m h&ugrave;m hấp ngay tại b&egrave; nu&ocirc;i.</div>\n<div>&nbsp;</div>\n<div><strong>M&oacute;n ăn kh&ocirc;ng thể bỏ qua</strong></div>\n<div>Người d&acirc;n Kh&aacute;nh H&ograve;a c&oacute; c&acirc;u: &ldquo;Yến s&agrave;o H&ograve;n Nội, vịt lội Ninh H&ograve;a, t&ocirc;m h&ugrave;m B&igrave;nh Ba, nai kh&ocirc; Di&ecirc;n Kh&aacute;nh&rdquo;, n&ecirc;n đến B&igrave;nh Ba l&agrave; phải thưởng thức đặc sản t&ocirc;m h&ugrave;m được nu&ocirc;i tại h&ograve;n đảo n&agrave;y. T&ocirc;m h&ugrave;m hấp, nướng hoặc ch&aacute;o t&ocirc;m h&ugrave;m bổ dưỡng. Gi&aacute; t&ocirc;m khoảng 800.000-1.000.000 đồng/kg.</div>\n<div>&nbsp;</div>\n<div><img title="Tham Quan Đảo T&ocirc;m H&ugrave;m B&igrave;nh Ba - Kh&aacute;nh H&ograve;a - Ảnh 2" src="https://nhatrangsensetravel.com/view/at_tham-quan-dao-tom-hum-binh-ba-khanh-hoa_dd18fb05d655687b65bd4611e3ee7672.jpg" alt="Tham Quan Đảo T&ocirc;m H&ugrave;m B&igrave;nh Ba - Kh&aacute;nh H&ograve;a - Ảnh 2" /></div>\n<div><em>T&ocirc;m h&ugrave;m - đặc sản B&igrave;nh Ba.</em></div>\n<div>&nbsp;</div>\n<div>Nhum (cầu gai) nướng, d&ugrave;ng muỗng nạo phần thịt chấm muối ti&ecirc;u chanh, sẽ cảm nhận được vị b&eacute;o, bổ dưỡng.</div>\n<div>&nbsp;</div>\n<div>Ốc v&uacute; n&agrave;ng, ốc mặt trăng, mực một nắng&hellip; cũng l&agrave; những hải sản của v&ugrave;ng biển đảo miền Trung kh&ocirc;ng thể bỏ lỡ khi đến B&igrave;nh Ba.</div>\n<div>&nbsp;</div>\n<div><strong>Lưu &yacute;</strong></div>\n<div>B&igrave;nh Ba khai th&aacute;c du lịch chưa l&acirc;u, c&ograve;n kh&aacute; hoang sơ, bạn h&atilde;y g&oacute;p phần l&agrave;m đẹp v&agrave; sạch đảo, đừng xả r&aacute;c hay giẫm đạp l&ecirc;n san h&ocirc;, nhất l&agrave; kh&ocirc;ng n&ecirc;n lấy san h&ocirc; mang về.</div>\n<div>&nbsp;</div>\n<div>San h&ocirc; v&agrave; &ldquo;thế giới&rdquo; dưới biển ở b&atilde;i Nh&agrave; Cũ, b&atilde;i Chướng rất đẹp, h&atilde;y chuẩn bị k&iacute;nh lặn, m&aacute;y ảnh chụp dưới nước.</div>\n<div>&nbsp;</div>\n<div>Đi theo nh&oacute;m, n&ecirc;n mang theo lều trại, đ&agrave;n guitar&hellip; để c&oacute; những trải nghiệm đ&aacute;ng nhớ b&ecirc;n bạn b&egrave; giữa h&ograve;n đảo xinh đẹp.</div>\n<div>&nbsp;</div>\n<div><img title="Tham Quan Đảo T&ocirc;m H&ugrave;m B&igrave;nh Ba - Kh&aacute;nh H&ograve;a - Ảnh 3" src="https://nhatrangsensetravel.com/view/at_tham-quan-dao-tom-hum-binh-ba-khanh-hoa_f472cb30377478328e5956a29de71ede.jpg" alt="Tham Quan Đảo T&ocirc;m H&ugrave;m B&igrave;nh Ba - Kh&aacute;nh H&ograve;a - Ảnh 3" /></div>\n<div><em>B&igrave;nh Ba - điểm hẹn cuối tuần cho c&aacute;c bạn trẻ ưa kh&aacute;m ph&aacute;.</em></div>', 1, 2, '2019-06-22 15:11:08', '2019-06-22 15:11:08'),
(20, 'Những Quán Café Đừng Nên Bỏ Lỡ Khi Đến Du Lịch Nha Trang', '/images/news/205ecf571afb7932353cc8edf35a84cbe99f1f59.jpeg', '<h3>Những Qu&aacute;n Caf&eacute; Đừng N&ecirc;n Bỏ Lỡ Khi Đến Du Lịch Nha Trang</h3>\n<div>Đến với&nbsp;<strong>du lịch Nha Trang</strong>&nbsp;b&acirc;y giờ kh&ocirc;ng chỉ c&ograve;n l&agrave; tắm biển, ăn hải sản rồi thả m&igrave;nh v&agrave;o biển xanh c&aacute;t trắng nắng v&agrave;ng nữa&hellip;Kh&aacute;m ph&aacute; trải nghiệm Nha Trang b&acirc;y giờ l&agrave; phải tận hưởng&hellip;thưởng thức c&aacute;i ngon từ ẩm thực đường phố, c&aacute;i lạ từ đặc sản qu&ecirc; hương v&agrave; m&ugrave;i hương của t&aacute;ch cafe Nha Trang</div>\n<div>&nbsp;</div>\n<div>Muốn trải nghiệm văn h&oacute;a caf&eacute; nơi đ&acirc;y, bạn c&oacute; thể gh&eacute; qua h&agrave;ng loạt qu&aacute;n caf&eacute; đẹp v&agrave; c&oacute; thiết kế độc đ&aacute;o, kh&aacute;c hẳn với những qu&aacute;n caf&eacute; tại th&agrave;nh phố ồn &agrave;o&hellip;.</div>\n<div>&nbsp;</div>\n<div><em>H&atilde;y xem thủ những qu&aacute;n c&agrave; ph&ecirc; tuyệt đẹp bạn nhất định phải gh&eacute; khi du lịch Nha Trang dưới đ&acirc;y nh&eacute;.&nbsp;</em></div>\n<div>&nbsp;</div>\n<div><strong>Toastina</strong></div>\n<div>&nbsp;</div>\n<div>Nằm trong khu&ocirc;n vi&ecirc;n tầng trệt của Sheraton, Toastina l&agrave; qu&aacute;n c&agrave; ph&ecirc; kh&aacute; sang chảnh mang đậm phong c&aacute;ch &Yacute;. Do nằm ở tầng trệt của một trong những kh&aacute;ch sạn c&oacute; vị tr&iacute; đắc địa ở Nha Trang n&ecirc;n từ qu&aacute;n n&agrave;y bạn c&oacute; thể nh&igrave;n thẳng ra biển, vừa đẹp mắt, vừa rất tiện cho những người muốn thư gi&atilde;n, c&agrave; ph&ecirc; ở khu vực trung t&acirc;m hay nghỉ ngơi sau khi tắm biển. Th&ecirc;m v&agrave;o đ&oacute; qu&aacute;n c&agrave; ph&ecirc; n&agrave;y lại c&oacute; cả kh&ocirc;ng gian trong nh&agrave; lẫn ngo&agrave;i trời cho bạn lựa chọn.</div>\n<div>&nbsp;</div>\n<div><img title="Toastina" src="https://nhatrangsensetravel.com/view/at_nhung-quan-cafe-dung-nen-bo-lo-khi-den-du-lich-nha-trang_ddccbf6b0f9bcc1911c4c1af308a7fdb.jpg" alt="Toastina" longdesc="https://nhatrangsensetravel.com/Toastina" /></div>\n<div>&nbsp;</div>\n<div>L&agrave; qu&aacute;n c&agrave; ph&ecirc; trực thuộc kh&aacute;ch sạn, đồ uống của Toastina rất đa dạng, đi k&egrave;m với đ&oacute; l&agrave; c&aacute;c loại b&aacute;nh ngọt được đ&aacute;nh gi&aacute; cao do l&agrave;m theo ti&ecirc;u chuẩn kh&aacute;ch sạn. Một điều th&uacute; vị nhỏ l&agrave; sau 17 giờ, nhiều loại b&aacute;nh ở đ&acirc;y sẽ giảm gi&aacute; đến 50% n&ecirc;n nếu muốn ăn b&aacute;nh ngọt, gi&aacute; mềm, bạn h&atilde;y ghi nhớ nh&eacute;! Đồ ăn đồ uống của qu&aacute;n trung b&igrave;nh từ 30 ng&agrave;n trở l&ecirc;n.&nbsp;</div>\n<div>&nbsp;</div>\n<div><img title="Toastina1" src="https://nhatrangsensetravel.com/view/at_nhung-quan-cafe-dung-nen-bo-lo-khi-den-du-lich-nha-trang_ee55a7c858dfb6dcbc264e1d56bae3d8.jpg" alt="Toastina" longdesc="https://nhatrangsensetravel.com/Toastina1" /></div>\n<div>&nbsp;</div>\n<div>Địa chỉ: 26 - 28 Trần Ph&uacute;, Tp. Nha Trang</div>\n<div>&nbsp;</div>\n<div><strong>City Fox Bistro Caf&eacute;&nbsp;</strong></div>\n<div>&nbsp;</div>\n<div>Với những người muốn t&igrave;m một qu&aacute;n c&agrave; ph&ecirc; phong c&aacute;ch trẻ trung, hiện đại th&igrave; City Fox l&agrave; địa chỉ kh&ocirc;ng n&ecirc;n bỏ qua. Ngo&agrave;i c&aacute;i t&ecirc;n mang &yacute; nghĩa th&uacute; vị, qu&aacute;n c&agrave; ph&ecirc; n&agrave;y cũng g&acirc;y ấn tượng với c&aacute;ch b&agrave;i tr&iacute; hiện đại, năng động h&ograve;a lẫn một ch&uacute;t cổ điển, classic rất thư gi&atilde;n.&nbsp;</div>\n<div>&nbsp;</div>\n<div><img title="City Fox Bistro Caf&eacute; " src="https://nhatrangsensetravel.com/view/at_nhung-quan-cafe-dung-nen-bo-lo-khi-den-du-lich-nha-trang_13fbb92f6588b3987a53f89c325c76b5.jpg" alt="City Fox Bistro Caf&eacute; " longdesc="https://nhatrangsensetravel.com/City%20Fox%20Bistro%20Caf%C3%A9" /></div>\n<div>&nbsp;</div>\n<div>City Fox c&oacute; 3 tầng với thiết kế tho&aacute;ng m&aacute;t ,đặc biệt mỗi tầng, mỗi một khu vực n&agrave;y c&oacute; c&aacute;ch b&agrave;i tr&iacute; ri&ecirc;ng, nơi m&agrave;u sắc, nơi c&aacute; t&iacute;nh, nơi mộc mạc do vậy d&ugrave; hướng đến kh&ocirc;ng gian n&agrave;o bạn vẫn dễ d&agrave;ng lựa chọn được g&oacute;c ngồi ph&ugrave; hợp. Kh&ocirc;ng những vậy thỉnh thoảng c&ograve;n c&oacute; nhạc ascoutic v&agrave;o buổi tối. V&agrave; việc thưởng thức &acirc;m nhạc mới mẻ ở một qu&aacute;n c&agrave; ph&ecirc; đẹp ở một th&agrave;nh phố lạ thực sự l&agrave; một trải nghiệm th&uacute; vị.</div>\n<div>&nbsp;</div>\n<div><img title="City Fox Bistro Caf&eacute; 1" src="https://nhatrangsensetravel.com/view/at_nhung-quan-cafe-dung-nen-bo-lo-khi-den-du-lich-nha-trang_a57fd6afb9edce8dbb014dd71340e901.jpg" alt="City Fox Bistro Caf&eacute; " longdesc="https://nhatrangsensetravel.com/City%20Fox%20Bistro%20Caf%C3%A9%201" /></div>\n<div>&nbsp;</div>\n<div>B&ecirc;n cạnh yếu tố kh&ocirc;ng gian th&igrave; đồ ăn, đồ uống của City Fox cũng được nhiều kh&aacute;ch khen ngợi bởi kh&aacute; đa dạng v&agrave; update với đủ c&aacute;c m&oacute;n ăn đồ uống được giới trẻ ưa th&iacute;ch như sinh tố, iceblended, b&aacute;nh cupcake, b&aacute;nh red velvet... Ngo&agrave;i ra qu&aacute;n cũng c&oacute; th&ecirc;m c&oacute; đồ mặn, hamburger phục vụ nhu cầu ăn no của kh&aacute;ch. Mức gi&aacute; đồ ăn, đồ uống ở đ&acirc;y mức trung b&igrave;nh khoảng 40 ng&agrave;n đồng trở l&ecirc;n&nbsp;</div>\n<div>&nbsp;</div>\n<div>Địa chỉ: 27 L&ecirc; Q&uacute;y Đ&ocirc;n - Nha Trang</div>\n<div>&nbsp;</div>\n<div><strong>Cafe Ấn Tượng</strong></div>\n<div>&nbsp;</div>\n<div>Tuy kh&ocirc;ng nằm ở vị tr&iacute; qu&aacute; trung t&acirc;m nhưng c&agrave; ph&ecirc; Ấn Tượng lại l&agrave; điểm đến rất được ưa chuộng của kh&aacute;ch bản địa lẫn du kh&aacute;ch trong v&agrave; ngo&agrave;i nước ở Nha Trang. Đ&oacute; l&agrave; nhờ qu&aacute;n c&oacute; ph&ograve;ng tranh 3D rất ấn tượng bao gồm h&agrave;ng loạt m&ocirc; h&igrave;nh những đồ vật si&ecirc;u khủng, si&ecirc;u s&aacute;ng tạo được chế t&aacute;c kh&eacute;o l&eacute;o. C&ugrave;ng với đ&oacute; l&agrave; 2 căn ph&ograve;ng lộn ngược mang đến cho bạn cảm gi&aacute;c được bước đi tr&ecirc;n trần nh&agrave; v&agrave; căn ph&ograve;ng đầu nhỏ - đầu to mang đến những bức ảnh cực h&agrave;i hước.</div>\n<div>&nbsp;</div>\n<div><img title="Cafe Ấn Tượng" src="https://nhatrangsensetravel.com/view/at_nhung-quan-cafe-dung-nen-bo-lo-khi-den-du-lich-nha-trang_2dcd4993126f7bf8496eb60254429d85.jpg" alt="Cafe Ấn Tượng" longdesc="https://nhatrangsensetravel.com/Cafe%20%E1%BA%A4n%20T%C6%B0%E1%BB%A3ng" /></div>\n<div>&nbsp;</div>\n<div>Căn ph&ograve;ng ngược l&agrave; một điểm nhấn của qu&aacute;n.</div>\n<div>&nbsp;</div>\n<div><img title="Cafe Ấn Tượng1" src="https://nhatrangsensetravel.com/view/at_nhung-quan-cafe-dung-nen-bo-lo-khi-den-du-lich-nha-trang_94079de07d61cd833e8d7e9744171db8.jpg" alt="Cafe Ấn Tượng" longdesc="https://nhatrangsensetravel.com/Cafe%20%E1%BA%A4n%20T%C6%B0%E1%BB%A3ng1" /></div>\n<div>&nbsp;</div>\n<div>C&oacute; lẽ bởi sự độc đ&aacute;o n&agrave;y m&agrave; kh&ocirc;ng &iacute;t những cặp đ&ocirc;i đến đ&acirc;y để ghi lại những bức ảnh cưới lạ mắt.</div>\n<div>&nbsp;</div>\n<div>C&ograve;n đối với những người đơn thuần muốn t&igrave;m một nơi y&ecirc;n tĩnh, tiện nghi để c&agrave; ph&ecirc; thư gi&atilde;n th&igrave; Ấn Tượng vẫn thừa sức đ&aacute;p ứng khi kh&ocirc;ng gian qu&aacute;n l&agrave; nguy&ecirc;n một biệt thự vườn mang phong c&aacute;ch &Aacute; Đ&ocirc;ng rất nhẹ nh&agrave;ng. Chưa kể đến qu&aacute;n c&agrave; ph&ecirc; n&agrave;y thậm ch&iacute; c&ograve;n c&oacute; nh&agrave; h&agrave;ng n&ecirc;n c&oacute; thể đ&aacute;p ứng được đủ m&oacute;n ăn uống, rất ph&ugrave; hợp l&agrave;m điểm dừng ch&acirc;n cho đại gia đ&igrave;nh.</div>\n<div>&nbsp;</div>\n<div>Gi&aacute; đồ ăn, đồ uống ở đ&acirc;y trung b&igrave;nh chỉ từ 20 ng&agrave;n đồng/ đồ uống trở l&ecirc;n. Tuy nhi&ecirc;n nếu muốn v&agrave;o ph&ograve;ng tranh 3D vui chơi, gi&aacute; v&eacute; sẽ l&agrave; 75 ng&agrave;n đồng/ người lớn v&agrave; 50 ng&agrave;n đồng/ trẻ em.</div>\n<div>&nbsp;</div>\n<div><img title="Cafe Ấn Tượng3" src="https://nhatrangsensetravel.com/view/at_nhung-quan-cafe-dung-nen-bo-lo-khi-den-du-lich-nha-trang_0f98cf6370847f54af43291022f4f759.jpg" alt="Cafe Ấn Tượng" longdesc="https://nhatrangsensetravel.com/Cafe%20%E1%BA%A4n%20T%C6%B0%E1%BB%A3ng3" /></div>\n<div>&nbsp;</div>\n<div>Địa chỉ: 10 Bửu Đ&oacute;a, Nha Trang</div>\n<div>&nbsp;</div>\n<div><strong>An Cafe</strong></div>\n<div>&nbsp;</div>\n<div>Trong h&agrave;ng trăm qu&aacute;n c&agrave; ph&ecirc; s&ocirc;i động, trẻ trung của th&agrave;nh phố du lịch Nha Trang, An Coffee như một nốt trầm xinh xắn để du kh&aacute;ch thả hồn l&atilde;ng đ&atilde;ng, thư gi&atilde;n sau những giờ dạo chơi ở th&agrave;nh phố biển. Diện t&iacute;ch của An Cafe kh&ocirc;ng nhỏ, c&oacute; cả kh&ocirc;ng gian s&acirc;n vườn v&agrave; trong nh&agrave; nhưng d&ugrave; l&agrave; kh&ocirc;ng gian n&agrave;o th&igrave; cũng được b&agrave;i tr&iacute; theo c&aacute;ch ấm c&uacute;ng, gần gũi v&agrave; k&iacute;n đ&aacute;o.</div>\n<div>&nbsp;</div>\n<div><img title="An Cafe" src="https://nhatrangsensetravel.com/view/at_nhung-quan-cafe-dung-nen-bo-lo-khi-den-du-lich-nha-trang_dd12da232e55f267f9a1ee5167931d24.jpg" alt="An Cafe" longdesc="https://nhatrangsensetravel.com/An%20Cafe" /></div>\n<div>&nbsp;</div>\n<div>Ngay cả những m&oacute;n đồ decor trong qu&aacute;n cũng rất cổ, đ&oacute; l&agrave; chiếc audio, m&aacute;y quay phim, thậm ch&iacute; l&agrave; đ&agrave;i radio, quạt điện, b&agrave;n ủi con g&agrave;, điện thoại b&agrave;n, chiếc đầu băng cối xưa, d&agrave;n ampli đ&egrave;n... Thưởng thức ly c&agrave; ph&ecirc; trong những bản nhạc Ph&aacute;p mộng mơ v&agrave; kh&ocirc;ng gian cũ kỹ b&igrave;nh y&ecirc;n của qu&aacute;n, bạn sẽ cảm nhận được một Nha Trang rất kh&aacute;c, s&acirc;u lắng v&agrave; rất kh&oacute; qu&ecirc;n.</div>\n<div>&nbsp;</div>\n<div><img title="An Cafe2" src="https://nhatrangsensetravel.com/view/at_nhung-quan-cafe-dung-nen-bo-lo-khi-den-du-lich-nha-trang_0a5db41e774345a22b1669a662cbf93a.jpg" alt="An Cafe" longdesc="https://nhatrangsensetravel.com/An%20Cafe2" /></div>\n<div>&nbsp;</div>\n<div>Đồ uống của qu&aacute;n kh&aacute; cơ bản với c&aacute;c loại tr&agrave;, c&agrave; ph&ecirc;, sinh tố v&agrave; kem. Gi&aacute; đồ ở đ&acirc;y trung b&igrave;nh từ khoảng 20 ng&agrave;n đến 50 ng&agrave;n đồng.</div>\n<div>&nbsp;</div>\n<div>Địa chỉ: 40 L&ecirc; Đại H&agrave;nh, Tp. Nha Trang, Kh&aacute;nh Ho&agrave;&nbsp;</div>\n<div>&nbsp;</div>\n<div><strong>Lak Coffee</strong></div>\n<div>&nbsp;</div>\n<div>Với diện t&iacute;ch tr&ecirc;n 600m2 v&agrave; được thiết kế theo kiểu nh&agrave; vườn 2 tầng tho&aacute;ng m&aacute;t, Lak Coffee l&agrave; địa chỉ c&agrave; ph&ecirc; quen thuộc của người d&acirc;n Nha Trang cũng như được kh&aacute; nhiều du kh&aacute;ch m&aacute;ch cho nhau để đến thăm khi đi du lịch. Qu&aacute;n rộng lại &nbsp;c&oacute; nhiều kh&ocirc;ng gian kh&aacute;c nhau như s&acirc;n vườn, ph&ograve;ng m&aacute;y lạnh với view ngắm đường phố Nha Trang n&ecirc;n kh&ocirc;ng kh&oacute; để bạn t&igrave;m được chỗ ngồi ưng &yacute;.&nbsp;</div>\n<div>&nbsp;</div>\n<div><img title="Lak Coffee" src="https://nhatrangsensetravel.com/view/at_nhung-quan-cafe-dung-nen-bo-lo-khi-den-du-lich-nha-trang_a042c50ac8da321a979459cdbdf19bf7.jpg" alt="Lak Coffee" longdesc="https://nhatrangsensetravel.com/Lak%20Coffee" /></div>\n<div>&nbsp;</div>\n<div>Menu của qu&aacute;n c&agrave; ph&ecirc; n&agrave;y được đ&aacute;nh gi&aacute; l&agrave; kh&aacute; đa dạng khi c&oacute; hơn 60 m&oacute;n bao gồm từ c&agrave; ph&ecirc; truyền thống cho đến những loại đồ uống c&oacute; nguồn gốc từ nước ngo&agrave;i như capuchino, cocktail, tr&agrave; xanh.... với gi&aacute; trung b&igrave;nh từ 30 ng&agrave;n đồng. Cũng như City Fox, thỉnh thoảng Lak cũng c&oacute; nhạc sống v&agrave;o buổi tối.</div>', 1, 2, '2019-06-22 15:13:27', '2019-06-22 15:13:27'),
(21, 'Nha Trang Sẽ Đón Hơn 180.000 Lượt Khách Nga', '/images/news/73544d96a98ee7207d7077df607b3c3173821158.jpeg', '<p>Theo dự b&aacute;o của Sở Văn h&oacute;a - Thể thao v&agrave; Du lịch, năm nay tiếp tục l&agrave; năm c&oacute; sự tăng trưởng về lượng du kh&aacute;ch Nga đến vui chơi, nghỉ dưỡng ở Nha Trang. C&aacute;c c&ocirc;ng ty ch&iacute;nh đưa kh&aacute;ch Nga đến Nha Trang vẫn l&agrave;: Forcus Travel, Pegas Touristik với khoảng 180.000 lượt du kh&aacute;ch. Ngo&agrave;i ra, c&ograve;n c&oacute; một lượng kh&aacute;ch Nga từ Matxcơva đến s&acirc;n bay quốc tế Cam Ranh tr&ecirc;n c&aacute;c chuyến bay của Tổng C&ocirc;ng ty H&agrave;ng kh&ocirc;ng Việt Nam.</p>\n<p><img title="Nha Trang Sẽ Đ&oacute;n Hơn 180.000 Lượt Kh&aacute;ch Nga Năm 2014 - Ảnh 1" src="https://nhatrangsensetravel.com/view/at_nha-trang-se-don-hon-180000-luot-khach-nga-nam-2014_8fbe73298db8fbdcac39b8139c13b79b.jpg" alt="Nha Trang Sẽ Đ&oacute;n Hơn 180.000 Lượt Kh&aacute;ch Nga Năm 2014 - Ảnh 1" /></p>\n<p><em>Du kh&aacute;ch Nga xuống s&acirc;n bay quốc tế Cam Ranh.</em></p>\n<p>Như vậy, lượng kh&aacute;ch Nga đến Nha Trang trong năm nay sẽ cao gần gấp đ&ocirc;i so với năm trước. Điều n&agrave;y chứng tỏ Nha Trang l&agrave; một điểm đến hấp dẫn đối với kh&aacute;ch du lịch từ xứ sở Bạch Dương. Tuy nhi&ecirc;n, lượng kh&aacute;ch Nga tăng trưởng cao trong một thời gian ngắn đang tạo &aacute;p lực về cơ sở vật chất, chất lượng dịch vụ, sản phẩm du lịch, tr&igrave;nh độ ngoại ngữ.</p>', 1, 2, '2019-06-22 15:14:43', '2019-06-22 15:14:43');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(22, 1500000, 81, '2019-06-16 14:13:37', '2019-06-16 14:13:37', '2019-06-16 21:13:37', 1, NULL),
(23, 1500000, 82, '2019-06-16 14:16:12', '2019-06-16 14:16:12', '2019-06-16 21:16:12', 1, NULL),
(26, 1500000, 85, '2019-06-17 10:43:45', '2019-06-17 10:47:29', '2019-06-17 17:43:45', 2, 'PAYID-LUDW7QA5L9053502S4192018'),
(27, 800000, 86, '2019-06-22 06:28:28', '2019-06-22 06:29:19', '2019-06-22 13:28:28', 2, 'PAYID-LUG4VKI0C789678TE953981U');

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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`PlaceID`, `PlaceName`, `Description`, `Contents`, `Region`, `ImgUrl`, `created_at`, `updated_at`) VALUES
(52, 'Khánh hòa', 'Thành phố biển Nha Trang', '<p>Kh&aacute;nh H&ograve;a c&oacute; bờ biển d&agrave;i hơn 200&nbsp;km v&agrave; gần 200 h&ograve;n đảo lớn nhỏ c&ugrave;ng nhiều vịnh biển đẹp như&nbsp;<a title="V&acirc;n Phong" href="https://vi.wikipedia.org/wiki/V%C3%A2n_Phong">V&acirc;n Phong</a>,&nbsp;<a title="Nha Trang" href="https://vi.wikipedia.org/wiki/Nha_Trang#Du_l%E1%BB%8Bch">Nha Trang</a>&nbsp;(một trong 29 vịnh đẹp nhất thế giới),&nbsp;<a title="Cam Ranh" href="https://vi.wikipedia.org/wiki/Cam_Ranh">Cam Ranh</a>... với kh&iacute; hậu &ocirc;n h&ograve;a, nhiệt độ trung b&igrave;nh 26⁰C, c&oacute; hơn 300 ng&agrave;y nắng trong năm, v&agrave; nhiều di t&iacute;ch lịch sử văn h&oacute;a v&agrave; danh lam thắng cảnh nổi tiếng như: Th&aacute;p Ponagar, th&agrave;nh cổ Di&ecirc;n Kh&aacute;nh, c&aacute;c di t&iacute;ch của nh&agrave; b&aacute;c học&nbsp;<a title="Alexandre Yersin" href="https://vi.wikipedia.org/wiki/Alexandre_Yersin">Yersin</a>&hellip;. Với những lợi thế đ&oacute; Kh&aacute;nh H&ograve;a đ&atilde; trở th&agrave;nh một trong những trung t&acirc;m du lịch lớn của Việt Nam.</p>\n<p>Trong cơ cấu kinh tế của tỉnh, tỷ trọng GDP của Dịch vụ - Du lịch chiếm 42,8%. Năm 2008, Kh&aacute;nh H&ograve;a đ&atilde; đ&oacute;n gần 1,6 triệu lượt kh&aacute;ch, trong đ&oacute; c&oacute; 325.000 lượt kh&aacute;ch quốc tế, doanh thu đạt 1.350 tỷ đồng. C&aacute;c cơ sở kinh doanh c&oacute; quy m&ocirc; lớn, hệ thống cơ sở hạ tầng được quan t&acirc;m đầu tư ph&aacute;t triển ảnh hưởng t&iacute;ch cực đến hoạt động Du lịch tr&ecirc;n địa b&agrave;n. Trong 10 kh&aacute;ch sạn đạt danh hiệu kh&aacute;ch sạn 5 sao h&agrave;ng đầu Việt Nam th&igrave; c&oacute; đến 3 kh&aacute;ch sạn tại Kh&aacute;nh H&ograve;a (Six Senses Ninh Van Bay, Evason Ana Mandara, v&agrave; Vinpearl Resort &amp; Spa)<sup id="cite_ref-1" class="reference"><a href="https://vi.wikipedia.org/wiki/Du_l%E1%BB%8Bch_Kh%C3%A1nh_H%C3%B2a#cite_note-1">[1]</a></sup>. Kh&aacute;nh H&ograve;a c&oacute; khu nghỉ dưỡng cao cấp nhất Việt Nam l&agrave; Six Senses Ninh Van Bay (huyện Ninh Van) do tập đo&agrave;n Six Senses quản l&yacute; vừa được tờ&nbsp;<em><a class="new" title="Sunday Times (trang chưa được viết)" href="https://vi.wikipedia.org/w/index.php?title=Sunday_Times&amp;action=edit&amp;redlink=1">Sunday Times</a></em>&nbsp;bầu l&agrave; một trong 20 resort tốt nhất thế giới&nbsp;<sup id="cite_ref-2" class="reference"><a href="https://vi.wikipedia.org/wiki/Du_l%E1%BB%8Bch_Kh%C3%A1nh_H%C3%B2a#cite_note-2">[2]</a></sup>.Nhiều loại h&igrave;nh, sản phẩm dịch vụ du lịch được tổ chức như c&aacute;c hoạt động vui chơi giải tr&iacute; tr&ecirc;n biển, du lịch lặn biển, tắm b&ugrave;n kho&aacute;ng... với năng lực tổ chức v&agrave; khai th&aacute;c kinh doanh ng&agrave;y c&agrave;ng ph&aacute;t triển r&otilde; n&eacute;t.</p>\n<div class="thumb tright">\n<div class="thumbinner">\n<div class="thumbcaption"><img src="../../upload/images/e087ccc5ad30591a1dc1f97aa1560f97319f1156.jpg" alt="" width="800" height="600" /></div>\n</div>\n</div>', 'MienTrung', '292772ce8608cfa2ddb830c5c78fa02c671d05de.jpeg', '2019-05-15 06:20:15', '2019-06-18 15:15:02'),
(56, 'Đà nẵng', 'Thành phố đáng sống', '<p>Đ&agrave; Nẵng l&agrave; một th&agrave;nh phố kh&aacute; nổi tiếng ở Việt Nam. Nhắc đến Đ&agrave; Nẵng ch&uacute;ng ta c&oacute; nhiều ng&ocirc;n từ để n&oacute;i về th&agrave;nh phố n&agrave;y khiến bạn v&agrave; du kh&aacute;ch tứ phương kh&ocirc;ng khỏi ấn tượng v&agrave; t&ograve; m&ograve;.</p>\n<p><img src="../../upload/images/757e73853620b561ee41ceb052b354aed9e1e80c.jpg" alt="" width="845" height="507" /></p>\n<p><img src="../../upload/images/a1c7e08434d8eac9cb71adce87805c592681f6cd.jpg" alt="" width="1200" height="800" /></p>', 'MienNam', '4d4f1851b192e3c009bb7a04829a83e67bb08728.jpeg', '2019-05-15 06:20:15', '2019-06-18 15:19:56'),
(59, 'Quảng Ngãi', 'Tình yêu về đất quảng', '<p><strong>Chắc chắn rằng nhắc đến du lịch&nbsp;Quảng&nbsp;Ng&atilde;i th&igrave; kh&ocirc;ng nhiều c&aacute;i t&ecirc;n xuất hiện trong đầu bạn cho lắm. Tuy nhi&ecirc;n, những địa điểm du&nbsp;lịch&nbsp;Quảng Ng&atilde;i c&oacute; rất nhiều nơi đẹp v&ocirc; c&ugrave;ng m&agrave; bạn chưa hề biết đến m&agrave; th&ocirc;i. Dưới đ&acirc;y l&agrave; 22 điểm đến sẽ chứng minh điều đ&oacute; với bạn!</strong></p>\n<p><strong><img src="../../upload/images/047d69bada35378ef891d76a8894a91b83a1c29c.jpg" alt="" width="748" height="497" /></strong></p>', 'MienTrung', '66ef3e3c732d3fb11fff822ae04328c7c700397c.jpeg', '2019-05-15 06:20:15', '2019-06-18 15:33:56'),
(63, 'Lâm đồng', 'Lâm Đồng là tỉnh duy nhất ở Tây Nguyên không có đường biên giới quốc tế. Thành phố Đà Lạt, tỉnh Lâm Đồng nằm cách TP Hồ Chí Minh khoảng 300 km về hướng Bắc; cách cảng biển Nha Trangkhoảng 210', '<p><strong>L&acirc;m Đồng</strong>&nbsp;thuộc Nam T&acirc;y Nguy&ecirc;n, l&agrave; một trong năm tỉnh của v&ugrave;ng T&acirc;y Nguy&ecirc;n với địa h&igrave;nh: ph&iacute;a Đ&ocirc;ng Bắc gi&aacute;p tỉnh&nbsp;Kh&aacute;nh Ho&agrave;, ph&iacute;a Đ&ocirc;ng gi&aacute;p tỉnh&nbsp;Ninh Thuận, ph&iacute;a T&acirc;y gi&aacute;p Đắk N&ocirc;ng, ph&iacute;a T&acirc;y Nam gi&aacute;p tỉnh&nbsp;Đồng Nai&nbsp;v&agrave; B&igrave;nh Phước, ph&iacute;a Nam v&agrave; Đ&ocirc;ng Nam gi&aacute;p tỉnh&nbsp;B&igrave;nh Thuận, ph&iacute;a Bắc gi&aacute;p tỉnh Đắc Lắc.</p>\n<p>L&acirc;m Đồng l&agrave;&nbsp;tỉnh&nbsp;duy nhất ở&nbsp;T&acirc;y Nguy&ecirc;n&nbsp;kh&ocirc;ng c&oacute; đường&nbsp;bi&ecirc;n giới&nbsp;quốc tế. Th&agrave;nh phố Đ&agrave; Lạt, tỉnh L&acirc;m Đồng nằm c&aacute;ch&nbsp;TP Hồ Ch&iacute; Minh&nbsp;khoảng 300&nbsp;km về&nbsp;hướng Bắc; c&aacute;ch cảng biển&nbsp;<a class="ctis" href="http://tuoidep.net/tag/du-lich-nha-trang/">Nha Trang</a>khoảng 210&nbsp;km về&nbsp;hướng T&acirc;y.</p>\n<p>Với kh&iacute; hậu &ocirc;n đới quanh năm m&aacute;t mẻ c&ugrave;ng với nhiều danh lam thắng cảnh đẹp, h&agrave;ng năm L&acirc;m Đồng thu h&uacute;t một lượng lớn du kh&aacute;ch tới đ&acirc;y&nbsp;<a class="ctis" href="http://tuoidep.net/">du lịch</a>, tham quan v&agrave; nghỉ dưỡng.</p>', 'TayNguyen', 'b305452cce0f3af47fe6f5b3f6a9b5de49011ff2.jpeg', '2019-05-15 06:20:15', '2019-06-18 15:30:51'),
(64, 'Phú yên', 'Phú Yên đẹp tựa một cô thôn nữ, có nét chân chất, mộc mạc của làng quê Việt Nam lại ẩn chứa những nét nhẹ nhàng, thuần khiết, trong trẻo.', '<p><img class="aligncenter wp-image-13645 size-full" src="https://vntrip.cdn.vccloud.vn/cam-nang/wp-content/uploads/2017/07/phu-yen.jpg" alt="C&aacute;nh đồng Ph&uacute; Y&ecirc;n đẹp mộng mơ qua ống k&iacute;nh của đạo diễn Victor Vũ (Ảnh: sưu tầm)" width="640" height="400" /></p>\n<div class="fb-quote fb_iframe_widget">&nbsp;</div>\n<p>&nbsp;</p>\n<p><em>C&aacute;nh đồng Ph&uacute; Y&ecirc;n đẹp mộng mơ qua ống k&iacute;nh của đạo diễn Victor Vũ (Ảnh: sưu tầm)</em></p>\n<p><strong>Ph&uacute; Y&ecirc;n</strong><strong>&nbsp;</strong>l&agrave; tỉnh thuộc miền Nam Trung Bộ, nối liền B&igrave;nh Định v&agrave; Kh&aacute;nh H&ograve;a. Nơi đ&acirc;y mang vẻ đẹp dịu d&agrave;ng, duy&ecirc;n d&aacute;ng khi &ocirc;m trọn hai ngọn đ&egrave;o: Đ&egrave;o C&ugrave; M&ocirc;ng gi&aacute;p B&igrave;nh Định v&agrave; đ&egrave;o Cả gi&aacute;p Kh&aacute;nh H&ograve;a. Điểm nổi bật ghi dấu trong l&ograve;ng kh&aacute;ch du lịch khi đặt ch&acirc;n tới nơi đ&acirc;y l&agrave; h&igrave;nh ảnh đồng l&uacute;a thẳng c&aacute;ch c&ograve; bay, b&atilde;i biển xanh mượt b&aacute;t ng&aacute;t, những đầm nước trong l&agrave;nh hay những g&agrave;nh đ&aacute; đĩa nhấp nh&ocirc; đầy l&iacute; th&uacute;.</p>', 'MienTrung', 'ac0d0d4d6c3baf2ce853fc0131a60e59be70431c.jpeg', '2019-06-22 16:52:41', '2019-06-22 16:52:41'),
(65, 'Bình định', 'Du lịch Bình Định với khung cảnh thiên nhiên tuyệt đẹp, nhiều đặc sản hấp dẫn sẽ là điểm dừng chân thú vị cho du khách muốn tránh xa những nơi ồn ào, đông đúc.', '<div class="content-tintuc"><a title="1. Tổng quan " href="https://wiki-travel.com.vn/Uploads/picture/Thaophuongnguyen-185524105540-bd.jpg" rel="gallery"><img title="1. Tổng quan " src="https://wiki-travel.com.vn/Uploads/picture/Thaophuongnguyen-185524105540-bd.jpg" alt="1. Tổng quan " /><img title="Slideshow" src="https://www.vietravel.com/content/img/icon_zoom.png" alt="Slideshow" /></a></div>\n<div>- Diện t&iacute;ch: 6.024,4 km&sup2;&nbsp;<br />- D&acirc;n số: 1.485.943 người (2009)&nbsp;<br />- Tỉnh lỵ: th&agrave;nh phố Qui Nhơn&nbsp;<br />- C&aacute;c huyện: An L&atilde;o, An nhơn, Ho&agrave;i &Acirc;n, Ho&agrave;i Nhơn, Ph&ugrave; C&aacute;t, Ph&ugrave; Mỹ, Tuy Phước, T&acirc;y Sơn, V&acirc;n Canh, Vĩnh Thạnh.&nbsp;<br />- D&acirc;n tộc: Kinh, Chăm, Ba Na, Hr&ecirc;&hellip;&nbsp;<br />- Địa giới: B&igrave;nh Định l&agrave; một tỉnh thuộc v&ugrave;ng duy&ecirc;n hải Nam Trung bộ, ph&iacute;a Bắc gi&aacute;p tỉnh Quảng Ng&atilde;i với đường ranh giới chung 63km, ph&iacute;a Nam gi&aacute;p tỉnh Ph&uacute; Ỵ&ecirc;n với đường ranh giới chung 50km, ph&iacute;a T&acirc;y gi&aacute;p tỉnh Gia Lai c&oacute; đường ranh giới chung 130 km, ph&iacute;a Đ&ocirc;ng gi&aacute;p biển Đ&ocirc;ng với bờ biển d&agrave;i 134km.&nbsp;<br />- Giao th&ocirc;ng: B&igrave;nh Định c&oacute; hệ thống giao th&ocirc;ng kh&aacute; thuận tiện với tuyến quốc lộ 1A v&agrave; đường sắt Bắc - Nam chạy dọc theo chiều d&agrave;i của tỉnh. Quốc lộ 19 được xem l&agrave; một trong những cửa ng&otilde; ra biển của c&aacute;c tỉnh T&acirc;y nguy&ecirc;n v&agrave; v&ugrave;ng Nam L&agrave;o.&nbsp;<br />Ga h&agrave;ng kh&ocirc;ng nằm tại huyện Ph&ugrave; C&aacute;t c&aacute;ch trung t&acirc;m th&agrave;nh phố 30km, c&oacute; c&aacute;c chuyến bay nối Qui nhơn với H&agrave; Nội,&nbsp;Đ&agrave; Nẵng&nbsp;v&agrave; th&agrave;nh phố Hồ Ch&iacute; Minh.&nbsp;<br />- Cự ly đường bộ từ Qui Nhơn đi: H&agrave; Nội (1.081km) &ndash; Pleiku (170km) &ndash; Quảng ng&atilde;i (199km) &ndash; Đ&agrave; Nẵng (324km) &ndash;&nbsp;Huế(427km) &ndash; Nha Trang (235km) &ndash; TP.HCM 642km)&hellip;&nbsp;<br />- Điểm&nbsp;du lịch&nbsp;ti&ecirc;u biểu: Điện thờ T&acirc;y Sơn, Bảo t&agrave;ng Quang Trung, th&agrave;nh Ho&agrave;ng Đế, quần thể di t&iacute;ch th&aacute;p Chăm cổ, G&agrave;nh R&aacute;ng Ti&ecirc;n Sa v&agrave; khu mộ thi sĩ H&agrave;n Mạc Tử, b&aacute;n đảo Phương Mai - Thị Nại, b&atilde;i tắm Ho&agrave;ng Hậu, suối nước n&oacute;ng Hội V&acirc;n, thắng cảnh Hầm H&ocirc;, hồ N&uacute;i Một, suối Ti&ecirc;n, đảo Yến, động Cườm&hellip;&nbsp;</div>', 'MienTrung', '6a38787d82ae6d7da1a7dd991c84da0c1b56409d.jpeg', '2019-06-22 16:56:30', '2019-06-22 16:56:30'),
(66, 'Bình thuận', 'Bình Thuận thuộc miền nào? Vùng đất thuộc duyên hải miền Trung, cực Nam Trung Bộ. Với điều kiện tự nhiên chia Bình Thuận thành 3 vùng: Ven biển, rừng núi và đồng bằng.', '<p><strong>Du lịch B&igrave;nh Thuận</strong>&nbsp;- Với lợi thế kh&ocirc;ng chỉ ở biển m&agrave; c&ograve;n ở sự tồn tại phong ph&uacute; về danh lam thắng cảnh, di t&iacute;ch kiến tr&uacute;c &ndash; lịch sử v&agrave; hệ thống văn h&oacute;a lễ hội cả d&acirc;n gian lẫn hiện đại. B&igrave;nh Thuận c&oacute; thể coi l&agrave; một trong những trung t&acirc;m du lịch của Việt Nam, mặc d&ugrave; so với c&aacute;c trung t&acirc;m du lịch lớn kh&aacute;c du lịch B&igrave;nh Thuận c&ograve;n kh&aacute; non trẻ. Ngo&agrave;i địa danh du lịch nổi tiếng&nbsp;<em>Mũi N&eacute;</em>,&nbsp;<em>Phan Thiết</em>,... B&igrave;nh Thuận c&ograve;n rất nhiều c&aacute;c địa điểm du lịch&nbsp;m&agrave; c&oacute; thể bạn đ&atilde; hoặc chưa từng nghe qua. Đến với&nbsp;<em><strong>tour du lịch B&igrave;nh Thuận&nbsp;</strong></em>tại&nbsp;<strong>Du Lịch Việt</strong>&nbsp;c&aacute;c bạn sẽ được đến những điểm du lịch nổi tiếng như:&nbsp;<em>Hải đăng K&ecirc; G&agrave;, đảo Ph&uacute; Qu&yacute;, C&ugrave; Lao C&acirc;u</em>, b&atilde;i đ&aacute;&nbsp;<em>Cổ Thạch</em>&hellip; Mỗi địa danh n&agrave;y dường như vẫn c&ograve;n ẩn chứa rất nhiều những vẻ đẹp hoang sơ&nbsp;tiềm ẩn chưa được khai th&aacute;c hết. Ch&iacute;nh bởi thế&nbsp;m&agrave;<em><strong>&nbsp;tour&nbsp;B&igrave;nh Thuận</strong></em>trong những năm qua vẫn lu&ocirc;n đặc biệt cuốn h&uacute;t được rất nhiều du kh&aacute;ch, nhất l&agrave; c&aacute;c bạn trẻ.</p>', 'MienTrung', '1451d862f79a6d2d687a721fedfce1b326e7551f.jpeg', '2019-06-22 17:00:10', '2019-06-22 17:00:10'),
(67, 'Huế', 'Huế không chỉ cuốn hút du khách bởi những nét đẹp văn hóa, lịch sử, những nét đẹp cổ kính, mà còn thu phục lòng người bởi sự thân thiện của con người xứ Huế, sự dịu dàng, ngọt ngào của người ', '<p>&nbsp;Kinh đ&ocirc; Huế l&agrave; thủ đ&ocirc; của quốc gia Việt Nam thống nhất từ năm 1802, sau khi Nguyễn &Aacute;nh l&ecirc;n ng&ocirc;i ho&agrave;ng đế mở đầu cho nh&agrave; Nguyễn, vương triều phong kiến cuối c&ugrave;ng trong lịch sử Việt Nam. Huế kết th&uacute;c sứ mệnh l&agrave; thủ đ&ocirc; Việt Nam v&agrave;o năm 1945 khi vị ho&agrave;ng đế cuối c&ugrave;ng của nh&agrave; Nguyễn l&agrave; Bảo Đại tho&aacute;i vị. Kể từ đ&oacute; thủ đ&ocirc; Việt Nam một lần nữa lại được chọn l&agrave; H&agrave; Nội, Kinh đ&ocirc; Huế xưa trở th&agrave;nh Cố đ&ocirc;.&nbsp;Huế l&agrave; th&agrave;nh phố nằm ven biển Đ&ocirc;ng, l&agrave; th&agrave;nh phố miền Trung nằm giữa hai th&agrave;nh phố lớn H&agrave; Nội v&agrave; S&agrave;i G&ograve;n. Hai tỉnh l&aacute;ng giềng của Huế l&agrave; Quảng Trị v&agrave; Đ&agrave; Nẵng. Đ&egrave;o Hải V&acirc;n nối liền Huế với Đ&agrave; Nẵng v&agrave; ranh giới thời tiết hai miền.</p>', 'MienTrung', '1734b68c3d580869c06efcc6071d4de4ef0a4b68.jpeg', '2019-06-22 17:02:49', '2019-06-22 17:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE IF NOT EXISTS `promotions` (
  `PromotionID` int(10) unsigned NOT NULL,
  `Contents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`PromotionID`, `Contents`, `created_at`, `updated_at`) VALUES
(24, 'khuyến mãi 30/04/2019', '2019-05-12 07:35:40', '2019-05-12 07:35:40'),
(25, 'Sinh nhật bác hồ', '2019-05-12 07:39:44', '2019-05-12 07:39:44'),
(26, 'quốc tế thiếu nhi', '2019-05-12 07:41:07', '2019-05-12 07:41:07'),
(27, 'Tết nguyên đán', '2019-05-15 05:29:11', '2019-05-15 05:29:11'),
(28, 'Du lịch mùa hè', '2019-06-18 16:47:39', '2019-06-18 16:47:39');

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
(26, 53, 11.00, '2019-07-06 00:38:02'),
(26, 55, 11.00, '2019-07-06 00:38:02'),
(28, 52, 9.00, '2019-06-29 23:47:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(50, 5, 'jhjhnj', '0', '2019-06-15 03:41:21', '2019-06-15 03:41:21', 2, 2, 51),
(51, 5, 'test', '0', '2019-06-18 14:49:05', '2019-06-18 14:49:05', 2, 2, 52),
(52, 4, 'Công nhận haty', '0', '2019-06-18 14:54:32', '2019-06-18 14:54:32', 2, 2, 52);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'member', 'web', '2019-04-24 10:08:48', '2019-04-24 10:08:48'),
(2, 'mod', 'web', '2019-04-24 10:08:48', '2019-04-24 10:08:48'),
(3, 'admin', 'web', '2019-04-24 10:08:48', '2019-04-24 10:08:48');

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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scenic__cultures`
--

INSERT INTO `scenic__cultures` (`ScenicID`, `place_id`, `Description`, `Contents`, `HitCount`, `ImgUrl`, `state`, `created_at`, `updated_at`, `ScenicName`) VALUES
(63, 52, 'Nằm trên đảo Hòn Tre, Vinpearl Land là một điểm du lịch hấp dẫn, nổi tiếng nhất Nha Trang. Không chỉ thu hút du khách bởi bãi biển tuyệt đẹp, khách sạn sang trọng, công viên nước và thủy cung', '<p><img src="../upload/images/ceed4f4c4016e5fb86b170eeacc576d75017cf71.jpg" alt="" width="600" height="417" /></p>\n<p>Vinpearl Land c&ograve;n đem đến cho kh&aacute;ch du lịch những trải nghiệm th&uacute; vị từ c&aacute;c tr&ograve; chơi cảm gi&aacute;c mạnh v&agrave; rạp chiếu phim 4D ho&agrave;nh tr&aacute;ng.</p>\n<p>Để đến được Vinpearl Land bạn phải đi c&aacute;p treo hoặc ca n&ocirc; từ th&agrave;nh phố Nha Trang. V&eacute; đi c&aacute;p treo l&agrave; 450.000VND/người lớn; 350.000VND/trẻ em (1,0 m &ndash; 1,4 m). V&eacute; n&agrave;y cũng đ&atilde; bao gồm cả những dịch vụ tr&ograve; chơi tr&ecirc;n &ldquo;h&ograve;n ngọc Việt&rdquo; n&agrave;y.</p>', 0, '07507aead82f6c720b2bd15fd751a8833b3042a3.jpeg', 1, '2019-06-18 16:17:00', '2019-06-18 16:17:00', 'Khu du lịch Vinpearl Land'),
(64, 52, 'Viện Hải dương học nằm ở địa chỉ số 1, Cầu Đá, Thành phố Nha Trang, tỉnh Khánh Hoà. Viện được người Pháp xây dựng vào năm 1923 với diện tích rộng khoảng 20ha nằm gần vùng biển sâu thuận lợi c', '<header class="the-article-header"></header>\n<section class="main">\n<div class="the-article-body">\n<h1><strong>Viện Hải dương học Nha Trang</strong></h1>\n<p>Viện Hải dương học nằm ở địa chỉ số 1, Cầu Đ&aacute;, Th&agrave;nh phố Nha Trang, tỉnh Kh&aacute;nh Ho&agrave;. Viện được người Ph&aacute;p x&acirc;y dựng v&agrave;o năm 1923 với diện t&iacute;ch rộng khoảng 20ha nằm gần v&ugrave;ng biển s&acirc;u thuận lợi cho việc nguy&ecirc;n cứu c&aacute;c lo&agrave;i sinh vật biển tại đ&acirc;y. Biểu tượng của Viện Hải dương học Nha Trang l&agrave; lo&agrave;i c&aacute; Mao Ti&ecirc;n cực độc.<br />Đến đ&acirc;y du kh&aacute;ch cũng sẽ được chi&ecirc;m ngưỡng Bảo t&agrave;ng sinh vật biển với tr&ecirc;n 20.000 mẫu vật của hơn 4000 loại sinh vật biển v&agrave; nước ngọt được sưu tầm, g&igrave;n giữ từ nhiều năm nay.</p>\n<p>Nơi đ&acirc;y c&oacute; trưng b&agrave;y bộ xương c&aacute; voi khổng lồ d&agrave;i gần 26 m, cao 3m. Theo c&aacute;c nh&agrave; khoa học con c&aacute; n&agrave;y c&oacute; c&aacute;ch đ&acirc;y hơn 200 năm.</p>\n<p><img src="../upload/images/f13f05e7e799b6cd9ac751ef85465962dc0f997e.png" alt="" width="600" height="400" /></p>\n<p>Đặc biệt hơn, khi đến với Viện Hải dương học du kh&aacute;ch sẽ c&oacute; cơ hội được tận mắt chứng kiến những mẫu vật sống được nu&ocirc;i thả trong bể k&iacute;nh. C&oacute; đến h&agrave;ng trăm lo&agrave;i sinh vật biển qu&yacute; hiếm đang được nu&ocirc;i giữ tại đ&acirc;y như: c&aacute; mập, r&ugrave;a biển, c&aacute; ch&igrave;nh, c&aacute; ho&agrave;ng hậu, t&ocirc;m h&ugrave;m, c&aacute; mặt quỷ, hải cẩu,...</p>\n</div>\n</section>', 0, '3a6d99fadbbe389d845d9621e4190e36da0d69bd.jpeg', 1, '2019-06-18 16:21:39', '2019-06-18 16:21:39', 'Viện Hải dương học Nha Trang'),
(65, 52, 'Tháp Bà Po Nagar là một công trình kiến trúc cổ tuyệt đẹp và giàu tính lịch sử văn minh của dân tộc Chăm.', '<p>Th&aacute;p B&agrave; Po Nagar l&agrave; một c&ocirc;ng tr&igrave;nh kiến tr&uacute;c cổ tuyệt đẹp v&agrave; gi&agrave;u t&iacute;nh lịch sử văn minh của d&acirc;n tộc Chăm. Th&aacute;p B&agrave; nằm c&aacute;ch trung t&acirc;m th&agrave;nh phố khoảng 2km. Điều đặc biệt l&agrave; Th&aacute;p&nbsp;B&agrave; Po Nagar hiện nay vẫn duy tr&igrave; c&aacute;c hoạt động t&iacute;n ngưỡng t&acirc;m linh n&ecirc;n rất ph&ugrave; hợp cho những ai muốn t&igrave;m hiểu về văn h&oacute;a Chăm.</p>\n<p>Tuy nhi&ecirc;n, khi bạn tới Th&aacute;p B&agrave; tham quan h&atilde;y ch&uacute; &yacute; c&aacute;c chỉ dẫn ở đ&acirc;y. Nếu bạn mặc trang phục chưa ph&ugrave; hợp th&igrave; c&oacute; thể mượn &aacute;o d&agrave;i ở b&ecirc;n ngo&agrave;i để v&agrave;o trong th&aacute;p tham quan hoặc h&agrave;nh lễ.</p>\n<table align="center">\n<tbody>\n<tr>\n<td><a href="https://znews-photo.zadn.vn/w660/Uploaded/NokaRW/2015_11_30/dulichnhatrang5.jpg"><img class="loaded" src="https://znews-photo.zadn.vn/w660/Uploaded/NokaRW/2015_11_30/dulichnhatrang5.jpg" alt="14 diem du lich khong the bo qua khi toi Khanh Hoa hinh anh 3 " /></a></td>\n</tr>\n<tr>\n<td>Ảnh:&nbsp;<strong><em>Internet</em>.</strong></td>\n</tr>\n</tbody>\n</table>\n<p>Sau khi thăm quan xong quần thể th&aacute;p Po Nagar, bạn c&oacute; thể đến khu suối kho&aacute;ng n&oacute;ng Th&aacute;p B&agrave; ngay cạnh đ&oacute; để trải nghiệm dịch vụ tắm b&ugrave;n độc đ&aacute;o. Gi&aacute; v&eacute; khoảng 100.000VND/người ở hồ tập thể (từ 15 &ndash; 20 người) hoặc 250.000VND/người nếu sử dụng hồ ri&ecirc;ng.</p>', 0, '2b16d65badc57b23a1b8406038ad8d64b8dd3e37.jpeg', 1, '2019-06-18 16:27:13', '2019-06-18 16:27:13', 'Tháp Bà Po Nagar'),
(66, 63, 'Nằm cách trung thành phố Đà Lạt khoảng 4km, tọa lạc trên đường số 7, Mai Anh Đào.', '<h2>Thung lũng t&igrave;nh y&ecirc;u</h2>\n<p>Nằm c&aacute;ch trung th&agrave;nh phố Đ&agrave; Lạt khoảng 4km, tọa lạc tr&ecirc;n đường số 7, Mai Anh Đ&agrave;o. B&ecirc;n cạnh những cảnh sắc đẹp, thung lũng T&igrave;nh Y&ecirc;u c&ograve;n c&oacute; những tr&ograve; chơi mạo hiểm v&agrave; hấp dẫn với nhiều du kh&aacute;ch như: đạp vịt thả tr&ocirc;i tr&ecirc;n hồ Đa Thiện, Đu d&acirc;y tự do, thử th&aacute;ch với con đường gian khổ, du ngoạn bằng xe jeep, cưỡi ngựa tr&ecirc;n rừng th&ocirc;ng...</p>\n<p><img title="Thung&nbsp;lũng&nbsp;t&igrave;nh&nbsp;y&ecirc;u&nbsp;tại&nbsp;Đ&agrave;&nbsp;Lạt" src="http://tuoidep.net/app/webroot/js/kcfinder/upload/images/da-lat/thung-lung-tinh-yeu.jpg" alt="Thung&nbsp;lũng&nbsp;t&igrave;nh&nbsp;y&ecirc;u&nbsp;tại&nbsp;Đ&agrave;&nbsp;Lạt" longdesc="http://tuoidep.net/du-lich-lam-dong-va-nhung-danh-lam-thang-canh-noi-tieng/Thung%C2%A0l%C5%A9ng%C2%A0t%C3%ACnh%C2%A0y%C3%AAu%C2%A0t%E1%BA%A1i%C2%A0%C4%90%C3%A0%C2%A0L%E1%BA%A1t" /></p>', 0, '489d6c4115335a881981704bd0fc593701575125.jpeg', 1, '2019-06-18 16:29:07', '2019-06-18 16:29:07', 'Thung lũng tình yêu'),
(67, 63, 'Nhà thờ con gà ở Đà Lạt nằm trên đường Trần Phú còn được gọi tên gọi khách là Nhà thờ Chánh Tòa.', '<h3>Nh&agrave; thờ con g&agrave;</h3>\n<p>Nh&agrave; thờ con g&agrave;&nbsp;ở&nbsp;Đ&agrave; Lạt&nbsp;nằm tr&ecirc;n đường Trần Ph&uacute; c&ograve;n được gọi t&ecirc;n gọi kh&aacute;ch l&agrave; Nh&agrave; thờ Ch&aacute;nh T&ograve;a. Nh&agrave; thờ Con g&agrave;&nbsp;l&agrave; một trong những kiến tr&uacute;c cổ xưa ti&ecirc;u biểu c&ograve;n x&oacute;t lại từ thời Ph&aacute;p thuộc. Đ&acirc;y l&agrave; một trong những nh&agrave; thờ lớn nhất của&nbsp;Đ&agrave; Lạt. Sở dĩ nh&agrave; thờ c&oacute; t&ecirc;n gọi l&agrave; con g&agrave; v&igrave; tr&ecirc;n đỉnh th&aacute;p chu&ocirc;ng c&oacute; tượng một con g&agrave; lớn.</p>\n<p><img title="Nh&agrave;&nbsp;thờ&nbsp;con&nbsp;g&agrave;&nbsp;tại&nbsp;Đ&agrave;&nbsp;Lạt" src="http://tuoidep.net/app/webroot/js/kcfinder/upload/images/da-lat/nha-tho-con-ga.jpg" alt="Nh&agrave;&nbsp;thờ&nbsp;con&nbsp;g&agrave;&nbsp;tại&nbsp;Đ&agrave;&nbsp;Lạt" longdesc="http://tuoidep.net/du-lich-lam-dong-va-nhung-danh-lam-thang-canh-noi-tieng/Nh%C3%A0%C2%A0th%E1%BB%9D%C2%A0con%C2%A0g%C3%A0%C2%A0t%E1%BA%A1i%C2%A0%C4%90%C3%A0%C2%A0L%E1%BA%A1t" /></p>', 0, '856964abee16dcd37608ee40faa17e381edc8046.jpeg', 1, '2019-06-18 16:30:08', '2019-06-18 16:30:08', 'Nhà thờ con gà'),
(68, 67, 'Sông Hương là dòng sông thơ mộng được coi là biểu tượng của Huế (ngoài Kinh Thành Huế). Là một trong 5 điểm đến hấp dẫn nhất Việt Nam theo bình chọn của Tổ chức các kỷ lục gia Việt Nam bình c', '<p class="box-title"><strong>S&ocirc;ng Hương</strong></p>\n<p class="box-title"><a href="http://blog.1tour.vn/wp-content/uploads/2015/12/3.Cau-Trang-Tien26.jpg"><img class="alignnone wp-image-15374 size-full td-animation-stack-type0-2" src="http://blog.1tour.vn/wp-content/uploads/2015/12/3.Cau-Trang-Tien26.jpg" sizes="(max-width: 3008px) 100vw, 3008px" srcset="http://blog.1tour.vn/wp-content/uploads/2015/12/3.Cau-Trang-Tien26.jpg 3008w, http://blog.1tour.vn/wp-content/uploads/2015/12/3.Cau-Trang-Tien26-300x173.jpg 300w, http://blog.1tour.vn/wp-content/uploads/2015/12/3.Cau-Trang-Tien26-1024x590.jpg 1024w, http://blog.1tour.vn/wp-content/uploads/2015/12/3.Cau-Trang-Tien26-696x401.jpg 696w, http://blog.1tour.vn/wp-content/uploads/2015/12/3.Cau-Trang-Tien26-1068x615.jpg 1068w, http://blog.1tour.vn/wp-content/uploads/2015/12/3.Cau-Trang-Tien26-729x420.jpg 729w" alt="3.Cau Trang Tien26" width="3008" height="1732" /></a></p>\n<p class="box-title">S&ocirc;ng Hương l&agrave; d&ograve;ng s&ocirc;ng thơ mộng được coi l&agrave; biểu tượng của Huế (ngo&agrave;i Kinh Th&agrave;nh Huế). L&agrave; một trong 5 điểm đến hấp dẫn nhất Việt Nam theo b&igrave;nh chọn của Tổ chức c&aacute;c kỷ lục gia Việt Nam b&igrave;nh chọn.</p>\n<p class="box-title"><a href="http://blog.1tour.vn/wp-content/uploads/2015/12/huutam246-20125309025307-TAM_4834-pro.jpg"><img class="alignnone wp-image-15379 size-full td-animation-stack-type0-2" src="http://blog.1tour.vn/wp-content/uploads/2015/12/huutam246-20125309025307-TAM_4834-pro.jpg" sizes="(max-width: 1366px) 100vw, 1366px" srcset="http://blog.1tour.vn/wp-content/uploads/2015/12/huutam246-20125309025307-TAM_4834-pro.jpg 1366w, http://blog.1tour.vn/wp-content/uploads/2015/12/huutam246-20125309025307-TAM_4834-pro-300x176.jpg 300w, http://blog.1tour.vn/wp-content/uploads/2015/12/huutam246-20125309025307-TAM_4834-pro-1024x600.jpg 1024w, http://blog.1tour.vn/wp-content/uploads/2015/12/huutam246-20125309025307-TAM_4834-pro-696x408.jpg 696w, http://blog.1tour.vn/wp-content/uploads/2015/12/huutam246-20125309025307-TAM_4834-pro-1068x625.jpg 1068w, http://blog.1tour.vn/wp-content/uploads/2015/12/huutam246-20125309025307-TAM_4834-pro-717x420.jpg 717w" alt="huutam246-20125309025307-TAM_4834 pro" width="1366" height="800" /></a></p>\n<p class="box-title">S&ocirc;ng Hương bắt nguồn từ d&atilde;y n&uacute;i Trường Sơn, &nbsp;men theo c&aacute;c d&ograve;ng suối nhỏ sau đ&oacute; tọa lạc b&ecirc;n Kinh Th&agrave;nh Huế cổ k&iacute;nh. Ch&iacute;nh từ len lỏi trong những c&aacute;nh rừng, d&ograve;ng nước đ&atilde; mang theo hương thơm của cỏ c&acirc;y đến với xứ Huế, kể từ đ&oacute; d&ograve;ng s&ocirc;ng được mang t&ecirc;n l&agrave; d&ograve;ng nước Hương Giang.</p>', 0, '9298148158a263cf0f6e9db9e86c81804ec0e76f.jpeg', 1, '2019-06-22 17:06:40', '2019-06-22 17:06:40', 'Sông Hương'),
(69, 67, 'Được mệnh danh là người đẹp làng chài, Với vè đẹp thanh bình, quyến rũ, Lăng Cô đã mang đến cho du khách một sức hút vô cùng mới lạ. Nơi đây, giống như một xứ sở thần tiên, một bức tranh thiê', '<p class="box-title">Được mệnh danh l&agrave; người đẹp l&agrave;ng ch&agrave;i, Với v&egrave; đẹp thanh b&igrave;nh, quyến rũ, Lăng C&ocirc; đ&atilde; mang đến cho du kh&aacute;ch một sức h&uacute;t v&ocirc; c&ugrave;ng mới lạ. Nơi đ&acirc;y, giống như một xứ sở thần ti&ecirc;n, một bức tranh thi&ecirc;n nhi&ecirc;n đẹp đến m&ecirc; hồn.</p>\n<p class="box-title"><a href="http://blog.1tour.vn/wp-content/uploads/2015/12/1333945768-LangCo.jpg"><img class="alignnone wp-image-15382 size-full td-animation-stack-type0-2" src="http://blog.1tour.vn/wp-content/uploads/2015/12/1333945768-LangCo.jpg" sizes="(max-width: 1280px) 100vw, 1280px" srcset="http://blog.1tour.vn/wp-content/uploads/2015/12/1333945768-LangCo.jpg 1280w, http://blog.1tour.vn/wp-content/uploads/2015/12/1333945768-LangCo-300x226.jpg 300w, http://blog.1tour.vn/wp-content/uploads/2015/12/1333945768-LangCo-1024x771.jpg 1024w, http://blog.1tour.vn/wp-content/uploads/2015/12/1333945768-LangCo-80x60.jpg 80w, http://blog.1tour.vn/wp-content/uploads/2015/12/1333945768-LangCo-696x524.jpg 696w, http://blog.1tour.vn/wp-content/uploads/2015/12/1333945768-LangCo-1068x804.jpg 1068w, http://blog.1tour.vn/wp-content/uploads/2015/12/1333945768-LangCo-558x420.jpg 558w" alt="1333945768-LangCo" width="1280" height="964" /></a></p>\n<p class="box-title">Nằm dọc theo quốc lộ 1A, cạnh đ&egrave;o Hải V&acirc;n v&agrave; c&aacute;ch vườn quốc gia Bạch m&atilde; chừng 24km, với b&atilde;i c&aacute;t d&agrave;i 8km trắng mịn, lung linh, h&agrave;i h&ograve;a c&ugrave;ng gi&oacute; nước m&acirc;y trời nơi xứ Huế tạo n&ecirc;n một bức tranh diệu kỳ.</p>', 0, '8bcc45ea1a63a72d2fc87014a9424c2a1a996a86.jpeg', 1, '2019-06-22 17:09:11', '2019-06-22 17:09:11', 'Bãi Biển Lăng Cô'),
(70, 59, 'Đảo Lý Sơn, hay còn gọi là Cù Lao Ré, vốn là một miệng núi lửa đã tắt, có sức hút vô cùng mãnh liệt đối với bất cứ ai đam mê du lịch và thích khám phá.', '<div id="attachment_175666" class="wp-caption aligncenter"><img class="wp-image-175666 size-full" title="Đỉnh Thới Lới. Ảnh: ST" src="https://cdn3.ivivu.com/2016/11/du-lich-quang-ngai-ivivu-1.jpg" alt="Đỉnh Thới Lới. Ảnh: ST" width="600" height="398" />\n<p class="wp-caption-text">Đỉnh Thới Lới. Ảnh: ST</p>\n</div>\n<p>Đảo L&yacute; Sơn, hay c&ograve;n gọi l&agrave; C&ugrave; Lao R&eacute;, vốn l&agrave; một miệng n&uacute;i lửa đ&atilde; tắt, c&oacute; sức h&uacute;t v&ocirc; c&ugrave;ng m&atilde;nh liệt đối với bất cứ ai đam m&ecirc; du lịch v&agrave; th&iacute;ch kh&aacute;m ph&aacute;. C&aacute;ch Quảng Ng&atilde;i 40 km đường biển, đảo L&yacute; Sơn kh&ocirc;ng chỉ nổi tiếng l&agrave; &ldquo;vương quốc h&agrave;nh tỏi&rdquo;, m&agrave; c&ograve;n l&agrave; một địa chỉ du lịch bỏ t&uacute;i cho c&aacute;c t&iacute;n đồ m&ecirc; x&ecirc; dịch.</p>\n<div id="attachment_175667" class="wp-caption aligncenter"><img class="wp-image-175667 size-full" title="Khung cảnh b&igrave;nh y&ecirc;n tr&ecirc;n đảo. Ảnh: ST" src="https://cdn3.ivivu.com/2016/11/du-lich-quang-ngai-ivivu-2.jpg" alt="Khung cảnh b&igrave;nh y&ecirc;n tr&ecirc;n đảo. Ảnh: ST" width="1600" height="1057" />\n<p class="wp-caption-text">Khung cảnh b&igrave;nh y&ecirc;n tr&ecirc;n đảo. Ảnh: ST</p>\n</div>\n<p>H&ograve;n đảo xinh đẹp với m&agrave;u nước trong veo, v&agrave; bạn c&oacute; thể nh&igrave;n thấy đ&aacute;y. Bạn sẽ thấy 3 m&agrave;u nước một c&aacute;ch r&otilde; rệt: ở gần bờ l&agrave; nước m&agrave;u trong trẻo, tiếp theo l&agrave; lớp m&agrave;u xanh ngọc v&agrave; xa hơn l&agrave; m&agrave;u xanh da trời. Một khung cảnh đẹp tuyệt vời m&agrave; chắc chắn bạn sẽ muốn nhảy xuống, ng&acirc;m m&igrave;nh trong d&ograve;ng nước m&aacute;t rượi n&agrave;y.</p>', 0, 'b49672b44602178431b26d88b1283583ee5f66d7.jpeg', 1, '2019-06-22 17:12:55', '2019-06-22 17:12:55', 'Đảo Lý Sơn'),
(71, 59, 'Thác thuộc xã Thanh An, huyện Minh Long, cách thành phố Quảng Ngãi khoảng 23 km về hướng Tây Nam.', '<p>Th&aacute;c thuộc x&atilde; Thanh An, huyện Minh Long, c&aacute;ch th&agrave;nh phố Quảng Ng&atilde;i khoảng 23 km về hướng T&acirc;y Nam. Bao quanh th&aacute;c l&agrave; v&ugrave;ng đồi n&uacute;i trập tr&ugrave;ng, ngập tr&agrave;n m&agrave;u xanh của c&acirc;y l&aacute; n&ecirc;n khung cảnh rất n&ecirc;n thơ, trong l&agrave;nh v&agrave; tĩnh lặng. Th&aacute;c Trắng cao chừng hơn 40 m, những d&ograve;ng nước tu&ocirc;n tr&agrave;o tung bọt trắng x&oacute;a c&aacute;c ghềnh đ&aacute; ph&iacute;a dưới.</p>\n<div id="attachment_175671" class="wp-caption aligncenter"><img class="wp-image-175671 size-full" title="Ảnh: ST" src="https://cdn3.ivivu.com/2016/11/du-lich-quang-ngai-ivivu-3.jpg" alt="Ảnh: ST" width="960" height="960" />\n<p class="wp-caption-text">Ảnh: ST</p>\n</div>\n<p>Nước đổ xuống hồ dưới ch&acirc;n th&aacute;c rồi chảy theo con suối rộng chừng 20 m, nhấp nh&ocirc; đ&aacute;, chảy quanh co trong thung lũng trước khi hợp với c&aacute;c khe suối kh&aacute;c. Trong hồ nước dưới ch&acirc;n th&aacute;c c&ograve;n c&oacute; nhiều c&aacute; ni&ecirc;ng, một loại đặc sản được nhiều du kh&aacute;ch ưa th&iacute;ch.</p>', 0, '440998c27dc5db980d07f7955466bff4c599ed47.jpeg', 1, '2019-06-22 17:14:08', '2019-06-22 17:14:08', 'Thác Trắng Minh Long'),
(72, 65, 'Cù Lao Xanh hay còn gọi là đảo Vân Phi thuộc xã đảo Nhơn Châu cách Quy Nhơn hơn 20 km', '<div class="item_slide_show clearfix">\n<div class="desc_cation">\n<p>C&ugrave; Lao Xanh hay c&ograve;n gọi l&agrave; đảo V&acirc;n Phi thuộc x&atilde; đảo Nhơn Ch&acirc;u c&aacute;ch Quy Nhơn hơn 20 km. Đ&uacute;ng như c&aacute;i t&ecirc;n, đến đ&acirc;y du kh&aacute;ch sẽ được đắm m&igrave;nh trong một khoảng kh&ocirc;ng gian bất tận của biển trời v&agrave; n&uacute;i non xanh m&aacute;t. Du kh&aacute;ch c&oacute; thể d&agrave;nh hai ng&agrave;y một đ&ecirc;m tr&ecirc;n đảo để trải nghiệm đời sống d&acirc;n ch&agrave;i, c&ugrave;ng đi đ&aacute;nh c&aacute; sớm, leo l&ecirc;n ngọn hải đăng ngắm to&agrave;n cảnh đảo, thưởng thức hải sản tươi ngon, tắm biển, kh&aacute;m ph&aacute; c&aacute;c b&atilde;i đ&aacute;, l&agrave;ng ch&agrave;i... Ảnh:&nbsp;<em>Tiến H&ugrave;ng.</em></p>\n</div>\n</div>\n<div class="item_slide_show clearfix">\n<div class="block_thumb_slide_show"><img id="vne_slide_image_1" class="left  displayAfterResize vne_lazy_image lazyloaded" src="https://i-dulich.vnecdn.net/2018/04/14/18299581-1450143565044081-4937141760896794624-n-1523677123_680x0.jpg" alt="7 điểm du lịch l&yacute; tưởng ở B&igrave;nh Định dịp 30/4" data-reference-id="25518755" data-original="https://i-dulich.vnecdn.net/2018/04/14/18299581-1450143565044081-4937141760896794624-n-1523677123_680x0.jpg" data-component-caption="&amp;lt;p&amp;gt;\n	&amp;lt;strong&amp;gt;H&ograve;n Kh&ocirc;&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;\n&amp;lt;p&amp;gt;\n	H&ograve;n Kh&ocirc; hay C&ugrave; lao H&ograve;n Kh&ocirc;, l&agrave; một trong 32 h&ograve;n đảo nằm gần bờ của tỉnh B&igrave;nh Định, c&aacute;ch trung t&acirc;m th&agrave;nh phố Quy Nhơn khoảng 16 km, thuộc th&ocirc;n Hải Đ&ocirc;ng, x&atilde; Nhơn Hải. Đến đ&acirc;y, ngo&agrave;i thăm l&agrave;ng ch&agrave;i du kh&aacute;ch sẽ được lặn ngắm san h&ocirc;, thưởng thức nhiều m&oacute;n tươi ngon miền biển với ly rượu B&agrave;u Đ&aacute; cay nồng v&agrave; chinh phục d&atilde;y n&uacute;i đ&aacute; tr&ecirc;n đảo. Gi&aacute; tour kh&aacute;m ph&aacute; H&ograve;n Kh&ocirc; một ng&agrave;y từ 220.000 đến 320.000 đồng mỗi người. Ảnh: &amp;lt;em&amp;gt;nguyenthuytrang153.&amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;" /></div>\n</div>', 0, '964921cf4c83b1b6aeeb6d7fda496ea90f37d9e6.jpeg', 1, '2019-06-22 17:16:14', '2019-06-22 17:16:14', 'Cù Lao Xanh'),
(73, 65, 'Thuộc xã Nhơn Lý, cách thành phố Quy Nhơn 25 km về phía đông bắc, Kỳ Co có một mặt giáp biển, 3 mặt là đồi núi', '<div class="item_slide_show clearfix">\n<div class="desc_cation">\n<p>Thuộc x&atilde; Nhơn L&yacute;, c&aacute;ch th&agrave;nh phố Quy Nhơn 25 km về ph&iacute;a đ&ocirc;ng bắc, Kỳ Co c&oacute; một mặt gi&aacute;p biển, 3 mặt l&agrave; đồi n&uacute;i. Du kh&aacute;ch tới Kỳ Co c&oacute; thể chọn dịch vụ cano hoặc thuyền đi từ Eo Gi&oacute; ra, trải nghiệm l&ecirc;nh đ&ecirc;nh s&oacute;ng nước v&agrave; ngắm vẻ đẹp Nhơn L&yacute; h&ugrave;ng vỹ.&nbsp;Nước biển ở Kỳ Co trong xanh, nh&igrave;n tận đ&aacute;y, được v&iacute; như "Palawan của Việt Nam", v&igrave; thế m&agrave; du kh&aacute;ch kh&ocirc;ng thể bỏ qua hoạt động tắm biển, lặn ngắm san h&ocirc;... Tour trọn g&oacute;i đi Kỳ Co khoảng 350.000 đồng mỗi người. Ảnh:&nbsp;<em>Tiến H&ugrave;ng.</em></p>\n</div>\n</div>\n<div class="item_slide_show clearfix">\n<div class="block_thumb_slide_show"><img id="vne_slide_image_4" class="left  displayAfterResize vne_lazy_image lazyloaded" src="https://i-dulich.vnecdn.net/2018/04/14/24177685-1510949612335206-2219791509782265856-n-1523680763_680x0.jpg" alt="7 điểm du lịch l&yacute; tưởng ở B&igrave;nh Định dịp 30/4" data-reference-id="25518758" data-original="https://i-dulich.vnecdn.net/2018/04/14/24177685-1510949612335206-2219791509782265856-n-1523680763_680x0.jpg" data-component-caption="&amp;lt;p&amp;gt;\n	&amp;lt;strong&amp;gt;Đồi c&aacute;t Phương Mai&amp;lt;/strong&amp;gt;&amp;lt;br /&amp;gt;&amp;lt;br /&amp;gt;\n	Đồi c&aacute;t nằm cạnh b&atilde;i biển Nhơn L&yacute;, thuộc b&aacute;n đảo Phương Mai v&agrave; c&aacute;ch trung t&acirc;m Quy Nhơn gần 20 km.Với địa h&igrave;nh dốc của đồi c&aacute;t l&ecirc;n đến 50 m, tốc độ trượt c&aacute;t ở đ&acirc;y c&oacute; thể l&ecirc;n đến 30 - 40 km/h v&agrave; gần như l&agrave; tốc độ trượt nhanh nhất ở c&aacute;c đồi c&aacute;t Việt Nam hiện nay. Buổi sớm dịu m&aacute;t v&agrave; buổi chiều lộng gi&oacute; l&agrave; thời điểm l&yacute; tưởng cho du kh&aacute;ch khám phá t&acirc;́t cả thu&ocirc;̣c v&ecirc;̀ nơi đ&acirc;y. Leo l&ecirc;n đỉnh đồi, ph&oacute;ng tầm mắt ra xa du kh&aacute;ch c&oacute; thể nh&igrave;n thấy được một hồ nước trong xanh tương tự ở B&agrave;u Trắng (B&igrave;nh Thuận). Ảnh:&nbsp;&amp;lt;em&amp;gt;ngoclittle18.&amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;" /></div>\n</div>', 0, '81f9f1431d724df3833a01d1fe529fe2771f8843.jpeg', 1, '2019-06-22 17:17:23', '2019-06-22 17:17:23', 'Kỳ Co'),
(74, 66, 'Phú Quý hay Cù Lao Thu cách thành phố Phan Thiết 56 hải lý. Huyện đảo rộng khoảng 17 km2, gồm ba xã là Long Hải, Ngũ Phụng và Tam Thanh.', '<div class="item_slide_show clearfix">\n<div class="desc_cation">\n<p class="Normal"><strong>Đảo Ph&uacute; Qu&yacute;</strong></p>\n<p class="Normal">Ph&uacute; Qu&yacute; hay C&ugrave; Lao Thu c&aacute;ch th&agrave;nh phố Phan Thiết 56 hải l&yacute;. Huyện đảo rộng khoảng 17 km2, gồm ba x&atilde; l&agrave; Long Hải, Ngũ Phụng v&agrave; Tam Thanh. Nơi n&agrave;y thu h&uacute;t du kh&aacute;ch bởi những b&atilde;i biển vắng người, khung cảnh thi&ecirc;n nhi&ecirc;n hoang sơ. Hiện phương tiện duy nhất để l&ecirc;n đảo l&agrave; t&agrave;u, mất khoảng 4 - 6 giờ t&ugrave;y loại.</p>\n<p class="Normal">Đ&atilde; đặt ch&acirc;n l&ecirc;n đảo, bạn kh&ocirc;ng thể kh&ocirc;ng gh&eacute; thăm hải đăng Ph&uacute; Qu&yacute; c&ugrave;ng cột cờ chủ quyền đảo tr&ecirc;n n&uacute;i Cấm, n&uacute;i Cao C&aacute;t, đền thờ c&aacute; &Ocirc;ng Vạn An Thạnh, c&aacute;nh đồng phong điện, bờ k&egrave; Ngũ Phụng, dinh mộ Thầy S&agrave;i Nại hay c&ograve;n gọi l&agrave; Mộ Thầy. B&igrave;nh minh v&agrave;o buổi sớm l&agrave; khoảnh khắc bạn kh&ocirc;ng thể bỏ qua. Ảnh:&nbsp;<em>T&iacute;nh Ph&uacute; Qu&yacute;.</em></p>\n</div>\n</div>\n<div class="item_slide_show clearfix">\n<div class="block_thumb_slide_show"><img id="vne_slide_image_1" class="left  displayAfterResize vne_lazy_image lazyloaded" src="https://i-dulich.vnecdn.net/2019/05/13/2-Phan-Vi-Duc-CuLaoCau-BinhThuan-1557715139_680x0.jpg" alt="8 cảnh đẹp khiến nhiều du kh&aacute;ch m&ecirc; mẩn B&igrave;nh Thuận" data-reference-id="26491285" data-original="https://i-dulich.vnecdn.net/2019/05/13/2-Phan-Vi-Duc-CuLaoCau-BinhThuan-1557715139_680x0.jpg" data-component-caption="&amp;lt;p class=&amp;quot;Normal&amp;quot;&amp;gt;\n	&amp;lt;strong&amp;gt;C&ugrave; Lao C&acirc;u&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;\n&amp;lt;p class=&amp;quot;Normal&amp;quot;&amp;gt;\n	C&ugrave; Lao C&acirc;u hay H&ograve;n Cau l&agrave; đảo nhỏ thuộc huyện Tuy Phong, bờ gần nhất c&aacute;ch trung t&acirc;m Phan Thiết khoảng 80 km. Những b&atilde;i c&aacute;t trắng mịn, nước biển trong xanh c&ugrave;ng b&atilde;i đ&aacute; h&ugrave;ng vĩ ở đ&acirc;y thu h&uacute;t nhiều người y&ecirc;u th&iacute;ch sự hoang sơ.&amp;lt;/p&amp;gt;\n&amp;lt;p class=&amp;quot;Normal&amp;quot;&amp;gt;\n	Để ra đảo, bạn c&oacute; thể khởi h&agrave;nh từ nhiều điểm, phổ biến nhất l&agrave; thị trấn Li&ecirc;n Hương hoặc cảng c&aacute; Phước Thể, x&atilde; Vĩnh T&acirc;n. C&aacute;c hoạt động nổi bật tr&ecirc;n đảo l&agrave; lặn ngắm san h&ocirc;, kh&aacute;m ph&aacute; b&atilde;i đ&aacute; tự nhi&ecirc;n. Một số điểm tham quan n&ecirc;n gh&eacute; l&agrave;: Hang Ba H&ograve;n, giếng Ti&ecirc;n, b&atilde;i Ti&ecirc;n, hang T&igrave;nh Y&ecirc;u, b&atilde;i C&aacute; Suốt, đền thờ thần Nam Hải. Ảnh: &amp;lt;em&amp;gt;Phan Vi Duc.&amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;" /></div>\n</div>', 0, 'b6f31be56139e8c2f346b6bdeb9c0466e78c4053.jpeg', 1, '2019-06-22 17:19:19', '2019-06-22 17:19:19', 'Đảo Phú Quý'),
(75, 56, 'Là địa điểm du lịch mà bất cứ ai đến du lịch Đà Nẵng cũng đi ít nhất 1 lần.', '<h2><strong>B&agrave; N&agrave; Hills &ndash;&nbsp;địa điểm du lịch Đ&agrave; Nẵng</strong></h2>\n<p>L&agrave; địa điểm du lịch m&agrave; bất cứ ai đến du lịch Đ&agrave; Nẵng cũng đi &iacute;t nhất 1 lần. Tọa lạc tr&ecirc;n đỉnh n&uacute;i cao vời vợi B&agrave; N&agrave; h&uacute;t hồn du kh&aacute;ch với cảnh đẹp như ti&ecirc;n cảnh v&agrave; c&aacute;p treo d&agrave;i nhất thế giới. Đ&acirc;y cũng được xem l&agrave; một trong những địa điểm nổi bật nhất Đ&agrave; Nẵng.</p>\n<p><img class="wp-image-3731 td-animation-stack-type0-1" title="địa điểm du lịch Đ&agrave; Nẵng" src="https://danangaz.com/wp-content/uploads/2018/09/1-min.jpg" sizes="(max-width: 720px) 100vw, 720px" srcset="https://danangaz.com/wp-content/uploads/2018/09/1-min.jpg 1024w, https://danangaz.com/wp-content/uploads/2018/09/1-min-300x194.jpg 300w, https://danangaz.com/wp-content/uploads/2018/09/1-min-768x497.jpg 768w, https://danangaz.com/wp-content/uploads/2018/09/1-min-696x451.jpg 696w, https://danangaz.com/wp-content/uploads/2018/09/1-min-649x420.jpg 649w" alt="đi chơi đ&agrave; nẵng" width="720" height="466" />B&agrave; N&agrave; Hills &ndash; Đường l&ecirc;n ti&ecirc;n cảnh</p>', 0, 'ef5c27e03be114b3a4e04cb43b18b96b7af5f407.jpeg', 1, '2019-06-22 17:21:43', '2019-06-22 17:21:43', 'Bà Nà Hills – địa điểm du lịch Đà Nẵng'),
(76, 64, 'Gành Đá Dĩa là một trong những điểm đến đặc biệt mà bạn không nên bỏ qua khi đi du lịch Phú Yên.', '<p><img class="aligncenter size-full wp-image-27872 td-animation-stack-type2-2" src="https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-4.jpg" sizes="(max-width: 696px) 100vw, 696px" srcset="https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-4.jpg 696w, https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-4-300x225.jpg 300w, https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-4-80x60.jpg 80w, https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-4-265x198.jpg 265w, https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-4-559x420.jpg 559w" alt="" width="696" height="523" /></p>\n<p>Những khối đ&aacute; h&igrave;nh lục gi&aacute;c xếp chồng l&ecirc;n nhau như tổ ong tạo n&ecirc;n hiệu ứng thị gi&aacute;c tuyệt đẹp.</p>\n<p><img class="aligncenter size-full wp-image-27873 td-animation-stack-type2-2" src="https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-5.jpg" sizes="(max-width: 696px) 100vw, 696px" srcset="https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-5.jpg 696w, https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-5-300x225.jpg 300w, https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-5-80x60.jpg 80w, https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-5-265x198.jpg 265w, https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-5-560x420.jpg 560w" alt="" width="696" height="522" /></p>\n<p>Từ Ph&uacute; Y&ecirc;n, c&oacute; rất nhiều c&aacute;ch đến G&agrave;nh Đ&aacute; Dĩa. Bạn c&oacute; thể di chuyển theo QL 1A về hướng Bắc khoảng 30km, đến thị trấn Ch&iacute; Thạnh rẽ phải về ph&iacute;a Đ&ocirc;ng khoảng 12km. Hoặc bạn c&oacute; thể đi đường thủy (mất từ 1-2 giờ), xuất ph&aacute;t từ bến cảng phường 6, TP. Tuy H&ograve;a.</p>\n<p><img class="aligncenter size-full wp-image-27874 td-animation-stack-type2-2" src="https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-6.jpg" sizes="(max-width: 696px) 100vw, 696px" srcset="https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-6.jpg 696w, https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-6-300x225.jpg 300w, https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-6-80x60.jpg 80w, https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-6-265x198.jpg 265w, https://mangphuyen.com/wp-content/uploads/2019/04/9-diem-den-dep-nhat-phu-yen-6-560x420.jpg 560w" alt="" width="696" height="522" /></p>\n<p><strong>Địa chỉ:</strong>&nbsp;X&atilde; An Ninh Đ&ocirc;ng, huyện Tuy An, tỉnh Ph&uacute; Y&ecirc;n</p>', 0, '4dca17a29924192ce8da3aca35c55445d40848c3.jpeg', 1, '2019-06-22 17:22:59', '2019-06-22 17:22:59', 'Gành Đá Dĩa');

-- --------------------------------------------------------

--
-- Table structure for table `scenic__culture_tour`
--

CREATE TABLE IF NOT EXISTS `scenic__culture_tour` (
  `id` int(10) unsigned NOT NULL,
  `scenic_id` int(10) unsigned NOT NULL,
  `tour_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scenic__culture_tour`
--

INSERT INTO `scenic__culture_tour` (`id`, `scenic_id`, `tour_id`) VALUES
(13, 64, 52),
(14, 65, 52),
(15, 66, 50),
(16, 67, 50),
(17, 74, 53),
(18, 75, 54),
(19, 75, 55),
(20, 68, 55),
(21, 69, 55),
(22, 73, 48),
(23, 72, 48),
(24, 63, 49),
(25, 73, 51),
(26, 76, 51),
(27, 73, 56),
(28, 76, 56);

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tours`
--

INSERT INTO `tours` (`TourID`, `TourName`, `TourDescription`, `DateDeparture`, `DateBack`, `Note`, `ImageUrl`, `NumberPerson`, `PriceAdult`, `PriceKid`, `Unit`, `created_at`, `updated_at`, `schedule_id`) VALUES
(48, 'Tour Nha Trang máy bay khách lẻ', 'Nói đến Nha Trang, hẳn ai cũng hình dung ngay đến những bờ cát trắng, những ánh sóng bàng bạc khi nắng lên, nơi những vùng biển xanh trong như ngọc', '2019-05-24 11:29:37', '2019-05-27 11:29:37', 'Thành phố biển của Nam Trung Bộ này, lúc nào cũng nhanh chóng mang lại cho du khách những hình ảnh tuyệt vời như thế, khi vừa được nghe nhắc, gọi tên', '["d797592ea70aaf578fae6891af909ff537275ec2.jpeg","68d4d4f5cc7b61c83328c0d30e49d90e7db89ab6.jpeg"]', 6, 1000000, 800000, 'VND', '2019-05-24 04:30:14', '2019-06-12 06:11:58', 53),
(49, 'Tour Nha Trang - Vinpearl Land - Suối Hoa Lan - Buffet Hải sản', 'Hành trình tuyệt vời này cùng Bazan Travel sẽ mang đến cho khách thời gian thật sảng khoái khi dừng chân ở Bãi Dài cát trắng', '2019-05-25 06:00:00', '2019-05-25 20:00:00', 'Khách còn có dịp tham quan Chùa Long Sơn nổi tiếng, tắm bùn tốt cho sức khỏe', '["a2f89ffd4e49cc41d367e056cb6064ac547d6442.jpeg"]', 11, 800000, 500000, 'VND', '2019-05-24 13:00:15', '2019-05-24 13:00:15', 51),
(50, 'Du Lịch Đà Lạt: Siêu Giảm Giá TP.HCM - Đà Lạt Thành Phố Ngàn Hoa 3 Ngày 3 Đêm', 'Nơi mà mỗi khi người ta nhắc đến Đà Lạt người ta nghĩ ngay đến thành phố của những thung lũng, ngọn đồi, dòng suối và hồ', '2019-05-24 22:31:39', '2019-05-25 22:31:39', 'Nơi mà mỗi khi người ta nhắc đến Đà Lạt người ta nghĩ ngay đến thành phố của những thung lũng, ngọn đồi, dòng suối và hồ', '["fa856add79bdc761478aa8c0727b045550142824.jpeg","d55afb27bd772c429f3fc36d8b241cc44132631e.jpeg","d55afb27bd772c429f3fc36d8b241cc44132631e.jpeg"]', 13, 1200000, 800000, 'VND', '2019-05-24 15:35:12', '2019-05-24 15:35:12', 51),
(51, 'Du Lịch Quy Nhơn - Phú Yên - Nha Trang', 'Du lịch Phú Yên là một sự lựa chọn hết sức sáng suốt và độc đáo bởi Phú Yên là một tỉnh ven biển Duyên hải Nam Trung Bộ', '2019-05-25 22:36:17', '2019-05-30 22:36:17', 'Quý khách lên Cano qua Đảo Kì Co nằm dưới chân dãy núi Phương Mai sừng sững thuộc bán đảo Nhơn Lý, TP Quy Nhơn', '["8b7ba9bba21631a206386bb5650dc192ec607ac8.jpeg","cd11a507282b399786554deaf32b915362871b38.jpeg"]', 10, 1500000, 1000000, 'VND', '2019-05-24 15:38:10', '2019-05-24 15:38:47', 51),
(52, 'Tour Hà Nội đi Nha Trang Điệp Sơn bằng máy bay', 'Tour Hà Nội đi Nha Trang Điệp Sơn bằng máy bay', '2019-06-15 13:28:29', '2019-07-19 13:28:29', 'Tour Hà Nội đi Nha Trang Điệp Sơn bằng máy bay', '["1057c775797df6e1a05f4830fac5c22b915c0835.jpeg"]', 11, 1500000, 1200000, 'VND', '2019-06-05 06:28:54', '2019-06-18 16:33:02', 51),
(53, 'Free and Easy Pandanus resort 4* Mũi Né Phan Thiết Resort 2 ngày 1 đêm', 'PANDANUS RESORT 4* - Mũi Né, Phan Thiết Resort - Pandanus Resort gồm 134 phòng căn hộ và bungalow.', '2019-06-23 00:24:05', '2019-06-23 00:24:05', 'Chương trình áp từ 23/06 – 31/10/2019\nGiá từ : 3.165.000 đ/khách ( áp dụng 2 khách/phòng)', '["82e52aa72542cec7c5a7ffb479dc6c4e4e6192c3.jpeg","326a96439a83e72d54c08d89b57c67c9b881926c.jpeg","326a96439a83e72d54c08d89b57c67c9b881926c.jpeg"]', 4, 5000000, 4000000, 'VND', '2019-06-22 17:26:42', '2019-06-22 17:26:42', 53),
(54, 'Tour Đà Nẵng - Hội An - Bà Nà - Sơn Trà khách đoàn', 'Tour Đà Nẵng - Hội An - Bà Nà - Sơn Trà 3 ngày 2 đêm cho khách đoàn của Beach Crest', '2019-06-30 00:28:31', '2019-07-05 00:28:31', 'Không áp dụng', '["888b9978ab79b008716988ecad5c075e2264bd6b.jpeg","888b9978ab79b008716988ecad5c075e2264bd6b.jpeg"]', 12, 3500000, 3000000, 'VND', '2019-06-22 17:31:33', '2019-06-22 17:31:33', 53),
(55, 'Tour du lịch Đà Nẵng Huế Động Phong Nha', 'Tour Đà Nẵng Hội An - Huế - Động Phong Nha 4 ngày 3 đêm chỉ từ 3.150.000đ.', '2019-06-25 00:32:07', '2019-06-30 00:32:07', 'không được', '["e13d5ba54efa94de8e928039225a050a6c32ec1b.jpeg","e13d5ba54efa94de8e928039225a050a6c32ec1b.jpeg","e13d5ba54efa94de8e928039225a050a6c32ec1b.jpeg"]', 11, 3110000, 2900000, 'VND', '2019-06-22 17:34:28', '2019-06-22 17:35:32', 53),
(56, 'DU LỊCH TUY HÒA - QUY NHƠN - KỲ CO - EO GIÓ', 'Ngắm nhìn Hải đăng Mũi Điện -  nơi đón nhận bình minh sớm nhất trên đất liền của Việt Nam', '2019-06-23 00:57:54', '2019-06-23 00:57:54', 'Tắm biển tại  Kỳ Co - một bãi tắm còn hoang sơ, đẹp tự với màu nước trong xanh, bãi cát trắng dài và mịn', '["a34f323d7db8efa5686861e7f26aad8030f64d79.jpeg","43219837d08f13ba649a0d1239bf72e5f5bcb795.jpeg"]', 15, 1250000, 1000000, 'VND', '2019-06-22 17:59:41', '2019-06-22 17:59:41', 52);

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
  ADD KEY `news_approvedby_foreign` (`user_id`);

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
  MODIFY `BookingID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=178;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `NewsID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
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
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `PlaceID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `PromotionID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `ReviewID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `scenic__cultures`
--
ALTER TABLE `scenic__cultures`
  MODIFY `ScenicID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `scenic__culture_tour`
--
ALTER TABLE `scenic__culture_tour`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
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
  MODIFY `TourID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
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
  ADD CONSTRAINT `news_approvedby_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
