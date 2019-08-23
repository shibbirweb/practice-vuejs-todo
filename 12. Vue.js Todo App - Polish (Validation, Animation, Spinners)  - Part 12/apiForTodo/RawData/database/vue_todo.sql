-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2019 at 08:42 PM
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
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_14_204459_create_todos_table', 1);

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
(1, NULL, 'Laravel Personal Access Client', 'lnCoRsdxwcIme33kf1zgHbl0r7hK9WNaF8t846hK', 'http://localhost', 1, 0, 0, '2019-08-22 04:56:44', '2019-08-22 04:56:44'),
(2, NULL, 'Laravel Password Grant Client', '38i9tYwRHdWGKz5Pb7n2aXE9eEHJUiQVpZWBjA3H', 'http://localhost', 0, 1, 0, '2019-08-22 04:56:44', '2019-08-22 04:56:44');

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
(1, 1, '2019-08-22 04:56:44', '2019-08-22 04:56:44');

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
('0acfe7029ff47124fdbd23739f19e7e5b007f97ebb629e51f683a03eaa64cc69feecc94c36376cd5', '004d811727fb610a7f5ee459dd9b14b3559e3dad9a1cbd5561260b088f039d9c6ca19bb85eada571', 0, '2020-08-23 08:03:40'),
('0b5d0b24682932f9a240f81b48019759ca84dab4f5372ba6aa2d4aea29051e5108cef72675a0e785', 'ff070a6dcd7c40c28f7996565d22e48c2920b8af0f71212958c5413607e32c0ae3f27c3d36b8da87', 0, '2020-08-22 11:20:32'),
('168af2ce1911546f7aa4a711afe7928ff67c818feb85f328a96e73f7262cd7fc7c704e967e5ca259', '4ee66405359bfb5252d3118cbf78bea259bc0d5e23e8c5c1ffdb637322cf11b03b8e1e7f47432abf', 0, '2020-08-22 11:24:25'),
('3be8fdeb8c2fa84146ecbf5e26f3d6e6f8808ce3e81840663159d6e39a5a2c2ece9a435b86ae96c5', 'b0b1e9cf129e1cb6023953991714e73dce438b13f6f20e2299bb312b022fe0beb0f9f76ea529dd40', 0, '2020-08-22 10:58:53'),
('43e128a91c8aff72ee864095ed87c24479d25c367b397f07d9e26df3bd5786676bd894a16ecaae5c', 'e30becda9e0182998cea63bae506c29d7c3190824a679f9d8b3db66a7127a3adde29083829a3afeb', 0, '2020-08-23 17:20:09'),
('630157b07fffa220ad5747a6f5a07d93e0b0416af00720d97567418fb18693060bcbd70a185e096d', 'fadb358fec856748b151c8be96b41049c823f37756baab3876187b0b6e29a4c4ff4021fa7a959fc3', 0, '2020-08-23 18:16:18'),
('941fd0d04a5e55a6fb08521d1691a69443c45eff09ed450e9edc6164d95e2b687649d2f860303ba0', '63092e49e401c0890fd40579f8e19f3d31cd368b144dc876f04912c16c34b9eafd272614fda58421', 0, '2020-08-23 08:03:20'),
('b4e2fced351b5aee2b6a9db4cf95bd75ebc46a37dd3374c1f78c77d07dbaa1fbd37a7496df19d4db', '31f156ef4ca41857a969fe33c773f6cd52cf864e07ed8e63797c5ddf4876afeb0c8e110f9e0466f6', 0, '2020-08-22 11:07:58'),
('d33b36a9035161eee1dfd88c0e0d1b52f49f608173eea427d6b6f8e9049990f5d9f7ba9562c65371', '9cbaf5d6a9b7d4085c2bcfa0bd91f80e78ea1edeafe56146585c873320efbe7c5e8ae21d148bc777', 0, '2020-08-22 11:16:56'),
('e49de401f2456fe5d0216c0a970be3531d3eca0e5e43a32a2da34b9d9c7aa6b1764f25ddefa86dad', '004a32eab5cebf6af5be572c41fe9b459f865c067217faa6681dbb72b106b5ec44213dd7da1c9bc4', 0, '2020-08-23 18:37:17'),
('f22b781aa50ef3ad5cdfebcb3d74fdbecf0b2683ecab422a3537cc880ad78d3911c1640e37cc9992', '14e0458d098679b4e5d28dbce9386095e4e7c25de70cb907b223b374ca1f4676d296a759de457f02', 0, '2020-08-23 08:04:35'),
('f5af7c9261f35a74d7ba5092d02c44ce8123e86fc1473a7b4388ef8ef660771792ca0f19a3f844d7', '3124d336b15467eef1b81178655ec78b5cfb964f5158fadc3d7efcbe47c34c006908ee5c5241eb19', 0, '2020-08-22 11:19:18');

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
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `user_id`, `title`, `completed`, `created_at`, `updated_at`) VALUES
(1, 1, 'changed', 1, '2019-08-22 11:06:52', '2019-08-22 05:41:16'),
(2, 1, 'john todo 2', 0, '2019-08-22 11:07:11', '2019-08-22 11:07:12'),
(3, 2, 'shibbir todo 1', 0, '2019-08-22 11:07:25', '2019-08-22 05:47:34'),
(4, 2, 'shibbir todo 2', 0, '2019-08-22 11:07:38', '2019-08-22 05:47:34'),
(5, 1, 'johon todo 3', 0, '2019-08-22 05:23:12', '2019-08-22 05:23:12'),
(11, 2, 'todo one', 0, '2019-08-22 12:46:10', '2019-08-22 12:46:10'),
(12, 2, 'todo two', 0, '2019-08-22 12:46:12', '2019-08-22 12:46:12'),
(13, 2, 'todo three', 0, '2019-08-22 12:46:14', '2019-08-22 12:46:14'),
(14, 1, 'hi', 0, '2019-08-23 12:16:28', '2019-08-23 12:16:28');

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
(1, 'John', 'john@example.net', NULL, '$2y$10$CZCppiqwHLGW4mFxKBXhKuhGdQeOS8wpBnMhTuHeLNER0RuhrdYrm', NULL, '2019-08-22 04:58:45', '2019-08-22 04:58:45'),
(2, 'Shibbir', 'shibbirweb@gmail.com', NULL, '$2y$10$V0.rD/oX5KNnMfQS.mLjDeq3Eibr1Hvx3/TKZ2/ptsY.r/OMseFUG', NULL, '2019-08-22 05:00:32', '2019-08-22 05:00:32'),
(3, 'Name will go here', 'another@email.coom', NULL, '$2y$10$1EKpffeBM3jFqzeUKkxO0OgjkNOveAFAKIin5CzUEPitfx1LewxPu', NULL, '2019-08-22 14:09:39', '2019-08-22 14:09:39'),
(4, 'new name', 'new@new.com', NULL, '$2y$10$.goKNSkhjlrzm/8poMGnpOOC279hCmZY7uiKiDzxTzGdFmq7OnKay', NULL, '2019-08-23 11:29:30', '2019-08-23 11:29:30'),
(5, 'check', 'check@example.net', NULL, '$2y$10$GuEcKUqbwT29nU7zcasGGOtMZS9pThhaKeeHQPUF1vXcg8WPVNwN2', NULL, '2019-08-23 11:41:08', '2019-08-23 11:41:08'),
(6, 'another name', 'another@example.net', NULL, '$2y$10$pVBQfctv2wbAhSfVKgtvr.K1RZ5yihQEKIUPwKPnAP1UaoIzbieV6', NULL, '2019-08-23 11:47:59', '2019-08-23 11:47:59'),
(7, 'any name', 'anyname@example.net', NULL, '$2y$10$9e/64s/wZMCIFiQI9BU0yuzJfL64yTnkHfm6BnaWNmHszriYvoTdC', NULL, '2019-08-23 11:49:06', '2019-08-23 11:49:06'),
(8, 'new name', 'hn@example.net', NULL, '$2y$10$Wqrry2qFKpLbYDwpm9OE6uriWna0043ehgmHi4XFmtYNc503rg6CW', NULL, '2019-08-23 12:10:44', '2019-08-23 12:10:44');

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `todos_user_id_foreign` (`user_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `todos`
--
ALTER TABLE `todos`
  ADD CONSTRAINT `todos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
