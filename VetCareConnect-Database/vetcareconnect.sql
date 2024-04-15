-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2024. Ápr 15. 16:29
-- Kiszolgáló verziója: 10.5.21-MariaDB-0+deb11u1
-- PHP verzió: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `vetcareconnect`
--
CREATE DATABASE IF NOT EXISTS `vetcareconnect` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vetcareconnect`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(15) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$rVvjbQEXZ/bWLF4Q0BibIudwJdRyFjkAaQAQI9/NeCBFP.YheVJte');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cure`
--

DROP TABLE IF EXISTS `cure`;
CREATE TABLE `cure` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `pet_id` int(11) DEFAULT NULL,
  `cure_type_id` int(11) DEFAULT NULL,
  `vet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `cure`
--

INSERT INTO `cure` (`id`, `date`, `pet_id`, `cure_type_id`, `vet_id`) VALUES
(246, '2024-04-25 12:00:00', 147, 3, 5),
(247, '2024-04-24 17:00:00', 164, 1, 37),
(248, '2024-06-04 10:30:00', 148, 3, 5),
(250, '2024-06-06 13:00:00', 148, 1, 37),
(251, '2024-06-03 15:30:00', 148, 2, 37),
(252, '2024-05-29 18:30:00', 149, 2, 37),
(253, '2024-05-31 13:00:00', 171, 2, 37),
(254, '2024-04-24 13:00:00', 149, 1, 37),
(255, '2024-04-17 14:00:00', 148, 2, 5),
(256, '2024-04-17 17:30:00', 149, 2, 37),
(257, '2024-05-30 18:30:00', 172, 1, 37),
(258, '2024-04-15 18:30:00', 174, 2, 37),
(259, '2024-05-29 17:00:00', 173, 3, 37),
(260, '2024-04-16 18:30:00', 172, 1, 37),
(261, '2024-05-29 15:00:00', 170, 1, 37),
(262, '2024-05-29 15:30:00', 175, 2, 37),
(263, '2024-05-14 10:00:00', 170, 2, 37);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cure_type`
--

DROP TABLE IF EXISTS `cure_type`;
CREATE TABLE `cure_type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `cure_type`
--

INSERT INTO `cure_type` (`id`, `type`) VALUES
(1, 'oltás'),
(2, 'általános vizsgálat'),
(3, 'műtét utáni kontroll');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gyik`
--

DROP TABLE IF EXISTS `gyik`;
CREATE TABLE `gyik` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `gyik`
--

