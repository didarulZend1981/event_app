-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2025 at 09:50 AM
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
(1, 3, 1, 2, 500.00, 0, 'confirmed', '2025-03-20 12:11:59', '2025-04-03 03:40:24'),
(2, 4, 2, 3, 2100.00, 0, 'pending', '2025-03-20 12:11:59', '2025-03-20 12:11:59'),
(3, 4, 2, 4, 2800.00, 0, 'pending', '2025-03-20 12:11:59', '2025-03-20 12:11:59'),
(4, 5, 3, 1, 3000.00, 0, 'confirmed', '2025-03-20 12:11:59', '2025-03-20 12:11:59'),
(5, 1, 1, 1, 500.00, 0, 'pending', '2025-03-20 12:20:57', '2025-03-20 12:20:57'),
(6, 1, 1, 2, 500.00, 1000, 'confirmed', '2025-03-20 12:32:45', '2025-03-20 15:38:13'),
(7, 6, 1, 1, 500.00, 500, 'pending', '2025-03-20 13:25:36', '2025-04-03 06:03:23'),
(8, 6, 3, 1, 700.00, 700, 'confirmed', '2025-03-20 13:25:52', '2025-04-03 06:05:51'),
(9, 6, 3, 1, 700.00, 700, 'pending', '2025-03-20 13:48:23', '2025-04-03 08:23:26'),
(10, 6, 1, 1, 500.00, 500, 'pending', '2025-04-03 03:52:32', '2025-04-03 08:24:05'),
(11, 6, 2, 1, 600.00, 600, 'pending', '2025-04-03 04:08:37', '2025-04-03 04:08:37'),
(12, 6, 3, 3, 700.00, 2100, 'pending', '2025-04-03 08:24:21', '2025-04-03 08:24:21');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `ticket_price`, `title`, `descriptions`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 600, 'Event 6', 'Event 1 des', '2025-03-27 18:11:59', '2025-03-27 23:11:59', '2025-03-20 12:11:59', '2025-04-04 10:57:29'),
(2, 600, 'Event 2', 'Event 2 des', '2025-03-28 18:11:59', '2025-03-28 23:11:59', '2025-03-20 12:11:59', '2025-03-20 12:18:20'),
(3, 700, 'Event 3', 'Event 3 des', '2025-03-29 18:11:59', '2025-03-29 23:11:59', '2025-03-20 12:11:59', '2025-03-20 12:18:31'),
(4, 327, 'Culpa consequatur N', 'Sunt quas illo expe', '1985-03-08 00:00:00', '2004-03-04 00:00:00', '2025-04-04 15:07:24', '2025-04-04 15:07:24'),
(5, 208, 'Aut aliquam sunt cul', 'Sed qui omnis Nam el', '1998-11-27 00:00:00', '2004-06-02 00:00:00', '2025-04-04 15:15:34', '2025-04-04 15:15:34'),
(6, 260, 'Officia ut iure aut', 'Quam dolor iure ut r', '2005-06-02 00:00:00', '2016-05-20 00:00:00', '2025-04-04 15:51:08', '2025-04-04 15:51:08'),
(7, 170, 'Praesentium aut assu', 'Qui eveniet fugit', '1976-04-24 00:00:00', '1994-06-13 00:00:00', '2025-04-05 22:50:42', '2025-04-05 22:50:42'),
(8, 497, 'Id fuga Tempora nul', '<p>Iste necessitatibus .</p>', '1979-03-07 00:00:00', '2017-04-27 00:00:00', '2025-04-05 23:01:39', '2025-04-05 23:01:39'),
(9, 951, 'Est nihil duis sit o', '<ul><li><strong>Quod tempora nisi el.</strong></li></ul>', '2019-10-05 00:00:00', '1998-01-04 00:00:00', '2025-04-05 23:02:09', '2025-04-05 23:02:09'),
(10, 397, 'Ratione rem aliquid', '<ol><li>Molestiae quo exerci.</li><li>Molestiae quo exerci.Ullamco rerum sint c.</li><li>Molestiae quo exerci.</li><li>Molestiae quo exerci.</li></ol>', '2011-06-01 00:00:00', '2013-03-13 00:00:00', '2025-04-05 23:04:30', '2025-04-05 23:04:30');

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
(11, 'App\\Models\\User', 1, 'auth_token', '3c2f48d11683c043116201075a94361611e2a3e44f5b5514f915d7c8e6014b70', '[\"*\"]', NULL, NULL, '2025-04-04 10:55:51', '2025-04-04 10:55:51');

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
('C6oxclKCZWhy0362smpPCec9KVRkBlVSvkPvtAbY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmpjTWZoNGRGc1QzdW55MGZkeFQwZU5YelVKZUpQNjRzbFo0aUxZMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1743925609),
('KPkViGF1uIKSUN6UB6ZrFts5mdsxy7p2QGsRdcfV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ1hxVW4yb3l1c3FVQkhsZW55SkhVaEJObVFpdUlTVlFmSG1TeWtjMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1743680557),
('N1PFHw2fsEgyaC15asAZNkity2KENkZLq9hgjV38', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUlk5MmNIUEViZHg3UFlqNWhKVWFIVG9rWHdDN213SjVpaXoxQTR1YyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1743670536);

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
(6, 'user', 'abc', 'abc@gmail.com', 'storage/profile_images/profile_image_1742494407.png', '$2y$12$7RPzakhVjcr8ot9O5/d4wusEReIBNKsbSSWuq12zRYP5DRjikXAx.', '2025-03-20 12:13:28', '2025-03-20 12:13:28');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
