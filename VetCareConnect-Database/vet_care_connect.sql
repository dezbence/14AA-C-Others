-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Jan 15. 09:35
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `vet_care_connect`
--
CREATE DATABASE IF NOT EXISTS `vet_care_connect` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `vet_care_connect`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cure`
--

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
(2, '2024-06-18 12:15:00', 4, 1, 2),
(3, '2024-07-22 10:30:00', 3, 3, 2),
(4, '2024-06-17 09:00:00', 5, 2, 1),
(5, '2024-07-23 17:00:00', 6, 2, 4),
(6, '2024-06-25 15:15:00', 2, 3, 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cure_type`
--

CREATE TABLE `cure_type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `period` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `cure_type`
--

INSERT INTO `cure_type` (`id`, `type`, `period`) VALUES
(1, 'oltás', 15),
(2, 'általános vizsgálat', 30),
(3, 'műtét utáni kontroll', 15);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
--

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
-- Tábla szerkezet ehhez a táblához `migrations`
--

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
(1, '8:00-16:00', 'hétfő', 1),
(2, '8:00-16:00', 'kedd', 1),
(3, '8:00-17:00', 'szerda', 1),
(4, '9:00-17:00', 'csütörtök', 1),
(5, '8:00-14:00', 'péntek', 1),
(6, '10:00-18:00', 'hétfő', 2),
(7, '10:00-18:00', 'kedd', 2),
(8, '10:00-18:00', 'szerda', 2),
(9, '10:00-18:00', 'csütörtök', 2),
(10, '10:00-18:00', 'péntek', 2),
(11, '10:00-18:00', 'hétfő', 3),
(12, '10:00-16:00', 'kedd', 3),
(15, '10:00-16:00', 'szerda', 3),
(16, '10:00-16:00', 'csütörtök', 3),
(17, '10:00-16:00', 'péntek', 3),
(18, '12:00-18:00', 'hétfő', 4),
(19, '12:00-18:00', 'kedd', 4),
(20, 'zárva', 'szerda', 4),
(21, '12:00-18:00', 'csütörtök', 4),
(22, '12:00-18:00', 'péntek', 4),
(23, '8:00-14:00', 'hétfő', 5),
(24, '8:00-14:00', 'kedd', 5),
(25, '8:00-16:00', 'szerda', 5),
(26, '8:00-14:00', 'csütörtök', 5),
(27, 'zárva', 'péntek', 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `owner`
--

CREATE TABLE `owner` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `owner`
--

INSERT INTO `owner` (`id`, `name`, `email`, `password`, `postal_code`, `phone`) VALUES
(1, 'Dezamics Bence', 'bence@gmail.com', 'a', '9023 Győr, Puskás Tivadar u. 14.', '+36702365498'),
(2, 'Nagy Lajos', 'lacii@gmail.com', 'a', '9330 Kapuvár, Lehel u. 38.', '+36205639851'),
(3, 'Har Mónika', 'har.moni@gmail.com', 'a', '2900 Komárom, Arany János u. 32.', '+36202569843'),
(4, 'Joó Lél', 'joolel@gmail.com', 'a', '6700 Szeged, Mártírok útja 56.', '+36305684563'),
(5, 'teszt9', 'teszt9@gmail.com', '$2y$12$0WmEltdCrAbgOlmL9acGaOdhfEe.8dl1byURLQuNkjouENlGk6BBm', 'asd', 'asd'),
(6, 'Tv', 'tv@gmail.com', '$2y$12$B4syK/5sBLL587Yb.jxQPuGQ4ZTe5BqJGWiRJy0vc58rR5i2R8xvK', '1221a', 'a');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
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
(17, 'App\\Models\\Vet', 9, 'Secret', 'ef59df0aed20bf0d08cc42b125f2f6e5f464985507e7af0dd64aaf74a79cea93', '[\"*\"]', NULL, NULL, '2024-01-15 07:20:40', '2024-01-15 07:20:40');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pet`
--

CREATE TABLE `pet` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `species` varchar(255) NOT NULL,
  `gender` int(1) NOT NULL,
  `weight` double NOT NULL,
  `born_date` date NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `chip_number` int(5) DEFAULT NULL,
  `pedigree_number` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `pet`
--

