-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2019 at 10:45 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vue_todo`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_14_204459_create_todos_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(7, '2016_06_01_000004_create_oauth_clients_table', 2),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('11630301276184d8b4dda8e79a44bc3355152e21b2ce4c2594c74ed8243334ff4369bca8a46d335f', 2, 2, NULL, '[]', 0, '2019-08-18 13:37:17', '2019-08-18 13:37:17', '2020-08-18 19:37:17'),
('62521fcbb524677e84797b74b34b941c850b107c8235636cdd8323e706735b6f7ca15d5b2b6ade81', 2, 2, NULL, '[]', 0, '2019-08-18 14:20:01', '2019-08-18 14:20:01', '2020-08-18 20:20:01'),
('7ea6b44a0a5ba9c2e02e982e0aaea07f84b2f56c6c19a026fa3fd3bde314aa2fe907ca49033fd1ae', 2, 2, NULL, '[]', 0, '2019-08-18 14:18:04', '2019-08-18 14:18:04', '2020-08-18 20:18:04'),
('95c592653eacd2fd793d9216bee28203904ad37b936ef3f463ec2cec3c6d85c798793a3b2255209a', 2, 2, NULL, '[]', 0, '2019-08-18 14:19:45', '2019-08-18 14:19:45', '2020-08-18 20:19:45'),
('acd890b2550c2e5b4b133453d5f23700dba9c399ecf6eca58f2cb264bc0b92bb2ab5c20d40219804', 2, 2, NULL, '[]', 0, '2019-08-18 14:12:12', '2019-08-18 14:12:12', '2020-08-18 20:12:12'),
('bf108b52a4479e31800e1b8fd3bdafec84c2653403127ea8d395a638f9e210409ce190bd157ec1b2', 2, 2, NULL, '[]', 0, '2019-08-18 14:19:48', '2019-08-18 14:19:48', '2020-08-18 20:19:48'),
('f12690d8f05da9f818b3326d5c5c087c4e0e2dfa19ea4072d523321761756c99c8bb0596dbd05acf', 2, 2, NULL, '[]', 0, '2019-08-18 14:10:16', '2019-08-18 14:10:16', '2020-08-18 20:10:16'),
('f8bc0626a6ac6ca8aabadc56d45734cea36f6a9f83c9e210cb46d5582521bd5137158a66411a9687', 1, 2, NULL, '[]', 0, '2019-08-17 15:26:52', '2019-08-17 15:26:52', '2020-08-17 21:26:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Co5YpXAo2spJC2tHVtnh6D9WFQ6sp1btfFJW8Uof', 'http://localhost', 1, 0, 0, '2019-08-17 15:02:01', '2019-08-17 15:02:01'),
(2, NULL, 'Laravel Password Grant Client', '8ihzaQvrqgB6L1p0mvCzSNtNu2t0sLapKAUM1dI1', 'http://localhost', 0, 1, 0, '2019-08-17 15:02:01', '2019-08-17 15:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-08-17 15:02:01', '2019-08-17 15:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('0c78773fd342add366fa4261ce18cbbcec9f00e5030251bc48e6b724266f8c4f3f674b8a9cd4bac2', 'f12690d8f05da9f818b3326d5c5c087c4e0e2dfa19ea4072d523321761756c99c8bb0596dbd05acf', 0, '2020-08-18 20:10:16'),
('2d3c2a8c197123369f83df9a82efa3f7db64f635f6336f7fb8becfdea75ffac07df375bc1c67f99b', 'cf95d9a2dc6ee4fc8fde0adb6ecca1c640b3e503d132071bb3335289326e7464a49f80e7d0150d18', 0, '2020-08-18 20:36:52'),
('3206064323fb587b0149d7b11439fdb2e722d9936f7f4f729e57922080e0e9a1174f1c4ad0b25b60', 'acd890b2550c2e5b4b133453d5f23700dba9c399ecf6eca58f2cb264bc0b92bb2ab5c20d40219804', 0, '2020-08-18 20:12:13'),
('5c07ed1db7c56bc2bb0d7399c5623b9bb9e144e3d4a57083d6c5b8dfdf22f52642eb55816973900c', '7d930bc5b3f98d6559b8acb31c6ada2f9945fed5eeedfe4f71e4fa91d549a4d4145988d339d0e188', 0, '2020-08-18 20:36:21'),
('99bb399a376e927cfbbd08c2c728a398c8278469331fad35bba399444c201c0942438c82e07b8302', 'f8bc0626a6ac6ca8aabadc56d45734cea36f6a9f83c9e210cb46d5582521bd5137158a66411a9687', 0, '2020-08-17 21:26:52'),
('bba585fb87f65fd5a807ece34f33cb019cbf70c397087f3479800fb4ba776413c45e19efb9493357', 'bf108b52a4479e31800e1b8fd3bdafec84c2653403127ea8d395a638f9e210409ce190bd157ec1b2', 0, '2020-08-18 20:19:49'),
('c33c5dcf7f81e1f41c6f264410b5d782428d5fcb528a4f72397b347d08f234c8e0e03ddea8301a58', '95c592653eacd2fd793d9216bee28203904ad37b936ef3f463ec2cec3c6d85c798793a3b2255209a', 0, '2020-08-18 20:19:45'),
('d0fa2dc6ef17f10cbe54b851f92f95ba0a719a0b2e1a4e3323afe252cb6dd3fdcfdfbd5c233ca79b', '62521fcbb524677e84797b74b34b941c850b107c8235636cdd8323e706735b6f7ca15d5b2b6ade81', 0, '2020-08-18 20:20:01'),
('e5b8748bd8fe59e3b533dbc0f75c3fadad4a7e0ac96292839f13e7383240d046428385ad1db90d76', '11630301276184d8b4dda8e79a44bc3355152e21b2ce4c2594c74ed8243334ff4369bca8a46d335f', 0, '2020-08-18 19:37:17'),
('f7a9759837e03e2fa58e6922c4cbd035e17b83592793a35d4dfd3d5cfd4acffae526644370e13e58', '7ea6b44a0a5ba9c2e02e982e0aaea07f84b2f56c6c19a026fa3fd3bde314aa2fe907ca49033fd1ae', 0, '2020-08-18 20:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `title`, `completed`, `created_at`, `updated_at`) VALUES
(11, 'hi', 0, '2019-08-14 16:38:17', '2019-08-14 16:38:17'),
(12, 'one', 0, '2019-08-17 13:52:32', '2019-08-17 13:52:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Demond Koss', 'elliott69@example.com', '2019-08-17 15:09:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HJbQlXq2g0', '2019-08-17 15:09:49', '2019-08-17 15:09:49'),
(2, 'Rhianna Muller', 'ferry.jermain@example.net', '2019-08-17 15:09:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YH9ONvcYNx', '2019-08-17 15:09:51', '2019-08-17 15:09:51'),
(4, 'John', 'john@example.net', NULL, '$2y$10$I7/De9gOypOyKsLo0RECDOJOOoWHt2.y9HS5qnybey8SDzv7CeRGC', NULL, '2019-08-18 14:35:08', '2019-08-18 14:35:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
