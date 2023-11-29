-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 29 nov. 2023 à 21:10
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `produits`
--

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_29_081643_create_products_table', 2),
(6, '2023_11_29_082137_create_product_images_table', 3),
(7, '2023_11_29_104828_create_roles_table', 4),
(8, '2023_11_29_140325_create_role_user_table', 5);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `description`, `price`, `created_at`, `updated_at`) VALUES
(12, 'oumaima ghbhvfhdvudgd', '12.12', '2023-11-29 17:15:28', '2023-11-29 17:15:28'),
(4, 'Suscipit explicabo et qui eos modi.', '46.29', '2023-11-29 07:55:09', '2023-11-29 07:55:09'),
(5, 'Pariatur in commodi et cum.', '63.93', '2023-11-29 07:55:10', '2023-11-29 07:55:10'),
(6, 'Quia provident fugit tenetur perferendis qui.', '22.44', '2023-11-29 07:55:15', '2023-11-29 07:55:15'),
(7, 'Omnis fugiat eligendi tenetur sunt similique corrupti deserunt voluptatibus.', '52.40', '2023-11-29 07:55:19', '2023-11-29 07:55:19'),
(8, 'Tenetur voluptatibus doloribus voluptates in.', '87.69', '2023-11-29 07:55:24', '2023-11-29 07:55:24'),
(9, 'Odit est nam et iusto dolores quisquam.', '77.93', '2023-11-29 07:55:26', '2023-11-29 07:55:26'),
(10, 'Aliquam atque non ullam quo.', '19.92', '2023-11-29 07:55:28', '2023-11-29 07:55:28'),
(11, 'Hic voluptatem labore odio nostrum nisi nostrum et.', '63.73', '2023-11-29 07:55:30', '2023-11-29 07:55:30');

-- --------------------------------------------------------

--
-- Structure de la table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 2, 'product_images/Abricot.png', '2023-11-29 07:55:02', '2023-11-29 07:55:02'),
(2, 2, 'product_images/Avocat.png', '2023-11-29 07:55:04', '2023-11-29 07:55:04'),
(4, 3, 'product_images/figue.png', '2023-11-29 07:55:06', '2023-11-29 07:55:06'),
(7, 4, 'product_images/Cerise.png', '2023-11-29 07:55:09', '2023-11-29 07:55:09'),
(8, 4, 'product_images/Framboise.png', '2023-11-29 07:55:10', '2023-11-29 07:55:10'),
(9, 5, 'product_images/Grenade.png', '2023-11-29 07:55:12', '2023-11-29 07:55:12'),
(10, 5, 'product_images/Kiwi.png', '2023-11-29 07:55:14', '2023-11-29 07:55:14'),
(11, 5, 'product_images/lime.png', '2023-11-29 07:55:15', '2023-11-29 07:55:15'),
(13, 6, 'product_images/Mangue.png', '2023-11-29 07:55:18', '2023-11-29 07:55:18'),
(15, 7, 'product_images/MelonHami.png', '2023-11-29 07:55:20', '2023-11-29 07:55:20'),
(16, 7, 'product_images/Peche.png', '2023-11-29 07:55:21', '2023-11-29 07:55:21'),
(20, 8, 'product_images/RaisinNoir.png', '2023-11-29 07:55:25', '2023-11-29 07:55:25'),
(21, 8, 'product_images/Broccoli.png', '2023-11-29 07:55:26', '2023-11-29 07:55:26'),
(22, 9, 'product_images/Carotte.png', '2023-11-29 07:55:27', '2023-11-29 07:55:27'),
(23, 9, 'product_images/Celeri.png', '2023-11-29 07:55:28', '2023-11-29 07:55:28'),
(25, 10, 'product_images/Chou.png', '2023-11-29 07:55:29', '2023-11-29 07:55:29'),
(26, 10, 'product_images/ChouViolet.png', '2023-11-29 07:55:30', '2023-11-29 07:55:30'),
(27, 11, 'product_images/gombo.png', '2023-11-29 07:55:31', '2023-11-29 07:55:31'),
(28, 11, 'product_images/Haricot.png', '2023-11-29 07:55:32', '2023-11-29 07:55:32'),
(29, 11, 'product_images/Concombre.png', '2023-11-29 07:55:33', '2023-11-29 07:55:33'),
(30, 12, 'product_images/Courgette.png', '2023-11-29 17:15:28', '2023-11-29 17:15:28'),
(33, 15, 'Broccoli.png', '2023-11-29 18:32:13', '2023-11-29 18:32:13'),
(34, 16, 'Fenouil.png', '2023-11-29 19:59:33', '2023-11-29 19:59:33'),
(32, 14, 'pngegg (3).png', '2023-11-29 18:01:38', '2023-11-29 18:01:38'),
(35, 17, 'product_images/Celeri.png', '2023-11-29 20:05:55', '2023-11-29 20:05:55');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(6, 'manager', '2023-11-29 13:06:44', '2023-11-29 13:06:44'),
(5, 'admin', '2023-11-29 13:06:44', '2023-11-29 13:06:44');

-- --------------------------------------------------------

--
-- Structure de la table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  KEY `role_user_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 5, 6, NULL, NULL),
(2, 6, 7, NULL, NULL),
(3, 5, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Oumaaa', 'oumaimasouad08@gmail', NULL, '$2y$12$Kgtjm4Lz5kvORqduuegBI.7NWVl1oHqaiC7zZX0kOzdsRB.Zv25ny', NULL, '2023-11-29 13:52:53', '2023-11-29 13:52:53'),
(7, 'Manager User', 'manager@gmail.com', NULL, '$2y$12$aWMNmbXgkE8SdKAOGStDpeE0HvauPETkIDYQ.p9XHazBJ0QN8P6DK', NULL, '2023-11-29 13:51:52', '2023-11-29 13:51:52'),
(6, 'Admin User', 'admin@gmail.com', NULL, '$2y$12$zqVW2dCu9EQ69XBfQ5hYt.pd0l9WDtPE2lGJTGqHyzr/iXJUDOVK6', NULL, '2023-11-29 13:51:51', '2023-11-29 13:51:51');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