INSERT INTO `pet` (`id`, `name`, `species`, `gender`, `weight`, `born_date`, `comment`, `owner_id`, `chip_number`, `pedigree_number`) VALUES
(1, 'Gránát', 'kutya', 1, 50.4, '2020-04-04', '', 1, 0, 0),
(2, 'Süti', 'kutya', 1, 8, '2017-12-14', 'allergiás a kutyaszőrre', 4, 0, 0),
(3, 'Dana', 'kutya', 0, 32.6, '2022-01-28', '', 4, 0, 0),
(4, 'Jessie', 'kutya', 0, 10, '2016-07-11', '', 3, 0, 0),
(5, 'Monti', 'macska', 0, 5.3, '2022-12-31', '', 2, 0, 0),
(6, 'Lali', 'hörcsög', 1, 0.5, '2023-06-05', '', 2, 0, 0),
(7, 'Tv', 'kutya', 1, 10, '2024-01-01', 'a', NULL, 1, 13),
(8, 'T3', 'kutya', 1, 10, '2024-01-01', NULL, NULL, 1, 13);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `special_opening`
--

CREATE TABLE `special_opening` (
  `id` int(11) NOT NULL,
  `working_hours` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `vet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `special_opening`
--

INSERT INTO `special_opening` (`id`, `working_hours`, `date`, `vet_id`) VALUES
(1, '8:00-16:00', '2024-05-01', 2),
(2, 'zárva', '2024-06-04', 5),
(3, 'zárva', '2024-07-08', 4),
(4, '10:00-14:00', '2024-08-22', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

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

CREATE TABLE `vet` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `stamp_number` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `vet`
--

INSERT INTO `vet` (`id`, `name`, `email`, `password`, `postal_code`, `phone`, `address`, `stamp_number`) VALUES
(1, 'Dr. Állat Orvos', 'drallatorvos@gmail.com', 'a', '9027 Győr, Orvos u. 12.', '', '', 0),
(2, 'Dr. Tóth Bernadett', 'drtothbernadett@gmail.com', 'a', '2900 Komárom, Arany János u. 20.', '', '', 0),
(3, 'Dr. Nagy László', 'drnagylaszlo@gmail.com', 'a', '1014 Budapest, Lehel u. 63.', '', '', 0),
(4, 'Dr. Kiss Sándor', 'drkisssandor@gmail.com', 'a', '6700 Szeged, Margaréta u. 41.', '', '', 0),
(5, 'Dr. Horváth Mária', 'dehorvathmaria@gmail.com', 'a', '9023 Győr, Aradi Vértanúk útja 24.', '', '', 0),
(6, 'Teszt', 't@gmail.com', '$2y$12$EouWvIhF1ggicK1xrTkWu.vbMVpoAsq6tg8O6tni.Br1A5sJ3rVWS', 'valahol', '+3612345678', '', 0),
(7, 'Teszt', 't@gmail.com', '$2y$12$KhAxj2UBOPHiRAQyhYjD0eC8s1nQwoCjg4jfPi2Y7wtkh7sqyO.hm', 'valahol', '+3612345678', '', 0),
(8, 'teszt10', 'teszt10@gmail.com', '$2y$12$zgfn8dgFFkP46KqzizzCGe32hJCe9c//jd9r/uiaK74pja5ATaTOG', 'asd', 'asd', '', 0),
(9, 'Tv', 'tv2@gmail.com', '$2y$12$4JWp93rq9au9l4.leBLauOpW0bivnZs0qiYbF8vJYr1GQF3dzoQsy', '1123', 'a', 'tv', 123);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `cure`
--
ALTER TABLE `cure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cure_cure_id` (`cure_type_id`),
  ADD KEY `FK_cure_vet_id` (`vet_id`),
  ADD KEY `FK_cure_pet_id` (`pet_id`);

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
-- AUTO_INCREMENT a táblához `cure`
--
ALTER TABLE `cure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `opening`
--
ALTER TABLE `opening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT a táblához `owner`
--
ALTER TABLE `owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT a táblához `pet`
--
ALTER TABLE `pet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `special_opening`
--
ALTER TABLE `special_opening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `vet`
--
ALTER TABLE `vet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `cure`
--
ALTER TABLE `cure`
  ADD CONSTRAINT `FK_cure_cure_id` FOREIGN KEY (`cure_type_id`) REFERENCES `cure_type` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_cure_pet_id` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_cure_vet_id` FOREIGN KEY (`vet_id`) REFERENCES `vet` (`id`) ON DELETE NO ACTION;

--
-- Megkötések a táblához `opening`
--
ALTER TABLE `opening`
  ADD CONSTRAINT `FK_opening_vet_id2` FOREIGN KEY (`vet_id`) REFERENCES `vet` (`id`) ON DELETE NO ACTION;

--
-- Megkötések a táblához `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `FK_pet_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id`) ON DELETE NO ACTION;

--
-- Megkötések a táblához `special_opening`
--
ALTER TABLE `special_opening`
  ADD CONSTRAINT `FK_special_opening_vet_id` FOREIGN KEY (`vet_id`) REFERENCES `vet` (`id`) ON DELETE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
