-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2019 at 10:16 AM
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
('96d39079bee55d712108c5002e4a0873a386c12d9dfb5fb67107c5a13f895a37375565d4afd33a8b', 4, 2, NULL, '[]', 0, '2019-08-22 02:15:44', '2019-08-22 02:15:44', '2020-08-22 08:15:44');

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
('04c54d78053316ef91b089b3a0ed1f4933bc5cda56b4eb843288ff2922915b6091a43c6f804e5fcc', 'fc696359802d4c2a39b539201650f3af7ea287e4a3eac089404d369d9d2f71248ab0a8a577c137b9', 0, '2020-08-22 07:37:36'),
('054654303da672af0a3cb6ef0d3271288aabae53fc1710f736280136c2014192e4c9f1e8d66628dd', '2a6e65c035b9d2103b74f3273f9dfe4dad26da47693794ebcbf78ede999e9435aef6a2d931ab2c9c', 0, '2020-08-22 07:32:26'),
('099bd7dbe0dde61459a6ab402db2c017b921d5b5d1534bdb0a0e95099e6a3590437ccbac59dafbe6', '859a8d9eba95accf8c8f028c26b4f8cb3b4ddfc4f8dd80a3a5dbbbd3833803a2d2c20f16ca01410e', 0, '2020-08-20 14:34:08'),
('0c1462c9859b25dc79e002ec9e3d4eb208984cfc9477526e0998b87032c963f6961e0f1e967524c0', '4c1e66407f2d57e5c5f5a048f13713a12eca890e8acda8c31ff6fa69b738a610288f6a753b9d2f35', 0, '2020-08-20 13:07:04'),
('0c78773fd342add366fa4261ce18cbbcec9f00e5030251bc48e6b724266f8c4f3f674b8a9cd4bac2', 'f12690d8f05da9f818b3326d5c5c087c4e0e2dfa19ea4072d523321761756c99c8bb0596dbd05acf', 0, '2020-08-18 20:10:16'),
('1214d72f6df3eee472bed4f2beec91a34a0bb9eb64e75b6e364f8b7a0eebf5188a1d9f9db3394ae4', 'f407d5639d83608485e5936a0f35405ee955c7c86669d2a2a1852b7e3ba3a9c445151221e22945cf', 0, '2020-08-22 07:31:27'),
('14e878a44ce66460cf47be35d6daea8474580806f2a91c26a8cb7c3a445093804fefda9f1c8527c9', '9e6eb9b54ae6e410de83d5a47f85fcadd1f2f7b4bc9e27e7c5bb3911afccaa9f61c68bb5d712eebe', 0, '2020-08-22 07:43:41'),
('19d9b8a30bb2a5513f647af52b47bb83d1324c463bf0f4bade0602b30c2919bddeb5b65d6f2dd9f1', '9251e63bc57e436f85107b29ddcda020f153312e8a1951cb0a24e7e0fd4bf09bbc0a278fe63e8d89', 0, '2020-08-20 13:19:31'),
('1c70632dbd86a9567119dedf934dd7eda568f048228f32ed45049d5fc9871c1fd5a282a5ec22ab3a', '07890449e4df954e867c96a9a6b5121f9941b2b7ae78533e568a1c7e2a13f4d181210b9b67a323e8', 0, '2020-08-22 06:59:19'),
('1cafa145db31c60e55852d0a88af5c29ea95ed4487a45b3fb4cf22bfad73420bdd21b3d135d8ac0b', '853a4d64ff019c986f81a9dd1d80a087c31aff0c2316d16338aaca3f6de0d6701e00fa751391f3d1', 0, '2020-08-22 07:02:57'),
('22f447f7d950437693aa2c406a417d437757c79e21480dd2037d8cc1d112e341414da9ad2d277fa0', '54fddeb6c173097b548495ddee2528131be93322d62b83ab2bcf1fb2c3b6196f97660329287ab5d1', 0, '2020-08-22 07:34:56'),
('2ca6209bb7b9e72d131d0b04ece39e50f3b7185d014236a3cbb9683a31cf5e9b331de950337755c1', '16a0d3a576a022bf06b639c76e2a8e56c2882065fa743e366beaed036c00d2af3e9297f32f8c3e29', 0, '2020-08-22 07:38:50'),
('2d3c2a8c197123369f83df9a82efa3f7db64f635f6336f7fb8becfdea75ffac07df375bc1c67f99b', 'cf95d9a2dc6ee4fc8fde0adb6ecca1c640b3e503d132071bb3335289326e7464a49f80e7d0150d18', 0, '2020-08-18 20:36:52'),
('3206064323fb587b0149d7b11439fdb2e722d9936f7f4f729e57922080e0e9a1174f1c4ad0b25b60', 'acd890b2550c2e5b4b133453d5f23700dba9c399ecf6eca58f2cb264bc0b92bb2ab5c20d40219804', 0, '2020-08-18 20:12:13'),
('332c48be813b1f617e0d660f4f79c2797e6f78de0ba9e8cff5981ebb3132e314139989d50cac079e', 'a6702680ad677a9842f8c0dc4c5dcdc3e09abae054b83894f408520e39186eea5b9ecf1c22cbe46d', 0, '2020-08-22 08:05:48'),
('38a7c3f29af6c7746e7423b79e3de9b25445b94f842d0626b1174dd013ae4c561667015eacb4c959', 'f4f39aff58b86936fbcee4844a4f3401333b00198f4c0a37f04026f7889d94629ef0d0030e012843', 0, '2020-08-22 07:13:10'),
('4a472131b1ec063fe7d1f678e9402991299687dd086e073c00c4dc064ea623f34f6e8f1a43c5b756', '91c5ae6305cf7b434b24176f1531553531ce5a00f12d2f470b49447201ca0b011c65b87955eb5863', 0, '2020-08-22 07:59:08'),
('4ba7ef9406298999928e6ebd08726b162368e9e5af5cf24b32a5868b12d33d0cff77ee9190da09a9', '3eb45ffc8d87a5d2c949f365d45a0622269675074923a68f7d0ec020085171a5203b62b979e27449', 0, '2020-08-22 07:34:00'),
('4ee1369f5b69df6fe78a1c1ed4c5b8582d6394b12cf7855e70b26028aadd053823e9e97a09aacd4c', 'c88570a2f51b4a3274e5f8c1a28ce9561c3b0b84c6b7e1e4470ab297f723e341ff89dd920414b136', 0, '2020-08-22 07:04:44'),
('50f230c20d48d70508a311b3e4d6397c7f229b0f327e3816c106d51d89028512c72c114a2ea7fe93', '2bae3d2c4aa4e096ecbdb6cb82c0139662ae634e14add84289f2b2b417ecd730175500424bb1a749', 0, '2020-08-22 08:12:46'),
('56984b55e3ff8e6cd05ce38851e4e3b25cbbfdacf178ee8c68645cd884d7ccf271934e1e06245a6d', '5a4f6cfb54888c705b930013fc9a08c414c1e7326aa47e1ec2b86bc82f89ca72169a01f8780c3389', 0, '2020-08-20 15:11:14'),
('5adb3295b512f839d0f3979dc31965c17ef866faa6bf3cb2cc952ab6e2433647326163c735b80dae', '92544cccf9b663d132ed037372596721df79950ab9ce8fa51f72d8fe1a8d074d7cbf6e4e43d0b2b7', 0, '2020-08-22 07:38:40'),
('5b0902eb7983607c94727d1be1f5d843f0ae3efbadc0c27aa55b6d23c86fae1c7ef3d78b8ce3dd08', '159201e6634b2733bdcaab75db29096aad1f2ea44b12c63ed188ab41d719c3bad7693e940a13e771', 0, '2020-08-22 07:13:18'),
('5b1993b98c26d748fe0fa06cc84066c1dffa77b63c1077d8bf9ed2932abc17df58710920e3674480', '32269eeab05650913353b7c656185186cf86b1580360481af8b07840ef47674dc3dfd2652dce871e', 0, '2020-08-20 15:10:55'),
('5c07ed1db7c56bc2bb0d7399c5623b9bb9e144e3d4a57083d6c5b8dfdf22f52642eb55816973900c', '7d930bc5b3f98d6559b8acb31c6ada2f9945fed5eeedfe4f71e4fa91d549a4d4145988d339d0e188', 0, '2020-08-18 20:36:21'),
('64fc6bb40ad051f07742487331551848946595acd78f98034599a8b21ad8fb4fc137d4346ec8513d', 'f468fc4504a8b122851f2e6e7e8f1b58d60e4f276b629fc9c6b8dc31fc8bff0d1aeb2f4647600ebf', 0, '2020-08-20 15:09:04'),
('6abe5ae4930d42b51129da9e60848a6a8c6ec6905d5f66364e5b3e67a223a361d2efa2cfa007ea07', '31dd7a297c7c915d82977fd2be05da215bfcd14ab4da3cdfe1674f65d45952f38df6d2c0c6d6c50c', 0, '2020-08-22 07:12:23'),
('6d0e2988000428b4d7e1de7f1d7eacc634275848eae633f71872f1ecf8014e3901365e961681eeb7', '0bf441eabed0f6e46a004d84d631017a31b0d3a05ddd2dc1942767cb3100cc383bd766a9f0353f1e', 0, '2020-08-22 07:11:28'),
('6ece91ee75e5019f780993febf4cb376d1ea656a9e339bbfc64ca889343d71cc443fabd0a10d89c8', '1b319b9d3e93bfa9963f7ffb666ea5c3a6e59c0e3a5cb74c6ca5f872a4cbe38bf278cea73f065306', 0, '2020-08-22 06:48:37'),
('717d16aaee44ace2ecbdff8692e6b10a66f28176a5f321d41fe22bf9e810306345cd6a52bfd86d94', '7c1c3d119aca8785849dd867c1f9713328a7be4237b0f9b4f9429ccbd4be07a96edf8a1e19af4f65', 0, '2020-08-22 07:35:18'),
('772fb2793df9e103cce00ef8d498dc4579911efceb3e39a2a5313f33367257b4ca8e91ee9a33615d', '2f555c3d5f2dc9dcc3a6fa0af393c4f84eff7a5ca156f5160623fcf3c7838706bffddca250b3758c', 0, '2020-08-22 07:32:36'),
('77d75237e28771aafb3c4cc56b273c6e2d36adde3ba2c62fb2afe0d81571ae177a050230075fac28', 'cf9807497cc14596735033be1c968751731401a1ae076baf414f8083658025b6464980fdd0121121', 0, '2020-08-20 13:11:58'),
('7981a2cf44a040db8650e1ea019258f5d907088564777ad6a713e46f449c7d79eb85f56916b428b2', '1a4b9cfee5aa17c84e55d2846b2006789684ff6d66056a5610814daee9e38f4a6f6e982ce0201ec7', 0, '2020-08-20 13:15:37'),
('7cb26692918ccb552529a154033e503d1ed674a7fbaf1b2bdd12c46aac2555cb9cd941f5a7aab903', '32050500814998f8ff08e5656e28cee518a14591722905c30f0a0a3b24a5ea96aeff877462d9a159', 0, '2020-08-20 14:45:55'),
('7de479c17ea168ef25499699fc8dabe44a46e9e54002e48e3a3411af3ac4914e336b58b06bb3727a', 'da85650cf5f0bf8d8af61ed248f5356d1d2d5ef57ae924e97f77655018a7d3e845df9fd79480cc6f', 0, '2020-08-22 07:11:25'),
('7f4cea96d84c7e82e543ceb2c198f6253500962d6e8b5d1f0e7fe4528daaef0a5bc738d250229b96', '5b6ddcddf2f595a62fde9ca45f14d08351826b25af08415a871b075af38a875c75b52487bf908c01', 0, '2020-08-20 14:38:32'),
('88e95d9d553ae2743601a558d15485e9790e488edcdcae845c60b0745d2ad3d2ed4805f13d5ae06c', '1e4f0c42f6f6bce8b0108c1f4488208cc8efb53675db7d4280b1e109cfd2f98f6e6c45b445d1b3bb', 0, '2020-08-22 07:43:38'),
('94b8050d41bab050915c92270189313ebe55cea12cb8bf317d5da48e2693568a174ce480fa220313', '1fa9e7c3bfc26f75e28d3e3d544b4710eed4e5d9bd5d38ef727ba4d5560adf1ead2acd16b8eacfe0', 0, '2020-08-22 07:21:04'),
('95a80f71cd84441e46910eb69338bbcf9d2ea6187dde07e07f18a1a16d682f0f0fab2b3ca9001119', 'c4c82c8d195b335c1e8fb7971747a3518c113a7d6c78dcf1de448af5f27cb0fde3d21af1bd02e7d0', 0, '2020-08-22 07:54:02'),
('99bb399a376e927cfbbd08c2c728a398c8278469331fad35bba399444c201c0942438c82e07b8302', 'f8bc0626a6ac6ca8aabadc56d45734cea36f6a9f83c9e210cb46d5582521bd5137158a66411a9687', 0, '2020-08-17 21:26:52'),
('99d8c9b49a6b717d809754b05c256c59999841e8b0764c83e04de3e89a5b76b748463d1f34ab34fc', 'd471b04e508a6aae19baf1abb71ac33714c7c2bb3d394cfcbc83d403d311c1d31523507c01556bde', 0, '2020-08-22 06:39:00'),
('9a5befc2128cad27eee5c43ae4462f715bbc72a65eafeb673c094de73b3f20bb0cc3d156b006f3f3', '7e202c6b63650d57a734ac3c686ae6f3495106e491b6f355a02ea01c87307e9d2faa7515aad3e1ed', 0, '2020-08-20 14:46:04'),
('9e6c1a1436d387e0943c8bd7aeb5bb71e34c5743f821b6f1cc9d4773d8fefd88fc4cc8fc9de37c05', '3716c8e42139234d1238830664467bdc244968a29fa17ad581e2638e4bea2bdf57bca2a3649848c8', 0, '2020-08-22 08:14:21'),
('a8171622318a962381600ef5627a1636f1e0a5ff53f898f1db2aaa41e515ba6d17681656ae2261df', '69dc8445524aad732c0861aa7682860febb101bb7354d0beecac62087aa0bed8220856f9e4ca2ea8', 0, '2020-08-22 07:02:00'),
('aa3f6343713734df95d158bd320f70845a9868769a83a4b69d442af9f739fdaa8dabbb0cd9254cf7', '0ad1b589ef0d50765313854772166d508d7c667fb34583c6d750bb978004c4914cb5ead6c668d39b', 0, '2020-08-22 07:57:35'),
('b359ce5cd6d7381edc6421f695ddac527c118c1d10cb7aaf137f6ef1d3012c22b375e3b8f18ae4ff', 'a6f5f1829db34e3bc8168c9155d69c881b24b396ff2293decfbf40851c2ece43835ccb6517830857', 0, '2020-08-20 13:17:36'),
('b3773c479af0a1174cf94967085fc86d73daf6d0c719af0a78597cb8bbdfef018e459123a87275b2', '17f57d90cf454af49a35abfc421ba4aea8c162e51739e6850cacb4055a6e2241812f78c9c1e6d91c', 0, '2020-08-22 07:55:20'),
('b948d356bb6b615b9a9b0bb28be642113493c02bfc4d1f8a272331cd83c4cbc55d0cd0e333f99a82', '42e7e085bc0839c837b46d0abe016368f23a987b3a1339b1f367fc98bbfc10ee321014f1b9fd254f', 0, '2020-08-22 06:58:07'),
('bba585fb87f65fd5a807ece34f33cb019cbf70c397087f3479800fb4ba776413c45e19efb9493357', 'bf108b52a4479e31800e1b8fd3bdafec84c2653403127ea8d395a638f9e210409ce190bd157ec1b2', 0, '2020-08-18 20:19:49'),
('bbecdcd8ed05ac84466c67332beb1e00150e6c39cbda167cccb438a9a9ac3fdee7c1b0d42443d8c6', '58fe7e09e480c0e20c6caa9cb3f4fa6854b6470a6e4708393732b68e273e6f2f1f3cc5d34703dd2d', 0, '2020-08-20 15:12:33'),
('bc10835133cd4c99f69e52806a9ad02ab52ce3eccbd25090b587cd2cdb42b5f9ca81fafa911773ab', '52ef96ffa7315b0ff12f7c6a0930fed2f5c707a1910eb04e44b1bcd0f99ca25cfd821ff98603f11c', 0, '2020-08-20 13:13:02'),
('bf0a0a176e60e309d67aeb6315c3c26508e7dc9f2e171bb011f76497ad914abc839412d0bc1753d4', '979b9e2cf82aece0fb1f3ccc972efe598807fdb3ca9254e187dbd237098c1eadcabdd8d680667170', 0, '2020-08-22 07:02:29'),
('c0542cdf1bee1a2b4094bd1408b39845d1319aa6365c83ac99bd51938d8e9fd24d6aa56adece47a2', 'e9a248b2effdbb6d81759b30ce7297fe455b9b482f73a1c81b161e753163a2306223e05bc96f4842', 0, '2020-08-22 06:48:09'),
('c1896cb6b1812a82b38e95c5a3cb92980f996832fa9d9a27487283199eb80e62cfe21338411506ee', '5c75a3bc7037459f4a02bb00196616e5933dbe996a908b548b7795520251aabbe9c4b535ce6624c8', 0, '2020-08-20 14:34:06'),
('c33c5dcf7f81e1f41c6f264410b5d782428d5fcb528a4f72397b347d08f234c8e0e03ddea8301a58', '95c592653eacd2fd793d9216bee28203904ad37b936ef3f463ec2cec3c6d85c798793a3b2255209a', 0, '2020-08-18 20:19:45'),
('c8b31a391f8270510668097a0c6d7283a0f9f9e0f789cd13e819f5baa4c1d8787b57c4f1e36ec7cc', '494867a4487fb44540e1ee88ed88994785c96388c61746279ed25608e99111a44cfbe4849ae6756b', 0, '2020-08-20 13:11:41'),
('d0fa2dc6ef17f10cbe54b851f92f95ba0a719a0b2e1a4e3323afe252cb6dd3fdcfdfbd5c233ca79b', '62521fcbb524677e84797b74b34b941c850b107c8235636cdd8323e706735b6f7ca15d5b2b6ade81', 0, '2020-08-18 20:20:01'),
('d2bbf7fad70634e4dc43be172cf377fa9e519f1e19c4c3d5bef96775c9874ae8fdef1ace7004f50f', '22a5c72658df2ca36f0721e9d0f343bd8a8ebf2f23d8d3b70bd246e0c4444458b59ee3d2210c4493', 0, '2020-08-20 13:07:07'),
('d5326936286ff84b90bc310e4b1279e1b591a870c7d727da6b93a9a2d6e80d1bbdb36537e3737f2b', 'a0efb1f01c29aadcbf90d48c3d9b639d55bc8623f9403f00ec4df939c78902f3caf76a312e7474ff', 0, '2020-08-20 15:04:01'),
('d79bde015c055f08372f61f1aafed49b088c50e1dc273d94997e630e5a372c5fcea69b50104febdc', 'fe61a5f74e4ff5f26625b9a4962b988a564564dcb5bfbe1a81ef8802c5a7ddb7dbf0feb1c650991b', 0, '2020-08-22 06:59:54'),
('dbdbe7ffbe7d224e5c6c19b7263f0a8cd6b0dee76fc97a72324c2acd06babfbefd4f572bbc0bceb8', '2435f8726f21a28ae5da0110adee1b5fd75c5881e4e034ffb008b18ddf6971b557d6504a6b8127a6', 0, '2020-08-20 14:38:20'),
('e022e8d97c1111b9f6f9c7f73dabbe32723815e1256bf6e608b72ad2996630766657c0e5fea92767', 'f0fef266e9c37e55fdf3dd6575027d569ab545dd22caf6425a039c5a53a2bde554f6c44cc7d028b4', 0, '2020-08-22 07:54:00'),
('e5b8748bd8fe59e3b533dbc0f75c3fadad4a7e0ac96292839f13e7383240d046428385ad1db90d76', '11630301276184d8b4dda8e79a44bc3355152e21b2ce4c2594c74ed8243334ff4369bca8a46d335f', 0, '2020-08-18 19:37:17'),
('eeb83b6deaa58f22920469be2dc6bfe9c37724ba3a4bd67fba424fb272f6918cc5014c346747f599', '4ef278140dc4cfbd645b0c90e04ff778219336725302119d99fcc44873849be0449d31b2c38314c4', 0, '2020-08-22 07:40:43'),
('f18358c5b977ed06328be598f8966c655236db37c718e1abbae9d0f6f3402ea14597232ab429c7e2', 'd20a81d9e68350b6724466af19292940404b0e97fe1ef7256917ac2398bbaeee1b83ab7dcd70b06f', 0, '2020-08-20 14:46:18'),
('f27147034cd93aea8bc269e31a10fd710655b70f89ea89612e7846d486cfa312311ec2b8d3158772', '96d39079bee55d712108c5002e4a0873a386c12d9dfb5fb67107c5a13f895a37375565d4afd33a8b', 0, '2020-08-22 08:15:44'),
('f3b5d9cc04acbea16b7d76d8ee19b5d40df86dd6783d9accd081c8007758ee8ee232449ba8759e6e', '550f304cbc73407c868a1daa704952edc4deceb2116699bbf9d1cd249ab40249c8c03e656f885cec', 0, '2020-08-22 07:37:10'),
('f7a9759837e03e2fa58e6922c4cbd035e17b83592793a35d4dfd3d5cfd4acffae526644370e13e58', '7ea6b44a0a5ba9c2e02e982e0aaea07f84b2f56c6c19a026fa3fd3bde314aa2fe907ca49033fd1ae', 0, '2020-08-18 20:18:04'),
('f7b0919c86b054afe1fa7b9a1d5b534a9c41c3b67a26d60bdb41648b376364ad07140c9a9d6b4588', '619af21a683b9ef36a4c3b7ab8c5391e9d1687786e64f367e995961dbd3ee257d33291ac2e9a39b3', 0, '2020-08-20 13:07:29'),
('fff0b9744a132242866988f7d03a7e76c36683ec7a24ee5fc2acf5d92782cd2d121b281950d0c55b', 'eae7397e7f97f8ebbc0aa7442f695df99c2033e2307dbb775c76ba8bbb0741166e09e4a60fdc2d43', 0, '2020-08-22 08:15:09');

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
(4, 'John', 'john@example.net', NULL, '$2y$10$I7/De9gOypOyKsLo0RECDOJOOoWHt2.y9HS5qnybey8SDzv7CeRGC', NULL, '2019-08-18 14:35:08', '2019-08-18 14:35:08'),
(5, 'name will go here', 'name@email.com', NULL, '$2y$10$FBGOZavquaJkwRAAkxv/COwISD3xKI3V0nvE7fSkSQMeZ79H8uoD6', NULL, '2019-08-22 01:53:08', '2019-08-22 01:53:08');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
