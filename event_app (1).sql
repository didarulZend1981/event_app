-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2025 at 08:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `ticket_qty` int(11) NOT NULL,
  `ticket_price` decimal(8,2) NOT NULL,
  `total_price` double NOT NULL DEFAULT 0,
  `status` enum('pending','confirmed','cancelled') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `event_id`, `ticket_qty`, `ticket_price`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 2, 500.00, 0, 'cancelled', '2025-03-20 12:11:59', '2025-04-22 12:29:40'),
(2, 4, 2, 3, 2100.00, 0, 'confirmed', '2025-03-20 12:11:59', '2025-04-15 21:54:14'),
(3, 4, 2, 4, 2800.00, 0, 'pending', '2025-03-20 12:11:59', '2025-03-20 12:11:59'),
(4, 5, 3, 1, 3000.00, 0, 'pending', '2025-03-20 12:11:59', '2025-04-15 22:26:28'),
(5, 1, 1, 1, 500.00, 0, 'pending', '2025-03-20 12:20:57', '2025-03-20 12:20:57'),
(6, 1, 1, 2, 500.00, 1000, 'confirmed', '2025-03-20 12:32:45', '2025-03-20 15:38:13'),
(7, 6, 1, 1, 500.00, 500, 'confirmed', '2025-03-20 13:25:36', '2025-04-15 22:57:06'),
(8, 6, 3, 1, 700.00, 700, 'confirmed', '2025-03-20 13:25:52', '2025-04-03 06:05:51'),
(9, 6, 3, 1, 700.00, 700, 'pending', '2025-03-20 13:48:23', '2025-04-03 08:23:26'),
(10, 6, 1, 1, 500.00, 500, 'pending', '2025-04-03 03:52:32', '2025-04-03 08:24:05'),
(11, 6, 2, 1, 600.00, 600, 'pending', '2025-04-03 04:08:37', '2025-04-03 04:08:37'),
(12, 6, 3, 3, 700.00, 2100, 'pending', '2025-04-03 08:24:21', '2025-04-03 08:24:21'),
(13, 1, 1, 5, 600.00, 3000, 'pending', '2025-04-09 15:05:53', '2025-04-09 15:05:53'),
(14, 1, 16, 1, 870.00, 870, 'pending', '2025-04-10 06:41:54', '2025-04-10 06:41:54'),
(15, 1, 1, 10, 600.00, 6000, 'pending', '2025-04-10 06:47:50', '2025-04-10 06:47:50'),
(16, 1, 5, 10, 208.00, 2080, 'pending', '2025-04-10 11:26:57', '2025-04-10 11:26:57'),
(17, 6, 6, 10, 260.00, 2600, 'pending', '2025-04-12 09:38:35', '2025-04-12 09:38:35'),
(18, 6, 1, 2, 600.00, 1200, 'cancelled', '2025-04-13 10:43:36', '2025-04-15 22:47:57'),
(19, 6, 1, 10, 600.00, 6000, 'pending', '2025-04-13 10:59:52', '2025-04-13 10:59:52'),
(20, 6, 3, 1, 700.00, 700, 'pending', '2025-04-13 11:16:13', '2025-04-13 11:16:13'),
(21, 6, 1, 1, 600.00, 600, 'pending', '2025-04-13 14:10:34', '2025-04-13 14:10:34'),
(22, 6, 1, 1, 600.00, 600, 'pending', '2025-04-13 14:11:35', '2025-04-13 14:11:35'),
(23, 6, 1, 1, 600.00, 600, 'pending', '2025-04-13 15:04:29', '2025-04-13 15:04:29'),
(24, 1, 3, 3, 700.00, 2100, 'pending', '2025-04-22 12:18:21', '2025-04-22 12:18:21'),
(25, 1, 6, 8, 260.00, 2080, 'pending', '2025-04-22 12:20:20', '2025-04-22 12:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_price` double NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `descriptions` text NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `event_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `ticket_price`, `title`, `descriptions`, `start_time`, `end_time`, `event_image`, `created_at`, `updated_at`) VALUES
(1, 600, 'Event 6', 'Event 1 des', '2025-03-27 18:11:59', '2025-03-27 23:11:59', NULL, '2025-03-20 12:11:59', '2025-04-04 10:57:29'),
(2, 600, 'Event 2', 'Event 2 des', '2025-03-28 18:11:59', '2025-03-28 23:11:59', NULL, '2025-03-20 12:11:59', '2025-03-20 12:18:20'),
(3, 700, 'Event 3', 'Event 3 des', '2025-03-29 18:11:59', '2025-03-29 23:11:59', NULL, '2025-03-20 12:11:59', '2025-03-20 12:18:31'),
(4, 327, 'Culpa consequatur N', 'Sunt quas illo expe', '1985-03-08 00:00:00', '2004-03-04 00:00:00', NULL, '2025-04-04 15:07:24', '2025-04-04 15:07:24'),
(5, 208, 'Aut aliquam sunt cul', 'Sed qui omnis Nam el', '1998-11-27 00:00:00', '2004-06-02 00:00:00', NULL, '2025-04-04 15:15:34', '2025-04-04 15:15:34'),
(6, 260, 'Officia ut iure aut', 'Quam dolor iure ut r', '2005-06-02 00:00:00', '2016-05-20 00:00:00', NULL, '2025-04-04 15:51:08', '2025-04-04 15:51:08'),
(7, 170, 'Praesentium aut assu', 'Qui eveniet fugit', '1976-04-24 00:00:00', '1994-06-13 00:00:00', NULL, '2025-04-05 22:50:42', '2025-04-05 22:50:42'),
(8, 497, 'Id fuga Tempora nul', '<p>Iste necessitatibus .</p>', '1979-03-07 00:00:00', '2017-04-27 00:00:00', NULL, '2025-04-05 23:01:39', '2025-04-05 23:01:39'),
(9, 951, 'Est nihil duis sit o', '<ul><li><strong>Quod tempora nisi el.</strong></li></ul>', '2019-10-05 00:00:00', '1998-01-04 00:00:00', NULL, '2025-04-05 23:02:09', '2025-04-05 23:02:09'),
(10, 397, 'Ratione rem aliquid', '<ol><li>Molestiae quo exerci.</li><li>Molestiae quo exerci.Ullamco rerum sint c.</li><li>Molestiae quo exerci.</li><li>Molestiae quo exerci.</li></ol>', '2011-06-01 00:00:00', '2013-03-13 00:00:00', NULL, '2025-04-05 23:04:30', '2025-04-05 23:04:30'),
(16, 870, 'Veritatis dignissimo', '<p>Dolores tenetur rem .</p>', '2006-03-09 00:00:00', '2017-07-19 00:00:00', 'storage/event_images/event_image_1744224774.jpg', '2025-04-09 12:52:54', '2025-04-09 12:52:54'),
(17, 482, 'Aliquam laborum Vol', '<p>Sed aliqua. Aperiam .</p>', '1989-01-09 00:00:00', '1980-09-13 00:00:00', 'storage/event_images/event_image_1744224792.jpg', '2025-04-09 12:53:12', '2025-04-09 12:53:12'),
(18, 406, 'Officia aut magna fu', '<ol><li>Accusantium ea sit, .</li></ol>', '1991-04-05 00:00:00', '2002-09-13 00:00:00', NULL, '2025-04-09 12:58:32', '2025-04-09 12:58:32'),
(19, 276, 'Quisquam est dolore', '<p>Eos labore deserunt .</p>', '1973-01-17 00:00:00', '2002-05-13 00:00:00', 'storage/event_images/event_image_1744225380.jpg', '2025-04-09 13:03:00', '2025-04-09 13:03:00'),
(20, 291, 'Ea voluptatum quibus', '<ol><li>Est eum labore numqu.</li></ol>', '2016-06-21 00:00:00', '2011-11-01 00:00:00', 'storage/event_images/event_image_1744226096.jpg', '2025-04-09 13:14:56', '2025-04-09 13:14:56');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_03_04_190207_create_users_table', 1),
(2, '2025_03_04_192220_create_sessions_table', 1),
(3, '2025_03_04_192353_create_cache_table', 1),
(4, '2025_03_04_193311_create_events_table', 1),
(5, '2025_03_04_193651_create_bookings_table', 1),
(6, '2025_03_04_194111_create_notifications_table', 1),
(7, '2025_03_04_205046_make_user_profile_nullable_table', 1),
(8, '2025_03_04_211744_create_personal_access_tokens_table', 1),
(9, '2025_03_15_204422_add_ticket_price_to_event_table', 1),
(10, '2025_03_20_180525_make_total_price_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `descriptions` text NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 6, 'auth_token', '866604d7bcb3eace3b73030ef419bd5a2aeb9c3b6d69ec404e707725d5754fd3', '[\"*\"]', NULL, NULL, '2025-03-20 12:13:28', '2025-03-20 12:13:28'),
(2, 'App\\Models\\User', 6, 'auth_token', '6a72660a2f0676e0c08c2bdf977246386b83d336669210ba8113dfc4f4b25b68', '[\"*\"]', NULL, NULL, '2025-03-20 12:13:49', '2025-03-20 12:13:49'),
(3, 'App\\Models\\User', 1, 'auth_token', '4f3e71773854a3c9e6a1796308a7ce68d9cf90c2ddc58f7e08a5f9826abef61c', '[\"*\"]', NULL, NULL, '2025-03-20 12:17:50', '2025-03-20 12:17:50'),
(4, 'App\\Models\\User', 6, 'auth_token', '1d0f1bc09bb9ccd032877874d89aa4ae3a1300d5050a5e134fd5ad1948c6b3ea', '[\"*\"]', NULL, NULL, '2025-03-20 12:19:06', '2025-03-20 12:19:06'),
(5, 'App\\Models\\User', 1, 'auth_token', '17f3c576be68acaae19491c2fb7131115cd795a3e5b8e96ea23cb5f5f64deae0', '[\"*\"]', NULL, NULL, '2025-03-20 12:20:44', '2025-03-20 12:20:44'),
(6, 'App\\Models\\User', 6, 'auth_token', 'af8b5771f70df7ba8f11233d9a4f6910a1fa378347716d66c855bff98eb62420', '[\"*\"]', NULL, NULL, '2025-03-20 13:25:25', '2025-03-20 13:25:25'),
(7, 'App\\Models\\User', 1, 'auth_token', 'ce8569b2fac8f4d7cf64cfb26879c98abf62fcb7b557a520cefccdeff4418fdc', '[\"*\"]', NULL, NULL, '2025-03-20 13:49:23', '2025-03-20 13:49:23'),
(8, 'App\\Models\\User', 6, 'auth_token', '846b3ceeaba2940f7a609f6db6b053a12ab8746c4ac4366f8a63100e7e98bf59', '[\"*\"]', NULL, NULL, '2025-04-03 03:50:11', '2025-04-03 03:50:11'),
(9, 'App\\Models\\User', 6, 'auth_token', '06968cae6ee77f24488997211e4936f4bea306fca02348860e843795c4beadef', '[\"*\"]', NULL, NULL, '2025-04-03 04:10:16', '2025-04-03 04:10:16'),
(10, 'App\\Models\\User', 1, 'auth_token', 'db6b8d4561e7302d0e20f99fa1b1872834960fb461f615e4a9ed1d038cb53aec', '[\"*\"]', NULL, NULL, '2025-04-03 05:41:28', '2025-04-03 05:41:28'),
(11, 'App\\Models\\User', 1, 'auth_token', '3c2f48d11683c043116201075a94361611e2a3e44f5b5514f915d7c8e6014b70', '[\"*\"]', NULL, NULL, '2025-04-04 10:55:51', '2025-04-04 10:55:51'),
(12, 'App\\Models\\User', 1, 'auth_token', '2f0e1f04f7909da1ae82a36659ffc966aa73badc9654bec1b5cd7bb42fb2f2b7', '[\"*\"]', NULL, NULL, '2025-04-06 07:49:56', '2025-04-06 07:49:56'),
(13, 'App\\Models\\User', 7, 'auth_token', '6dac8e93f6295ff8692943dec02e4e769d5ed4cb8bc3d01b3f6702f067aaba56', '[\"*\"]', NULL, NULL, '2025-04-09 10:35:14', '2025-04-09 10:35:14'),
(14, 'App\\Models\\User', 6, 'auth_token', '4c55a66ec1e53fc40c6c36c4b8d41929761d9527dc33a7de37ffc5da9d7a5f83', '[\"*\"]', NULL, NULL, '2025-04-11 13:11:07', '2025-04-11 13:11:07'),
(15, 'App\\Models\\User', 6, 'auth_token', 'a95dbe75e4bcb5040aae2e0dd75408ae62f0429c6b59774f9a0dd4e403030dcd', '[\"*\"]', NULL, NULL, '2025-04-12 09:37:54', '2025-04-12 09:37:54'),
(16, 'App\\Models\\User', 6, 'auth_token', '436b5558b2032e5f8397db1bcc6df9e0af620f468986a90b938786834d87f776', '[\"*\"]', NULL, NULL, '2025-04-13 10:43:18', '2025-04-13 10:43:18'),
(17, 'App\\Models\\User', 6, 'auth_token', 'ee7aeaf546f4cb716fd550374f626b4e93f94e87ab50f7973e0ec09353ce47b9', '[\"*\"]', NULL, NULL, '2025-04-13 11:13:42', '2025-04-13 11:13:42'),
(18, 'App\\Models\\User', 6, 'auth_token', 'a49527a203ed8c100ba52cfa149d5989b3cd629c788bada17717caa9effa4ce1', '[\"*\"]', NULL, NULL, '2025-04-13 11:15:26', '2025-04-13 11:15:26'),
(19, 'App\\Models\\User', 6, 'auth_token', '89e9bee412eb0920c6e65fea0411e74303bac129d48b06aa476089357a41983d', '[\"*\"]', NULL, NULL, '2025-04-13 14:10:15', '2025-04-13 14:10:15'),
(20, 'App\\Models\\User', 6, 'auth_token', 'c20614afb2a95ff698a7a0c0d84563252b68697b8de0cdc053064c7bf0c72606', '[\"*\"]', NULL, NULL, '2025-04-14 06:36:31', '2025-04-14 06:36:31'),
(21, 'App\\Models\\User', 6, 'auth_token', '1d6359d16c72396141aea5714458e7a740d9c432f116dbc4486b53752748a6b7', '[\"*\"]', NULL, NULL, '2025-04-14 09:52:49', '2025-04-14 09:52:49'),
(22, 'App\\Models\\User', 6, 'auth_token', '67b9939c8ee869e2558057ce7da4ea86e98bab91a586a7978c1b21552bfe9f27', '[\"*\"]', NULL, NULL, '2025-04-15 10:50:42', '2025-04-15 10:50:42'),
(23, 'App\\Models\\User', 6, 'auth_token', 'c0d01a9ff618c1a85899e35243d0b23b95f3f7ac8f67019847c90e0c9095db65', '[\"*\"]', NULL, NULL, '2025-04-15 14:26:55', '2025-04-15 14:26:55'),
(24, 'App\\Models\\User', 6, 'auth_token', 'f0cbd237290c638c59884c0d5fbf064f557b720be9ce20a12f6b5f4fd8face1a', '[\"*\"]', NULL, NULL, '2025-04-15 14:38:17', '2025-04-15 14:38:17'),
(25, 'App\\Models\\User', 6, 'auth_token', 'ecb6ac07965f5a692742893d31291a5f8e2656c56c884e3c4955c0a061d82794', '[\"*\"]', NULL, NULL, '2025-04-15 14:40:40', '2025-04-15 14:40:40'),
(26, 'App\\Models\\User', 6, 'auth_token', '8ecabcc29c9d481995dbd9fec6ae71316cf787319d2da1783ede25865c5234b6', '[\"*\"]', NULL, NULL, '2025-04-15 14:43:12', '2025-04-15 14:43:12'),
(27, 'App\\Models\\User', 8, 'auth_token', '71e992f19b00928c45f60656a5ca42f6c88a14c91851fd343f45aaffee45b444', '[\"*\"]', NULL, NULL, '2025-04-15 15:03:21', '2025-04-15 15:03:21'),
(28, 'App\\Models\\User', 9, 'auth_token', '65160993e3a0fe0f61025ad79b8adcc7364ee259280b6202e12103f977decbbc', '[\"*\"]', NULL, NULL, '2025-04-15 15:05:29', '2025-04-15 15:05:29'),
(29, 'App\\Models\\User', 10, 'auth_token', '3a5112f9b145d4ca2baa0237a12d2f3ecadaf5e61fbef6c7ddf7fcf6c26ba5c9', '[\"*\"]', NULL, NULL, '2025-04-15 15:08:04', '2025-04-15 15:08:04'),
(30, 'App\\Models\\User', 6, 'auth_token', 'bff452ff0b3487505b73c41b912047471c059bd2720305e421caf346f83c0134', '[\"*\"]', NULL, NULL, '2025-04-15 15:09:32', '2025-04-15 15:09:32'),
(31, 'App\\Models\\User', 11, 'auth_token', '79b8f843f008ec8a144d55b62aad2dbf6bd04364b7389f259c13186fa1ab6004', '[\"*\"]', NULL, NULL, '2025-04-15 15:10:52', '2025-04-15 15:10:52'),
(32, 'App\\Models\\User', 12, 'auth_token', '9f14d1c9a8014b15316f415442cdf022daf6c7aa5cb97710a23f524b15a9aea6', '[\"*\"]', NULL, NULL, '2025-04-15 15:15:30', '2025-04-15 15:15:30'),
(33, 'App\\Models\\User', 13, 'auth_token', 'a0186988d63550f1cb88371fca5d840d29c6efaa13d6c49d1b3dd177a151294c', '[\"*\"]', NULL, NULL, '2025-04-15 15:16:02', '2025-04-15 15:16:02'),
(34, 'App\\Models\\User', 6, 'auth_token', 'd049916812df5f0ce88a736d026d7fb6bb3476625fcebee122db90700b6aac18', '[\"*\"]', NULL, NULL, '2025-04-15 21:40:32', '2025-04-15 21:40:32'),
(35, 'App\\Models\\User', 1, 'auth_token', 'eed7ab35be8e9cd9a53205f2eae793408a3c688a4bfc35479720017b161959f2', '[\"*\"]', NULL, NULL, '2025-04-15 21:41:09', '2025-04-15 21:41:09'),
(36, 'App\\Models\\User', 6, 'auth_token', 'a0598c1888b68f53b24f7da3312dbe9c50eb1382058bf30b15167ae569afa889', '[\"*\"]', NULL, NULL, '2025-04-15 21:51:23', '2025-04-15 21:51:23'),
(37, 'App\\Models\\User', 1, 'auth_token', '278bceecf62b3c046fcef4dcf97bfe29f7827412a9deea3e6bbf009b860ee333', '[\"*\"]', NULL, NULL, '2025-04-15 21:51:47', '2025-04-15 21:51:47'),
(38, 'App\\Models\\User', 1, 'auth_token', '7018711c0777c1c18806d285b30be4bd437009e923ca0018f2080fda50402bc5', '[\"*\"]', NULL, NULL, '2025-04-15 22:13:01', '2025-04-15 22:13:01'),
(39, 'App\\Models\\User', 6, 'auth_token', '0ee080c82e4b4ba160e386cebf253d7d8f1a84b78b8fd5a0f2ee7c20cdee6d7a', '[\"*\"]', NULL, NULL, '2025-04-15 22:13:32', '2025-04-15 22:13:32'),
(40, 'App\\Models\\User', 6, 'auth_token', '897ec64f524bb6b424b91df4fbb0df05c4ad89c68bb0822c81c7f36a6a978911', '[\"*\"]', NULL, NULL, '2025-04-20 06:55:26', '2025-04-20 06:55:26'),
(41, 'App\\Models\\User', 6, 'auth_token', 'e47d80de2bf0a3f12adac66c9642380cbd5537bea95bc66d2b128ce9ace4f61b', '[\"*\"]', NULL, NULL, '2025-04-20 09:37:16', '2025-04-20 09:37:16'),
(42, 'App\\Models\\User', 6, 'auth_token', '088cb0cd0241c8824c217b1df907055817cef3fbc4da2796fa4a0b88d1fe0ba4', '[\"*\"]', NULL, NULL, '2025-04-22 04:31:44', '2025-04-22 04:31:44'),
(43, 'App\\Models\\User', 6, 'auth_token', '2c69da27bc94f21e017417ca942b394814576c05b2548a2b978f471a2f427711', '[\"*\"]', NULL, NULL, '2025-04-22 04:47:50', '2025-04-22 04:47:50'),
(44, 'App\\Models\\User', 1, 'auth_token', '4d17eb833bd38f8edd5905afe5402e4280b8053472ba24cd2796eb8bf4ee25a6', '[\"*\"]', NULL, NULL, '2025-04-22 04:56:39', '2025-04-22 04:56:39'),
(45, 'App\\Models\\User', 1, 'auth_token', 'a3953aa30716fd2bf60af990e398603bca5c557fcfc9f8c79514fbe02dfe1bd8', '[\"*\"]', NULL, NULL, '2025-04-22 05:00:33', '2025-04-22 05:00:33'),
(46, 'App\\Models\\User', 1, 'auth_token', '801035019bc29c07973947f68d1e3adb1cbf673b250b1431faf4e224b2d0f712', '[\"*\"]', NULL, NULL, '2025-04-22 13:01:37', '2025-04-22 13:01:37'),
(47, 'App\\Models\\User', 1, 'auth_token', '407aaa301d4c08f1cf70747a793dc8d2c1af1db704eb683ecad91b46d9862e5f', '[\"*\"]', NULL, NULL, '2025-04-22 13:03:59', '2025-04-22 13:03:59'),
(48, 'App\\Models\\User', 6, 'auth_token', 'fe4cac06401b46db974769a7bd829d5b01f39e3799bac941b1efc03b3bc4529a', '[\"*\"]', NULL, NULL, '2025-04-22 13:05:30', '2025-04-22 13:05:30'),
(49, 'App\\Models\\User', 1, 'auth_token', '0c20c769df23acae3d23bef90fb42c74c73fa7c72b57ead8868db1e30481eb32', '[\"*\"]', NULL, NULL, '2025-04-22 13:11:02', '2025-04-22 13:11:02'),
(50, 'App\\Models\\User', 1, 'auth_token', '1f1b6ceb40d4159a50da72e0684e5044e4b29ff8ac147a01803009750b11ac37', '[\"*\"]', NULL, NULL, '2025-04-22 13:25:46', '2025-04-22 13:25:46'),
(51, 'App\\Models\\User', 1, 'auth_token', '6c20866e4f5ab4eca4e459d4b67a4fff1d93cc814192208d8ff06e8ab618f75b', '[\"*\"]', NULL, NULL, '2025-04-22 13:28:08', '2025-04-22 13:28:08'),
(52, 'App\\Models\\User', 1, 'auth_token', '97b2586878ba11966bfbe78790e73054cb78ab0a4bdb00f9879abd75acd1cfa6', '[\"*\"]', NULL, NULL, '2025-04-22 13:29:41', '2025-04-22 13:29:41'),
(53, 'App\\Models\\User', 6, 'auth_token', '1975849355363ebc6c027ba7b033a100573c6c29b7e0d631718cca7a850c0a1f', '[\"*\"]', NULL, NULL, '2025-04-22 14:49:37', '2025-04-22 14:49:37'),
(54, 'App\\Models\\User', 1, 'auth_token', '1d0b24df0a07f47eb5852abb981ae90fb5d8bd523c8561860a243c8e0690b1db', '[\"*\"]', NULL, NULL, '2025-04-22 15:05:13', '2025-04-22 15:05:13'),
(55, 'App\\Models\\User', 6, 'auth_token', '972a765c4f85d3e010416a6ce61296767ed9589d2d635fefa9ac329e4437a65d', '[\"*\"]', NULL, NULL, '2025-04-22 15:08:54', '2025-04-22 15:08:54'),
(56, 'App\\Models\\User', 6, 'auth_token', '5c9a35e4e722ccc0fde250f2288cd62c360d149564fe3e0f684815b619af9879', '[\"*\"]', NULL, NULL, '2025-04-22 15:10:43', '2025-04-22 15:10:43'),
(57, 'App\\Models\\User', 1, 'auth_token', 'ef8e7554d33c53674c31ffe07692a8ea66fce6ade9d241fdfe601daad89d957e', '[\"*\"]', NULL, NULL, '2025-04-22 15:17:12', '2025-04-22 15:17:12'),
(58, 'App\\Models\\User', 1, 'auth_token', '9d9c68f6beb8351c95df238f8dd77d4654b99f4f770737afaee52fd7f49508fb', '[\"*\"]', NULL, NULL, '2025-04-22 23:12:10', '2025-04-22 23:12:10'),
(59, 'App\\Models\\User', 6, 'auth_token', 'f730ab4a71c440586c08e11e0a532d8d7ea5557c66aab433780c3364bedd80f5', '[\"*\"]', NULL, NULL, '2025-04-22 23:54:20', '2025-04-22 23:54:20'),
(60, 'App\\Models\\User', 6, 'auth_token', 'd9861d0f0068757c4b3b37d3b0cbeb9f30e76a96540d5d630d615b688598d24f', '[\"*\"]', NULL, NULL, '2025-04-22 23:59:40', '2025-04-22 23:59:40'),
(61, 'App\\Models\\User', 6, 'auth_token', 'e7452ceb267c0587bfe69d16288b17ec06990b66dbdf5590c40745384898ecd7', '[\"*\"]', NULL, NULL, '2025-04-23 06:58:46', '2025-04-23 06:58:46'),
(62, 'App\\Models\\User', 1, 'auth_token', '38e61835a4b983c30d73501af817a006c142fd18715e7c146127b0f9d541faa2', '[\"*\"]', NULL, NULL, '2025-04-23 07:01:37', '2025-04-23 07:01:37'),
(63, 'App\\Models\\User', 6, 'auth_token', '151a82e01579bd45984ee092a72df6211572412467e197ef2999bc006364e53e', '[\"*\"]', NULL, NULL, '2025-04-23 07:03:46', '2025-04-23 07:03:46'),
(64, 'App\\Models\\User', 6, 'auth_token', 'ad747a2a0168b6edd05c0725e854dffa1785443aa295589ddcf1104ad55f7a88', '[\"*\"]', NULL, NULL, '2025-04-23 07:19:33', '2025-04-23 07:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8KeYOdk340DG4CPo8rEIdyzMrlSqxr369G6tAk2c', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNDhMMFpFdkVtMThGeHAwalE0MFU0eEk3WU82Vm9aUmR3N0NNbGNpUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1743912483),
('a0Kxr74RvXQTQ4PKrHOnqYwW6BIUuGxVMOvOJhF4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTWRBMmFYSUdQSjliWW9PNzdLNGZwd1oyV0lIbGJtcjk0YXNyWWh4WSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1743781448),
('bVYTcuWH8D7L9YYq7SEyJ3QJPGOfslVYVDNBNmg3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMktkQTdjbHhKSUNwd0FuWWdBeklNcWtCVTE2SVFQVm5qM3FXTkJrZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1744632281),
('C6oxclKCZWhy0362smpPCec9KVRkBlVSvkPvtAbY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmpjTWZoNGRGc1QzdW55MGZkeFQwZU5YelVKZUpQNjRzbFo0aUxZMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1743927735),
('f7yL6wDLhMDMg4D9XcqmxQNEV6HzZ0cYSkQpGwlb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid25CWTl4d0YwbE1iYXRSeEZhTGhhaXROQno4Uk5lQXBSMzRKQ1RMMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1744300801),
('KPkViGF1uIKSUN6UB6ZrFts5mdsxy7p2QGsRdcfV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ1hxVW4yb3l1c3FVQkhsZW55SkhVaEJObVFpdUlTVlFmSG1TeWtjMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1743680557),
('mblDX0uGss9JPLztfgSKEfmTU3iiCCggjWmtCuS5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTlZNODFtckFnUTk3bkhPTG1ZdW9icElPNjl4bGlZMWdGcmpVd1NSYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1744776737),
('N1PFHw2fsEgyaC15asAZNkity2KENkZLq9hgjV38', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUlk5MmNIUEViZHg3UFlqNWhKVWFIVG9rWHdDN213SjVpaXoxQTR1YyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1743670536),
('qIaXaXziq7iRCEUhFJL23TO6GYj7GWm0hEBimJ0b', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMWxNQ3lJVnRZWmZNRXFVQnp0bDNTU3h4Mzd3TXVoaUN1TGxlQjhndiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1744632737),
('YPJ7nWJtZuI1HuxD67Xjbpwsg3kpfotsfXkshSfv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXVTeDNVbG1CU0ljVW9rS01DMmI3UEhqWVExaDJ5d0JSRE8wSUFQTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744217339);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `profile_image`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'App Admin', 'app_admin@example.com', NULL, '$2y$12$A6LtlbOjLxq9kzO/ZtNKYu2cVPlyhWBR5//5GG7gaUtsKAYQdTWD2', '2025-03-20 12:11:58', '2025-03-20 12:11:58'),
(2, 'event_admin', 'Event Admin', 'event_admin@example.com', NULL, '$2y$12$Y2voHPzI0QX849iZCztW5uPPvsPI9nI08AQtpmmCnztBqgET/l69i', '2025-03-20 12:11:58', '2025-03-20 12:11:58'),
(3, 'user', 'Jamal', 'jamal@example.com', NULL, '$2y$12$rKW1b4hD.MSfXc1As33FouKYPY2hfFbpzV35GEFukqUH8jfrggP2G', '2025-03-20 12:11:59', '2025-03-20 12:11:59'),
(4, 'user', 'Apu', 'apu@example.com', NULL, '$2y$12$GRV16IX0in2Ayg6EPVYK3OnD1sHZZSNiZ36STjqlFWl.rCycsSh06', '2025-03-20 12:11:59', '2025-03-20 12:11:59'),
(5, 'user', 'Fahim', 'fahim@example.com', NULL, '$2y$12$qdCxH36pyn6WT1aiop7XT.Ckub7PtDlS4CPAIlYkmo5H4PX/Abhba', '2025-03-20 12:11:59', '2025-03-20 12:11:59'),
(6, 'user', 'abc', 'abc@gmail.com', 'storage/profile_images/profile_image_1742494407.png', '$2y$12$7RPzakhVjcr8ot9O5/d4wusEReIBNKsbSSWuq12zRYP5DRjikXAx.', '2025-03-20 12:13:28', '2025-03-20 12:13:28'),
(7, 'user', 'test012100100', 'test012100100@gmail.com', 'storage/profile_images/profile_image_1744216513.png', '$2y$12$tpZIvNHEnn3RyRwP9T6ENu7BAs4vjrf6Ig/64UlJdgboG8TgNS/cG', '2025-04-09 10:35:14', '2025-04-09 10:35:14'),
(8, 'user', 'Kaseem Yates', 'pusikiduq@mailinator.com', 'storage/profile_images/profile_image_1744751000.jpg', '$2y$12$P0FMEj/f2kJYMmdF/FSjgeTILy7s/iLyHuXOMQmYYF1N3R42glYwK', '2025-04-15 15:03:21', '2025-04-15 15:03:21'),
(11, 'user', 'Raya Johnston', 'sytor@mailinator.com', 'storage/profile_images/profile_image_1744751451.jpg', '$2y$12$yhURqSk6sdi8ZMjFfEz2XevvBUlfNG68LZi8w9b5UdriyTBtgctGu', '2025-04-15 15:10:52', '2025-04-15 15:10:52'),
(12, 'user', 'Nichole Pratt', 'nawi@mailinator.com', NULL, '$2y$12$G4X1BuahOJ8URnW9tWvpSeaTcghLJW.eHcprbcTw/NwmD9z0/kyEK', '2025-04-15 15:15:30', '2025-04-15 15:15:30'),
(13, 'user', 'Amelia Hardy', 'gydesosede@mailinator.com', NULL, '$2y$12$yzI5ZVbvibjLHDR.KgRsa.RVzkHrJhLrGh8PWMo1Oc09NvVjjBmJC', '2025-04-15 15:16:01', '2025-04-15 15:16:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_event_id_foreign` (`event_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