INSERT INTO `gyik` (`id`, `question`, `answer`) VALUES
(1, 'Mi a VetCareConnect?', 'A VetCareConnect egy állatorvosok és gazdák közötti összekötő felület. Legfőbb funkciója az időpontfoglalás és a kiskedvenceinkkel kapcsolatos adatok nyilvántartása.'),
(2, 'Le tudom mondani az időpontjaimat?', 'A naptáram menüpontban megtalálhatók a lefoglalt időpontok. Az időpontlemondásra kattintva mondja le az időpontot. Időpontlemondásra az időpont előtt maximum 2 nappal van lehetőség.'),
(3, 'Hogyan tudok időpontot foglalni?', 'Időpontot foglalni az \"Időpont foglalás\" menüpont alatt tud.\nAz időpontfoglaláshoz meg kell adnia a kiválasztott orvost, az időpont típusát, a kisállatát, akit az időpontra szeretni vinni, valamint ki tuda választani az időpontot az adott orvoshoz.'),
(4, 'Nem tudom melyik állatorvoshoz menjek. Hogyan tudok választani?', 'Az oldalon található egy állatorvos böngésző, az \"Állatorvosok\" menüpont alatt. Itt találhatja az összes adatbázisban szereplő állatorvost. Közülük tud választani.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `opening`
--

DROP TABLE IF EXISTS `opening`;
CREATE TABLE `opening` (
  `id` int(11) NOT NULL,
  `working_hours` varchar(255) NOT NULL,
  `day` varchar(255) NOT NULL,
  `vet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `opening`
--

INSERT INTO `opening` (`id`, `working_hours`, `day`, `vet_id`) VALUES
(1720, '08:00-16:00', 'kedd', 5),
(1722, '08:00-16:00', 'csütörtök', 5),
(1723, '08:00-16:00', 'péntek', 5),
(1725, '12:00-16:00', 'szerda', 5),
(1767, '13:00-19:00', 'hétfő', 37),
(1768, '10:00-12:30', 'kedd', 37),
(1769, '13:00-19:00', 'kedd', 37),
(1770, '10:00-12:30', 'szerda', 37),
(1771, '13:00-19:00', 'szerda', 37),
(1772, '10:00-12:30', 'csütörtök', 37),
(1773, '13:00-19:00', 'csütörtök', 37),
(1774, '10:00-12:30', 'péntek', 37),
(1775, '13:00-19:00', 'péntek', 37),
(1786, '10:00-15:00', 'hétfő', 24),
(1787, '10:00-15:00', 'kedd', 24),
(1788, '10:00-15:00', 'szerda', 24),
(1789, '10:00-15:00', 'csütörtök', 24),
(1790, '10:00-15:00', 'péntek', 24),
(1791, '10:00-15:00', 'szombat', 24),
(1792, '10:00-15:00', 'vasárnap', 24);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `owner`
--

DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `postal_code` int(4) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email_verified_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `owner`
--

INSERT INTO `owner` (`id`, `name`, `email`, `password`, `postal_code`, `phone`, `email_verified_at`) VALUES
(9, 'Teszt Mária', 'maria@example.net', '$2y$12$O9eZ0gEdJqqZVxgZ48AnA.bcv3fVOh2/5jET6ZlWOgVbcX7L0qu5y', 5552, '+36201456329', '0000-00-00'),
(117, 'Nyikos Kata', 'nykata04@gmail.com', '$2y$12$ieZw6HP.drdiCd8AUdlIvO1ukmvcC.zfwfRkvRPhMkSHASKtJ07XG', 9172, '+36202355565', '2024-03-26'),
(150, 'Joó Barnabás', 'joobarni@gmail.com', '$2y$12$ueRqJ0zZdgdkglL4IA4CB.1F1Osn66C1j6Z3bc6EoC8O4q5SAUVEi', 2900, '+36315678559', '2024-04-15'),
(151, 'Dezamics Bence', 'dezbence@gmail.com', '$2y$12$AjuuNcOIu8gp/58mtTnaqO5.cPaGHGjJCUiPQCwszjTfUp0T.NcBC', 1234, '+36201234567', '2024-01-01');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
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
-- A tábla adatainak kiíratása `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Vet', 7, 'Secret', 'e73742206054b75c45a8df5985dfebcac0b1eea50f667c1156b28ad9bc36ff52', '[\"*\"]', NULL, NULL, '2024-01-09 06:27:36', '2024-01-09 06:27:36'),
(2, 'App\\Models\\Owner', 5, 'Secret', 'f7e94b1fe27d768751241b378e05f349524fad7da5af1a2094ad13eea9ce43eb', '[\"*\"]', NULL, NULL, '2024-01-09 10:19:30', '2024-01-09 10:19:30'),
(3, 'App\\Models\\Vet', 8, 'Secret', '0cc9e09b15dd6f96905480ddc680967bd69fbc5784358a30698ebcdc2b97b357', '[\"*\"]', NULL, NULL, '2024-01-09 10:19:49', '2024-01-09 10:19:49'),
(4, 'App\\Models\\Owner', 5, 'Secret', '81ad11833085deea1e1e7b401866658d8e1dcb0dea7f361e4bc1d5b77d249d5b', '[\"*\"]', NULL, NULL, '2024-01-09 10:20:40', '2024-01-09 10:20:40'),
(5, 'App\\Models\\Vet', 8, 'Secret', 'd6acf71735f5ce82ae74581f37f531012d30fd3df1cce9db1746a0b493fcedc8', '[\"*\"]', NULL, NULL, '2024-01-09 10:57:50', '2024-01-09 10:57:50'),
(6, 'App\\Models\\Vet', 8, 'Secret', '07aa84d2ee6fbb62f4d65e38e3afc99d955e53796c637ef5290b7a5fe07101c2', '[\"*\"]', NULL, NULL, '2024-01-09 10:58:16', '2024-01-09 10:58:16'),
(7, 'App\\Models\\Owner', 5, 'Secret', '1dd3a299f4c36cc841ae48697d0cb0aa5dc6e4b69fcc8baeb793834874d5c8eb', '[\"*\"]', NULL, NULL, '2024-01-09 11:00:25', '2024-01-09 11:00:25'),
(8, 'App\\Models\\Owner', 5, 'Secret', 'cab10a0fd774be4d76f02af5263554d4fb51e67745ccc59e57e5b6e2d529c217', '[\"*\"]', NULL, NULL, '2024-01-09 11:01:26', '2024-01-09 11:01:26'),
(9, 'App\\Models\\Owner', 5, 'Secret', '2fa2c941fca468d9f0e78ab235a7754bfdfbd4e1736ddf80337c67619572fea1', '[\"*\"]', NULL, NULL, '2024-01-09 11:02:29', '2024-01-09 11:02:29'),
(10, 'App\\Models\\Owner', 5, 'Secret', '7189e3c3154cc04b4140edd83fe05a9045b3a0f08b415e0b808410210659a9df', '[\"*\"]', NULL, NULL, '2024-01-09 11:02:40', '2024-01-09 11:02:40'),
(11, 'App\\Models\\Owner', 5, 'Secret', 'df26fd70df04dbf036c54356b9607116c071c311ac811282b105f2a1c0cf9807', '[\"*\"]', NULL, NULL, '2024-01-09 11:03:00', '2024-01-09 11:03:00'),
(12, 'App\\Models\\Owner', 5, 'Secret', '24d2c9c2d482a6d027fc1c8e302fa07ba224a66ccb38c7b337d75f08b5d70a28', '[\"*\"]', NULL, NULL, '2024-01-09 11:05:03', '2024-01-09 11:05:03'),
(13, 'App\\Models\\Owner', 5, 'Secret', 'ec44fffe74699d7bfd0598434b1b5d569af383392aa0f7da236229b84602e54b', '[\"*\"]', NULL, NULL, '2024-01-09 11:06:56', '2024-01-09 11:06:56'),
(14, 'App\\Models\\Owner', 5, 'Secret', '12fc49cb297e592cf6eb0cc69b887683a18beed16dbf3c377642c587f78c9d42', '[\"*\"]', NULL, NULL, '2024-01-09 11:10:44', '2024-01-09 11:10:44'),
(15, 'App\\Models\\Vet', 8, 'Secret', '1376900ba90b7ecab434dabb71c0dd568f1c910b2f9299e3d9fc920f96bbf396', '[\"*\"]', NULL, NULL, '2024-01-09 11:10:50', '2024-01-09 11:10:50'),
(19, 'App\\Models\\Owner', 7, 'Secret', 'f4f0903b3ff984c6e3ef238d4d7467bdd1e80cdbb232abbdc3195b2909fa3f2a', '[\"*\"]', NULL, NULL, '2024-01-15 09:54:34', '2024-01-15 09:54:34'),
(20, 'App\\Models\\Owner', 7, 'Secret', 'b5d03a6e1bad9abf683e5a3e2c3c7a1004389baa929b30ebe34253942fcdf0df', '[\"*\"]', NULL, NULL, '2024-01-15 09:54:44', '2024-01-15 09:54:44'),
(23, 'App\\Models\\Owner', 8, 'Secret', '652e0a5cfd19a03f733a11d868a3b03721d31ba7b6fd41f8becb78496faf1179', '[\"*\"]', NULL, NULL, '2024-01-15 10:22:36', '2024-01-15 10:22:36'),
(29, 'App\\Models\\Owner', 5, 'Secret', 'cfa5262f7be92abc9a1c60e114a36c3b8fe053da82c32f240b01774075c667e3', '[\"*\"]', '2024-01-16 06:38:06', NULL, '2024-01-16 06:36:44', '2024-01-16 06:38:06'),
(91, 'App\\Models\\Vet', 9, 'Secret', 'a86b2145db4ffd6c26535be514959539b0f534f202cb0398ad50eddf48ad8d88', '[\"*\"]', '2024-01-18 14:38:41', NULL, '2024-01-18 14:36:43', '2024-01-18 14:38:41'),
(92, 'App\\Models\\Vet', 6, 'Secret', 'e76784cac833d48078fc4680935543ea56d567d61963f188bdf86e279a6e4615', '[\"*\"]', '2024-01-18 17:33:52', NULL, '2024-01-18 14:44:03', '2024-01-18 17:33:52'),
(98, 'App\\Models\\Vet', 9, 'Secret', '3ccc62e0dc8d966f7d53cb585921c9ec804d261281ab08c2157b4426462bdc86', '[\"*\"]', '2024-01-18 18:14:00', NULL, '2024-01-18 17:27:24', '2024-01-18 18:14:00'),
(136, 'App\\Models\\Owner', 6, 'Secret', '6fbcee6beb7af3e1fbe372b995979c24b4ac65d38e70c516a77d7f7f0cb2b633', '[\"*\"]', NULL, NULL, '2024-01-23 18:50:19', '2024-01-23 18:50:19'),
(137, 'App\\Models\\Owner', 6, 'Secret', '77af822d5e0c469ed24ca1ebe6c323e052538e4d8b0a46fdd17fca1cba16162d', '[\"*\"]', '2024-01-23 18:53:44', NULL, '2024-01-23 18:53:19', '2024-01-23 18:53:44'),
(187, 'App\\Models\\Owner', 12, 'Secret', 'ebbdc8d574a0e301ab099b7a53961103fa072ec3005146f42f93f2f955c3bf3c', '[\"*\"]', '2024-01-25 09:23:24', NULL, '2024-01-25 09:22:27', '2024-01-25 09:23:24'),
(216, 'App\\Models\\Vet', 5, 'Secret', 'e3e2520b645ca8031852f9a518a4b57e511239b5603f953cf210dae0bae3ffc9', '[\"*\"]', NULL, NULL, '2024-01-27 20:16:42', '2024-01-27 20:16:42'),
(217, 'App\\Models\\Vet', 5, 'Secret', 'f5330088347d5a62fd43d35d36acb43157b0122bdfd75ad7c05b0c12a82a4ac8', '[\"*\"]', NULL, NULL, '2024-01-27 20:16:43', '2024-01-27 20:16:43'),
(221, 'App\\Models\\Owner', 12, 'Secret', '2d307562f9464617ba5797253fab10b5ebfee0661bdf6d7ecdb90875134fb1e5', '[\"*\"]', '2024-01-30 12:03:35', NULL, '2024-01-28 17:06:16', '2024-01-30 12:03:35'),
(228, 'App\\Models\\Owner', 12, 'Secret', '63030bf7a8aaac0b30c742b8371c9fc49c38f16e571c494d29c804ed5bae9a2c', '[\"*\"]', '2024-03-11 16:54:28', NULL, '2024-01-29 15:45:07', '2024-03-11 16:54:28'),
(229, 'App\\Models\\Owner', 12, 'Secret', '86c077e78170da3a082a3dd572feb3cbf0716935f6fbd840b384fe9875dfe5dc', '[\"*\"]', '2024-01-30 06:47:44', NULL, '2024-01-30 06:29:26', '2024-01-30 06:47:44'),
(232, 'App\\Models\\Owner', 12, 'Secret', 'b01261adeab5e2fa2a161b69b47645afc8a64eefd11c8c9288f750a706a6be06', '[\"*\"]', '2024-01-30 07:22:23', NULL, '2024-01-30 07:21:35', '2024-01-30 07:22:23'),
(235, 'App\\Models\\Owner', 12, 'Secret', '6d7c0f9add816fb8dcc944c436eea5bf22a4acca66f71227f8b148674203b819', '[\"*\"]', '2024-02-01 06:43:19', NULL, '2024-01-30 17:44:04', '2024-02-01 06:43:19'),
(254, 'App\\Models\\Owner', 19, 'Secret', 'd897a246e16736203d43888d425c75f9fac9bab0d4045f7fd02185954eed3a43', '[\"*\"]', '2024-02-04 18:48:15', NULL, '2024-02-04 18:45:09', '2024-02-04 18:48:15'),
(274, 'App\\Models\\Vet', 5, 'Secret', '403f8e8f8418e52bc23f3c911e995edff4b5c7aeff03a4db325b87b756430798', '[\"*\"]', '2024-02-06 06:14:32', NULL, '2024-02-06 06:10:45', '2024-02-06 06:14:32'),
(283, 'App\\Models\\Vet', 5, 'Secret', '0634a67448a9ce987c6022707d2d7cf2a92ea965008f80565da1b15a45f9ecc3', '[\"*\"]', '2024-02-07 10:30:46', NULL, '2024-02-07 10:17:44', '2024-02-07 10:30:46'),
(298, 'App\\Models\\Owner', 13, 'Secret', '74ebf4b67e411c73ad15c9c4fd1afbd5d86053e618fbd6cfdbf42d1221070b28', '[\"*\"]', NULL, NULL, '2024-02-09 09:45:09', '2024-02-09 09:45:09'),
(299, 'App\\Models\\Owner', 13, 'Secret', '2136dc715b6a608d0eba01dc4094ecc58777672fe4301f2f6884dbcbe047563a', '[\"*\"]', NULL, NULL, '2024-02-09 09:45:17', '2024-02-09 09:45:17'),
(300, 'App\\Models\\Owner', 13, 'Secret', '78d9cc9419c3c35aab7d962cae56952c1077977f83807584a03adbb5b61861ec', '[\"*\"]', NULL, NULL, '2024-02-09 09:45:40', '2024-02-09 09:45:40'),
(303, 'App\\Models\\Vet', 11, 'Secret', '208825d51a2731f16f5d87f459b46d0fefd63d70a5802690f6cec2b2964a17a4', '[\"*\"]', NULL, NULL, '2024-02-09 11:03:21', '2024-02-09 11:03:21'),
(314, 'App\\Models\\Vet', 11, 'Secret', '0c890580abdd5680487685b28cb50b2354b709713a5e5bc651b6018b273c2832', '[\"*\"]', '2024-02-09 11:53:21', NULL, '2024-02-09 11:43:00', '2024-02-09 11:53:21'),
(317, 'App\\Models\\Vet', 5, 'Secret', '4276642d894483830aa392352ca19c7c1b085453556ce07efa095e4bffbbbaa2', '[\"*\"]', '2024-02-29 10:54:15', NULL, '2024-02-12 10:31:10', '2024-02-29 10:54:15'),
(329, 'App\\Models\\Vet', 5, 'Secret', '68efcda2f10ef9f11c9a93163f9e0632317a0812104365c6d7c24d2d4e081c96', '[\"*\"]', NULL, NULL, '2024-02-13 07:08:03', '2024-02-13 07:08:03'),
(330, 'App\\Models\\Vet', 5, 'Secret', '5b4fd42ea7c9899d46c7d63229b7d25fa3fb8aace389d39962f0da93464692c5', '[\"*\"]', NULL, NULL, '2024-02-13 07:08:13', '2024-02-13 07:08:13'),
(331, 'App\\Models\\Vet', 5, 'Secret', '27a4e242785c6f8d921f2e46958f87b8cc2c870df9eb513753e39c60a0913507', '[\"*\"]', NULL, NULL, '2024-02-13 07:08:17', '2024-02-13 07:08:17'),
(341, 'App\\Models\\Vet', 5, 'Secret', '3e68439d25c9eb101cb06eee6ec65fb6cadc940f3577da0a28dadf0ec314c0c0', '[\"*\"]', '2024-02-16 16:36:57', NULL, '2024-02-14 19:48:02', '2024-02-16 16:36:57'),
(346, 'App\\Models\\Vet', 4, 'Secret', '153c7ac3fc45f89716be2e35186e85548fee1d44f3b49ffeda66d52f73ccadc7', '[\"*\"]', NULL, NULL, '2024-02-15 07:11:43', '2024-02-15 07:11:43'),
(349, 'App\\Models\\Vet', 5, 'Secret', 'b7ac4c3bda447d07597972c5b723fa0490c55db6f12c3880d976cd275e8ea092', '[\"*\"]', NULL, NULL, '2024-02-15 09:50:12', '2024-02-15 09:50:12'),
(356, 'App\\Models\\Vet', 11, 'Secret', 'ee59092be81aedd018775666db9e2ffbf9e1768e0befa5e2da3d5a8c9d970c2b', '[\"*\"]', NULL, NULL, '2024-02-16 09:17:18', '2024-02-16 09:17:18'),
(358, 'App\\Models\\Vet', 11, 'Secret', '25b61bc46956cf316b69b354f7f61f7f3c7bdb8c2c633c2ad01bed137595e2ce', '[\"*\"]', NULL, NULL, '2024-02-16 11:57:09', '2024-02-16 11:57:09'),
(360, 'App\\Models\\Owner', 13, 'Secret', 'aeba18578b1bad1e8ab60100afcebe8ae260632a02534749755ca8dfd11015e7', '[\"*\"]', NULL, NULL, '2024-02-16 20:46:39', '2024-02-16 20:46:39'),
(362, 'App\\Models\\Owner', 31, 'Secret', '910c3b1715e9635a00b69c810b54f55915b50660a0b953a97531b417223e11c5', '[\"*\"]', NULL, NULL, '2024-02-17 10:14:56', '2024-02-17 10:14:56'),
(363, 'App\\Models\\Owner', 31, 'Secret', '70e63917c155c86f812ec51b415c2a88dcd9ca90a75b1c028dbaf27064cbe69d', '[\"*\"]', NULL, NULL, '2024-02-17 10:15:25', '2024-02-17 10:15:25'),
(364, 'App\\Models\\Owner', 31, 'Secret', '93752f0aeee6f0e52881736e42e338fd4488cc08538adbe3d0d21103ccdfa411', '[\"*\"]', NULL, NULL, '2024-02-17 10:15:42', '2024-02-17 10:15:42'),
(366, 'App\\Models\\Owner', 31, 'Secret', '3fae398171b527e18dc97bf1b0cebeb60d4e28e180ba0d653030b16be779654d', '[\"*\"]', NULL, NULL, '2024-02-18 12:37:34', '2024-02-18 12:37:34'),
(367, 'App\\Models\\Owner', 31, 'Secret', '47875101b242b2e38d771972ffa24b4d3f1c98d5df789af86f61b1e2f9216fc8', '[\"*\"]', NULL, NULL, '2024-02-18 12:37:45', '2024-02-18 12:37:45'),
(368, 'App\\Models\\Owner', 31, 'Secret', '448db53e504ffa70ee9540fac21d563e357410bf46e68bbb996cfcdba52fc9ec', '[\"*\"]', NULL, NULL, '2024-02-18 12:37:47', '2024-02-18 12:37:47'),
(371, 'App\\Models\\Owner', 31, 'Secret', '635df76e0bc7d2b77c36587e734e77bef1b32c734965a0f5c3184e836f0b0139', '[\"*\"]', NULL, NULL, '2024-02-18 16:41:18', '2024-02-18 16:41:18'),
(373, 'App\\Models\\Owner', 31, 'Secret', '2f4f5976a0072c3acc9c32451416cb8878503757ad2ff15e45b151b81ef1e502', '[\"*\"]', NULL, NULL, '2024-02-19 08:02:59', '2024-02-19 08:02:59'),
(374, 'App\\Models\\Owner', 31, 'Secret', '5840635d96baba90d634028ba1514b5ab90593a5dc8261fb12a32adc7231e5fe', '[\"*\"]', NULL, NULL, '2024-02-19 08:03:21', '2024-02-19 08:03:21'),
(375, 'App\\Models\\Owner', 31, 'Secret', '56998c2334d74f228bb1f438daf318c57ce9cb4b49962a993eb9aae4a0080f3f', '[\"*\"]', NULL, NULL, '2024-02-19 08:03:44', '2024-02-19 08:03:44'),
(376, 'App\\Models\\Owner', 31, 'Secret', '6f139467ba317e9cf9314c1f9213f7b9cf995800aee1cd81f614e31b5f20a825', '[\"*\"]', NULL, NULL, '2024-02-19 08:04:06', '2024-02-19 08:04:06'),
(377, 'App\\Models\\Owner', 31, 'Secret', 'e677b08bc49ce45147b4e01bc5b9038887e76fb048fc1e755df441768f5ea8e5', '[\"*\"]', NULL, NULL, '2024-02-19 08:08:49', '2024-02-19 08:08:49'),
(378, 'App\\Models\\Owner', 31, 'Secret', '40e6c8053e9136232209077c507d24ba8665d7f439a8d73bcdc56ca0c906e11e', '[\"*\"]', NULL, NULL, '2024-02-19 08:10:26', '2024-02-19 08:10:26'),
(379, 'App\\Models\\Owner', 31, 'Secret', 'e1c8de4faa07dbf79a35e13b2e41ae05606fc7f20c2aaf7569cc2a3c8d015d1a', '[\"*\"]', NULL, NULL, '2024-02-19 08:10:50', '2024-02-19 08:10:50'),
(386, 'App\\Models\\Owner', 31, 'Secret', '4f0139249304119df00f431ec608257d8e25566f492f7756737add2265adfe5b', '[\"*\"]', NULL, NULL, '2024-02-19 16:09:56', '2024-02-19 16:09:56'),
(388, 'App\\Models\\Owner', 31, 'Secret', '4136bb22d794c51419ca9e8374860fbed96c1e24f384b5d41a441a40f837da30', '[\"*\"]', NULL, NULL, '2024-02-19 16:40:40', '2024-02-19 16:40:40'),
(392, 'App\\Models\\Vet', 5, 'Secret', 'd26e03c9cb2d22ca1a4a093149b078441c47d0100809e9f7a91aac838e0e31f5', '[\"*\"]', NULL, NULL, '2024-02-19 17:15:10', '2024-02-19 17:15:10'),
(396, 'App\\Models\\Vet', 5, 'Secret', 'e2e80375e136584a91397bdb1975fb21813c5d34687f45d0dcc9b7b9322aead0', '[\"*\"]', NULL, NULL, '2024-02-20 06:22:04', '2024-02-20 06:22:04'),
(400, 'App\\Models\\Vet', 5, 'Secret', '1a86c20a9533e9fcdefc94ec2ae5d1bf565ab1493904dc00b5ba37c08b7056c1', '[\"*\"]', NULL, NULL, '2024-02-20 06:27:02', '2024-02-20 06:27:02'),
(401, 'App\\Models\\Vet', 5, 'Secret', 'a6ee933760dca5422ec02b5d7d154f060ec8ce946660866f8ab4ba843adb2b97', '[\"*\"]', NULL, NULL, '2024-02-20 06:27:46', '2024-02-20 06:27:46'),
(402, 'App\\Models\\Vet', 5, 'Secret', 'cfbac32317deafb0ec598132220eea7713b38af6a8e6a8969ef300c41b4d7372', '[\"*\"]', NULL, NULL, '2024-02-20 06:27:50', '2024-02-20 06:27:50'),
(403, 'App\\Models\\Vet', 5, 'Secret', '475cc649ef06d1d7c7475f4f6e6ca04add4d48a5050375a72ac331ed79bcb020', '[\"*\"]', NULL, NULL, '2024-02-20 07:54:03', '2024-02-20 07:54:03'),
(442, 'App\\Models\\Vet', 5, 'Secret', '0d5fd8010b44d4c7e7275e3459f85591f80b2c19b4dd7adb90bd4b5868872846', '[\"*\"]', '2024-02-27 09:19:43', NULL, '2024-02-27 08:48:23', '2024-02-27 09:19:43'),
(455, 'App\\Models\\Owner', 12, 'Secret', 'a3e4f4d0934f2b5f33469193265deee3924e84e220ee0e9fff35a2c1367b05ce', '[\"*\"]', NULL, NULL, '2024-02-29 08:08:47', '2024-02-29 08:08:47'),
(456, 'App\\Models\\Owner', 12, 'Secret', 'cb849d479aec4a8207e36e3759f09803a36e569cef6ca3e81c5218a9a76c0b09', '[\"*\"]', NULL, NULL, '2024-02-29 08:09:50', '2024-02-29 08:09:50'),
(457, 'App\\Models\\Owner', 12, 'Secret', 'b2254dcc3d10cf62b96a7c0980aa9f79184e8deeca4bb0a33f9af6c5d7e1954c', '[\"*\"]', NULL, NULL, '2024-02-29 08:10:08', '2024-02-29 08:10:08'),
(458, 'App\\Models\\Owner', 12, 'Secret', '9532b175c0df47e7354f958f9dc3cdce4bb64bccca7c327171ef5d35f4198dcf', '[\"*\"]', NULL, NULL, '2024-02-29 08:14:46', '2024-02-29 08:14:46'),
(459, 'App\\Models\\Owner', 12, 'Secret', 'f84ff632ba49fd1636b9a3fdb1d18e010c702e62240af0a9dbdf3fb1f13da3cc', '[\"*\"]', NULL, NULL, '2024-02-29 08:15:44', '2024-02-29 08:15:44'),
(460, 'App\\Models\\Owner', 12, 'Secret', 'b0384d81b7eacf65c9dd3d6f1ba109f18b021482d23390fd20ca99a8f3d4affa', '[\"*\"]', NULL, NULL, '2024-02-29 08:16:35', '2024-02-29 08:16:35'),
(461, 'App\\Models\\Owner', 12, 'Secret', 'e7ef565f645f087cf9d1a511a0782017d3ef3da3a92852f2fe67ceead4fe6333', '[\"*\"]', NULL, NULL, '2024-02-29 08:16:56', '2024-02-29 08:16:56'),
(462, 'App\\Models\\Owner', 80, 'Secret', '8260ac96d1604e0fed94629a6689776493a1ecf5cead7f1868e426f70e10c404', '[\"*\"]', NULL, NULL, '2024-02-29 08:17:56', '2024-02-29 08:17:56'),
(469, 'App\\Models\\Vet', 21, 'Secret', '1c837bb02a9ae2dce9ed2203f92826c1bee2f201b384ce18cbf8c161468b6df3', '[\"*\"]', NULL, NULL, '2024-02-29 08:33:14', '2024-02-29 08:33:14'),
(470, 'App\\Models\\Vet', 21, 'Secret', '9d4d572c877e72e3495a28e3f8c945cbab86020c09fdd2a28f7f110f94125c1c', '[\"*\"]', NULL, NULL, '2024-02-29 08:34:06', '2024-02-29 08:34:06'),
(471, 'App\\Models\\Vet', 21, 'Secret', 'f36d540565ce36e84337fda10404489689158423dc27fc085b652be836315841', '[\"*\"]', NULL, NULL, '2024-02-29 08:36:36', '2024-02-29 08:36:36'),
(472, 'App\\Models\\Vet', 21, 'Secret', '8c19d3ecfed31639e87409826e8827d23e152ee22a9a8f5372aec1da355fd86f', '[\"*\"]', NULL, NULL, '2024-02-29 08:36:48', '2024-02-29 08:36:48'),
(473, 'App\\Models\\Vet', 21, 'Secret', 'e834b6c8658112f07741f7d2d0caf7d4f664e1026d49aa5a3fcb75daa18f2c89', '[\"*\"]', NULL, NULL, '2024-02-29 08:36:57', '2024-02-29 08:36:57'),
(474, 'App\\Models\\Vet', 21, 'Secret', '9074e014db60a63214e9f1af8a00f58031177c39328cd26a053034ab66fb899a', '[\"*\"]', NULL, NULL, '2024-02-29 08:38:04', '2024-02-29 08:38:04'),
(475, 'App\\Models\\Vet', 21, 'Secret', 'c21f991b845681982fe06cbf0be89fa0dfea84d5926e301716e745deb3307f50', '[\"*\"]', NULL, NULL, '2024-02-29 08:42:10', '2024-02-29 08:42:10'),
(476, 'App\\Models\\Vet', 21, 'Secret', '2082e17f250853fc6c81471c39727cf00ca93d6770b260cf10e5b4a29b5d4b0e', '[\"*\"]', NULL, NULL, '2024-02-29 08:44:07', '2024-02-29 08:44:07'),
(477, 'App\\Models\\Vet', 21, 'Secret', 'f8a949996f01eee3d40e6c7ae4f5308aa89b1db1219dab1725c5f9869a9e9010', '[\"*\"]', NULL, NULL, '2024-02-29 08:44:31', '2024-02-29 08:44:31'),
(478, 'App\\Models\\Vet', 21, 'Secret', '3506de402ff4bed4aabfb3ce52c9846f92a11c07d4aca5fcb6b8ab5f92e9e3c6', '[\"*\"]', NULL, NULL, '2024-02-29 08:44:38', '2024-02-29 08:44:38'),
(479, 'App\\Models\\Vet', 21, 'Secret', '0cc91aaacd0e2f097447545f470b32f8cc278be936a76787a5b98d0c680eb838', '[\"*\"]', NULL, NULL, '2024-02-29 08:44:41', '2024-02-29 08:44:41'),
(480, 'App\\Models\\Vet', 21, 'Secret', 'b4ef1f43f6ec69bcac7c4d5f9f04e7858dd86ff1c26d382425c8b7e7d0ff6207', '[\"*\"]', NULL, NULL, '2024-02-29 08:44:48', '2024-02-29 08:44:48'),
(481, 'App\\Models\\Vet', 21, 'Secret', 'bbac312fa08a3abe5d28535a6e19348ddf21d297a1e21c50e341f2f257edcee2', '[\"*\"]', NULL, NULL, '2024-02-29 08:45:41', '2024-02-29 08:45:41'),
(482, 'App\\Models\\Vet', 21, 'Secret', '1af6aa11995f097e3a8331e8fb361468854943122c8f525b25b0516b39bf464a', '[\"*\"]', NULL, NULL, '2024-02-29 08:46:10', '2024-02-29 08:46:10'),
(483, 'App\\Models\\Vet', 21, 'Secret', 'c37e37180e7c5ccbe345000bd2601f8d3db9f38554af0a981472176ac97c36bc', '[\"*\"]', NULL, NULL, '2024-02-29 08:46:24', '2024-02-29 08:46:24'),
(484, 'App\\Models\\Vet', 21, 'Secret', '5d3358d167c72a72fad2ad383d6898a05fe65c792b132b686d2191a3c7d70792', '[\"*\"]', NULL, NULL, '2024-02-29 08:52:34', '2024-02-29 08:52:34'),
(485, 'App\\Models\\Vet', 21, 'Secret', '06bfcf08942a2ac7a5cb738bd6fb31572a9f8e66657b6185e949b68e8b9d6c87', '[\"*\"]', NULL, NULL, '2024-02-29 08:53:54', '2024-02-29 08:53:54'),
(486, 'App\\Models\\Vet', 21, 'Secret', 'aaa38217e7a0782ef47204e1228cf986895debaa8ae024cd05dad46a95514b75', '[\"*\"]', NULL, NULL, '2024-02-29 08:54:18', '2024-02-29 08:54:18'),
(487, 'App\\Models\\Vet', 21, 'Secret', '9b34ede8986b09ecea9d99b27fc04653f993b483e4e4af7e72e6623d9ee515a7', '[\"*\"]', NULL, NULL, '2024-02-29 08:54:28', '2024-02-29 08:54:28'),
(488, 'App\\Models\\Vet', 21, 'Secret', 'd3e37bd9c0aed2e00082c2b5a04522ad5b8a139d833fb1dffe5f7f1ada5d3110', '[\"*\"]', NULL, NULL, '2024-02-29 08:54:31', '2024-02-29 08:54:31'),
(489, 'App\\Models\\Vet', 21, 'Secret', '1912f7fdb6946ede9ffd8b8e14f2ec5d4367f8d4d21e981b6ffa5c31564f6526', '[\"*\"]', NULL, NULL, '2024-02-29 08:54:55', '2024-02-29 08:54:55'),
(490, 'App\\Models\\Vet', 5, 'Secret', '34ccb324c62d9ee8494aa63a0a2039a054cd2bc18fe09464d74bcd80ef6f3637', '[\"*\"]', NULL, NULL, '2024-02-29 08:54:57', '2024-02-29 08:54:57'),
(491, 'App\\Models\\Vet', 5, 'Secret', '7c9a6a9bb9dae4d6e4ea389862ea6e775b33d1e8c5fd7805dfa990f5ba8c03dd', '[\"*\"]', NULL, NULL, '2024-02-29 08:55:04', '2024-02-29 08:55:04'),
(494, 'App\\Models\\Vet', 21, 'Secret', '279076622109ae5c14e54b168b9be38e165c4e731247c9e2ec178c5e8096193e', '[\"*\"]', NULL, NULL, '2024-02-29 09:56:46', '2024-02-29 09:56:46'),
(495, 'App\\Models\\Vet', 21, 'Secret', '09c1b9ff59abf80fa4dee972a0c2769ef6414571be5d26aa29278224be530cf4', '[\"*\"]', NULL, NULL, '2024-02-29 09:56:55', '2024-02-29 09:56:55'),
(496, 'App\\Models\\Vet', 21, 'Secret', 'a5ef8ef9afa349c4f40288ce8ffebd0a52c4325f5bcf8402642b3e17cdca6755', '[\"*\"]', NULL, NULL, '2024-02-29 09:57:44', '2024-02-29 09:57:44'),
(497, 'App\\Models\\Vet', 21, 'Secret', 'f3d0ac1331de6b1ee254d7a2ae49bcf2cfc0122242074c3e9d2d379d94488101', '[\"*\"]', NULL, NULL, '2024-02-29 09:58:41', '2024-02-29 09:58:41'),
(498, 'App\\Models\\Vet', 21, 'Secret', '47ebeef9402b6f1a109ee7610efc4c998c8859f4e6ab486361ba6b8df0021997', '[\"*\"]', NULL, NULL, '2024-02-29 09:59:07', '2024-02-29 09:59:07'),
(499, 'App\\Models\\Vet', 21, 'Secret', '33ee99e8919b620302b9f00b373c5fdf051ee880170161bb73cf94189c93566c', '[\"*\"]', NULL, NULL, '2024-02-29 09:59:24', '2024-02-29 09:59:24'),
(500, 'App\\Models\\Vet', 21, 'Secret', 'af900d709c1cffd5c39a6117698a4a43fb7876b855e97bb7c67c82e0a8de0355', '[\"*\"]', NULL, NULL, '2024-02-29 10:00:02', '2024-02-29 10:00:02'),
(501, 'App\\Models\\Vet', 21, 'Secret', 'f73e4703590b3ce1a236ef39309671cb470344f74da2bd68e103bec7160729a2', '[\"*\"]', NULL, NULL, '2024-02-29 10:00:27', '2024-02-29 10:00:27'),
(502, 'App\\Models\\Vet', 21, 'Secret', '6c9be933ac98f23b95179dfc001d1a850b99458c7db8ce5213dd75902376cb4a', '[\"*\"]', NULL, NULL, '2024-02-29 10:00:37', '2024-02-29 10:00:37'),
(503, 'App\\Models\\Vet', 21, 'Secret', '1b393bef000adb23e4d1bcbdcf0e4430cfaa5aa874f92d62494e1a097aa7d6a9', '[\"*\"]', NULL, NULL, '2024-02-29 10:01:05', '2024-02-29 10:01:05'),
(504, 'App\\Models\\Vet', 21, 'Secret', '592327e9d778b15cfb8dabf79b160d815878a94276c106e40206f6f2dd866145', '[\"*\"]', NULL, NULL, '2024-02-29 10:02:15', '2024-02-29 10:02:15'),
(507, 'App\\Models\\Owner', 82, 'Secret', '328b4cb3029d9358bcc64665ed967b65e45680a50eb424d54acb8f68b54317bd', '[\"*\"]', NULL, NULL, '2024-02-29 10:35:25', '2024-02-29 10:35:25'),
(509, 'App\\Models\\Admin', 1, 'Secret', '3f2a7f6729f48e8f8c718b1e52ce61ddd1fad5ae7caedad5329ea5496a6060f5', '[\"*\"]', NULL, NULL, '2024-03-01 08:22:27', '2024-03-01 08:22:27'),
(511, 'App\\Models\\Owner', 84, 'Secret', '2165d02aaf956a2c773f4960346b49a45cc46ee73551d34e215c605dc27cd3bc', '[\"*\"]', NULL, NULL, '2024-03-01 10:15:02', '2024-03-01 10:15:02'),
(512, 'App\\Models\\Owner', 84, 'Secret', 'df1ae2b8dc88aeb38d495a49be59b6a949d8d82199ff9d7e9f921eda7297b6b1', '[\"*\"]', NULL, NULL, '2024-03-01 10:16:58', '2024-03-01 10:16:58'),
(513, 'App\\Models\\Owner', 84, 'Secret', '58677f4325f778b3ecb82aaabafcc84d328631e885ce5674ce1b0c7fb42c6fae', '[\"*\"]', NULL, NULL, '2024-03-01 10:19:01', '2024-03-01 10:19:01'),
(514, 'App\\Models\\Owner', 84, 'Secret', '09f164e5e0f38aa92dbd452b33553d862d657d9cd38812bd321147010053fa39', '[\"*\"]', NULL, NULL, '2024-03-01 10:19:45', '2024-03-01 10:19:45'),
(515, 'App\\Models\\Owner', 84, 'Secret', '0fc74100e44f9d5ca533f15e14279385f41a55d6b1e02810e34cd78cf076da5c', '[\"*\"]', NULL, NULL, '2024-03-01 10:23:09', '2024-03-01 10:23:09'),
(516, 'App\\Models\\Owner', 84, 'Secret', 'c8067d982724cd598a946992383dab46461e93c105cea3fa4ac06f8aef1a5e18', '[\"*\"]', NULL, NULL, '2024-03-01 10:23:28', '2024-03-01 10:23:28'),
(517, 'App\\Models\\Owner', 84, 'Secret', '39dfde1f1ad237174de5bbe7b076ecf2012994886b5b1167f24c7d23ab9ea645', '[\"*\"]', NULL, NULL, '2024-03-01 10:24:17', '2024-03-01 10:24:17'),
(518, 'App\\Models\\Owner', 84, 'Secret', 'bf119fa9b551e7d4052196d6a8bd96a204167eac6887f131e5f5dccc71e26c26', '[\"*\"]', NULL, NULL, '2024-03-01 10:24:50', '2024-03-01 10:24:50'),
(520, 'App\\Models\\Owner', 84, 'Secret', '30d85276076ecc78dbfa5e8ac207ca3944158915d1a073ea95f511d5614a0daf', '[\"*\"]', NULL, NULL, '2024-03-01 10:28:06', '2024-03-01 10:28:06'),
(521, 'App\\Models\\Owner', 84, 'Secret', 'ef04c4953d774ec798590fc4ba01b427492606c9f07420e17ff5a1ba6c920806', '[\"*\"]', NULL, NULL, '2024-03-01 10:32:54', '2024-03-01 10:32:54'),
(522, 'App\\Models\\Owner', 84, 'Secret', 'd439c684ce795ece3022cb02798f1c95453f41940bf624e60431702ff764226d', '[\"*\"]', NULL, NULL, '2024-03-01 10:33:51', '2024-03-01 10:33:51'),
(523, 'App\\Models\\Admin', 1, 'Secret', '6e66e06410bba162fb16aef04b583f41482cda76da0afd5eab8457c5448cb41c', '[\"*\"]', NULL, NULL, '2024-03-01 10:35:22', '2024-03-01 10:35:22'),
(525, 'App\\Models\\Owner', 84, 'Secret', 'd8bd3f6446733bdaa8153a1cbbec73481e00dc815a7eb076802fff97db9cbfa0', '[\"*\"]', NULL, NULL, '2024-03-01 10:39:06', '2024-03-01 10:39:06'),
(526, 'App\\Models\\Admin', 1, 'Secret', '4a99a99a06d0c677b45117b607ed85780b7c9fcdbbd7f39874ffde2f957612b7', '[\"*\"]', '2024-03-01 11:23:38', NULL, '2024-03-01 10:39:35', '2024-03-01 11:23:38'),
(527, 'App\\Models\\Owner', 84, 'Secret', '10eb5546ebe429f991fdc7cb4d338b381c3845854c8be8ea9a5e667f73e52844', '[\"*\"]', NULL, NULL, '2024-03-01 10:57:06', '2024-03-01 10:57:06'),
(531, 'App\\Models\\Owner', 85, 'Secret', '09feca61045966ee77bab8bc8d9e81289b0320d7687a4ebf44eb27003efd99e7', '[\"*\"]', NULL, NULL, '2024-03-07 07:31:47', '2024-03-07 07:31:47'),
(532, 'App\\Models\\Owner', 12, 'Secret', 'f2c9aa8b3a063ea2f5af471a44397f0eaafa8e5fc4ef2b833ff7c755b83d3928', '[\"*\"]', NULL, NULL, '2024-03-07 08:14:40', '2024-03-07 08:14:40'),
(533, 'App\\Models\\Owner', 12, 'Secret', '9ee0c5ab7175673ed4cb6796d671ca48e54fa9c8302b307bedcaf6d1f989cbee', '[\"*\"]', NULL, NULL, '2024-03-07 08:18:17', '2024-03-07 08:18:17'),
(534, 'App\\Models\\Owner', 12, 'Secret', '233b747b7050407481c0df2e40a36edc8ec1a252400cb1537292f3ee7edfa17f', '[\"*\"]', NULL, NULL, '2024-03-07 08:21:42', '2024-03-07 08:21:42'),
(535, 'App\\Models\\Owner', 84, 'Secret', 'e910a516060787f7a56bf6401ffa8ad651858c7e2e5f0fab67e6b1bb75eac571', '[\"*\"]', NULL, NULL, '2024-03-07 08:45:28', '2024-03-07 08:45:28'),
(536, 'App\\Models\\Owner', 84, 'Secret', '1508ab9e023c997769d9de4d8c0373ab9a0985816154efeeaeacd4ab97e642f3', '[\"*\"]', NULL, NULL, '2024-03-07 08:58:46', '2024-03-07 08:58:46'),
(542, 'App\\Models\\Owner', 91, 'Secret', '5eb6bf072b38585ca6e973c5ba4115abbc0ed2d4738255559459e9d2748d2772', '[\"*\"]', NULL, NULL, '2024-03-10 19:10:24', '2024-03-10 19:10:24'),
(545, 'App\\Models\\Owner', 92, 'Secret', '13bdaaacce91fa95c91be2bf9e4f2067ba74cc5a7f3b8476da3b62e3d4a56961', '[\"*\"]', NULL, NULL, '2024-03-11 08:14:15', '2024-03-11 08:14:15'),
(546, 'App\\Models\\Owner', 92, 'Secret', '99b34149a2656c7bc69a1309528cacc27df97466c244574ba5fb666397010566', '[\"*\"]', '2024-03-11 09:28:52', NULL, '2024-03-11 09:09:05', '2024-03-11 09:28:52'),
(548, 'App\\Models\\Owner', 12, 'Secret', 'ab6a0f4eb60876d5d2cf4e7a98a74923fedeee2a10b87ae3c3dd4810b7ffbced', '[\"*\"]', '2024-03-12 09:11:39', NULL, '2024-03-11 16:55:37', '2024-03-12 09:11:39'),
(549, 'App\\Models\\Admin', 1, 'Secret', '9aa7d79c5cc16ea0d19aec0e7ee7a7adc474b1b6066657e9e84136a2ba161bec', '[\"*\"]', '2024-03-11 17:30:50', NULL, '2024-03-11 17:30:32', '2024-03-11 17:30:50'),
(588, 'App\\Models\\Admin', 1, 'Secret', '9a219743642449fbdc9f374141f1cb436fc4c12432e1d5541b6030d04e0f8d41', '[\"*\"]', '2024-03-14 09:31:36', NULL, '2024-03-12 09:05:22', '2024-03-14 09:31:36'),
(591, 'App\\Models\\Owner', 85, 'Secret', '320018e670b61afa910c48ff0bad04ef4fa22ab603352957571aa695c6d641b8', '[\"*\"]', NULL, NULL, '2024-03-12 09:15:22', '2024-03-12 09:15:22'),
(610, 'App\\Models\\Owner', 85, 'Secret', '8ac8db07ca639a69da76f80d39cce2f8c3bc8105133390f7e23a362bfa50c445', '[\"*\"]', '2024-03-18 08:44:29', NULL, '2024-03-18 08:40:05', '2024-03-18 08:44:29'),
(617, 'App\\Models\\Owner', 94, 'Secret', 'a592af669701cfcda022b08a0ed1b75ea88287232d8c4a726841f9c81059be71', '[\"*\"]', NULL, NULL, '2024-03-19 08:23:02', '2024-03-19 08:23:02'),
(620, 'App\\Models\\Owner', 85, 'Secret', '7bb2a06126c01d0c1aa7c9f2d1e4b7dbeffa6b308eabeca3026e44d7d0fa9b41', '[\"*\"]', NULL, NULL, '2024-03-19 08:32:45', '2024-03-19 08:32:45'),
(626, 'App\\Models\\Owner', 85, 'Secret', '1f7017135c4328622ab76d2c4544782526996aa0af82757a283d5262eb05c4bd', '[\"*\"]', '2024-03-21 09:50:01', NULL, '2024-03-21 07:27:32', '2024-03-21 09:50:01'),
(631, 'App\\Models\\Owner', 105, 'Secret', '2383003a5f9be400d0b7b7c9dfdaf4ad4633d1f58608180e7d3bf474349bab49', '[\"*\"]', NULL, NULL, '2024-03-21 09:47:20', '2024-03-21 09:47:20'),
(642, 'App\\Models\\Vet', 5, 'Secret', '0236f5041717e2d9fb488182211ab626e79a0cc3d280a8acb7ba9c23e798d7c5', '[\"*\"]', '2024-03-28 10:10:28', NULL, '2024-03-22 11:44:15', '2024-03-28 10:10:28'),
(649, 'App\\Models\\Owner', 110, 'Secret', 'a07caefe3c0e47c0ccf6697e2510a2abcbf9079e9cd1102be9219140dd7c48e9', '[\"*\"]', NULL, NULL, '2024-03-23 05:05:25', '2024-03-23 05:05:25'),
(652, 'App\\Models\\Owner', 111, 'Secret', '6c8d58f78b69acb7538c5bfe7e8cb65be97d6c42b9ce79cefe6ad65b3b630585', '[\"*\"]', NULL, NULL, '2024-03-23 05:31:51', '2024-03-23 05:31:51'),
(653, 'App\\Models\\Owner', 111, 'Secret', 'f38ef8af7ba4448dd1ce7b3e3cddbebe5f682e8affbc2218db0f39b291e867d9', '[\"*\"]', '2024-03-23 07:01:44', NULL, '2024-03-23 05:33:07', '2024-03-23 07:01:44'),
(655, 'App\\Models\\Vet', 40, 'Secret', 'b60d02ec8913c8d6d4aa38d3562018421095aec0f1b58e4c49cd8fd182aad690', '[\"*\"]', NULL, NULL, '2024-03-23 05:34:58', '2024-03-23 05:34:58'),
(658, 'App\\Models\\Owner', 112, 'Secret', '480cde855420ca5488c8de4b194724f6b6a033a895ecb93d70ad1caf83783a5d', '[\"*\"]', '2024-03-23 07:25:49', NULL, '2024-03-23 05:47:13', '2024-03-23 07:25:49'),
(661, 'App\\Models\\Owner', 112, 'Secret', 'bab3b67ca9de1661f3427fb8c9e36fed98f042e4c64426c6cbb4f52ea7cfa604', '[\"*\"]', '2024-03-23 05:57:22', NULL, '2024-03-23 05:55:55', '2024-03-23 05:57:22'),
(668, 'App\\Models\\Owner', 110, 'Secret', '2890a8e2a8a94d8887a61c4a0e4f87b0730fc91731077e2791086ec66799f6b0', '[\"*\"]', '2024-03-23 06:24:30', NULL, '2024-03-23 06:11:19', '2024-03-23 06:24:30'),
(673, 'App\\Models\\Vet', 41, 'Secret', 'ccec4e3f28440659774c647406b7b555bb92aa253a1c6696fa9847f2b3ecbab9', '[\"*\"]', '2024-03-23 08:02:13', NULL, '2024-03-23 06:36:46', '2024-03-23 08:02:13'),
(674, 'App\\Models\\Owner', 113, 'Secret', '5c1866cd838cdba52fac113a9e9aa80c697fb0fe69882e1ece521fd22ab41ded', '[\"*\"]', NULL, NULL, '2024-03-23 19:08:02', '2024-03-23 19:08:02'),
(676, 'App\\Models\\Vet', 42, 'Secret', 'c991be08115520edbc7f9d0df32b0e59691af6c8dfee43e4625e6e927a5910a2', '[\"*\"]', NULL, NULL, '2024-03-23 19:40:43', '2024-03-23 19:40:43'),
(680, 'App\\Models\\Owner', 113, 'Secret', '31abd306384bc57660cc24f7ddb419d569c7cff597236c7d018f4de31ad21f1f', '[\"*\"]', '2024-03-23 19:50:27', NULL, '2024-03-23 19:49:18', '2024-03-23 19:50:27'),
(681, 'App\\Models\\Owner', 114, 'Secret', '0ba126e2ffc3905ffd0b627de349a2ffd64ef57e58cc3c66fa14f99377649fe1', '[\"*\"]', '2024-03-24 15:42:21', NULL, '2024-03-24 15:39:10', '2024-03-24 15:42:21'),
(682, 'App\\Models\\Owner', 114, 'Secret', 'b41037e847762b4fb1132b57bdbaa2699727393bc98e8d056b52d254dead51e8', '[\"*\"]', '2024-03-25 03:58:35', NULL, '2024-03-24 15:43:02', '2024-03-25 03:58:35'),
(683, 'App\\Models\\Owner', 9, 'Secret', '75c90325d9b62f0e19c29c5e30700b0fe2aa35859e84413ed56672ef8b9add9d', '[\"*\"]', '2024-03-24 16:56:38', NULL, '2024-03-24 16:16:29', '2024-03-24 16:56:38'),
(687, 'App\\Models\\Vet', 5, 'Secret', '61a78258878f57000d3cef70c9e3f6f405149af60c286b5da61bd3c23e0e8dca', '[\"*\"]', '2024-03-25 09:24:21', NULL, '2024-03-25 08:17:39', '2024-03-25 09:24:21'),
(689, 'App\\Models\\Vet', 5, 'Secret', '921f94abfccb9404a5804a9a63e7e3a75421380b108dd73925800edd9b68de37', '[\"*\"]', '2024-03-25 08:56:38', NULL, '2024-03-25 08:38:20', '2024-03-25 08:56:38'),
(692, 'App\\Models\\Owner', 108, 'Secret', '1d9b5d669f405a851a42249afbd99ddcd1a3d16803c7d00e46c4a166329d2788', '[\"*\"]', '2024-03-25 09:23:28', NULL, '2024-03-25 08:54:51', '2024-03-25 09:23:28'),
(693, 'App\\Models\\Owner', 9, 'Secret', '1809678eaf369de981a39bbe1537ee8846d8d5737c225813fd4784250101a251', '[\"*\"]', '2024-03-25 09:00:01', NULL, '2024-03-25 08:58:03', '2024-03-25 09:00:01'),
(694, 'App\\Models\\Owner', 108, 'Secret', 'cc8f16d2997f104a65ef117612f08e1d724e00d1c0835d7dee4ba044447030c8', '[\"*\"]', '2024-03-26 08:21:14', NULL, '2024-03-25 10:17:00', '2024-03-26 08:21:14'),
(695, 'App\\Models\\Owner', 108, 'Secret', '9c242442192de03321a5775f1173eb006119eec146a1c259305d4affb8e4a5f3', '[\"*\"]', '2024-03-25 19:06:18', NULL, '2024-03-25 18:54:14', '2024-03-25 19:06:18'),
(700, 'App\\Models\\Owner', 108, 'Secret', 'ac02abe577a6604c76b87143e39c83b784fae72d7e1a423cf6f26e884d1e29a4', '[\"*\"]', '2024-04-04 17:33:38', NULL, '2024-03-25 19:04:33', '2024-04-04 17:33:38'),
(702, 'App\\Models\\Owner', 128, 'Secret', '36a0dd710db1f58a2b597add927432819083d6c3f8b69b751d974de46f7cc0cc', '[\"*\"]', NULL, NULL, '2024-03-26 08:10:15', '2024-03-26 08:10:15'),
(703, 'App\\Models\\Vet', 5, 'Secret', '49db9fa44500aa4f97981a630e44a694a5a58579a2d26ff947168866643e3723', '[\"*\"]', '2024-03-26 11:56:55', NULL, '2024-03-26 11:18:57', '2024-03-26 11:56:55'),
(705, 'App\\Models\\Owner', 129, 'Secret', 'ea180cad78c16ae1435a35498202a75b5bc78799ca43bd828c99bdb814cc7f67', '[\"*\"]', NULL, NULL, '2024-03-26 15:51:21', '2024-03-26 15:51:21'),
(707, 'App\\Models\\Owner', 129, 'Secret', '10c8b2bfdb84c36070f025ef4417db3221fac3d616a85a961428789151e3d6ab', '[\"*\"]', '2024-03-26 15:57:58', NULL, '2024-03-26 15:57:29', '2024-03-26 15:57:58'),
(709, 'App\\Models\\Owner', 108, 'Secret', 'e1a7c673df39f6cc494273e5af26f7a88dcd660ccfe85e601b6b55da6a674113', '[\"*\"]', '2024-03-30 17:14:18', NULL, '2024-03-28 14:21:36', '2024-03-30 17:14:18'),
(710, 'App\\Models\\Vet', 5, 'Secret', '96a29944e7ef5514a1124010e34d237560acf81d9585c8ec3bf144ac0e902f26', '[\"*\"]', '2024-04-03 06:49:31', NULL, '2024-04-02 18:58:57', '2024-04-03 06:49:31'),
(711, 'App\\Models\\Owner', 9, 'Secret', '359229214ee6569b51794ed4022661d443406df69de0b0a0579e2eb65b41e206', '[\"*\"]', '2024-04-03 11:13:46', NULL, '2024-04-03 11:01:59', '2024-04-03 11:13:46'),
(712, 'App\\Models\\Owner', 9, 'Secret', 'd73b241a33325583896c4da28854e539c3ab72ef9bff0fc343c05967714db704', '[\"*\"]', '2024-04-04 04:47:57', NULL, '2024-04-04 04:47:51', '2024-04-04 04:47:57'),
(714, 'App\\Models\\Owner', 9, 'Secret', '532355495ac72df852adb9a108092e781efb9c8c2cd65a67474e233de63a5d46', '[\"*\"]', NULL, NULL, '2024-04-05 07:14:17', '2024-04-05 07:14:17'),
(716, 'App\\Models\\Owner', 9, 'Secret', '0af0de3d7020d58d20ecdc4664b67d6a0ec50c18dac6df061742e80db6eec61d', '[\"*\"]', NULL, NULL, '2024-04-05 07:17:38', '2024-04-05 07:17:38'),
(717, 'App\\Models\\Owner', 9, 'Secret', '03a3c606edcbff6e0cae742934da005d001f8c21f1f39b76493c80f8b7c28d8c', '[\"*\"]', NULL, NULL, '2024-04-05 07:31:13', '2024-04-05 07:31:13'),
(718, 'App\\Models\\Owner', 9, 'Secret', '389e921b2d1787f8d531a29ea98c993ffcac60e0ac2c91ac29233d44e9732f04', '[\"*\"]', NULL, NULL, '2024-04-05 07:32:26', '2024-04-05 07:32:26'),
(719, 'App\\Models\\Owner', 9, 'Secret', 'a6ceb251c38f962ee542c63e0fda1def6b26e00e32f16eb20455661ce86fdb31', '[\"*\"]', NULL, NULL, '2024-04-05 07:33:45', '2024-04-05 07:33:45'),
(720, 'App\\Models\\Owner', 9, 'Secret', '6a80851e67081d353e6d8a7aeb2e833811f6ba7029ac614acf835c0f005f4ba8', '[\"*\"]', NULL, NULL, '2024-04-05 07:38:53', '2024-04-05 07:38:53'),
(721, 'App\\Models\\Owner', 9, 'Secret', '64628afc5c5052a5d66bb8382f20d02155105180affd4e7650b3fcf4f1ed158a', '[\"*\"]', NULL, NULL, '2024-04-05 07:41:29', '2024-04-05 07:41:29'),
(722, 'App\\Models\\Owner', 9, 'Secret', 'a2e216080956e581c946043d0df40a6a49341139ce573560f827b4742f807e51', '[\"*\"]', NULL, NULL, '2024-04-05 07:43:00', '2024-04-05 07:43:00'),
(723, 'App\\Models\\Owner', 9, 'Secret', '94e25f9fdd78df3200634fe9f08b8107a4fe465adddb75d8cc7306cd13cf4f23', '[\"*\"]', NULL, NULL, '2024-04-05 07:43:42', '2024-04-05 07:43:42'),
(724, 'App\\Models\\Owner', 9, 'Secret', '7af2a4a8642673fd5158ca53f68a43ef0439bbe78f9627fe68722a0a142cc5de', '[\"*\"]', NULL, NULL, '2024-04-05 07:45:10', '2024-04-05 07:45:10'),
(725, 'App\\Models\\Owner', 9, 'Secret', '379d432eff5491ade5b07122186ea318497f21d4dd9dafce08ea7c28f402bcc0', '[\"*\"]', '2024-04-05 07:46:37', NULL, '2024-04-05 07:46:36', '2024-04-05 07:46:37'),
(726, 'App\\Models\\Owner', 9, 'Secret', '1a5c52d3dab6a4f62fe2999b14102914e71636df4801095743f26a23d4c8d5e5', '[\"*\"]', '2024-04-05 07:49:53', NULL, '2024-04-05 07:47:15', '2024-04-05 07:49:53'),
(727, 'App\\Models\\Owner', 9, 'Secret', 'ca2f31af49232982bbd5d2d283a9822ad324d4e43f640fa0160b289a73b4a78c', '[\"*\"]', '2024-04-05 07:47:42', NULL, '2024-04-05 07:47:42', '2024-04-05 07:47:42'),
(728, 'App\\Models\\Owner', 9, 'Secret', '5c4f73d65d1ed026e7f0f5f1dd5d78fe128f81c0d6efe50e2edab28050926ab6', '[\"*\"]', '2024-04-05 07:49:16', NULL, '2024-04-05 07:49:15', '2024-04-05 07:49:16'),
(729, 'App\\Models\\Owner', 9, 'Secret', '2cf92a787634cd7c84c8a04d7288dca0d03ccf4ad2081e070d3218ad70a17ab2', '[\"*\"]', '2024-04-05 07:49:43', NULL, '2024-04-05 07:49:42', '2024-04-05 07:49:43'),
(730, 'App\\Models\\Owner', 9, 'Secret', '773f8eb846df64241f19e945035ea1c6ed68d84e680e2ccfa275a3cf7fac2a1b', '[\"*\"]', '2024-04-05 07:52:02', NULL, '2024-04-05 07:52:01', '2024-04-05 07:52:02'),
(731, 'App\\Models\\Owner', 9, 'Secret', '5ecd8ba8142ecda656d6c1e2a41af12f84ddf3f3f3b29d6eda27b2a110284ded', '[\"*\"]', '2024-04-05 07:56:32', NULL, '2024-04-05 07:56:31', '2024-04-05 07:56:32'),
(732, 'App\\Models\\Owner', 9, 'Secret', '59f5855fef0aeeaa935774f756d344bbddc422c1eb109b7750f4be1394b1f309', '[\"*\"]', '2024-04-05 07:57:03', NULL, '2024-04-05 07:57:02', '2024-04-05 07:57:03'),
(733, 'App\\Models\\Owner', 9, 'Secret', 'd555ca77dbcd32109dbef83eaf3662a34cb4b2123bd3f541a0e7d986997365c2', '[\"*\"]', '2024-04-05 07:59:29', NULL, '2024-04-05 07:59:28', '2024-04-05 07:59:29'),
(735, 'App\\Models\\Owner', 9, 'Secret', '31742ee66c5ae031bfc7cce34da338a3c46d94e514b091666de83afaacdc6b66', '[\"*\"]', '2024-04-05 08:28:50', NULL, '2024-04-05 08:28:49', '2024-04-05 08:28:50'),
(736, 'App\\Models\\Owner', 9, 'Secret', '322b0791e2fb161ddd22985bc563ceec360673001a95861d1f0a19e725c82a0a', '[\"*\"]', '2024-04-05 08:29:04', NULL, '2024-04-05 08:29:04', '2024-04-05 08:29:04'),
(737, 'App\\Models\\Owner', 9, 'Secret', 'ffa3117f99954116c120365acefb7b01b7374338c6e558479e40f4212062c174', '[\"*\"]', '2024-04-05 08:32:35', NULL, '2024-04-05 08:32:35', '2024-04-05 08:32:35'),
(738, 'App\\Models\\Owner', 9, 'Secret', 'a06052ef4c363cd41b1d871a688426c366e859f1c0f669fc49958a7530665e5d', '[\"*\"]', '2024-04-05 08:33:02', NULL, '2024-04-05 08:33:01', '2024-04-05 08:33:02'),
(739, 'App\\Models\\Owner', 9, 'Secret', 'f180fe25f5e139e569db7219ca57d579e8065f659e3474b24b9c20254a9baebd', '[\"*\"]', '2024-04-05 08:36:06', NULL, '2024-04-05 08:36:05', '2024-04-05 08:36:06'),
(740, 'App\\Models\\Owner', 9, 'Secret', 'dc0dbbba4169a88d862b42fec53c4d56887ecbf261dfbdf1fa0eee7499ccfeb8', '[\"*\"]', '2024-04-05 08:37:51', NULL, '2024-04-05 08:37:50', '2024-04-05 08:37:51'),
(741, 'App\\Models\\Owner', 9, 'Secret', 'd4a054b15203169200c8a968f24c110d5595d47052bf7b97b7df74d586a27193', '[\"*\"]', '2024-04-05 08:38:12', NULL, '2024-04-05 08:38:11', '2024-04-05 08:38:12'),
(742, 'App\\Models\\Owner', 9, 'Secret', '2a41bea55d0f350f9204d8db7e19a7ffff510fb2a3bdc71bf91f249d2b658d5f', '[\"*\"]', '2024-04-05 08:38:38', NULL, '2024-04-05 08:38:37', '2024-04-05 08:38:38'),
(743, 'App\\Models\\Owner', 9, 'Secret', '844cb36104de11967ee68c4e6639eb42e29af4c402f662ea6d5f80c6aa1c2d20', '[\"*\"]', '2024-04-05 08:39:27', NULL, '2024-04-05 08:39:26', '2024-04-05 08:39:27'),
(744, 'App\\Models\\Owner', 9, 'Secret', '8afb634623dc61c20cd0d09ddb3055c7fb105f3a2ae68f72d8dca62514fad189', '[\"*\"]', '2024-04-05 08:40:00', NULL, '2024-04-05 08:39:59', '2024-04-05 08:40:00'),
(745, 'App\\Models\\Owner', 136, 'Secret', 'a795489025894e73cadd5f92b3cb8915c0377eeece943ac23e39329bbe95464b', '[\"*\"]', NULL, NULL, '2024-04-05 08:43:31', '2024-04-05 08:43:31'),
(746, 'App\\Models\\Owner', 136, 'Secret', 'cb6c929ba3320d7e91b51b8058504a1fd27f0529b76462edbf2b2c82b331f24f', '[\"*\"]', NULL, NULL, '2024-04-05 08:43:35', '2024-04-05 08:43:35'),
(747, 'App\\Models\\Owner', 9, 'Secret', '6de4107a6efc0fddda50a363eb27cf23eda9adab394d2cc359f28725a2aad1b4', '[\"*\"]', '2024-04-05 08:43:42', NULL, '2024-04-05 08:43:41', '2024-04-05 08:43:42'),
(748, 'App\\Models\\Owner', 136, 'Secret', '4751c282e292197875c37b5bf5d0fea1f657a4d5977dd765fd13a055ff4a658d', '[\"*\"]', NULL, NULL, '2024-04-05 08:43:58', '2024-04-05 08:43:58'),
(749, 'App\\Models\\Owner', 136, 'Secret', '664b1c8a23691c6dc448d6eda5fae8dcf43e71397c4de3cb12995d209025e633', '[\"*\"]', NULL, NULL, '2024-04-05 08:44:00', '2024-04-05 08:44:00'),
(750, 'App\\Models\\Owner', 136, 'Secret', '932a469514773c2224b22ad889f57ab9e4f4cb8fd8c57655fc930f709a105bfd', '[\"*\"]', NULL, NULL, '2024-04-05 08:44:01', '2024-04-05 08:44:01'),
(751, 'App\\Models\\Owner', 136, 'Secret', '48a4035e42b370b34ab8359ffe8fd3ee67aab23adff41ccfbb981d12eedcb1f1', '[\"*\"]', NULL, NULL, '2024-04-05 08:44:02', '2024-04-05 08:44:02'),
(752, 'App\\Models\\Owner', 136, 'Secret', 'f57b9db47256133e3df3da239734ae88c627b77aafd6157a79864397c9bfec3b', '[\"*\"]', NULL, NULL, '2024-04-05 08:44:03', '2024-04-05 08:44:03'),
(753, 'App\\Models\\Owner', 136, 'Secret', '273c1210099254deaa7b194948fdf2c2f04145ab0f784a00d70f560d1ae03d21', '[\"*\"]', NULL, NULL, '2024-04-05 08:44:04', '2024-04-05 08:44:04'),
(755, 'App\\Models\\Owner', 9, 'Secret', '594df56e17152dcfd6cf9dc41e7bef7a804b0dbecbdc47fa82650600e3f36d60', '[\"*\"]', '2024-04-05 08:45:36', NULL, '2024-04-05 08:45:35', '2024-04-05 08:45:36'),
(756, 'App\\Models\\Owner', 136, 'Secret', '9788ed8e9935831a69b337b83098590bd4bae683c5de19d964a00133fb3ad31d', '[\"*\"]', '2024-04-05 09:07:34', NULL, '2024-04-05 08:45:50', '2024-04-05 09:07:34'),
(757, 'App\\Models\\Owner', 9, 'Secret', 'de7aeae3a9e7bfe4af14b88ec415cd080501a2e3cf87275f74e2704e1141c523', '[\"*\"]', '2024-04-05 08:48:20', NULL, '2024-04-05 08:48:18', '2024-04-05 08:48:20'),
(758, 'App\\Models\\Owner', 136, 'Secret', '88cd5c1c9d92fc6edbb0114c5cf76d4e7ad93de43ab1e57686e25aa6cb686561', '[\"*\"]', '2024-04-05 09:44:25', NULL, '2024-04-05 09:12:40', '2024-04-05 09:44:25'),
(759, 'App\\Models\\Owner', 137, 'Secret', 'b49b9b7ff5c50a86c92edccf78ddfb9e064cf312608d8b5cc1a3eefa54da34fe', '[\"*\"]', '2024-04-05 14:59:42', NULL, '2024-04-05 13:57:58', '2024-04-05 14:59:42'),
(760, 'App\\Models\\Owner', 138, 'Secret', '3a79aa6b3c6a5e03691c72b0c29b39b6f85c486bd2f702215a646f8f71055b16', '[\"*\"]', NULL, NULL, '2024-04-08 09:34:52', '2024-04-08 09:34:52'),
(765, 'App\\Models\\Vet', 51, 'Secret', '38180901ba0a06bfcd26877a5c00daaa80c0a24d9e6f68deed0c3141df79a80b', '[\"*\"]', '2024-04-08 11:23:52', NULL, '2024-04-08 11:21:47', '2024-04-08 11:23:52'),
(766, 'App\\Models\\Owner', 136, 'Secret', 'efef353d37525426aeb7028786435c0a4e6e20ea7e71dc657d583e3e4869e188', '[\"*\"]', '2024-04-09 04:44:31', NULL, '2024-04-09 04:03:13', '2024-04-09 04:44:31'),
(768, 'App\\Models\\Owner', 136, 'Secret', 'e7a67300ca4d0eb4e0ea38c83fc9f2582258b0e68859ec90314fc5a5b1d75d4c', '[\"*\"]', NULL, NULL, '2024-04-09 04:28:56', '2024-04-09 04:28:56'),
(769, 'App\\Models\\Owner', 136, 'Secret', '2420fc51049dd949953ac3989544b885d29566635fa6da99455bcb0fc6952899', '[\"*\"]', NULL, NULL, '2024-04-09 04:29:02', '2024-04-09 04:29:02'),
(770, 'App\\Models\\Owner', 136, 'Secret', '7bfbcddaff97898353a2fae17a0982c03791bbfd0261431d7343f0ad4be4dac9', '[\"*\"]', NULL, NULL, '2024-04-09 04:29:03', '2024-04-09 04:29:03'),
(771, 'App\\Models\\Owner', 136, 'Secret', 'dfdc5d14cc4d9d74f9c75a6735a005ec1843bdc8a76dbd884f02e8d3e65e932b', '[\"*\"]', '2024-04-09 04:41:15', NULL, '2024-04-09 04:29:05', '2024-04-09 04:41:15'),
(775, 'App\\Models\\Owner', 136, 'Secret', '0be07850c416464f2a3b478fe55dd5a382ad106d5be7bcfeea597e0ae86bcc83', '[\"*\"]', '2024-04-10 07:31:40', NULL, '2024-04-10 07:31:35', '2024-04-10 07:31:40'),
(779, 'App\\Models\\Owner', 9, 'Secret', 'a466441a184bb685d62bdb0e42e9a7d249155368b249ae50aa617928d88864ed', '[\"*\"]', '2024-04-12 09:02:47', NULL, '2024-04-12 08:20:39', '2024-04-12 09:02:47'),
(780, 'App\\Models\\Owner', 139, 'Secret', '4badeb216bbaa4f9b30010fdc70b902a00648318a7affd29c2667d6240458aab', '[\"*\"]', '2024-04-12 08:28:15', NULL, '2024-04-12 08:25:03', '2024-04-12 08:28:15'),
(781, 'App\\Models\\Owner', 9, 'Secret', 'e331283b34f5674d6e60cd2cb141a05e7e61dc5efd6050822453ce68e046753e', '[\"*\"]', '2024-04-12 08:54:35', NULL, '2024-04-12 08:40:13', '2024-04-12 08:54:35'),
(782, 'App\\Models\\Owner', 140, 'Secret', 'f9ffc78bc9dbe951704eaca36f67ee9b37030fac5b06a1e2c46194d0b8805d6c', '[\"*\"]', NULL, NULL, '2024-04-12 11:11:06', '2024-04-12 11:11:06'),
(783, 'App\\Models\\Owner', 140, 'Secret', '5bf84da673e7100c97ea48893ab59b84e3c19d6d1e0d727c7877a7bd5c9f8017', '[\"*\"]', '2024-04-12 11:15:52', NULL, '2024-04-12 11:11:51', '2024-04-12 11:15:52'),
(784, 'App\\Models\\Owner', 9, 'Secret', '0c9f7e426a73c9571c03becf8d70a65116d8ad843ff10b90ad3ce38bf1f5995d', '[\"*\"]', '2024-04-15 09:12:51', NULL, '2024-04-15 07:42:40', '2024-04-15 09:12:51'),
(787, 'App\\Models\\Admin', 1, 'Secret', '8c9acffae8fd53a6db299fc70327439923b7218fe7feba9e4ba0fb87b26bc2be', '[\"*\"]', NULL, NULL, '2024-04-15 08:15:56', '2024-04-15 08:15:56'),
(788, 'App\\Models\\Admin', 1, 'Secret', '77a20b4f4ba1446751018d4e0f85b47c93c74fefb928ba93d27242ac99483aab', '[\"*\"]', '2024-04-15 08:18:37', NULL, '2024-04-15 08:18:27', '2024-04-15 08:18:37'),
(789, 'App\\Models\\Admin', 1, 'Secret', '7c968330e5443a6883a7293f951371100bf77702cd34cff909346e08d97b35ee', '[\"*\"]', '2024-04-15 08:38:28', NULL, '2024-04-15 08:22:56', '2024-04-15 08:38:28'),
(790, 'App\\Models\\Admin', 1, 'Secret', 'a2f99b9686b7600fe43d45fc049c9d3d88400598e238606be266f76279961a6e', '[\"*\"]', '2024-04-15 09:28:36', NULL, '2024-04-15 08:23:16', '2024-04-15 09:28:36'),
(791, 'App\\Models\\Admin', 1, 'Secret', '2dc7a706f22e58a29940e72759bc0b68cbbbbf0f15183af5bcde86b79488b441', '[\"*\"]', '2024-04-15 09:17:09', NULL, '2024-04-15 08:24:40', '2024-04-15 09:17:09'),
(792, 'App\\Models\\Admin', 1, 'Secret', 'c2d55a6a52bfe5c73275e051dcc21648eb211f0b818b57b28efef59f819b532a', '[\"*\"]', NULL, NULL, '2024-04-15 08:27:36', '2024-04-15 08:27:36'),
(798, 'App\\Models\\Admin', 1, 'Secret', '88fb336e6bd3a8eee92377771f07af72c51711c4e0a99fe979d250ffeced6719', '[\"*\"]', '2024-04-15 09:31:45', NULL, '2024-04-15 09:31:15', '2024-04-15 09:31:45'),
(800, 'App\\Models\\Owner', 150, 'Secret', '5761aabd17f694c74d7c46e3d808d38dfb087991d4aaf5a72641345503094e50', '[\"*\"]', '2024-04-15 14:19:38', NULL, '2024-04-15 14:05:39', '2024-04-15 14:19:38'),
(801, 'App\\Models\\Owner', 151, 'Secret', '9d6111f5e5dc35ca620e3a77a5b6a7ebb39a634eec5c788f750b801b330c9844', '[\"*\"]', '2024-04-15 14:16:07', NULL, '2024-04-15 14:07:10', '2024-04-15 14:16:07'),
(802, 'App\\Models\\Owner', 150, 'Secret', '76b3e841759d40a20d45f0977063d78d8214b458e177c12c316fca801401ffaf', '[\"*\"]', '2024-04-15 14:16:42', NULL, '2024-04-15 14:13:26', '2024-04-15 14:16:42');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pet`
--

DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `species` varchar(255) NOT NULL,
  `gender` int(1) NOT NULL,
  `weight` double NOT NULL,
  `born_date` date NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `chip_number` bigint(20) DEFAULT NULL,
  `pedigree_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `pet`
--

INSERT INTO `pet` (`id`, `name`, `species`, `gender`, `weight`, `born_date`, `comment`, `owner_id`, `chip_number`, `pedigree_number`) VALUES
(88, 'Macsi', 'macska', 0, 12, '2023-12-13', NULL, 9, 32234343434324, 99999999),
(119, 'Pamacs', 'macska', 1, 12, '2024-04-04', NULL, 9, 545434354639869, 65415689),
(125, 'Monti', 'macska', 0, 4, '2024-04-03', NULL, 9, 232323423423567, 25312564),
(147, 'Nyuszi', 'nyúl', 1, 1.2, '2024-03-04', NULL, 9, 234523532523523, 35235235),
(148, 'Jessie', 'kutya', 0, 12, '2009-02-11', NULL, 117, 546554656556132, 56652626),
(149, 'Cirmi', 'macska', 1, 5, '2020-08-13', NULL, 117, 456456153154865, 45645645),
(164, 'Banán', 'papagáj', 0, 3, '2024-04-10', NULL, 9, 232234242342342, 34234234),
(167, 'Üstökös', 'ló', 1, 157, '2024-04-01', NULL, 9, 566565656546434, 65464654),
(170, 'Dorisz', 'kutya', 0, 18, '2021-06-01', NULL, 150, 273281762198462, 93716491),
(171, 'Citrom', 'papagáj', 0, 3.5, '2020-05-19', NULL, 117, 445454545445454, 51415613),
(172, 'Kisabdul', 'hörcsög', 1, 1, '2024-01-01', NULL, 151, 123456789101112, 12345678),
(173, 'Góliát', 'ló', 0, 100, '2023-12-03', 'Méretes', 151, 123456789123456, 12345678),
(174, 'Banán', 'papagáj', 1, 1, '2024-01-01', NULL, 151, 123456789123456, 12345546),
(175, 'Rozi', 'hörcsög', 0, 0.7, '2024-02-06', 'Allergiás a répára.', 150, 216491264921694, 68368357);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `special_opening`
--

DROP TABLE IF EXISTS `special_opening`;
CREATE TABLE `special_opening` (
  `id` int(11) NOT NULL,
  `working_hours` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `vet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `special_opening`
--

INSERT INTO `special_opening` (`id`, `working_hours`, `date`, `vet_id`) VALUES
(42, 'zárva', '2024-06-05', 37);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vet`
--

DROP TABLE IF EXISTS `vet`;
CREATE TABLE `vet` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `postal_code` int(4) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `stamp_number` int(4) NOT NULL,
  `email_verified_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `vet`
--

INSERT INTO `vet` (`id`, `name`, `email`, `password`, `postal_code`, `phone`, `address`, `stamp_number`, `email_verified_at`) VALUES
(5, 'Dr. Horváth Mária', 'drhorvathmaria@example.net', '$2y$12$S84I19ni0j4oINpUS8VVGONYWJsOgG7ztCYt4NL.A2pQIlVwoY1Y.', 9022, '+36202236556', 'Győr, Aradi Vértanúk útja 12123', 2222, '2024-02-05'),
(24, 'Dr. Nagy János', 'nagyjanos@example.net', '$2y$12$fI422DELWx6w5HWFEjwLP.cq3OG8T0NlRnst5Xrl5Dyb/Vb5vXLly', 9025, '+36202305156', 'Győr, Arany János rakpart 52-60.', 5656, '2024-03-12'),
(37, 'Dr. Kelényi Andrea', 'drkandrea@example.net', '$2y$12$BHQdhAVBAMo6vw2lNxHx/OOmar/J2vdQu6F38XQRCGIPSGg/B8HJu', 9026, '+36202564898', 'Győr, Nagy Lajos utca 45.', 5542, '2024-03-24'),
(57, 'Dr. Nagy Ibolya', 'drnagyibolya@example.net', '$2y$12$BHQdhAVBAMo6vw2lNxHx/OOmar/J2vdQu6F38XQRCGIPSGg/B8HJu', 9026, '+36202564898', 'Győr, Nagy Ibolya utca 45.', 5542, '2024-03-24'),
(58, 'Dr. Nagy Árpád', 'drnagyarpad@example.net', '$2y$12$BHQdhAVBAMo6vw2lNxHx/OOmar/J2vdQu6F38XQRCGIPSGg/B8HJu', 9026, '+36202564898', 'Győr, Nagy Árpád utca 45.', 5542, '2024-03-24'),
(59, 'Dr. Kiss János', 'drkissjanos@example.net', '$2y$12$BHQdhAVBAMo6vw2lNxHx/OOmar/J2vdQu6F38XQRCGIPSGg/B8HJu', 9026, '+36202564898', 'Győr, Kiss János utca 45.', 5542, '2024-03-24');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `cure`
--
ALTER TABLE `cure`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `date` (`date`),
  ADD KEY `FK_cure_cure_id` (`cure_type_id`),
  ADD KEY `FK_cure_pet_id` (`pet_id`),
  ADD KEY `FK_cure_vet_id` (`vet_id`);

--
-- A tábla indexei `cure_type`
--
ALTER TABLE `cure_type`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- A tábla indexei `gyik`
--
ALTER TABLE `gyik`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `opening`
--
ALTER TABLE `opening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_opening_vet_id2` (`vet_id`);

--
-- A tábla indexei `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- A tábla indexei `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_pet_owner_id` (`owner_id`);

--
-- A tábla indexei `special_opening`
--
ALTER TABLE `special_opening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_special_opening_vet_id` (`vet_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A tábla indexei `vet`
--
ALTER TABLE `vet`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `cure`
--
ALTER TABLE `cure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT a táblához `cure_type`
--
ALTER TABLE `cure_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `gyik`
--
ALTER TABLE `gyik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `opening`
--
ALTER TABLE `opening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1939;

--
-- AUTO_INCREMENT a táblához `owner`
--
ALTER TABLE `owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=805;

--
-- AUTO_INCREMENT a táblához `pet`
--
ALTER TABLE `pet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT a táblához `special_opening`
--
ALTER TABLE `special_opening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `vet`
--
ALTER TABLE `vet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `cure`
--
ALTER TABLE `cure`
  ADD CONSTRAINT `FK_cure_cure_id` FOREIGN KEY (`cure_type_id`) REFERENCES `cure_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_cure_pet_id` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_cure_vet_id` FOREIGN KEY (`vet_id`) REFERENCES `vet` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `opening`
--
ALTER TABLE `opening`
  ADD CONSTRAINT `FK_opening_vet_id2` FOREIGN KEY (`vet_id`) REFERENCES `vet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `FK_pet_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `special_opening`
--
ALTER TABLE `special_opening`
  ADD CONSTRAINT `FK_special_opening_vet_id` FOREIGN KEY (`vet_id`) REFERENCES `vet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
