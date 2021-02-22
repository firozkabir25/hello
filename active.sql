-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 22, 2021 at 02:25 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `active`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `unique_identifier` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `activated` int(1) NOT NULL DEFAULT 1,
  `image` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `name`, `unique_identifier`, `version`, `activated`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Point of Sale', 'pos_system', '1.3', 1, 'pos_banner.jpg', '2021-02-10 05:39:01', '2021-02-15 11:22:37'),
(2, 'club_point', 'club_point', '1.2', 1, 'club_points.png', '2021-02-10 23:32:02', '2021-02-10 23:32:02'),
(3, 'affiliate', 'affiliate_system', '1.4', 1, 'affiliate_banner.jpg', '2021-02-11 02:44:31', '2021-02-11 02:44:31'),
(4, 'Offline Payment', 'offline_payment', '1.3', 1, 'offline_banner.jpg', '2021-02-11 02:50:21', '2021-02-11 02:50:21'),
(5, 'OTP', 'otp_system', '1.4', 1, 'otp_system.jpg', '2021-02-11 02:51:07', '2021-02-11 02:51:07'),
(6, 'refund', 'refund_request', '1.1', 1, 'refund_request.png', '2021-02-11 02:52:16', '2021-02-11 02:52:16'),
(7, 'Seller Subscription System', 'seller_subscription', '1.2', 1, 'seller_subscription.jpg', '2021-02-11 04:01:36', '2021-02-15 12:26:50');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_default` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `country`, `city`, `postal_code`, `phone`, `set_default`, `created_at`, `updated_at`) VALUES
(1, 9, '65 elephant road', 'Bangladesh', 'Dhaka', '1205', '01737257462', 0, '2021-02-11 00:00:08', '2021-02-11 00:00:08');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_configs`
--

CREATE TABLE `affiliate_configs` (
  `id` int(11) NOT NULL,
  `type` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_configs`
--

INSERT INTO `affiliate_configs` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'verification_form', '[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\"}]', '2020-03-09 09:56:21', '2020-03-09 04:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_options`
--

CREATE TABLE `affiliate_options` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf32_unicode_ci DEFAULT NULL,
  `percentage` double NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_options`
--

INSERT INTO `affiliate_options` (`id`, `type`, `details`, `percentage`, `status`, `created_at`, `updated_at`) VALUES
(2, 'user_registration_first_purchase', NULL, 20, 1, '2020-03-03 05:08:37', '2020-03-05 03:56:30'),
(3, 'product_sharing', NULL, 20, 0, '2020-03-08 01:55:03', '2020-03-10 02:12:32'),
(4, 'category_wise_affiliate', NULL, 0, 0, '2020-03-08 01:55:03', '2020-03-10 02:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_payments`
--

CREATE TABLE `affiliate_payments` (
  `id` int(11) NOT NULL,
  `affiliate_user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `affiliate_payments`
--

INSERT INTO `affiliate_payments` (`id`, `affiliate_user_id`, `amount`, `payment_method`, `payment_details`, `created_at`, `updated_at`) VALUES
(2, 1, 20.00, 'Paypal', NULL, '2020-03-10 02:04:30', '2020-03-10 02:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_users`
--

CREATE TABLE `affiliate_users` (
  `id` int(11) NOT NULL,
  `paypal_email` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `bank_information` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `informations` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `balance` double(10,2) NOT NULL DEFAULT 0.00,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_users`
--

INSERT INTO `affiliate_users` (`id`, `paypal_email`, `bank_information`, `user_id`, `informations`, `balance`, `status`, `created_at`, `updated_at`) VALUES
(1, 'demo@gmail.com', '123456', 8, '[{\"type\":\"text\",\"label\":\"Your name\",\"value\":\"Nostrum dicta sint l\"},{\"type\":\"text\",\"label\":\"Email\",\"value\":\"Aut perferendis null\"},{\"type\":\"text\",\"label\":\"Full Address\",\"value\":\"Voluptatem Sit dolo\"},{\"type\":\"text\",\"label\":\"Phone Number\",\"value\":\"Ut ad beatae occaeca\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\",\"value\":\"Porro sint soluta u\"}]', 30.00, 1, '2020-03-09 05:35:07', '2021-02-22 00:21:37');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_withdraw_requests`
--

CREATE TABLE `affiliate_withdraw_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_format` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `name`, `logo`, `currency_id`, `currency_format`, `facebook`, `twitter`, `instagram`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, 'Active eCommerce', 'uploads/logo/matggar.png', 1, 'symbol', 'https://facebook.com', 'https://twitter.com', 'https://instagram.com', 'https://youtube.com', 'https://google.com', '2019-08-04 16:39:15', '2019-08-04 16:39:18');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2020-02-24 05:55:07', '2020-02-24 05:55:07'),
(3, 'First Release', '2021-02-10 23:45:58', '2021-02-10 23:45:58'),
(4, 'Network', '2021-02-10 23:46:15', '2021-02-10 23:46:15');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_translations`
--

CREATE TABLE `attribute_translations` (
  `id` bigint(20) NOT NULL,
  `attribute_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attribute_translations`
--

INSERT INTO `attribute_translations` (`id`, `attribute_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(1, 3, 'First Release', 'bd', '2021-02-10 23:45:58', '2021-02-10 23:45:58'),
(2, 4, 'Network', 'bd', '2021-02-10 23:46:15', '2021-02-10 23:46:15');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `published` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `url`, `position`, `published`, `created_at`, `updated_at`) VALUES
(4, 'uploads/banners/banner.jpg', '#', 1, 1, '2019-03-12 05:58:23', '2019-06-11 04:56:50'),
(5, 'uploads/banners/banner.jpg', '#', 1, 1, '2019-03-12 05:58:41', '2019-03-12 05:58:57'),
(6, 'uploads/banners/banner.jpg', '#', 2, 1, '2019-03-12 05:58:52', '2019-03-12 05:58:57'),
(7, 'uploads/banners/banner.jpg', '#', 2, 1, '2019-05-26 05:16:38', '2019-05-26 05:17:34'),
(8, 'uploads/banners/banner.jpg', '#', 2, 1, '2019-06-11 05:00:06', '2019-06-11 05:00:27'),
(9, 'uploads/banners/banner.jpg', '#', 1, 1, '2019-06-11 05:00:15', '2019-06-11 05:00:29'),
(10, 'uploads/banners/banner.jpg', '#', 1, 0, '2019-06-11 05:00:24', '2019-06-11 05:01:56');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `top` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `top`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Demo brand', 'uploads/brands/brand.jpg', 1, 'Demo-brand-12', 'Demo brand', NULL, '2019-03-12 06:05:56', '2019-08-06 06:52:40'),
(2, 'Demo brand1', 'uploads/brands/brand.jpg', 1, 'Demo-brand1', 'Demo brand1', NULL, '2019-03-12 06:06:13', '2019-08-06 06:07:26'),
(3, 'Apple', NULL, 0, 'Apple-F4i2e', NULL, NULL, '2021-02-10 23:53:50', '2021-02-10 23:53:50');

-- --------------------------------------------------------

--
-- Table structure for table `brand_translations`
--

CREATE TABLE `brand_translations` (
  `id` bigint(20) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brand_translations`
--

INSERT INTO `brand_translations` (`id`, `brand_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(1, 3, 'Apple', 'bd', '2021-02-10 23:53:50', '2021-02-10 23:53:50');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'home_default_currency', '1', '2018-10-16 01:35:52', '2019-01-28 01:26:53'),
(2, 'system_default_currency', '27', '2018-10-16 01:36:58', '2021-02-21 23:07:34'),
(3, 'currency_format', '1', '2018-10-17 03:01:59', '2018-10-17 03:01:59'),
(4, 'symbol_format', '1', '2018-10-17 03:01:59', '2019-01-20 02:10:55'),
(5, 'no_of_decimals', '2', '2018-10-17 03:01:59', '2021-02-21 23:08:11'),
(6, 'product_activation', '1', '2018-10-28 01:38:37', '2019-02-04 01:11:41'),
(7, 'vendor_system_activation', '1', '2018-10-28 07:44:16', '2019-02-04 01:11:38'),
(8, 'show_vendors', '1', '2018-10-28 07:44:47', '2019-02-04 01:11:13'),
(9, 'paypal_payment', '0', '2018-10-28 07:45:16', '2019-01-31 05:09:10'),
(10, 'stripe_payment', '0', '2018-10-28 07:45:47', '2018-11-14 01:51:51'),
(11, 'cash_payment', '1', '2018-10-28 07:46:05', '2019-01-24 03:40:18'),
(12, 'payumoney_payment', '0', '2018-10-28 07:46:27', '2019-03-05 05:41:36'),
(13, 'best_selling', '1', '2018-12-24 08:13:44', '2019-02-14 05:29:13'),
(14, 'paypal_sandbox', '0', '2019-01-16 12:44:18', '2019-01-16 12:44:18'),
(15, 'sslcommerz_sandbox', '1', '2019-01-16 12:44:18', '2019-03-14 00:07:26'),
(16, 'sslcommerz_payment', '0', '2019-01-24 09:39:07', '2019-01-29 06:13:46'),
(17, 'vendor_commission', '20', '2019-01-31 06:18:04', '2019-04-13 06:49:26'),
(18, 'verification_form', '[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Shop name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"License No\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"file\",\"label\":\"Tax Papers\"}]', '2019-02-03 11:36:58', '2019-02-16 06:14:42'),
(19, 'google_analytics', '0', '2019-02-06 12:22:35', '2019-02-06 12:22:35'),
(20, 'facebook_login', '0', '2019-02-07 12:51:59', '2019-02-08 19:41:15'),
(21, 'google_login', '0', '2019-02-07 12:52:10', '2019-02-08 19:41:14'),
(22, 'twitter_login', '0', '2019-02-07 12:52:20', '2019-02-08 02:32:56'),
(23, 'payumoney_payment', '1', '2019-03-05 11:38:17', '2019-03-05 11:38:17'),
(24, 'payumoney_sandbox', '1', '2019-03-05 11:38:17', '2019-03-05 05:39:18'),
(36, 'facebook_chat', '0', '2019-04-15 11:45:04', '2019-04-15 11:45:04'),
(37, 'email_verification', '0', '2019-04-30 07:30:07', '2021-02-10 23:34:17'),
(38, 'wallet_system', '0', '2019-05-19 08:05:44', '2021-02-10 05:33:58'),
(39, 'coupon_system', '0', '2019-06-11 09:46:18', '2019-06-11 09:46:18'),
(40, 'current_version', '3.9', '2019-06-11 09:46:18', '2019-06-11 09:46:18'),
(41, 'instamojo_payment', '0', '2019-07-06 09:58:03', '2019-07-06 09:58:03'),
(42, 'instamojo_sandbox', '1', '2019-07-06 09:58:43', '2019-07-06 09:58:43'),
(43, 'razorpay', '0', '2019-07-06 09:58:43', '2019-07-06 09:58:43'),
(44, 'paystack', '0', '2019-07-21 13:00:38', '2019-07-21 13:00:38'),
(45, 'pickup_point', '0', '2019-10-17 11:50:39', '2019-10-17 11:50:39'),
(46, 'maintenance_mode', '0', '2019-10-17 11:51:04', '2019-10-17 11:51:04'),
(47, 'voguepay', '0', '2019-10-17 11:51:24', '2019-10-17 11:51:24'),
(48, 'voguepay_sandbox', '0', '2019-10-17 11:51:38', '2019-10-17 11:51:38'),
(50, 'category_wise_commission', '0', '2020-01-21 07:22:47', '2020-01-21 07:22:47'),
(51, 'conversation_system', '1', '2020-01-21 07:23:21', '2020-01-21 07:23:21'),
(52, 'guest_checkout_active', '1', '2020-01-22 07:36:38', '2020-01-22 07:36:38'),
(53, 'facebook_pixel', '0', '2020-01-22 11:43:58', '2020-01-22 11:43:58'),
(55, 'classified_product', '0', '2020-05-13 13:01:05', '2020-05-13 13:01:05'),
(56, 'pos_activation_for_seller', '1', '2020-06-11 09:45:02', '2021-02-11 05:18:56'),
(57, 'shipping_type', 'product_wise_shipping', '2020-07-01 13:49:56', '2020-07-01 13:49:56'),
(58, 'flat_rate_shipping_cost', '0', '2020-07-01 13:49:56', '2020-07-01 13:49:56'),
(59, 'shipping_cost_admin', '0', '2020-07-01 13:49:56', '2020-07-01 13:49:56'),
(60, 'payhere_sandbox', '0', '2020-07-30 18:23:53', '2020-07-30 18:23:53'),
(61, 'payhere', '0', '2020-07-30 18:23:53', '2020-07-30 18:23:53'),
(62, 'google_recaptcha', '0', '2020-08-17 07:13:37', '2020-08-17 07:13:37'),
(63, 'ngenius', '0', '2020-09-22 10:58:21', '2020-09-22 10:58:21'),
(64, 'header_logo', '3', '2020-11-16 07:26:36', '2021-02-11 03:21:26'),
(65, 'show_language_switcher', NULL, '2020-11-16 07:26:36', '2021-02-14 19:42:03'),
(66, 'show_currency_switcher', NULL, '2020-11-16 07:26:36', '2021-02-14 19:42:03'),
(67, 'header_stikcy', NULL, '2020-11-16 07:26:36', '2021-02-11 03:21:26'),
(68, 'footer_logo', '4', '2020-11-16 07:26:36', '2021-02-11 03:24:28'),
(69, 'about_us_description', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(70, 'contact_address', '65 Elephant Road, Suit No: 301, Dhaka, Bangladesh.', '2020-11-16 07:26:36', '2021-02-13 00:54:41'),
(71, 'contact_phone', '+8801749 999 777', '2020-11-16 07:26:36', '2021-02-13 02:16:28'),
(72, 'contact_email', 'info@protidin.com.bd', '2020-11-16 07:26:36', '2021-02-11 03:22:38'),
(73, 'widget_one_labels', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(74, 'widget_one_links', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(75, 'widget_one', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(76, 'frontend_copyright_text', '© 2020 Sysable', '2020-11-16 07:26:36', '2021-02-13 02:17:35'),
(77, 'show_social_links', 'on', '2020-11-16 07:26:36', '2021-02-13 02:18:00'),
(78, 'facebook_link', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(79, 'twitter_link', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(80, 'instagram_link', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(81, 'youtube_link', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(82, 'linkedin_link', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(83, 'payment_method_images', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(84, 'home_slider_images', '[\"14\",\"11\",\"12\",\"13\",\"15\"]', '2020-11-16 07:26:36', '2021-02-15 17:02:29'),
(85, 'home_slider_links', '[null,null,null,null,null]', '2020-11-16 07:26:36', '2021-02-15 17:02:17'),
(86, 'home_banner1_images', NULL, '2020-11-16 07:26:36', '2021-02-14 19:55:41'),
(87, 'home_banner1_links', NULL, '2020-11-16 07:26:36', '2021-02-14 19:55:41'),
(88, 'home_banner2_images', '[]', '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(89, 'home_banner2_links', '[]', '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(90, 'home_categories', '[\"4\",\"4\",\"7\"]', '2020-11-16 07:26:36', '2021-02-16 16:53:05'),
(91, 'top10_categories', '[\"4\",\"8\",\"9\",\"10\",\"11\",\"12\",\"14\",\"15\",\"46\"]', '2020-11-16 07:26:36', '2021-02-14 19:46:39'),
(92, 'top10_brands', '[\"1\",\"2\",\"3\"]', '2020-11-16 07:26:36', '2021-02-14 19:50:30'),
(93, 'website_name', 'Protidin', '2020-11-16 07:26:36', '2021-02-11 03:36:14'),
(94, 'site_motto', 'Bangladesher Digital Dokan', '2020-11-16 07:26:36', '2021-02-11 03:36:37'),
(95, 'site_icon', '5', '2020-11-16 07:26:36', '2021-02-11 03:36:14'),
(96, 'base_color', '#e62e04', '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(97, 'base_hov_color', '#e62e04', '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(98, 'meta_title', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(99, 'meta_description', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(100, 'meta_keywords', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(101, 'meta_image', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(102, 'site_name', 'Protidin', '2020-11-16 07:26:36', '2021-02-11 03:06:07'),
(103, 'system_logo_white', '4', '2020-11-16 07:26:36', '2021-02-13 05:03:40'),
(104, 'system_logo_black', '8', '2020-11-16 07:26:36', '2021-02-13 05:09:11'),
(105, 'timezone', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(106, 'admin_login_background', '7', '2020-11-16 07:26:36', '2021-02-13 04:15:26'),
(107, 'iyzico_sandbox', '1', '2020-12-30 16:45:56', '2020-12-30 16:45:56'),
(108, 'iyzico', '1', '2020-12-30 16:45:56', '2020-12-30 16:45:56'),
(109, 'decimal_separator', '1', '2020-12-30 16:45:56', '2020-12-30 16:45:56'),
(110, 'nagad', '1', '2021-01-22 10:30:03', '2021-02-10 23:34:32'),
(111, 'bkash', '1', '2021-01-22 10:30:03', '2021-02-10 23:34:28'),
(112, 'bkash_sandbox', '1', '2021-01-22 10:30:03', '2021-01-22 10:30:03'),
(113, 'club_point_convert_rate', '10', '2019-03-12 05:58:23', '2019-03-12 05:58:23'),
(114, 'refund_request_time', '3', '2019-03-11 23:58:23', '2019-03-11 23:58:23'),
(115, 'best_selling_add', '19', '2021-02-13 05:44:17', '2021-02-16 23:51:30'),
(116, 'best_seller_add', '20', '2021-02-14 00:17:04', '2021-02-16 23:51:30'),
(117, 'featured_products_add', '18', '2021-02-14 00:30:08', '2021-02-16 23:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variation` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(20,2) DEFAULT NULL,
  `tax` double(20,2) DEFAULT NULL,
  `shipping_cost` double(20,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `commision_rate` double(8,2) NOT NULL DEFAULT 0.00,
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(1) NOT NULL DEFAULT 0,
  `top` int(1) NOT NULL DEFAULT 0,
  `digital` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `level`, `name`, `commision_rate`, `banner`, `icon`, `featured`, `top`, `digital`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(4, 0, 0, 'Grocery', 0.00, NULL, NULL, 0, 0, 0, 'Grocery-uiFbL', NULL, NULL, '2021-02-03 22:21:29', '2021-02-03 22:21:29'),
(5, 4, 1, 'Salt & Sugar', 0.00, NULL, NULL, 0, 0, 0, 'Salt--Sugar-YBZwX', NULL, NULL, '2021-02-03 22:30:02', '2021-02-03 22:30:02'),
(6, 4, 1, 'Spices', 0.00, NULL, NULL, 0, 0, 0, 'Spices-nQdrB', NULL, NULL, '2021-02-03 22:31:35', '2021-02-03 22:31:35'),
(7, 0, 0, 'Dairy & Beverages', 0.00, NULL, NULL, 0, 0, 0, 'Dairy--Beverages-kZJub', NULL, NULL, '2021-02-04 21:24:47', '2021-02-04 21:24:47'),
(8, 0, 0, 'Baby & Kids', 0.00, NULL, NULL, 0, 0, 0, 'Baby--Kids-N4bri', NULL, NULL, '2021-02-04 21:25:03', '2021-02-04 21:25:03'),
(9, 0, 0, 'Fruits & Vegetables', 0.00, NULL, NULL, 0, 0, 0, 'Fruits--Vegetables-oPvCA', NULL, NULL, '2021-02-04 21:25:18', '2021-02-04 21:25:18'),
(10, 0, 0, 'Personal Care', 0.00, NULL, NULL, 0, 0, 0, 'Personal-Care-KOztx', NULL, NULL, '2021-02-04 21:25:29', '2021-02-04 21:25:29'),
(11, 0, 0, 'Biscuit, Snacks & Choclate', 0.00, NULL, NULL, 0, 0, 0, 'Biscuit-Snacks--Choclate-8Ts3P', NULL, NULL, '2021-02-04 21:25:38', '2021-02-04 21:25:38'),
(12, 0, 0, 'Special Tag', 0.00, NULL, NULL, 0, 0, 0, 'gift-hfvln', NULL, NULL, '2021-02-04 09:24:04', '2021-02-04 22:24:04'),
(13, 0, 0, 'Home & Kitchen', 0.00, NULL, NULL, 0, 0, 0, 'Home--Kitchen-jCXMI', NULL, NULL, '2021-02-04 21:29:51', '2021-02-04 21:29:51'),
(14, 0, 0, 'Toys, Games & Gift', 0.00, NULL, NULL, 0, 0, 0, 'Toys-Games--Gift-19Kw4', NULL, NULL, '2021-02-04 21:30:05', '2021-02-04 21:30:05'),
(15, 0, 0, 'School & Office Supplies', 0.00, NULL, NULL, 0, 0, 0, 'School--Office-Supplies-wRZJG', NULL, NULL, '2021-02-04 21:30:17', '2021-02-04 21:30:17'),
(16, 4, 1, 'Edible Oil', 0.00, NULL, NULL, 0, 0, 0, 'Edible-Oil-oVyGs', NULL, NULL, '2021-02-04 22:05:06', '2021-02-04 22:05:06'),
(17, 4, 1, 'Pulses', 0.00, NULL, NULL, 0, 0, 0, 'Pulses-FgCFE', NULL, NULL, '2021-02-04 22:05:25', '2021-02-04 22:05:25'),
(18, 4, 1, 'Rice', 0.00, NULL, NULL, 0, 0, 0, 'Rice-oPjzy', NULL, NULL, '2021-02-04 22:06:04', '2021-02-04 22:06:04'),
(19, 4, 1, 'Flour & Grains', 0.00, NULL, NULL, 0, 0, 0, 'Flour--Grains-wsaUG', NULL, NULL, '2021-02-04 22:06:25', '2021-02-04 22:06:25'),
(20, 4, 1, 'Dry Fruits & Nuts', 0.00, NULL, NULL, 0, 0, 0, 'Dry-Fruits--Nuts-4A9lH', NULL, NULL, '2021-02-04 22:06:39', '2021-02-04 22:06:39'),
(21, 7, 1, 'Dairy', 0.00, NULL, NULL, 0, 0, 0, 'Dairy-piXH6', NULL, NULL, '2021-02-04 22:07:43', '2021-02-04 22:07:43'),
(22, 7, 1, 'Beverages', 0.00, NULL, NULL, 0, 0, 0, 'Beverages-CoFfQ', NULL, NULL, '2021-02-04 22:08:06', '2021-02-04 22:08:06'),
(23, 8, 1, 'Food', 0.00, NULL, NULL, 0, 0, 0, 'Food-wzbRK', NULL, NULL, '2021-02-04 22:09:25', '2021-02-04 22:09:25'),
(24, 8, 1, 'Diaper & Wipes', 0.00, NULL, NULL, 0, 0, 0, 'Diaper--Wipes-kAm7J', NULL, NULL, '2021-02-04 22:09:40', '2021-02-04 22:09:40'),
(25, 8, 1, 'Baby Care', 0.00, NULL, NULL, 0, 0, 0, 'Baby-Care-d5Zwd', NULL, NULL, '2021-02-04 22:09:56', '2021-02-04 22:09:56'),
(26, 9, 1, 'Fruits', 0.00, NULL, NULL, 0, 0, 0, 'Fruits-e4AiF', NULL, NULL, '2021-02-04 22:10:24', '2021-02-04 22:10:24'),
(27, 9, 1, 'Vegetables', 0.00, NULL, NULL, 0, 0, 0, 'Vegetables-4Fa0H', NULL, NULL, '2021-02-04 22:10:39', '2021-02-04 22:10:39'),
(28, 10, 1, 'Bath & Body', 0.00, NULL, NULL, 0, 0, 0, 'Bath--Body-MNfbJ', NULL, NULL, '2021-02-04 22:11:20', '2021-02-04 22:11:20'),
(29, 10, 1, 'Health & Wellness', 0.00, NULL, NULL, 0, 0, 0, 'Health--Wellness-5esOi', NULL, NULL, '2021-02-04 22:11:37', '2021-02-04 22:11:37'),
(30, 10, 1, 'Hair Care', 0.00, NULL, NULL, 0, 0, 0, 'Hair-Care-Jj5Lj', NULL, NULL, '2021-02-04 22:11:55', '2021-02-04 22:11:55'),
(31, 10, 1, 'Skin Care', 0.00, NULL, NULL, 0, 0, 0, 'Skin-Care-uuNNo', NULL, NULL, '2021-02-04 22:12:15', '2021-02-04 22:12:15'),
(32, 10, 1, 'Oral Care', 0.00, NULL, NULL, 0, 0, 0, 'Oral-Care-HHBKD', NULL, NULL, '2021-02-04 22:12:34', '2021-02-04 22:12:34'),
(33, 10, 1, 'Face Care', 0.00, NULL, NULL, 0, 0, 0, 'Face-Care-1gf1M', NULL, NULL, '2021-02-04 22:12:52', '2021-02-04 22:12:52'),
(34, 10, 1, 'Mens Grooming', 0.00, NULL, NULL, 0, 0, 0, 'Mens-Grooming-kv7pB', NULL, NULL, '2021-02-04 22:13:09', '2021-02-04 22:13:09'),
(35, 10, 1, 'Female Hygiene', 0.00, NULL, NULL, 0, 0, 0, 'Female-Hygiene-vhWVR', NULL, NULL, '2021-02-04 22:13:33', '2021-02-04 22:13:33'),
(36, 10, 1, 'Fragrances', 0.00, NULL, NULL, 0, 0, 0, 'Fragrances-LFuiV', NULL, NULL, '2021-02-04 22:14:23', '2021-02-04 22:14:23'),
(37, 10, 1, 'Cosmetics', 0.00, NULL, NULL, 0, 0, 0, 'Cosmetics-nkFZR', NULL, NULL, '2021-02-04 22:14:38', '2021-02-04 22:14:38'),
(38, 11, 1, 'Ketchup & Sauce', 0.00, NULL, NULL, 0, 0, 0, 'Ketchup--Sauce-sPjMN', NULL, NULL, '2021-02-04 22:15:08', '2021-02-04 22:15:08'),
(39, 11, 1, 'Pickles', 0.00, NULL, NULL, 0, 0, 0, 'Pickles-WygQD', NULL, NULL, '2021-02-04 22:15:21', '2021-02-04 22:15:21'),
(40, 11, 1, 'Bakery', 0.00, NULL, NULL, 0, 0, 0, 'Bakery-HNCmg', NULL, NULL, '2021-02-04 22:15:38', '2021-02-04 22:15:38'),
(41, 11, 1, 'Biscuit & Cookies', 0.00, NULL, NULL, 0, 0, 0, 'Biscuit--Cookies-olxsZ', NULL, NULL, '2021-02-04 22:15:54', '2021-02-04 22:15:54'),
(42, 11, 1, 'Chips & Crisps', 0.00, NULL, NULL, 0, 0, 0, 'Chips--Crisps-O56Tb', NULL, NULL, '2021-02-04 22:16:46', '2021-02-04 22:16:46'),
(43, 11, 1, 'Sweets', 0.00, NULL, NULL, 0, 0, 0, 'Sweets-EoAi7', NULL, NULL, '2021-02-04 22:17:06', '2021-02-04 22:17:06'),
(44, 11, 1, 'Canned Food', 0.00, NULL, NULL, 0, 0, 0, 'Canned-Food-oQ4Yq', NULL, NULL, '2021-02-04 22:17:29', '2021-02-04 22:17:29'),
(45, 11, 1, 'Noodles & Soup', 0.00, NULL, NULL, 0, 0, 0, 'Noodles--Soup-M9aPC', NULL, NULL, '2021-02-04 22:17:49', '2021-02-04 22:17:49'),
(46, 0, 0, 'Choclate & Candy', 0.00, NULL, NULL, 0, 0, 0, 'Choclate--Candy-EWnBB', NULL, NULL, '2021-02-04 22:19:08', '2021-02-04 22:19:08'),
(47, 46, 1, 'Chewing Gum', 0.00, NULL, NULL, 0, 0, 0, 'Chewing-Gum-chZxb', NULL, NULL, '2021-02-04 22:19:35', '2021-02-04 22:19:35'),
(48, 46, 1, 'Candies', 0.00, NULL, NULL, 0, 0, 0, 'Candies-rRTBY', NULL, NULL, '2021-02-04 22:19:53', '2021-02-04 22:19:53'),
(49, 46, 1, 'Choclate', 0.00, NULL, NULL, 0, 0, 0, 'Choclate-CPE5r', NULL, NULL, '2021-02-04 22:20:16', '2021-02-04 22:20:16'),
(50, 13, 1, 'Kitchen', 0.00, NULL, NULL, 0, 0, 0, 'Kitchen-J151W', NULL, NULL, '2021-02-04 22:21:01', '2021-02-04 22:21:01'),
(51, 13, 1, 'Bed', 0.00, NULL, NULL, 0, 0, 0, 'Bed-aGxdM', NULL, NULL, '2021-02-04 22:21:27', '2021-02-04 22:21:27'),
(52, 13, 1, 'Bathroom', 0.00, NULL, NULL, 0, 0, 0, 'Bathroom-giAqV', NULL, NULL, '2021-02-04 22:21:44', '2021-02-04 22:21:44'),
(53, 13, 1, 'Cleaner', 0.00, NULL, NULL, 0, 0, 0, 'Cleaner-dQOmV', NULL, NULL, '2021-02-04 22:22:01', '2021-02-04 22:22:01'),
(54, 15, 1, 'Notebook', 0.00, NULL, NULL, 0, 0, 0, 'Notebook-G693D', NULL, NULL, '2021-02-04 22:23:00', '2021-02-04 22:23:00'),
(55, 15, 1, 'Drawing Accessories', 0.00, NULL, NULL, 0, 0, 0, 'Drawing-Accessories-C6cox', NULL, NULL, '2021-02-04 22:23:19', '2021-02-04 22:23:19'),
(56, 12, 1, 'Diabetes', 0.00, NULL, NULL, 0, 0, 0, 'Diabetes-0zgwP', NULL, NULL, '2021-02-04 22:24:56', '2021-02-04 22:24:56'),
(57, 5, 2, 'Salt', 0.00, NULL, NULL, 0, 0, 0, 'Salt-Gx6iE', NULL, NULL, '2021-02-04 22:32:21', '2021-02-04 22:32:21'),
(58, 5, 2, 'Sugar', 0.00, NULL, NULL, 0, 0, 0, 'Sugar-QrOKw', NULL, NULL, '2021-02-04 22:32:41', '2021-02-04 22:32:41'),
(59, 5, 2, 'Sugar Free', 0.00, NULL, NULL, 0, 0, 0, 'Sugar-Free-IDclQ', NULL, NULL, '2021-02-04 22:33:12', '2021-02-04 22:33:12'),
(60, 6, 2, 'Whole Spice', 0.00, NULL, NULL, 0, 0, 0, 'Whole-Spice-ED3V5', NULL, NULL, '2021-02-04 22:33:28', '2021-02-04 22:33:28'),
(61, 6, 2, 'Powdered Speice', 0.00, NULL, NULL, 0, 0, 0, 'Powdered-Speice-Ubgrk', NULL, NULL, '2021-02-04 22:33:43', '2021-02-04 22:33:43'),
(62, 6, 2, 'Ready Masala', 0.00, NULL, NULL, 0, 0, 0, 'Ready-Masala-LGMkR', NULL, NULL, '2021-02-04 22:34:01', '2021-02-04 22:34:01'),
(63, 6, 2, 'Cooking Paste', 0.00, NULL, NULL, 0, 0, 0, 'Cooking-Paste-Rpg7s', NULL, NULL, '2021-02-04 22:34:20', '2021-02-04 22:34:20'),
(64, 6, 2, 'Herbs & Seasoning', 0.00, NULL, NULL, 0, 0, 0, 'Herbs--Seasoning-NuVwP', NULL, NULL, '2021-02-04 22:34:40', '2021-02-04 22:34:40'),
(65, 16, 2, 'Mustard Oil', 0.00, NULL, NULL, 0, 0, 0, 'Mustard-Oil-MZ2qb', NULL, NULL, '2021-02-04 22:35:29', '2021-02-04 22:35:29'),
(66, 16, 2, 'Sunflower Oil', 0.00, NULL, NULL, 0, 0, 0, 'Sunflower-Oil-aqcE9', NULL, NULL, '2021-02-04 22:35:45', '2021-02-04 22:35:45'),
(67, 16, 2, 'Soyabean Oil', 0.00, NULL, NULL, 0, 0, 0, 'Soyabean-Oil-dL92h', NULL, NULL, '2021-02-04 22:36:07', '2021-02-04 22:36:07'),
(68, 16, 2, 'Olive Oil', 0.00, NULL, NULL, 0, 0, 0, 'Olive-Oil-1ADHb', NULL, NULL, '2021-02-04 22:36:23', '2021-02-04 22:36:23'),
(69, 16, 2, 'Coconut OIl', 0.00, NULL, NULL, 0, 0, 0, 'Coconut-OIl-GfyqE', NULL, NULL, '2021-02-04 22:36:38', '2021-02-04 22:36:38'),
(70, 16, 2, 'Rice Bran', 0.00, NULL, NULL, 0, 0, 0, 'Rice-Bran-Ykq9O', NULL, NULL, '2021-02-04 22:38:07', '2021-02-04 22:38:07'),
(71, 17, 2, 'Moong', 0.00, NULL, NULL, 0, 0, 0, 'Moong-sVZqj', NULL, NULL, '2021-02-04 22:38:31', '2021-02-04 22:38:31'),
(72, 17, 2, 'Masoor', 0.00, NULL, NULL, 0, 0, 0, 'Masoor-atZTt', NULL, NULL, '2021-02-04 22:38:50', '2021-02-04 22:38:50'),
(73, 17, 2, 'Khesari', 0.00, NULL, NULL, 0, 0, 0, 'Khesari-UOVF0', NULL, NULL, '2021-02-04 22:39:05', '2021-02-04 22:39:05'),
(74, 17, 2, 'Chana', 0.00, NULL, NULL, 0, 0, 0, 'Chana-WcPIt', NULL, NULL, '2021-02-04 22:39:34', '2021-02-04 22:39:34'),
(75, 18, 2, 'Basmoti', 0.00, NULL, NULL, 0, 0, 0, 'Basmoti-UU7zi', NULL, NULL, '2021-02-04 22:39:57', '2021-02-04 22:39:57'),
(76, 18, 2, 'Miniket', 0.00, NULL, NULL, 0, 0, 0, 'Miniket-lrrE9', NULL, NULL, '2021-02-04 22:40:11', '2021-02-04 22:40:11'),
(77, 18, 2, 'Naziarshail', 0.00, NULL, NULL, 0, 0, 0, 'Naziarshail-1oJYD', NULL, NULL, '2021-02-04 22:40:40', '2021-02-04 22:40:40'),
(78, 19, 2, 'Atta', 0.00, NULL, NULL, 0, 0, 0, 'Atta-Jt7dR', NULL, NULL, '2021-02-04 22:41:19', '2021-02-04 22:41:19'),
(79, 19, 2, 'Flour', 0.00, NULL, NULL, 0, 0, 0, 'Flour-WfUzg', NULL, NULL, '2021-02-04 22:41:38', '2021-02-04 22:41:38'),
(80, 19, 2, 'Suji', 0.00, NULL, NULL, 0, 0, 0, 'Suji-PjKwy', NULL, NULL, '2021-02-04 22:41:55', '2021-02-04 22:41:55'),
(81, 20, 2, 'Dates', 0.00, NULL, NULL, 0, 0, 0, 'Dates-SSiau', NULL, NULL, '2021-02-04 22:42:35', '2021-02-04 22:42:35'),
(82, 20, 2, 'Almonds & Cashews', 0.00, NULL, NULL, 0, 0, 0, 'Almonds--Cashews-jlhuw', NULL, NULL, '2021-02-04 22:43:07', '2021-02-04 22:43:07'),
(83, 20, 2, 'Other Dry Fruits', 0.00, NULL, NULL, 0, 0, 0, 'Other-Dry-Fruits-cpClD', NULL, NULL, '2021-02-04 22:43:21', '2021-02-04 22:43:21'),
(84, 20, 2, 'Nuts & Seeds', 0.00, NULL, NULL, 0, 0, 0, 'Nuts--Seeds-Nk40V', NULL, NULL, '2021-02-04 22:43:39', '2021-02-04 22:43:39'),
(85, 21, 2, 'Milk', 0.00, NULL, NULL, 0, 0, 0, 'Milk-jEjuk', NULL, NULL, '2021-02-04 22:46:16', '2021-02-04 22:46:16'),
(86, 21, 2, 'Butter & Cheese', 0.00, NULL, NULL, 0, 0, 0, 'Butter--Cheese-7VRqv', NULL, NULL, '2021-02-04 22:46:38', '2021-02-04 22:46:38'),
(87, 21, 2, 'Dairy Products', 0.00, NULL, NULL, 0, 0, 0, 'Dairy-Products-An0HD', NULL, NULL, '2021-02-04 22:46:56', '2021-02-04 22:46:56'),
(88, 22, 2, 'Tea', 0.00, NULL, NULL, 0, 0, 0, 'Tea-Qehe4', NULL, NULL, '2021-02-04 22:47:25', '2021-02-04 22:47:25'),
(89, 22, 2, 'Coffee', 0.00, NULL, NULL, 0, 0, 0, 'Coffee-6b50p', NULL, NULL, '2021-02-04 22:47:44', '2021-02-04 22:47:44'),
(90, 22, 2, 'Soft Drinks', 0.00, NULL, NULL, 0, 0, 0, 'Soft-Drinks-eTHwl', NULL, NULL, '2021-02-04 23:02:57', '2021-02-04 23:02:57'),
(91, 22, 2, 'Juice', 0.00, NULL, NULL, 0, 0, 0, 'Juice-PH8lE', NULL, NULL, '2021-02-04 23:03:15', '2021-02-04 23:03:15'),
(92, 22, 2, 'Energy Drinks', 0.00, NULL, NULL, 0, 0, 0, 'Energy-Drinks-h71w9', NULL, NULL, '2021-02-04 23:03:36', '2021-02-04 23:03:36'),
(93, 22, 2, 'Health Drinks', 0.00, NULL, NULL, 0, 0, 0, 'Health-Drinks-Mg4ju', NULL, NULL, '2021-02-04 23:03:57', '2021-02-04 23:03:57'),
(94, 23, 2, '0-6 months', 0.00, NULL, NULL, 0, 0, 0, '0-6-months-C0DpU', NULL, NULL, '2021-02-04 23:04:22', '2021-02-04 23:04:22'),
(95, 23, 2, '6-12 months', 0.00, NULL, NULL, 0, 0, 0, '6-12-months-A8MNH', NULL, NULL, '2021-02-04 23:04:35', '2021-02-04 23:04:35'),
(96, 23, 2, '12-18 months', 0.00, NULL, NULL, 0, 0, 0, '12-18-months-sEdI1', NULL, NULL, '2021-02-04 23:04:51', '2021-02-04 23:04:51'),
(97, 23, 2, '18-24 months', 0.00, NULL, NULL, 0, 0, 0, '18-24-months-WxIaZ', NULL, NULL, '2021-02-04 23:05:12', '2021-02-04 23:05:12'),
(98, 23, 2, '24 months+', 0.00, NULL, NULL, 0, 0, 0, '24-months-53t9k', NULL, NULL, '2021-02-04 23:05:35', '2021-02-04 23:05:35'),
(99, 23, 2, 'Organic', 0.00, NULL, NULL, 0, 0, 0, 'Organic-uYilU', NULL, NULL, '2021-02-04 23:05:49', '2021-02-04 23:05:49'),
(100, 24, 2, 'Diaper', 0.00, NULL, NULL, 0, 0, 0, 'Diaper-34okT', NULL, NULL, '2021-02-04 23:06:24', '2021-02-04 23:06:24'),
(101, 24, 2, 'Wipes', 0.00, NULL, NULL, 0, 0, 0, 'Wipes-cil5X', NULL, NULL, '2021-02-04 23:07:08', '2021-02-04 23:07:08'),
(102, 25, 2, 'Hair', 0.00, NULL, NULL, 0, 0, 0, 'Hair-eT2j5', NULL, NULL, '2021-02-04 23:07:33', '2021-02-04 23:07:33'),
(103, 25, 2, 'Body', 0.00, NULL, NULL, 0, 0, 0, 'Body-PAya5', NULL, NULL, '2021-02-04 23:07:53', '2021-02-04 23:07:53'),
(104, 25, 2, 'Oral', 0.00, NULL, NULL, 0, 0, 0, 'Oral-lwIDg', NULL, NULL, '2021-02-04 23:08:15', '2021-02-04 23:08:15'),
(105, 56, 2, 'Sugerfree', 0.00, NULL, NULL, 0, 0, 0, 'Sugerfree-mdNxz', NULL, NULL, '2021-02-04 23:14:02', '2021-02-04 23:14:02'),
(106, 53, 2, 'Floor', 0.00, NULL, NULL, 0, 0, 0, 'Floor-Rb8ub', NULL, NULL, '2021-02-04 23:14:34', '2021-02-04 23:14:34'),
(107, 53, 2, 'Toilet', 0.00, NULL, NULL, 0, 0, 0, 'Toilet-kAiOf', NULL, NULL, '2021-02-04 23:15:33', '2021-02-04 23:15:33'),
(108, 53, 2, 'Fabric', 0.00, NULL, NULL, 0, 0, 0, 'Fabric-p2VZR', NULL, NULL, '2021-02-04 23:19:49', '2021-02-04 23:19:49'),
(109, 53, 2, 'Cleaning Tool', 0.00, NULL, NULL, 0, 0, 0, 'Cleaning-Tool-EMlLe', NULL, NULL, '2021-02-04 23:20:05', '2021-02-04 23:20:05'),
(110, 45, 2, 'Pasta', 0.00, NULL, NULL, 0, 0, 0, 'Pasta-4tYTi', NULL, NULL, '2021-02-04 23:20:40', '2021-02-04 23:20:40'),
(111, 45, 2, 'Noodles', 0.00, NULL, NULL, 0, 0, 0, 'Noodles-qo4Ec', NULL, NULL, '2021-02-04 23:20:58', '2021-02-04 23:20:58'),
(112, 45, 2, 'Soup', 0.00, NULL, NULL, 0, 0, 0, 'Soup-ajG2z', NULL, NULL, '2021-02-04 23:21:19', '2021-02-04 23:21:19'),
(113, 41, 2, 'Cream', 0.00, NULL, NULL, 0, 0, 0, 'Cream-MjjMX', NULL, NULL, '2021-02-04 23:22:50', '2021-02-04 23:22:50'),
(114, 41, 2, 'Glucose', 0.00, NULL, NULL, 0, 0, 0, 'Glucose-Lhg1l', NULL, NULL, '2021-02-04 23:23:06', '2021-02-04 23:23:06'),
(115, 41, 2, 'Salty', 0.00, NULL, NULL, 0, 0, 0, 'Salty-tZwDu', NULL, NULL, '2021-02-04 23:23:38', '2021-02-04 23:23:38'),
(116, 40, 2, 'Cake', 0.00, NULL, NULL, 0, 0, 0, 'Cake-wR9Aq', NULL, NULL, '2021-02-04 23:51:31', '2021-02-04 23:51:31'),
(117, 40, 2, 'Biscuits', 0.00, NULL, NULL, 0, 0, 0, 'Biscuits-tMiqh', NULL, NULL, '2021-02-04 23:51:56', '2021-02-04 23:51:56'),
(118, 39, 2, 'Mango', 0.00, NULL, NULL, 0, 0, 0, 'Mango-kFI2x', NULL, NULL, '2021-02-04 23:52:17', '2021-02-04 23:52:17'),
(119, 39, 2, 'Chilli', 0.00, NULL, NULL, 0, 0, 0, 'Chilli-zOooK', NULL, NULL, '2021-02-04 23:52:44', '2021-02-04 23:52:44'),
(120, 39, 2, 'Mixed', 0.00, NULL, NULL, 0, 0, 0, 'Mixed-CYbTp', NULL, NULL, '2021-02-04 23:53:10', '2021-02-04 23:53:10'),
(121, 39, 2, 'Other', 0.00, NULL, NULL, 0, 0, 0, 'Other-SisP7', NULL, NULL, '2021-02-04 23:53:27', '2021-02-04 23:53:27'),
(122, 38, 2, 'Ketchup', 0.00, NULL, NULL, 0, 0, 0, 'Ketchup-pjNZh', NULL, NULL, '2021-02-04 23:57:59', '2021-02-04 23:57:59'),
(123, 38, 2, 'Sauce', 0.00, NULL, NULL, 0, 0, 0, 'Sauce-NLVb1', NULL, NULL, '2021-02-04 23:59:50', '2021-02-04 23:59:50'),
(124, 38, 2, 'Chatney', 0.00, NULL, NULL, 0, 0, 0, 'Chatney-yQsKb', NULL, NULL, '2021-02-05 00:00:28', '2021-02-05 00:00:28'),
(125, 37, 2, 'Lip Color', 0.00, NULL, NULL, 0, 0, 0, 'Lip-Color-W5GBJ', NULL, NULL, '2021-02-05 00:08:46', '2021-02-05 00:08:46'),
(126, 37, 2, 'Eye Make-up', 0.00, NULL, NULL, 0, 0, 0, 'Eye-Make-up-dtLki', NULL, NULL, '2021-02-05 00:09:05', '2021-02-05 00:09:05'),
(127, 37, 2, 'Tools & Brushes', 0.00, NULL, NULL, 0, 0, 0, 'Tools--Brushes-nWBEL', NULL, NULL, '2021-02-05 00:10:14', '2021-02-05 00:10:14'),
(128, 36, 2, 'Deodorant Men', 0.00, NULL, NULL, 0, 0, 0, 'Deodorant-Men-aFX5v', NULL, NULL, '2021-02-05 00:10:36', '2021-02-05 00:10:36'),
(129, 36, 2, 'Deodorant Female', 0.00, NULL, NULL, 0, 0, 0, 'Deodorant-Female-AAdhB', NULL, NULL, '2021-02-05 00:10:51', '2021-02-05 00:10:51'),
(130, 36, 2, 'Perfumes', 0.00, NULL, NULL, 0, 0, 0, 'Perfumes-Ci6FD', NULL, NULL, '2021-02-05 00:11:10', '2021-02-05 00:11:10'),
(131, 35, 2, 'Sanitary Pads', 0.00, NULL, NULL, 0, 0, 0, 'Sanitary-Pads-qB5qs', NULL, NULL, '2021-02-05 00:12:00', '2021-02-05 00:12:00'),
(132, 35, 2, 'Hair Removal', 0.00, NULL, NULL, 0, 0, 0, 'Hair-Removal-GdkW3', NULL, NULL, '2021-02-05 00:22:41', '2021-02-05 00:22:41'),
(133, 34, 2, 'Razor & Blades', 0.00, NULL, NULL, 0, 0, 0, 'Razor--Blades-B7x2n', NULL, NULL, '2021-02-05 00:23:20', '2021-02-05 00:23:20'),
(134, 34, 2, 'Shaving Cream, Foam & Gel', 0.00, NULL, NULL, 0, 0, 0, 'Shaving-Cream-Foam--Gel-Ub4JH', NULL, NULL, '2021-02-05 00:23:35', '2021-02-05 00:23:35'),
(135, 34, 2, 'After Shave', 0.00, NULL, NULL, 0, 0, 0, 'After-Shave-PZSRU', NULL, NULL, '2021-02-05 00:23:51', '2021-02-05 00:23:51'),
(136, 33, 2, 'Face Wash', 0.00, NULL, NULL, 0, 0, 0, 'Face-Wash-ASPti', NULL, NULL, '2021-02-05 00:24:12', '2021-02-05 00:24:12'),
(137, 33, 2, 'Face Creams', 0.00, NULL, NULL, 0, 0, 0, 'Face-Creams-2RJKe', NULL, NULL, '2021-02-05 00:24:28', '2021-02-05 00:24:28'),
(138, 33, 2, 'Face Mask', 0.00, NULL, NULL, 0, 0, 0, 'Face-Mask-ONxYV', NULL, NULL, '2021-02-05 00:24:46', '2021-02-05 00:24:46'),
(139, 33, 2, 'Lip Color', 0.00, NULL, NULL, 0, 0, 0, 'Lip-Color-JGgVW', NULL, NULL, '2021-02-05 00:25:05', '2021-02-05 00:25:05'),
(140, 33, 2, 'Face Wipes', 0.00, NULL, NULL, 0, 0, 0, 'Face-Wipes-Ay559', NULL, NULL, '2021-02-05 00:25:27', '2021-02-05 00:25:27'),
(141, 32, 2, 'Toothpaste', 0.00, NULL, NULL, 0, 0, 0, 'Toothpaste-W0e8a', NULL, NULL, '2021-02-05 00:26:08', '2021-02-05 00:26:08'),
(142, 32, 2, 'Toothbrush', 0.00, NULL, NULL, 0, 0, 0, 'Toothbrush-ZlteK', NULL, NULL, '2021-02-05 00:26:21', '2021-02-05 00:26:21'),
(143, 32, 2, 'Mouthwash', 0.00, NULL, NULL, 0, 0, 0, 'Mouthwash-R1R0v', NULL, NULL, '2021-02-05 00:26:46', '2021-02-05 00:26:46'),
(144, 31, 2, 'Body Locations', 0.00, NULL, NULL, 0, 0, 0, 'Body-Locations-t0bkP', NULL, NULL, '2021-02-05 00:27:09', '2021-02-05 00:27:09'),
(145, 31, 2, 'Face Creams', 0.00, NULL, NULL, 0, 0, 0, 'Face-Creams-T4KgP', NULL, NULL, '2021-02-05 00:27:25', '2021-02-05 00:27:25'),
(146, 31, 2, 'Talc Powder', 0.00, NULL, NULL, 0, 0, 0, 'Talc-Powder-irY7Z', NULL, NULL, '2021-02-05 00:27:45', '2021-02-05 00:27:45'),
(147, 31, 2, 'Body Oils', 0.00, NULL, NULL, 0, 0, 0, 'Body-Oils-YE8z0', NULL, NULL, '2021-02-05 00:28:02', '2021-02-05 00:28:02'),
(148, 30, 2, 'Shampoo', 0.00, NULL, NULL, 0, 0, 0, 'Shampoo-sKrbU', NULL, NULL, '2021-02-05 00:28:28', '2021-02-05 00:28:28'),
(149, 30, 2, 'Hair Oil', 0.00, NULL, NULL, 0, 0, 0, 'Hair-Oil-WPRkv', NULL, NULL, '2021-02-05 00:28:42', '2021-02-05 00:28:42'),
(150, 30, 2, 'Conditioners', 0.00, NULL, NULL, 0, 0, 0, 'Conditioners-1VISg', NULL, NULL, '2021-02-05 00:29:11', '2021-02-05 00:29:11'),
(151, 30, 2, 'Hair Color', 0.00, NULL, NULL, 0, 0, 0, 'Hair-Color-JlKPn', NULL, NULL, '2021-02-05 00:29:27', '2021-02-05 00:29:27'),
(152, 29, 2, 'Antiseptic', 0.00, NULL, NULL, 0, 0, 0, 'Antiseptic-Wy4Rv', NULL, NULL, '2021-02-05 00:29:56', '2021-02-05 00:29:56'),
(153, 29, 2, 'Hand Washes', 0.00, NULL, NULL, 0, 0, 0, 'Hand-Washes-SF6fK', NULL, NULL, '2021-02-05 00:30:14', '2021-02-05 00:30:14'),
(154, 29, 2, 'Pain Relievers', 0.00, NULL, NULL, 0, 0, 0, 'Pain-Relievers-YvrD8', NULL, NULL, '2021-02-05 00:30:32', '2021-02-05 00:30:32'),
(155, 29, 2, 'Health Supplements', 0.00, NULL, NULL, 0, 0, 0, 'Health-Supplements-jIsqN', NULL, NULL, '2021-02-05 00:30:51', '2021-02-05 00:30:51'),
(156, 28, 2, 'Hand Wash', 0.00, NULL, NULL, 0, 0, 0, 'Hand-Wash-j37nl', NULL, NULL, '2021-02-05 00:31:21', '2021-02-05 00:31:21'),
(157, 28, 2, 'Body Wash & Shower Gel', 0.00, NULL, NULL, 0, 0, 0, 'Body-Wash--Shower-Gel-qqOMl', NULL, NULL, '2021-02-05 00:31:40', '2021-02-05 00:31:40'),
(158, 28, 2, 'Soap', 0.00, NULL, NULL, 0, 0, 0, 'Soap-x35vn', NULL, NULL, '2021-02-05 00:32:02', '2021-02-05 00:32:02');

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(1, 4, 'Face Creams', 'bd', '2021-02-10 23:53:19', '2021-02-10 23:53:19');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cost` double(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `city_translations`
--

CREATE TABLE `city_translations` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `club_points`
--

CREATE TABLE `club_points` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `points` double(18,2) NOT NULL,
  `convert_status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `club_point_details`
--

CREATE TABLE `club_point_details` (
  `id` int(11) NOT NULL,
  `club_point_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `point` double(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(76, 'Cyan', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(144, 'protidin', '#891198', '2021-02-13 10:52:17', '2021-02-13 10:52:17');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `title` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `sender_viewed` int(1) NOT NULL DEFAULT 1,
  `receiver_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 1, NULL, NULL),
(2, 'AL', 'Albania', 1, NULL, NULL),
(3, 'DZ', 'Algeria', 1, NULL, NULL),
(4, 'DS', 'American Samoa', 1, NULL, NULL),
(5, 'AD', 'Andorra', 1, NULL, NULL),
(6, 'AO', 'Angola', 1, NULL, NULL),
(7, 'AI', 'Anguilla', 1, NULL, NULL),
(8, 'AQ', 'Antarctica', 1, NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', 1, NULL, NULL),
(10, 'AR', 'Argentina', 1, NULL, NULL),
(11, 'AM', 'Armenia', 1, NULL, NULL),
(12, 'AW', 'Aruba', 1, NULL, NULL),
(13, 'AU', 'Australia', 1, NULL, NULL),
(14, 'AT', 'Austria', 1, NULL, NULL),
(15, 'AZ', 'Azerbaijan', 1, NULL, NULL),
(16, 'BS', 'Bahamas', 1, NULL, NULL),
(17, 'BH', 'Bahrain', 1, NULL, NULL),
(18, 'BD', 'Bangladesh', 1, NULL, NULL),
(19, 'BB', 'Barbados', 1, NULL, NULL),
(20, 'BY', 'Belarus', 1, NULL, NULL),
(21, 'BE', 'Belgium', 1, NULL, NULL),
(22, 'BZ', 'Belize', 1, NULL, NULL),
(23, 'BJ', 'Benin', 1, NULL, NULL),
(24, 'BM', 'Bermuda', 1, NULL, NULL),
(25, 'BT', 'Bhutan', 1, NULL, NULL),
(26, 'BO', 'Bolivia', 1, NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', 1, NULL, NULL),
(28, 'BW', 'Botswana', 1, NULL, NULL),
(29, 'BV', 'Bouvet Island', 1, NULL, NULL),
(30, 'BR', 'Brazil', 1, NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', 1, NULL, NULL),
(32, 'BN', 'Brunei Darussalam', 1, NULL, NULL),
(33, 'BG', 'Bulgaria', 1, NULL, NULL),
(34, 'BF', 'Burkina Faso', 1, NULL, NULL),
(35, 'BI', 'Burundi', 1, NULL, NULL),
(36, 'KH', 'Cambodia', 1, NULL, NULL),
(37, 'CM', 'Cameroon', 1, NULL, NULL),
(38, 'CA', 'Canada', 1, NULL, NULL),
(39, 'CV', 'Cape Verde', 1, NULL, NULL),
(40, 'KY', 'Cayman Islands', 1, NULL, NULL),
(41, 'CF', 'Central African Republic', 1, NULL, NULL),
(42, 'TD', 'Chad', 1, NULL, NULL),
(43, 'CL', 'Chile', 1, NULL, NULL),
(44, 'CN', 'China', 1, NULL, NULL),
(45, 'CX', 'Christmas Island', 1, NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', 1, NULL, NULL),
(47, 'CO', 'Colombia', 1, NULL, NULL),
(48, 'KM', 'Comoros', 1, NULL, NULL),
(49, 'CG', 'Congo', 1, NULL, NULL),
(50, 'CK', 'Cook Islands', 1, NULL, NULL),
(51, 'CR', 'Costa Rica', 1, NULL, NULL),
(52, 'HR', 'Croatia (Hrvatska)', 1, NULL, NULL),
(53, 'CU', 'Cuba', 1, NULL, NULL),
(54, 'CY', 'Cyprus', 1, NULL, NULL),
(55, 'CZ', 'Czech Republic', 1, NULL, NULL),
(56, 'DK', 'Denmark', 1, NULL, NULL),
(57, 'DJ', 'Djibouti', 1, NULL, NULL),
(58, 'DM', 'Dominica', 1, NULL, NULL),
(59, 'DO', 'Dominican Republic', 1, NULL, NULL),
(60, 'TP', 'East Timor', 1, NULL, NULL),
(61, 'EC', 'Ecuador', 1, NULL, NULL),
(62, 'EG', 'Egypt', 1, NULL, NULL),
(63, 'SV', 'El Salvador', 1, NULL, NULL),
(64, 'GQ', 'Equatorial Guinea', 1, NULL, NULL),
(65, 'ER', 'Eritrea', 1, NULL, NULL),
(66, 'EE', 'Estonia', 1, NULL, NULL),
(67, 'ET', 'Ethiopia', 1, NULL, NULL),
(68, 'FK', 'Falkland Islands (Malvinas)', 1, NULL, NULL),
(69, 'FO', 'Faroe Islands', 1, NULL, NULL),
(70, 'FJ', 'Fiji', 1, NULL, NULL),
(71, 'FI', 'Finland', 1, NULL, NULL),
(72, 'FR', 'France', 1, NULL, NULL),
(73, 'FX', 'France, Metropolitan', 1, NULL, NULL),
(74, 'GF', 'French Guiana', 1, NULL, NULL),
(75, 'PF', 'French Polynesia', 1, NULL, NULL),
(76, 'TF', 'French Southern Territories', 1, NULL, NULL),
(77, 'GA', 'Gabon', 1, NULL, NULL),
(78, 'GM', 'Gambia', 1, NULL, NULL),
(79, 'GE', 'Georgia', 1, NULL, NULL),
(80, 'DE', 'Germany', 1, NULL, NULL),
(81, 'GH', 'Ghana', 1, NULL, NULL),
(82, 'GI', 'Gibraltar', 1, NULL, NULL),
(83, 'GK', 'Guernsey', 1, NULL, NULL),
(84, 'GR', 'Greece', 1, NULL, NULL),
(85, 'GL', 'Greenland', 1, NULL, NULL),
(86, 'GD', 'Grenada', 1, NULL, NULL),
(87, 'GP', 'Guadeloupe', 1, NULL, NULL),
(88, 'GU', 'Guam', 1, NULL, NULL),
(89, 'GT', 'Guatemala', 1, NULL, NULL),
(90, 'GN', 'Guinea', 1, NULL, NULL),
(91, 'GW', 'Guinea-Bissau', 1, NULL, NULL),
(92, 'GY', 'Guyana', 1, NULL, NULL),
(93, 'HT', 'Haiti', 1, NULL, NULL),
(94, 'HM', 'Heard and Mc Donald Islands', 1, NULL, NULL),
(95, 'HN', 'Honduras', 1, NULL, NULL),
(96, 'HK', 'Hong Kong', 1, NULL, NULL),
(97, 'HU', 'Hungary', 1, NULL, NULL),
(98, 'IS', 'Iceland', 1, NULL, NULL),
(99, 'IN', 'India', 1, NULL, NULL),
(100, 'IM', 'Isle of Man', 1, NULL, NULL),
(101, 'ID', 'Indonesia', 1, NULL, NULL),
(102, 'IR', 'Iran (Islamic Republic of)', 1, NULL, NULL),
(103, 'IQ', 'Iraq', 1, NULL, NULL),
(104, 'IE', 'Ireland', 1, NULL, NULL),
(105, 'IL', 'Israel', 1, NULL, NULL),
(106, 'IT', 'Italy', 1, NULL, NULL),
(107, 'CI', 'Ivory Coast', 1, NULL, NULL),
(108, 'JE', 'Jersey', 1, NULL, NULL),
(109, 'JM', 'Jamaica', 1, NULL, NULL),
(110, 'JP', 'Japan', 1, NULL, NULL),
(111, 'JO', 'Jordan', 1, NULL, NULL),
(112, 'KZ', 'Kazakhstan', 1, NULL, NULL),
(113, 'KE', 'Kenya', 1, NULL, NULL),
(114, 'KI', 'Kiribati', 1, NULL, NULL),
(115, 'KP', 'Korea, Democratic People\'s Republic of', 1, NULL, NULL),
(116, 'KR', 'Korea, Republic of', 1, NULL, NULL),
(117, 'XK', 'Kosovo', 1, NULL, NULL),
(118, 'KW', 'Kuwait', 1, NULL, NULL),
(119, 'KG', 'Kyrgyzstan', 1, NULL, NULL),
(120, 'LA', 'Lao People\'s Democratic Republic', 1, NULL, NULL),
(121, 'LV', 'Latvia', 1, NULL, NULL),
(122, 'LB', 'Lebanon', 1, NULL, NULL),
(123, 'LS', 'Lesotho', 1, NULL, NULL),
(124, 'LR', 'Liberia', 1, NULL, NULL),
(125, 'LY', 'Libyan Arab Jamahiriya', 1, NULL, NULL),
(126, 'LI', 'Liechtenstein', 1, NULL, NULL),
(127, 'LT', 'Lithuania', 1, NULL, NULL),
(128, 'LU', 'Luxembourg', 1, NULL, NULL),
(129, 'MO', 'Macau', 1, NULL, NULL),
(130, 'MK', 'Macedonia', 1, NULL, NULL),
(131, 'MG', 'Madagascar', 1, NULL, NULL),
(132, 'MW', 'Malawi', 1, NULL, NULL),
(133, 'MY', 'Malaysia', 1, NULL, NULL),
(134, 'MV', 'Maldives', 1, NULL, NULL),
(135, 'ML', 'Mali', 1, NULL, NULL),
(136, 'MT', 'Malta', 1, NULL, NULL),
(137, 'MH', 'Marshall Islands', 1, NULL, NULL),
(138, 'MQ', 'Martinique', 1, NULL, NULL),
(139, 'MR', 'Mauritania', 1, NULL, NULL),
(140, 'MU', 'Mauritius', 1, NULL, NULL),
(141, 'TY', 'Mayotte', 1, NULL, NULL),
(142, 'MX', 'Mexico', 1, NULL, NULL),
(143, 'FM', 'Micronesia, Federated States of', 1, NULL, NULL),
(144, 'MD', 'Moldova, Republic of', 1, NULL, NULL),
(145, 'MC', 'Monaco', 1, NULL, NULL),
(146, 'MN', 'Mongolia', 1, NULL, NULL),
(147, 'ME', 'Montenegro', 1, NULL, NULL),
(148, 'MS', 'Montserrat', 1, NULL, NULL),
(149, 'MA', 'Morocco', 1, NULL, NULL),
(150, 'MZ', 'Mozambique', 1, NULL, NULL),
(151, 'MM', 'Myanmar', 1, NULL, NULL),
(152, 'NA', 'Namibia', 1, NULL, NULL),
(153, 'NR', 'Nauru', 1, NULL, NULL),
(154, 'NP', 'Nepal', 1, NULL, NULL),
(155, 'NL', 'Netherlands', 1, NULL, NULL),
(156, 'AN', 'Netherlands Antilles', 1, NULL, NULL),
(157, 'NC', 'New Caledonia', 1, NULL, NULL),
(158, 'NZ', 'New Zealand', 1, NULL, NULL),
(159, 'NI', 'Nicaragua', 1, NULL, NULL),
(160, 'NE', 'Niger', 1, NULL, NULL),
(161, 'NG', 'Nigeria', 1, NULL, NULL),
(162, 'NU', 'Niue', 1, NULL, NULL),
(163, 'NF', 'Norfolk Island', 1, NULL, NULL),
(164, 'MP', 'Northern Mariana Islands', 1, NULL, NULL),
(165, 'NO', 'Norway', 1, NULL, NULL),
(166, 'OM', 'Oman', 1, NULL, NULL),
(167, 'PK', 'Pakistan', 1, NULL, NULL),
(168, 'PW', 'Palau', 1, NULL, NULL),
(169, 'PS', 'Palestine', 1, NULL, NULL),
(170, 'PA', 'Panama', 1, NULL, NULL),
(171, 'PG', 'Papua New Guinea', 1, NULL, NULL),
(172, 'PY', 'Paraguay', 1, NULL, NULL),
(173, 'PE', 'Peru', 1, NULL, NULL),
(174, 'PH', 'Philippines', 1, NULL, NULL),
(175, 'PN', 'Pitcairn', 1, NULL, NULL),
(176, 'PL', 'Poland', 1, NULL, NULL),
(177, 'PT', 'Portugal', 1, NULL, NULL),
(178, 'PR', 'Puerto Rico', 1, NULL, NULL),
(179, 'QA', 'Qatar', 1, NULL, NULL),
(180, 'RE', 'Reunion', 1, NULL, NULL),
(181, 'RO', 'Romania', 1, NULL, NULL),
(182, 'RU', 'Russian Federation', 1, NULL, NULL),
(183, 'RW', 'Rwanda', 1, NULL, NULL),
(184, 'KN', 'Saint Kitts and Nevis', 1, NULL, NULL),
(185, 'LC', 'Saint Lucia', 1, NULL, NULL),
(186, 'VC', 'Saint Vincent and the Grenadines', 1, NULL, NULL),
(187, 'WS', 'Samoa', 1, NULL, NULL),
(188, 'SM', 'San Marino', 1, NULL, NULL),
(189, 'ST', 'Sao Tome and Principe', 1, NULL, NULL),
(190, 'SA', 'Saudi Arabia', 1, NULL, NULL),
(191, 'SN', 'Senegal', 1, NULL, NULL),
(192, 'RS', 'Serbia', 1, NULL, NULL),
(193, 'SC', 'Seychelles', 1, NULL, NULL),
(194, 'SL', 'Sierra Leone', 1, NULL, NULL),
(195, 'SG', 'Singapore', 1, NULL, NULL),
(196, 'SK', 'Slovakia', 1, NULL, NULL),
(197, 'SI', 'Slovenia', 1, NULL, NULL),
(198, 'SB', 'Solomon Islands', 1, NULL, NULL),
(199, 'SO', 'Somalia', 1, NULL, NULL),
(200, 'ZA', 'South Africa', 1, NULL, NULL),
(201, 'GS', 'South Georgia South Sandwich Islands', 1, NULL, NULL),
(202, 'SS', 'South Sudan', 1, NULL, NULL),
(203, 'ES', 'Spain', 1, NULL, NULL),
(204, 'LK', 'Sri Lanka', 1, NULL, NULL),
(205, 'SH', 'St. Helena', 1, NULL, NULL),
(206, 'PM', 'St. Pierre and Miquelon', 1, NULL, NULL),
(207, 'SD', 'Sudan', 1, NULL, NULL),
(208, 'SR', 'Suriname', 1, NULL, NULL),
(209, 'SJ', 'Svalbard and Jan Mayen Islands', 1, NULL, NULL),
(210, 'SZ', 'Swaziland', 1, NULL, NULL),
(211, 'SE', 'Sweden', 1, NULL, NULL),
(212, 'CH', 'Switzerland', 1, NULL, NULL),
(213, 'SY', 'Syrian Arab Republic', 1, NULL, NULL),
(214, 'TW', 'Taiwan', 1, NULL, NULL),
(215, 'TJ', 'Tajikistan', 1, NULL, NULL),
(216, 'TZ', 'Tanzania, United Republic of', 1, NULL, NULL),
(217, 'TH', 'Thailand', 1, NULL, NULL),
(218, 'TG', 'Togo', 1, NULL, NULL),
(219, 'TK', 'Tokelau', 1, NULL, NULL),
(220, 'TO', 'Tonga', 1, NULL, NULL),
(221, 'TT', 'Trinidad and Tobago', 1, NULL, NULL),
(222, 'TN', 'Tunisia', 1, NULL, NULL),
(223, 'TR', 'Turkey', 1, NULL, NULL),
(224, 'TM', 'Turkmenistan', 1, NULL, NULL),
(225, 'TC', 'Turks and Caicos Islands', 1, NULL, NULL),
(226, 'TV', 'Tuvalu', 1, NULL, NULL),
(227, 'UG', 'Uganda', 1, NULL, NULL),
(228, 'UA', 'Ukraine', 1, NULL, NULL),
(229, 'AE', 'United Arab Emirates', 1, NULL, NULL),
(230, 'GB', 'United Kingdom', 1, NULL, NULL),
(231, 'US', 'United States', 1, NULL, NULL),
(232, 'UM', 'United States minor outlying islands', 1, NULL, NULL),
(233, 'UY', 'Uruguay', 1, NULL, NULL),
(234, 'UZ', 'Uzbekistan', 1, NULL, NULL),
(235, 'VU', 'Vanuatu', 1, NULL, NULL),
(236, 'VA', 'Vatican City State', 1, NULL, NULL),
(237, 'VE', 'Venezuela', 1, NULL, NULL),
(238, 'VN', 'Vietnam', 1, NULL, NULL),
(239, 'VG', 'Virgin Islands (British)', 1, NULL, NULL),
(240, 'VI', 'Virgin Islands (U.S.)', 1, NULL, NULL),
(241, 'WF', 'Wallis and Futuna Islands', 1, NULL, NULL),
(242, 'EH', 'Western Sahara', 1, NULL, NULL),
(243, 'YE', 'Yemen', 1, NULL, NULL),
(244, 'ZR', 'Zaire', 1, NULL, NULL),
(245, 'ZM', 'Zambia', 1, NULL, NULL),
(246, 'ZW', 'Zimbabwe', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(20,2) NOT NULL,
  `discount_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` int(15) NOT NULL,
  `end_date` int(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double(10,5) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `exchange_rate`, `status`, `code`, `created_at`, `updated_at`) VALUES
(1, 'U.S. Dollar', '$', 1.00000, 1, 'USD', '2018-10-09 11:35:08', '2018-10-17 05:50:52'),
(2, 'Australian Dollar', '$', 1.28000, 1, 'AUD', '2018-10-09 11:35:08', '2019-02-04 05:51:55'),
(5, 'Brazilian Real', 'R$', 3.25000, 1, 'BRL', '2018-10-09 11:35:08', '2018-10-17 05:51:00'),
(6, 'Canadian Dollar', '$', 1.27000, 1, 'CAD', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(7, 'Czech Koruna', 'Kč', 20.65000, 1, 'CZK', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(8, 'Danish Krone', 'kr', 6.05000, 1, 'DKK', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(9, 'Euro', '€', 0.85000, 1, 'EUR', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(10, 'Hong Kong Dollar', '$', 7.83000, 1, 'HKD', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(11, 'Hungarian Forint', 'Ft', 255.24000, 1, 'HUF', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(12, 'Israeli New Sheqel', '₪', 3.48000, 1, 'ILS', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(13, 'Japanese Yen', '¥', 107.12000, 1, 'JPY', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(14, 'Malaysian Ringgit', 'RM', 3.91000, 1, 'MYR', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(15, 'Mexican Peso', '$', 18.72000, 1, 'MXN', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(16, 'Norwegian Krone', 'kr', 7.83000, 1, 'NOK', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(17, 'New Zealand Dollar', '$', 1.38000, 1, 'NZD', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(18, 'Philippine Peso', '₱', 52.26000, 1, 'PHP', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(19, 'Polish Zloty', 'zł', 3.39000, 1, 'PLN', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(20, 'Pound Sterling', '£', 0.72000, 1, 'GBP', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(21, 'Russian Ruble', 'руб', 55.93000, 1, 'RUB', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(22, 'Singapore Dollar', '$', 1.32000, 1, 'SGD', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(23, 'Swedish Krona', 'kr', 8.19000, 1, 'SEK', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(24, 'Swiss Franc', 'CHF', 0.94000, 1, 'CHF', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(26, 'Thai Baht', '฿', 31.39000, 1, 'THB', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(27, 'Taka', '৳', 84.00000, 1, 'BDT', '2018-10-09 11:35:08', '2018-12-02 05:16:13'),
(28, 'Indian Rupee', 'Rs', 68.45000, 1, 'Rupee', '2019-07-07 10:33:46', '2021-02-10 05:36:50');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 8, '2019-08-01 10:35:09', '2019-08-01 10:35:09'),
(5, 11, '2021-02-14 18:57:47', '2021-02-14 18:57:47'),
(6, 12, '2021-02-16 17:05:25', '2021-02-16 17:05:25'),
(7, 13, '2021-02-17 00:22:21', '2021-02-17 00:22:21');

-- --------------------------------------------------------

--
-- Table structure for table `customer_packages`
--

CREATE TABLE `customer_packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(20,2) DEFAULT NULL,
  `product_upload` int(11) DEFAULT NULL,
  `logo` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_package_payments`
--

CREATE TABLE `customer_package_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_package_id` int(11) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `approval` int(1) NOT NULL,
  `offline_payment` int(1) NOT NULL COMMENT '1=offline payment\r\n2=online paymnet',
  `reciept` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_package_translations`
--

CREATE TABLE `customer_package_translations` (
  `id` bigint(20) NOT NULL,
  `customer_package_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_products`
--

CREATE TABLE `customer_products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0,
  `added_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(20,2) DEFAULT 0.00,
  `meta_title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_product_translations`
--

CREATE TABLE `customer_product_translations` (
  `id` bigint(20) NOT NULL,
  `customer_product_id` bigint(20) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_rwallets`
--

CREATE TABLE `customer_rwallets` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_wallet` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` int(11) NOT NULL,
  `customer_wallet` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer_wallets`
--

INSERT INTO `customer_wallets` (`id`, `customer_wallet`, `created_at`, `updated_at`) VALUES
(1, 300, '2021-02-17 14:21:46', '2021-02-18 11:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_settings`
--

CREATE TABLE `customer_wallet_settings` (
  `id` int(11) NOT NULL,
  `min_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fixed` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` int(20) DEFAULT NULL,
  `end_date` int(20) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `featured` int(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` int(11) NOT NULL,
  `flash_deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` double(20,2) DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_translations`
--

CREATE TABLE `flash_deal_translations` (
  `id` bigint(20) NOT NULL,
  `flash_deal_id` bigint(20) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `frontend_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_background` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_sidebar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `frontend_color`, `logo`, `footer_logo`, `admin_logo`, `admin_login_background`, `admin_login_sidebar`, `favicon`, `site_name`, `address`, `description`, `phone`, `email`, `facebook`, `instagram`, `twitter`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, 'default', 'uploads/logo/pfdIuiMeXGkDAIpPEUrvUCbQrOHu484nbGfz77zB.png', NULL, 'uploads/admin_logo/wCgHrz0Q5QoL1yu4vdrNnQIr4uGuNL48CXfcxOuS.png', NULL, NULL, 'uploads/favicon/uHdGidSaRVzvPgDj6JFtntMqzJkwDk9659233jrb.png', 'Active Ecommerce CMS', 'Demo Address', 'Active eCommerce CMS is a Multi vendor system is such a platform to build a border less marketplace.', '1234567890', 'admin@example.com', 'https://www.facebook.com', 'https://www.instagram.com', 'https://www.twitter.com', 'https://www.youtube.com', 'https://www.googleplus.com', '2019-03-13 08:01:06', '2019-03-13 02:01:06');

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subsubcategories` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `category_id`, `subsubcategories`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '[\"1\"]', 1, '2019-03-12 06:38:23', '2019-03-12 06:38:23'),
(2, 2, '[\"10\"]', 1, '2019-03-12 06:44:54', '2019-03-12 06:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rtl` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 0, '2019-01-20 12:13:20', '2019-01-20 12:13:20'),
(3, 'Bangla', 'bd', 0, '2019-02-17 06:35:37', '2019-02-18 06:49:51'),
(4, 'Arabic', 'sa', 1, '2019-04-28 18:34:12', '2019-04-28 18:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manual_payment_methods`
--

CREATE TABLE `manual_payment_methods` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('125ce8289850f80d9fea100325bf892fbd0deba1f87dbfc2ab81fb43d57377ec24ed65f7dc560e46', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-30 04:51:13', '2019-07-30 04:51:13', '2020-07-30 10:51:13'),
('293d2bb534220c070c4e90d25b5509965d23d3ddbc05b1e29fb4899ae09420ff112dbccab1c6f504', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:00:04', '2019-08-04 06:00:04', '2020-08-04 12:00:04'),
('5363e91c7892acdd6417aa9c7d4987d83568e229befbd75be64282dbe8a88147c6c705e06c1fb2bf', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-13 06:44:28', '2019-07-13 06:44:28', '2020-07-13 12:44:28'),
('681b4a4099fac5e12517307b4027b54df94cbaf0cbf6b4bf496534c94f0ccd8a79dd6af9742d076b', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:23:06', '2019-08-04 07:23:06', '2020-08-04 13:23:06'),
('6d229e3559e568df086c706a1056f760abc1370abe74033c773490581a042442154afa1260c4b6f0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:32:12', '2019-08-04 07:32:12', '2020-08-04 13:32:12'),
('6efc0f1fc3843027ea1ea7cd35acf9c74282f0271c31d45a164e7b27025a315d31022efe7bb94aaa', 1, 1, 'Personal Access Token', '[]', 0, '2019-08-08 02:35:26', '2019-08-08 02:35:26', '2020-08-08 08:35:26'),
('7745b763da15a06eaded371330072361b0524c41651cf48bf76fc1b521a475ece78703646e06d3b0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:29:44', '2019-08-04 07:29:44', '2020-08-04 13:29:44'),
('815b625e239934be293cd34479b0f766bbc1da7cc10d464a2944ddce3a0142e943ae48be018ccbd0', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-22 02:07:47', '2019-07-22 02:07:47', '2020-07-22 08:07:47'),
('8921a4c96a6d674ac002e216f98855c69de2568003f9b4136f6e66f4cb9545442fb3e37e91a27cad', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:05:05', '2019-08-04 06:05:05', '2020-08-04 12:05:05'),
('8d8b85720304e2f161a66564cec0ecd50d70e611cc0efbf04e409330086e6009f72a39ce2191f33a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:44:35', '2019-08-04 06:44:35', '2020-08-04 12:44:35'),
('bcaaebdead4c0ef15f3ea6d196fd80749d309e6db8603b235e818cb626a5cea034ff2a55b66e3e1a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:14:32', '2019-08-04 07:14:32', '2020-08-04 13:14:32'),
('c25417a5c728073ca8ba57058ded43d496a9d2619b434d2a004dd490a64478c08bc3e06ffc1be65d', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-30 01:45:31', '2019-07-30 01:45:31', '2020-07-30 07:45:31'),
('c7423d85b2b5bdc5027cb283be57fa22f5943cae43f60b0ed27e6dd198e46f25e3501b3081ed0777', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-05 05:02:59', '2019-08-05 05:02:59', '2020-08-05 11:02:59'),
('e76f19dbd5c2c4060719fb1006ac56116fd86f7838b4bf74e2c0a0ac9696e724df1e517dbdb357f4', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-15 02:53:40', '2019-07-15 02:53:40', '2020-07-15 08:53:40'),
('ed7c269dd6f9a97750a982f62e0de54749be6950e323cdfef892a1ec93f8ddbacf9fe26e6a42180e', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-13 06:36:45', '2019-07-13 06:36:45', '2020-07-13 12:36:45'),
('f6d1475bc17a27e389000d3df4da5c5004ce7610158b0dd414226700c0f6db48914637b4c76e1948', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:22:01', '2019-08-04 07:22:01', '2020-08-04 13:22:01'),
('f85e4e444fc954430170c41779a4238f84cd6fed905f682795cd4d7b6a291ec5204a10ac0480eb30', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-30 06:38:49', '2019-07-30 06:38:49', '2020-07-30 12:38:49'),
('f8bf983a42c543b99128296e4bc7c2d17a52b5b9ef69670c629b93a653c6a4af27be452e0c331f79', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:28:55', '2019-08-04 07:28:55', '2020-08-04 13:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, NULL, 'Laravel Personal Access Client', 'eR2y7WUuem28ugHKppFpmss7jPyOHZsMkQwBo1Jj', 'http://localhost', 1, 0, 0, '2019-07-13 06:17:34', '2019-07-13 06:17:34'),
(2, NULL, 'Laravel Password Grant Client', 'WLW2Ol0GozbaXEnx1NtXoweYPuKEbjWdviaUgw77', 'http://localhost', 0, 1, 0, '2019-07-13 06:17:34', '2019-07-13 06:17:34');

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
(1, 1, '2019-07-13 06:17:34', '2019-07-13 06:17:34');

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

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `shipping_address` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manual_payment` int(1) NOT NULL DEFAULT 0,
  `manual_payment_data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'unpaid',
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` double(20,2) DEFAULT NULL,
  `coupon_discount` double(20,2) NOT NULL DEFAULT 0.00,
  `code` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` int(20) NOT NULL,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `delivery_viewed` int(1) NOT NULL DEFAULT 1,
  `payment_status_viewed` int(1) DEFAULT 1,
  `commission_calculated` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `guest_id`, `shipping_address`, `payment_type`, `manual_payment`, `manual_payment_data`, `payment_status`, `payment_details`, `grand_total`, `coupon_discount`, `code`, `date`, `viewed`, `delivery_viewed`, `payment_status_viewed`, `commission_calculated`, `created_at`, `updated_at`) VALUES
(1, 9, NULL, '{\"name\":\"firoz\",\"email\":\"firoz@sysable.tech\",\"address\":\"65 elephant road\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1205\",\"phone\":\"01737257462\",\"checkout_type\":\"logged\"}', 'bkash', 0, NULL, 'unpaid', NULL, 280.56, 0.00, '20210211-06002967', 1613023229, 1, 0, 0, 0, '2021-02-11 00:00:29', '2021-02-11 04:58:43');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variation` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(20,2) DEFAULT NULL,
  `tax` double(20,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` double(20,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `shipping_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickup_point_id` int(11) DEFAULT NULL,
  `product_referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `seller_id`, `product_id`, `variation`, `price`, `tax`, `shipping_cost`, `quantity`, `payment_status`, `delivery_status`, `shipping_type`, `pickup_point_id`, `product_referral_code`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 1, '', 128.00, 2.56, 150.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-02-11 00:00:29', '2021-02-11 00:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `otp_configurations`
--

CREATE TABLE `otp_configurations` (
  `id` int(11) NOT NULL,
  `type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `otp_configurations`
--

INSERT INTO `otp_configurations` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'nexmo', '1', '2020-03-22 09:19:07', '2020-03-22 09:19:07'),
(2, 'otp_for_order', '1', '2020-03-22 09:19:07', '2020-03-22 09:19:07'),
(3, 'otp_for_delivery_status', '1', '2020-03-22 09:19:37', '2020-03-22 09:19:37'),
(4, 'otp_for_paid_status', '0', '2020-03-22 09:19:37', '2020-03-22 09:19:37'),
(5, 'twillo', '0', '2020-03-22 09:54:03', '2020-03-22 03:54:20'),
(6, 'ssl_wireless', '0', '2020-03-22 09:54:03', '2020-03-22 03:54:20'),
(7, 'fast2sms', '0', '2020-03-22 09:54:03', '2020-03-22 03:54:20'),
(8, 'mimo', '0', '2020-12-27 09:54:03', '2020-12-28 03:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `type`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `keywords`, `meta_image`, `created_at`, `updated_at`) VALUES
(1, 'home_page', 'Home Page', 'home', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:13:20', '2020-11-04 10:13:20'),
(2, 'seller_policy_page', 'Seller Policy Pages', 'sellerpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:14:41', '2020-11-04 12:19:30'),
(3, 'return_policy_page', 'Return Policy Page', 'returnpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:14:41', '2020-11-04 10:14:41'),
(4, 'support_policy_page', 'Support Policy Page', 'supportpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:14:59', '2020-11-04 10:14:59'),
(5, 'terms_conditions_page', 'Term Conditions Page', 'terms', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:15:29', '2020-11-04 10:15:29'),
(6, 'privacy_policy_page', 'Privacy Policy Page', 'privacypolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:15:55', '2020-11-04 10:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint(20) NOT NULL,
  `page_id` bigint(20) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_points`
--

CREATE TABLE `pickup_points` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `pick_up_status` int(1) DEFAULT NULL,
  `cash_on_pickup_status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_point_translations`
--

CREATE TABLE `pickup_point_translations` (
  `id` bigint(20) NOT NULL,
  `pickup_point_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` int(11) NOT NULL,
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES
(1, 'support_policy', NULL, '2019-10-29 12:54:45', '2019-01-22 05:13:15'),
(2, 'return_policy', NULL, '2019-10-29 12:54:47', '2019-01-24 05:40:11'),
(4, 'seller_policy', NULL, '2019-10-29 12:54:49', '2019-02-04 17:50:15'),
(5, 'terms', NULL, '2019-10-29 12:54:51', '2019-10-28 18:00:00'),
(6, 'privacy_policy', NULL, '2019-10-29 12:54:54', '2019-10-28 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `added_by` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(20,2) NOT NULL,
  `purchase_price` double(20,2) NOT NULL,
  `variant_product` int(1) NOT NULL DEFAULT 0,
  `attributes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `choice_options` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `colors` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `todays_deal` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 1,
  `featured` int(11) NOT NULL DEFAULT 0,
  `seller_featured` int(11) NOT NULL DEFAULT 0,
  `current_stock` int(10) NOT NULL DEFAULT 0,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `discount` double(20,2) DEFAULT NULL,
  `discount_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax` double(20,2) DEFAULT NULL,
  `tax_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_type` varchar(20) CHARACTER SET latin1 DEFAULT 'flat_rate',
  `shipping_cost` double(20,2) DEFAULT 0.00,
  `num_of_sale` int(11) NOT NULL DEFAULT 0,
  `meta_title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `refundable` int(1) NOT NULL DEFAULT 0,
  `earn_point` double(8,2) NOT NULL DEFAULT 0.00,
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `digital` int(1) NOT NULL DEFAULT 0,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `seller_featured`, `current_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `refundable`, `earn_point`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(2, 'Apple iPhone 12 Pro Max', 'admin', 9, 4, NULL, NULL, NULL, '2', '2', 'youtube', NULL, 'asdasd', '<p>asdsa dasd asd&nbsp;</p>', 128.00, 125.00, 1, '[\"1\",\"3\",\"4\"]', '[{\"attribute_id\":\"1\",\"values\":[\"6.7 inches\"]},{\"attribute_id\":\"3\",\"values\":[\"30 November 2020\"]},{\"attribute_id\":\"4\",\"values\":[\"2G\",\"3G\",\"4G\",\"5G\"]}]', '[]', NULL, 0, 1, 1, 0, 0, '228 grams', 1, 0.00, 'amount', 2.00, 'percent', 'flat_rate', 150.00, 1, 'Apple iPhone 12 Pro Max', '<p>asdsa dasd asd&nbsp;</p>', NULL, NULL, 'apple-iphone-12-pro-max-G8CS0', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2021-02-13 02:41:08', '2021-02-14 19:37:37'),
(3, 'Apple iPhone 12 Pro Max', 'admin', 9, 4, NULL, NULL, NULL, '2', '2', 'youtube', NULL, 'asdasd', '<p>asdsa dasd asd&nbsp;</p>', 128.00, 125.00, 1, '[\"1\",\"3\",\"4\"]', '[{\"attribute_id\":\"1\",\"values\":[\"6.7 inches\"]},{\"attribute_id\":\"3\",\"values\":[\"30 November 2020\"]},{\"attribute_id\":\"4\",\"values\":[\"2G\",\"3G\",\"4G\",\"5G\"]}]', '[]', NULL, 0, 1, 1, 0, 0, '228 grams', 1, 0.00, 'amount', 2.00, 'percent', 'flat_rate', 150.00, 1, 'Apple iPhone 12 Pro Max', '<p>asdsa dasd asd&nbsp;</p>', NULL, NULL, 'apple-iphone-12-pro-max-w2bB2', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2021-02-13 02:41:11', '2021-02-14 19:37:35'),
(4, 'Apple iPhone 12 Pro Max', 'admin', 9, 4, NULL, NULL, NULL, '2', '2', 'youtube', NULL, 'asdasd', '<p>asdsa dasd asd&nbsp;</p>', 128.00, 125.00, 1, '[\"1\",\"3\",\"4\"]', '[{\"attribute_id\":\"1\",\"values\":[\"6.7 inches\"]},{\"attribute_id\":\"3\",\"values\":[\"30 November 2020\"]},{\"attribute_id\":\"4\",\"values\":[\"2G\",\"3G\",\"4G\",\"5G\"]}]', '[]', NULL, 0, 1, 1, 0, 0, '228 grams', 1, 0.00, 'amount', 2.00, 'percent', 'flat_rate', 150.00, 1, 'Apple iPhone 12 Pro Max', '<p>asdsa dasd asd&nbsp;</p>', NULL, NULL, 'apple-iphone-12-pro-max-LAuBZ', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2021-02-13 02:41:12', '2021-02-14 19:37:34'),
(5, 'Apple iPhone 12 Pro Max', 'admin', 9, 4, NULL, NULL, NULL, '2', '2', 'youtube', NULL, 'asdasd', '<p>asdsa dasd asd&nbsp;</p>', 128.00, 125.00, 1, '[\"1\",\"3\",\"4\"]', '[{\"attribute_id\":\"1\",\"values\":[\"6.7 inches\"]},{\"attribute_id\":\"3\",\"values\":[\"30 November 2020\"]},{\"attribute_id\":\"4\",\"values\":[\"2G\",\"3G\",\"4G\",\"5G\"]}]', '[]', NULL, 0, 1, 1, 0, 0, '228 grams', 1, 0.00, 'amount', 2.00, 'percent', 'flat_rate', 150.00, 1, 'Apple iPhone 12 Pro Max', '<p>asdsa dasd asd&nbsp;</p>', NULL, NULL, 'apple-iphone-12-pro-max-bSfIZ', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2021-02-13 02:41:14', '2021-02-14 19:37:33'),
(6, 'Apple iPhone 12 Pro Max', 'admin', 9, 4, NULL, NULL, NULL, '2', '2', 'youtube', NULL, 'asdasd', '<p>asdsa dasd asd&nbsp;</p>', 128.00, 125.00, 1, '[\"1\",\"3\",\"4\"]', '[{\"attribute_id\":\"1\",\"values\":[\"6.7 inches\"]},{\"attribute_id\":\"3\",\"values\":[\"30 November 2020\"]},{\"attribute_id\":\"4\",\"values\":[\"2G\",\"3G\",\"4G\",\"5G\"]}]', '[]', NULL, 0, 1, 1, 0, 0, '228 grams', 1, 0.00, 'amount', 2.00, 'percent', 'flat_rate', 150.00, 1, 'Apple iPhone 12 Pro Max', '<p>asdsa dasd asd&nbsp;</p>', NULL, NULL, 'apple-iphone-12-pro-max-spETP', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2021-02-13 02:41:16', '2021-02-14 19:37:32'),
(7, 'Apple iPhone 12 Pro Max', 'admin', 9, 4, NULL, NULL, NULL, '2', '2', 'youtube', NULL, 'asdasd', '<p>asdsa dasd asd&nbsp;</p>', 128.00, 125.00, 1, '[\"1\",\"3\",\"4\"]', '[{\"attribute_id\":\"1\",\"values\":[\"6.7 inches\"]},{\"attribute_id\":\"3\",\"values\":[\"30 November 2020\"]},{\"attribute_id\":\"4\",\"values\":[\"2G\",\"3G\",\"4G\",\"5G\"]}]', '[]', NULL, 0, 1, 1, 0, 0, '228 grams', 1, 0.00, 'amount', 2.00, 'percent', 'flat_rate', 150.00, 1, 'Apple iPhone 12 Pro Max', '<p>asdsa dasd asd&nbsp;</p>', NULL, NULL, 'apple-iphone-12-pro-max-U2e99', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2021-02-13 02:41:18', '2021-02-14 19:37:31'),
(8, 'Samsung Galaxy A21s', 'admin', 9, 7, NULL, NULL, 1, '16', '16', 'youtube', NULL, 'asdsadasd', NULL, 16999.00, 16999.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 0, 10, '225gm', 1, 0.00, 'amount', 2.00, 'amount', 'flat_rate', 0.00, 0, 'Samsung Galaxy A21s', NULL, NULL, NULL, 'Samsung-Galaxy-A21s-6FNHW', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2021-02-16 16:46:46', '2021-02-16 16:46:54'),
(9, 'Samsung Galaxy A21s', 'admin', 9, 7, NULL, NULL, 1, '16', '16', 'youtube', NULL, 'asdsadasd', NULL, 16999.00, 16999.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 0, 10, '225gm', 1, 0.00, 'amount', 2.00, 'amount', 'flat_rate', 0.00, 0, 'Samsung Galaxy A21s', NULL, NULL, NULL, 'Samsung-Galaxy-A21s-iBbXC', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2021-02-16 16:46:55', '2021-02-16 16:46:55'),
(10, 'Samsung Galaxy A21s', 'admin', 9, 7, NULL, NULL, 1, '16', '16', 'youtube', NULL, 'asdsadasd', NULL, 16999.00, 16999.00, 0, '[]', '[]', '[]', NULL, 1, 1, 0, 0, 10, '225gm', 1, 0.00, 'amount', 2.00, 'amount', 'flat_rate', 0.00, 0, 'Samsung Galaxy A21s', NULL, NULL, NULL, 'Samsung-Galaxy-A21s-LJxt9', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2021-02-16 16:46:56', '2021-02-16 16:47:15'),
(11, 'Samsung Galaxy A21s', 'admin', 9, 7, NULL, NULL, 1, '16', '16', 'youtube', NULL, 'asdsadasd', NULL, 16999.00, 16999.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 0, 10, '225gm', 1, 0.00, 'amount', 2.00, 'amount', 'flat_rate', 0.00, 0, 'Samsung Galaxy A21s', NULL, NULL, NULL, 'Samsung-Galaxy-A21s-CN3Zy', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2021-02-16 16:46:56', '2021-02-16 16:46:56'),
(12, 'Samsung Galaxy A21s', 'admin', 9, 7, NULL, NULL, 1, '16', '16', 'youtube', NULL, 'asdsadasd', NULL, 16999.00, 16999.00, 0, '[]', '[]', '[]', NULL, 1, 1, 0, 0, 10, '225gm', 1, 0.00, 'amount', 2.00, 'amount', 'flat_rate', 0.00, 0, 'Samsung Galaxy A21s', NULL, NULL, NULL, 'Samsung-Galaxy-A21s-6kMCd', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2021-02-16 16:46:58', '2021-02-16 16:47:18'),
(13, 'Samsung Galaxy A21s', 'admin', 9, 7, NULL, NULL, 1, '16', '16', 'youtube', NULL, 'asdsadasd', NULL, 16999.00, 16999.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 0, 10, '225gm', 1, 0.00, 'amount', 2.00, 'amount', 'flat_rate', 0.00, 0, 'Samsung Galaxy A21s', NULL, NULL, NULL, 'Samsung-Galaxy-A21s-K5WGY', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2021-02-16 16:46:58', '2021-02-16 16:47:17'),
(14, 'Samsung Galaxy A21s', 'admin', 9, 7, NULL, NULL, 1, '17', '17', 'youtube', NULL, 'asdsadasd', NULL, 16999.00, 16999.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 0, 10, '225gm', 1, 0.00, 'amount', 2.00, 'amount', 'flat_rate', 0.00, 0, 'Samsung Galaxy A21s', NULL, NULL, NULL, 'samsung-galaxy-a21s-hbcgt', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2021-02-16 16:46:59', '2021-02-16 23:44:28');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `variant`, `sku`, `price`, `qty`, `created_at`, `updated_at`) VALUES
(2, 1, '6.7inches-30November2020-2G', '6.7inches-30November2020-2G', 128.00, 10, '2021-02-11 00:16:53', '2021-02-11 00:16:53'),
(3, 1, '6.7inches-30November2020-3G', '6.7inches-30November2020-3G', 128.00, 10, '2021-02-11 00:16:53', '2021-02-11 00:16:53'),
(4, 1, '6.7inches-30November2020-4G', '6.7inches-30November2020-4G', 128.00, 10, '2021-02-11 00:16:53', '2021-02-11 00:16:53'),
(5, 1, '6.7inches-30November2020-5G', '6.7inches-30November2020-5G', 128.00, 10, '2021-02-11 00:16:53', '2021-02-11 00:16:53'),
(6, 8, NULL, NULL, 16999.00, 10, '2021-02-16 16:46:46', '2021-02-16 16:46:46'),
(7, 14, NULL, NULL, 16999.00, 10, '2021-02-16 23:44:28', '2021-02-16 23:44:28');

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_translations`
--

INSERT INTO `product_translations` (`id`, `product_id`, `name`, `unit`, `description`, `lang`, `created_at`, `updated_at`) VALUES
(1, 8, 'Samsung Galaxy A21s', '225gm', NULL, 'en', '2021-02-16 16:46:46', '2021-02-16 16:46:46'),
(2, 14, 'Samsung Galaxy A21s', '225gm', NULL, 'en', '2021-02-16 23:44:28', '2021-02-16 23:44:28');

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `seller_approval` int(1) NOT NULL DEFAULT 0,
  `admin_approval` int(1) NOT NULL DEFAULT 0,
  `refund_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `reason` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_seen` int(11) NOT NULL,
  `refund_status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '[\"1\",\"2\",\"4\"]', '2018-10-10 04:39:47', '2018-10-10 04:51:37'),
(2, 'Accountant', '[\"2\",\"3\"]', '2018-10-10 04:52:09', '2018-10-10 04:52:09');

-- --------------------------------------------------------

--
-- Table structure for table `role_translations`
--

CREATE TABLE `role_translations` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE `searches` (
  `id` int(11) NOT NULL,
  `query` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `searches`
--

INSERT INTO `searches` (`id`, `query`, `count`, `created_at`, `updated_at`) VALUES
(2, 'dcs', 1, '2020-03-08 00:29:09', '2020-03-08 00:29:09'),
(3, 'das', 3, '2020-03-08 00:29:15', '2020-03-08 00:29:50');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) NOT NULL DEFAULT 0,
  `remaining_digital_uploads` int(11) NOT NULL DEFAULT 0,
  `invalid_at` date DEFAULT NULL,
  `verification_status` int(1) NOT NULL DEFAULT 0,
  `verification_info` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `cash_on_delivery_status` int(1) NOT NULL DEFAULT 0,
  `admin_to_pay` double(20,2) NOT NULL DEFAULT 0.00,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_routing_no` int(50) DEFAULT NULL,
  `bank_payment_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `user_id`, `seller_package_id`, `remaining_uploads`, `remaining_digital_uploads`, `invalid_at`, `verification_status`, `verification_info`, `cash_on_delivery_status`, `admin_to_pay`, `bank_name`, `bank_acc_name`, `bank_acc_no`, `bank_routing_no`, `bank_payment_status`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, 0, 0, NULL, 1, '[{\"type\":\"text\",\"label\":\"Name\",\"value\":\"Mr. Seller\"},{\"type\":\"select\",\"label\":\"Marital Status\",\"value\":\"Married\"},{\"type\":\"multi_select\",\"label\":\"Company\",\"value\":\"[\\\"Company\\\"]\"},{\"type\":\"select\",\"label\":\"Gender\",\"value\":\"Male\"},{\"type\":\"file\",\"label\":\"Image\",\"value\":\"uploads\\/verification_form\\/CRWqFifcbKqibNzllBhEyUSkV6m1viknGXMEhtiW.png\"}]', 1, 78.40, NULL, NULL, NULL, NULL, 0, '2018-10-07 04:42:57', '2020-01-26 04:21:11'),
(2, 10, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-02-11 04:41:53', '2021-02-11 04:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `seller_packages`
--

CREATE TABLE `seller_packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(11,2) NOT NULL DEFAULT 0.00,
  `product_upload` int(11) NOT NULL DEFAULT 0,
  `digital_product_upload` int(11) NOT NULL DEFAULT 0,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_withdraw_requests`
--

CREATE TABLE `seller_withdraw_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` double(20,2) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `viewed` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seo_settings`
--

CREATE TABLE `seo_settings` (
  `id` int(11) NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisit` int(11) NOT NULL,
  `sitemap_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seo_settings`
--

INSERT INTO `seo_settings` (`id`, `keyword`, `author`, `revisit`, `sitemap_link`, `description`, `created_at`, `updated_at`) VALUES
(1, 'bootstrap,responsive,template,developer', 'Active IT Zone', 11, 'https://www.activeitzone.com', 'Active E-commerce CMS Multi vendor system is such a platform to build a border less marketplace both for physical and digital goods.', '2019-08-08 08:56:11', '2019-08-08 02:56:11');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sliders` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pick_up_point_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_cost` double(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `user_id`, `name`, `logo`, `sliders`, `address`, `facebook`, `google`, `twitter`, `youtube`, `slug`, `meta_title`, `meta_description`, `pick_up_point_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, 3, 'Demo Seller Shop', NULL, NULL, 'House : Demo, Road : Demo, Section : Demo', 'www.facebook.com', 'www.google.com', 'www.twitter.com', 'www.youtube.com', 'Demo-Seller-Shop-1', 'Demo Seller Shop Title', 'Demo description', NULL, 0.00, '2018-11-27 10:23:13', '2019-08-06 06:43:16'),
(2, 10, 'protidin-shop', NULL, NULL, '65 elephant road', NULL, NULL, NULL, NULL, 'protidin-shop-', NULL, NULL, NULL, 0.00, '2021-02-11 04:41:53', '2021-02-11 04:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 1,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `photo`, `published`, `link`, `created_at`, `updated_at`) VALUES
(7, 'uploads/sliders/slider-image.jpg', 1, NULL, '2019-03-12 05:58:05', '2019-03-12 05:58:05'),
(8, 'uploads/sliders/slider-image.jpg', 1, NULL, '2019-03-12 05:58:12', '2019-03-12 05:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `code` int(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `viewed` int(1) NOT NULL DEFAULT 0,
  `client_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` longtext COLLATE utf8_unicode_ci NOT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_key` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(3, 'en', 'All Category', 'All Category', '2020-11-02 07:40:38', '2020-11-02 07:40:38'),
(4, 'en', 'All', 'All', '2020-11-02 07:40:38', '2020-11-02 07:40:38'),
(5, 'en', 'Flash Sale', 'Flash Sale', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(6, 'en', 'View More', 'View More', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(7, 'en', 'Add to wishlist', 'Add to wishlist', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(8, 'en', 'Add to compare', 'Add to compare', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(9, 'en', 'Add to cart', 'Add to cart', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(10, 'en', 'Club Point', 'Club Point', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(11, 'en', 'Classified Ads', 'Classified Ads', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(13, 'en', 'Used', 'Used', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(14, 'en', 'Top 10 Categories', 'Top 10 Categories', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(15, 'en', 'View All Categories', 'View All Categories', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(16, 'en', 'Top 10 Brands', 'Top 10 Brands', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(17, 'en', 'View All Brands', 'View All Brands', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(43, 'en', 'Terms & conditions', 'Terms & conditions', '2020-11-02 07:40:41', '2020-11-02 07:40:41'),
(51, 'en', 'Best Selling', 'Best Selling', '2020-11-02 07:40:42', '2020-11-02 07:40:42'),
(53, 'en', 'Top 20', 'Top 20', '2020-11-02 07:40:42', '2020-11-02 07:40:42'),
(55, 'en', 'Featured Products', 'Featured Products', '2020-11-02 07:40:42', '2020-11-02 07:40:42'),
(56, 'en', 'Best Sellers', 'Best Sellers', '2020-11-02 07:40:43', '2020-11-02 07:40:43'),
(57, 'en', 'Visit Store', 'Visit Store', '2020-11-02 07:40:43', '2020-11-02 07:40:43'),
(58, 'en', 'Popular Suggestions', 'Popular Suggestions', '2020-11-02 07:46:59', '2020-11-02 07:46:59'),
(59, 'en', 'Category Suggestions', 'Category Suggestions', '2020-11-02 07:46:59', '2020-11-02 07:46:59'),
(62, 'en', 'Automobile & Motorcycle', 'Automobile & Motorcycle', '2020-11-02 07:47:01', '2020-11-02 07:47:01'),
(63, 'en', 'Price range', 'Price range', '2020-11-02 07:47:01', '2020-11-02 07:47:01'),
(64, 'en', 'Filter by color', 'Filter by color', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(65, 'en', 'Home', 'Home', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(67, 'en', 'Newest', 'Newest', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(68, 'en', 'Oldest', 'Oldest', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(69, 'en', 'Price low to high', 'Price low to high', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(70, 'en', 'Price high to low', 'Price high to low', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(71, 'en', 'Brands', 'Brands', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(72, 'en', 'All Brands', 'All Brands', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(74, 'en', 'All Sellers', 'All Sellers', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(78, 'en', 'Inhouse product', 'Inhouse product', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(79, 'en', 'Message Seller', 'Message Seller', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(80, 'en', 'Price', 'Price', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(81, 'en', 'Discount Price', 'Discount Price', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(82, 'en', 'Color', 'Color', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(83, 'en', 'Quantity', 'Quantity', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(84, 'en', 'available', 'available', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(85, 'en', 'Total Price', 'Total Price', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(86, 'en', 'Out of Stock', 'Out of Stock', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(87, 'en', 'Refund', 'Refund', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(88, 'en', 'Share', 'Share', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(89, 'en', 'Sold By', 'Sold By', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(90, 'en', 'customer reviews', 'customer reviews', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(91, 'en', 'Top Selling Products', 'Top Selling Products', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(92, 'en', 'Description', 'Description', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(93, 'en', 'Video', 'Video', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(94, 'en', 'Reviews', 'Reviews', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(95, 'en', 'Download', 'Download', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(96, 'en', 'There have been no reviews for this product yet.', 'There have been no reviews for this product yet.', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(97, 'en', 'Related products', 'Related products', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(98, 'en', 'Any query about this product', 'Any query about this product', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(99, 'en', 'Product Name', 'Product Name', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(100, 'en', 'Your Question', 'Your Question', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(101, 'en', 'Send', 'Send', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(103, 'en', 'Use country code before number', 'Use country code before number', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(105, 'en', 'Remember Me', 'Remember Me', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(107, 'en', 'Dont have an account?', 'Dont have an account?', '2020-11-02 08:18:04', '2020-11-02 08:18:04'),
(108, 'en', 'Register Now', 'Register Now', '2020-11-02 08:18:04', '2020-11-02 08:18:04'),
(109, 'en', 'Or Login With', 'Or Login With', '2020-11-02 08:18:04', '2020-11-02 08:18:04'),
(110, 'en', 'oops..', 'oops..', '2020-11-02 10:29:04', '2020-11-02 10:29:04'),
(111, 'en', 'This item is out of stock!', 'This item is out of stock!', '2020-11-02 10:29:04', '2020-11-02 10:29:04'),
(112, 'en', 'Back to shopping', 'Back to shopping', '2020-11-02 10:29:04', '2020-11-02 10:29:04'),
(113, 'en', 'Login to your account.', 'Login to your account.', '2020-11-02 11:27:41', '2020-11-02 11:27:41'),
(115, 'en', 'Purchase History', 'Purchase History', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(116, 'en', 'New', 'New', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(117, 'en', 'Downloads', 'Downloads', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(118, 'en', 'Sent Refund Request', 'Sent Refund Request', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(119, 'en', 'Product Bulk Upload', 'Product Bulk Upload', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(123, 'en', 'Orders', 'Orders', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(124, 'en', 'Recieved Refund Request', 'Recieved Refund Request', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(126, 'en', 'Shop Setting', 'Shop Setting', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(127, 'en', 'Payment History', 'Payment History', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(128, 'en', 'Money Withdraw', 'Money Withdraw', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(129, 'en', 'Conversations', 'Conversations', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(130, 'en', 'My Wallet', 'My Wallet', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(131, 'en', 'Earning Points', 'Earning Points', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(132, 'en', 'Support Ticket', 'Support Ticket', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(133, 'en', 'Manage Profile', 'Manage Profile', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(134, 'en', 'Sold Amount', 'Sold Amount', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(135, 'en', 'Your sold amount (current month)', 'Your sold amount (current month)', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(136, 'en', 'Total Sold', 'Total Sold', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(137, 'en', 'Last Month Sold', 'Last Month Sold', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(138, 'en', 'Total sale', 'Total sale', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(139, 'en', 'Total earnings', 'Total earnings', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(140, 'en', 'Successful orders', 'Successful orders', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(141, 'en', 'Total orders', 'Total orders', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(142, 'en', 'Pending orders', 'Pending orders', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(143, 'en', 'Cancelled orders', 'Cancelled orders', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(145, 'en', 'Product', 'Product', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(147, 'en', 'Purchased Package', 'Purchased Package', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(148, 'en', 'Package Not Found', 'Package Not Found', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(149, 'en', 'Upgrade Package', 'Upgrade Package', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(150, 'en', 'Shop', 'Shop', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(151, 'en', 'Manage & organize your shop', 'Manage & organize your shop', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(152, 'en', 'Go to setting', 'Go to setting', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(153, 'en', 'Payment', 'Payment', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(154, 'en', 'Configure your payment method', 'Configure your payment method', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(156, 'en', 'My Panel', 'My Panel', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(158, 'en', 'Item has been added to wishlist', 'Item has been added to wishlist', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(159, 'en', 'My Points', 'My Points', '2020-11-02 11:28:15', '2020-11-02 11:28:15'),
(160, 'en', ' Points', ' Points', '2020-11-02 11:28:15', '2020-11-02 11:28:15'),
(161, 'en', 'Wallet Money', 'Wallet Money', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(162, 'en', 'Exchange Rate', 'Exchange Rate', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(163, 'en', 'Point Earning history', 'Point Earning history', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(164, 'en', 'Date', 'Date', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(165, 'en', 'Points', 'Points', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(166, 'en', 'Converted', 'Converted', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(167, 'en', 'Action', 'Action', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(168, 'en', 'No history found.', 'No history found.', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(169, 'en', 'Convert has been done successfully Check your Wallets', 'Convert has been done successfully Check your Wallets', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(170, 'en', 'Something went wrong', 'Something went wrong', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(171, 'en', 'Remaining Uploads', 'Remaining Uploads', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(172, 'en', 'No Package Found', 'No Package Found', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(173, 'en', 'Search product', 'Search product', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(174, 'en', 'Name', 'Name', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(176, 'en', 'Current Qty', 'Current Qty', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(177, 'en', 'Base Price', 'Base Price', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(178, 'en', 'Published', 'Published', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(179, 'en', 'Featured', 'Featured', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(180, 'en', 'Options', 'Options', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(181, 'en', 'Edit', 'Edit', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(182, 'en', 'Duplicate', 'Duplicate', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(184, 'en', '1. Download the skeleton file and fill it with data.', '1. Download the skeleton file and fill it with data.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(185, 'en', '2. You can download the example file to understand how the data must be filled.', '2. You can download the example file to understand how the data must be filled.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(186, 'en', '3. Once you have downloaded and filled the skeleton file, upload it in the form below and submit.', '3. Once you have downloaded and filled the skeleton file, upload it in the form below and submit.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(187, 'en', '4. After uploading products you need to edit them and set products images and choices.', '4. After uploading products you need to edit them and set products images and choices.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(188, 'en', 'Download CSV', 'Download CSV', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(189, 'en', '1. Category,Sub category,Sub Sub category and Brand should be in numerical ids.', '1. Category,Sub category,Sub Sub category and Brand should be in numerical ids.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(190, 'en', '2. You can download the pdf to get Category,Sub category,Sub Sub category and Brand id.', '2. You can download the pdf to get Category,Sub category,Sub Sub category and Brand id.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(191, 'en', 'Download Category', 'Download Category', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(192, 'en', 'Download Sub category', 'Download Sub category', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(193, 'en', 'Download Sub Sub category', 'Download Sub Sub category', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(194, 'en', 'Download Brand', 'Download Brand', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(195, 'en', 'Upload CSV File', 'Upload CSV File', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(196, 'en', 'CSV', 'CSV', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(197, 'en', 'Choose CSV File', 'Choose CSV File', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(198, 'en', 'Upload', 'Upload', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(199, 'en', 'Add New Digital Product', 'Add New Digital Product', '2020-11-02 11:37:25', '2020-11-02 11:37:25'),
(200, 'en', 'Available Status', 'Available Status', '2020-11-02 11:37:29', '2020-11-02 11:37:29'),
(201, 'en', 'Admin Status', 'Admin Status', '2020-11-02 11:37:29', '2020-11-02 11:37:29'),
(202, 'en', 'Pending Balance', 'Pending Balance', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(203, 'en', 'Send Withdraw Request', 'Send Withdraw Request', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(204, 'en', 'Withdraw Request history', 'Withdraw Request history', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(205, 'en', 'Amount', 'Amount', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(206, 'en', 'Status', 'Status', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(207, 'en', 'Message', 'Message', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(208, 'en', 'Send A Withdraw Request', 'Send A Withdraw Request', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(209, 'en', 'Basic Info', 'Basic Info', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
(211, 'en', 'Your Phone', 'Your Phone', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
(212, 'en', 'Photo', 'Photo', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
(213, 'en', 'Browse', 'Browse', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
(215, 'en', 'Your Password', 'Your Password', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
(216, 'en', 'New Password', 'New Password', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(217, 'en', 'Confirm Password', 'Confirm Password', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(218, 'en', 'Add New Address', 'Add New Address', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(219, 'en', 'Payment Setting', 'Payment Setting', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(220, 'en', 'Cash Payment', 'Cash Payment', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(221, 'en', 'Bank Payment', 'Bank Payment', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(222, 'en', 'Bank Name', 'Bank Name', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(223, 'en', 'Bank Account Name', 'Bank Account Name', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(224, 'en', 'Bank Account Number', 'Bank Account Number', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(225, 'en', 'Bank Routing Number', 'Bank Routing Number', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(226, 'en', 'Update Profile', 'Update Profile', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(227, 'en', 'Change your email', 'Change your email', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(228, 'en', 'Your Email', 'Your Email', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(229, 'en', 'Sending Email...', 'Sending Email...', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(230, 'en', 'Verify', 'Verify', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(231, 'en', 'Update Email', 'Update Email', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(232, 'en', 'New Address', 'New Address', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(233, 'en', 'Your Address', 'Your Address', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(234, 'en', 'Country', 'Country', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(235, 'en', 'Select your country', 'Select your country', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(236, 'en', 'City', 'City', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(237, 'en', 'Your City', 'Your City', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(239, 'en', 'Your Postal Code', 'Your Postal Code', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(240, 'en', '+880', '+880', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(241, 'en', 'Save', 'Save', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(242, 'en', 'Received Refund Request', 'Received Refund Request', '2020-11-02 11:56:20', '2020-11-02 11:56:20'),
(244, 'en', 'Delete Confirmation', 'Delete Confirmation', '2020-11-02 11:56:20', '2020-11-02 11:56:20'),
(245, 'en', 'Are you sure to delete this?', 'Are you sure to delete this?', '2020-11-02 11:56:21', '2020-11-02 11:56:21'),
(246, 'en', 'Premium Packages for Sellers', 'Premium Packages for Sellers', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(247, 'en', 'Product Upload', 'Product Upload', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(248, 'en', 'Digital Product Upload', 'Digital Product Upload', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(250, 'en', 'Purchase Package', 'Purchase Package', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(251, 'en', 'Select Payment Type', 'Select Payment Type', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(252, 'en', 'Payment Type', 'Payment Type', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(253, 'en', 'Select One', 'Select One', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(254, 'en', 'Online payment', 'Online payment', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(255, 'en', 'Offline payment', 'Offline payment', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(256, 'en', 'Purchase Your Package', 'Purchase Your Package', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(258, 'en', 'Paypal', 'Paypal', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(259, 'en', 'Stripe', 'Stripe', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(260, 'en', 'sslcommerz', 'sslcommerz', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(265, 'en', 'Confirm', 'Confirm', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(266, 'en', 'Offline Package Payment', 'Offline Package Payment', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(267, 'en', 'Transaction ID', 'Transaction ID', '2020-11-02 12:30:12', '2020-11-02 12:30:12'),
(268, 'en', 'Choose image', 'Choose image', '2020-11-02 12:30:12', '2020-11-02 12:30:12'),
(269, 'en', 'Code', 'Code', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(270, 'en', 'Delivery Status', 'Delivery Status', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(271, 'en', 'Payment Status', 'Payment Status', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(272, 'en', 'Paid', 'Paid', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(273, 'en', 'Order Details', 'Order Details', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(274, 'en', 'Download Invoice', 'Download Invoice', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(275, 'en', 'Unpaid', 'Unpaid', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(277, 'en', 'Order placed', 'Order placed', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(278, 'en', 'Confirmed', 'Confirmed', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(279, 'en', 'On delivery', 'On delivery', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(280, 'en', 'Delivered', 'Delivered', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(281, 'en', 'Order Summary', 'Order Summary', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(282, 'en', 'Order Code', 'Order Code', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(283, 'en', 'Customer', 'Customer', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(287, 'en', 'Total order amount', 'Total order amount', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(288, 'en', 'Shipping metdod', 'Shipping metdod', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(289, 'en', 'Flat shipping rate', 'Flat shipping rate', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(290, 'en', 'Payment metdod', 'Payment metdod', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(291, 'en', 'Variation', 'Variation', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(292, 'en', 'Delivery Type', 'Delivery Type', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(293, 'en', 'Home Delivery', 'Home Delivery', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(294, 'en', 'Order Ammount', 'Order Ammount', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(295, 'en', 'Subtotal', 'Subtotal', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(296, 'en', 'Shipping', 'Shipping', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(298, 'en', 'Coupon Discount', 'Coupon Discount', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(300, 'en', 'N/A', 'N/A', '2020-11-02 12:44:20', '2020-11-02 12:44:20'),
(301, 'en', 'In stock', 'In stock', '2020-11-02 12:54:52', '2020-11-02 12:54:52'),
(302, 'en', 'Buy Now', 'Buy Now', '2020-11-02 12:54:52', '2020-11-02 12:54:52'),
(303, 'en', 'Item added to your cart!', 'Item added to your cart!', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(304, 'en', 'Proceed to Checkout', 'Proceed to Checkout', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(305, 'en', 'Cart Items', 'Cart Items', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(306, 'en', '1. My Cart', '1. My Cart', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(307, 'en', 'View cart', 'View cart', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(308, 'en', '2. Shipping info', '2. Shipping info', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(309, 'en', 'Checkout', 'Checkout', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(310, 'en', '3. Delivery info', '3. Delivery info', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(311, 'en', '4. Payment', '4. Payment', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(312, 'en', '5. Confirmation', '5. Confirmation', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(313, 'en', 'Remove', 'Remove', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(314, 'en', 'Return to shop', 'Return to shop', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(315, 'en', 'Continue to Shipping', 'Continue to Shipping', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(316, 'en', 'Or', 'Or', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(317, 'en', 'Guest Checkout', 'Guest Checkout', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(318, 'en', 'Continue to Delivery Info', 'Continue to Delivery Info', '2020-11-02 12:57:44', '2020-11-02 12:57:44'),
(319, 'en', 'Postal Code', 'Postal Code', '2020-11-02 13:01:01', '2020-11-02 13:01:01'),
(320, 'en', 'Choose Delivery Type', 'Choose Delivery Type', '2020-11-02 13:01:04', '2020-11-02 13:01:04'),
(321, 'en', 'Local Pickup', 'Local Pickup', '2020-11-02 13:01:04', '2020-11-02 13:01:04'),
(322, 'en', 'Select your nearest pickup point', 'Select your nearest pickup point', '2020-11-02 13:01:04', '2020-11-02 13:01:04'),
(323, 'en', 'Continue to Payment', 'Continue to Payment', '2020-11-02 13:01:04', '2020-11-02 13:01:04'),
(324, 'en', 'Select a payment option', 'Select a payment option', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(325, 'en', 'Razorpay', 'Razorpay', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(326, 'en', 'Paystack', 'Paystack', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(327, 'en', 'VoguePay', 'VoguePay', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(328, 'en', 'payhere', 'payhere', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(329, 'en', 'ngenius', 'ngenius', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(330, 'en', 'Paytm', 'Paytm', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(331, 'en', 'Cash on Delivery', 'Cash on Delivery', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(332, 'en', 'Your wallet balance :', 'Your wallet balance :', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(333, 'en', 'Insufficient balance', 'Insufficient balance', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(334, 'en', 'I agree to the', 'I agree to the', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(338, 'en', 'Complete Order', 'Complete Order', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(339, 'en', 'Summary', 'Summary', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(340, 'en', 'Items', 'Items', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(341, 'en', 'Total Club point', 'Total Club point', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(342, 'en', 'Total Shipping', 'Total Shipping', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(343, 'en', 'Have coupon code? Enter here', 'Have coupon code? Enter here', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(344, 'en', 'Apply', 'Apply', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(345, 'en', 'You need to agree with our policies', 'You need to agree with our policies', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(346, 'en', 'Forgot password', 'Forgot password', '2020-11-02 13:01:25', '2020-11-02 13:01:25'),
(469, 'en', 'SEO Setting', 'SEO Setting', '2020-11-02 13:01:33', '2020-11-02 13:01:33'),
(474, 'en', 'System Update', 'System Update', '2020-11-02 13:01:34', '2020-11-02 13:01:34'),
(480, 'en', 'Add New Payment Method', 'Add New Payment Method', '2020-11-02 13:01:38', '2020-11-02 13:01:38'),
(481, 'en', 'Manual Payment Method', 'Manual Payment Method', '2020-11-02 13:01:38', '2020-11-02 13:01:38'),
(482, 'en', 'Heading', 'Heading', '2020-11-02 13:01:38', '2020-11-02 13:01:38'),
(483, 'en', 'Logo', 'Logo', '2020-11-02 13:01:38', '2020-11-02 13:01:38'),
(484, 'en', 'Manual Payment Information', 'Manual Payment Information', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(485, 'en', 'Type', 'Type', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(486, 'en', 'Custom Payment', 'Custom Payment', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(487, 'en', 'Check Payment', 'Check Payment', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(488, 'en', 'Checkout Thumbnail', 'Checkout Thumbnail', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(489, 'en', 'Payment Instruction', 'Payment Instruction', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(490, 'en', 'Bank Information', 'Bank Information', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(491, 'en', 'Select File', 'Select File', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(492, 'en', 'Upload New', 'Upload New', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(493, 'en', 'Sort by newest', 'Sort by newest', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(494, 'en', 'Sort by oldest', 'Sort by oldest', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(495, 'en', 'Sort by smallest', 'Sort by smallest', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(496, 'en', 'Sort by largest', 'Sort by largest', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(497, 'en', 'Selected Only', 'Selected Only', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(498, 'en', 'No files found', 'No files found', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(499, 'en', '0 File selected', '0 File selected', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(500, 'en', 'Clear', 'Clear', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(501, 'en', 'Prev', 'Prev', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(502, 'en', 'Next', 'Next', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(503, 'en', 'Add Files', 'Add Files', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(504, 'en', 'Method has been inserted successfully', 'Method has been inserted successfully', '2020-11-02 13:02:03', '2020-11-02 13:02:03'),
(506, 'en', 'Order Date', 'Order Date', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
(507, 'en', 'Bill to', 'Bill to', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
(510, 'en', 'Sub Total', 'Sub Total', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
(512, 'en', 'Total Tax', 'Total Tax', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
(513, 'en', 'Grand Total', 'Grand Total', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
(514, 'en', 'Your order has been placed successfully. Please submit payment information from purchase history', 'Your order has been placed successfully. Please submit payment information from purchase history', '2020-11-02 13:02:47', '2020-11-02 13:02:47'),
(515, 'en', 'Thank You for Your Order!', 'Thank You for Your Order!', '2020-11-02 13:02:48', '2020-11-02 13:02:48'),
(516, 'en', 'Order Code:', 'Order Code:', '2020-11-02 13:02:48', '2020-11-02 13:02:48'),
(517, 'en', 'A copy or your order summary has been sent to', 'A copy or your order summary has been sent to', '2020-11-02 13:02:48', '2020-11-02 13:02:48'),
(518, 'en', 'Make Payment', 'Make Payment', '2020-11-02 13:03:26', '2020-11-02 13:03:26'),
(519, 'en', 'Payment screenshot', 'Payment screenshot', '2020-11-02 13:03:29', '2020-11-02 13:03:29'),
(520, 'en', 'Paypal Credential', 'Paypal Credential', '2020-11-02 13:12:20', '2020-11-02 13:12:20'),
(522, 'en', 'Paypal Client ID', 'Paypal Client ID', '2020-11-02 13:12:20', '2020-11-02 13:12:20'),
(523, 'en', 'Paypal Client Secret', 'Paypal Client Secret', '2020-11-02 13:12:20', '2020-11-02 13:12:20'),
(524, 'en', 'Paypal Sandbox Mode', 'Paypal Sandbox Mode', '2020-11-02 13:12:20', '2020-11-02 13:12:20'),
(525, 'en', 'Sslcommerz Credential', 'Sslcommerz Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(526, 'en', 'Sslcz Store Id', 'Sslcz Store Id', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(527, 'en', 'Sslcz store password', 'Sslcz store password', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(528, 'en', 'Sslcommerz Sandbox Mode', 'Sslcommerz Sandbox Mode', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(529, 'en', 'Stripe Credential', 'Stripe Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(531, 'en', 'STRIPE KEY', 'STRIPE KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(533, 'en', 'STRIPE SECRET', 'STRIPE SECRET', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(534, 'en', 'RazorPay Credential', 'RazorPay Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(535, 'en', 'RAZOR KEY', 'RAZOR KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(536, 'en', 'RAZOR SECRET', 'RAZOR SECRET', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(537, 'en', 'Instamojo Credential', 'Instamojo Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(538, 'en', 'API KEY', 'API KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(539, 'en', 'IM API KEY', 'IM API KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(540, 'en', 'AUTH TOKEN', 'AUTH TOKEN', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(541, 'en', 'IM AUTH TOKEN', 'IM AUTH TOKEN', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(542, 'en', 'Instamojo Sandbox Mode', 'Instamojo Sandbox Mode', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(543, 'en', 'PayStack Credential', 'PayStack Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(544, 'en', 'PUBLIC KEY', 'PUBLIC KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(545, 'en', 'SECRET KEY', 'SECRET KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(546, 'en', 'MERCHANT EMAIL', 'MERCHANT EMAIL', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(547, 'en', 'VoguePay Credential', 'VoguePay Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(548, 'en', 'MERCHANT ID', 'MERCHANT ID', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(549, 'en', 'Sandbox Mode', 'Sandbox Mode', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(550, 'en', 'Payhere Credential', 'Payhere Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(551, 'en', 'PAYHERE MERCHANT ID', 'PAYHERE MERCHANT ID', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(552, 'en', 'PAYHERE SECRET', 'PAYHERE SECRET', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(553, 'en', 'PAYHERE CURRENCY', 'PAYHERE CURRENCY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(554, 'en', 'Payhere Sandbox Mode', 'Payhere Sandbox Mode', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(555, 'en', 'Ngenius Credential', 'Ngenius Credential', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(556, 'en', 'NGENIUS OUTLET ID', 'NGENIUS OUTLET ID', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(557, 'en', 'NGENIUS API KEY', 'NGENIUS API KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(558, 'en', 'NGENIUS CURRENCY', 'NGENIUS CURRENCY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(559, 'en', 'Mpesa Credential', 'Mpesa Credential', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(560, 'en', 'MPESA CONSUMER KEY', 'MPESA CONSUMER KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(561, 'en', 'MPESA_CONSUMER_KEY', 'MPESA_CONSUMER_KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(562, 'en', 'MPESA CONSUMER SECRET', 'MPESA CONSUMER SECRET', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(563, 'en', 'MPESA_CONSUMER_SECRET', 'MPESA_CONSUMER_SECRET', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(564, 'en', 'MPESA SHORT CODE', 'MPESA SHORT CODE', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(565, 'en', 'MPESA_SHORT_CODE', 'MPESA_SHORT_CODE', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(566, 'en', 'MPESA SANDBOX ACTIVATION', 'MPESA SANDBOX ACTIVATION', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(567, 'en', 'Flutterwave Credential', 'Flutterwave Credential', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(568, 'en', 'RAVE_PUBLIC_KEY', 'RAVE_PUBLIC_KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(569, 'en', 'RAVE_SECRET_KEY', 'RAVE_SECRET_KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(570, 'en', 'RAVE_TITLE', 'RAVE_TITLE', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(571, 'en', 'STAGIN ACTIVATION', 'STAGIN ACTIVATION', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(573, 'en', 'All Product', 'All Product', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(574, 'en', 'Sort By', 'Sort By', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(575, 'en', 'Rating (High > Low)', 'Rating (High > Low)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(576, 'en', 'Rating (Low > High)', 'Rating (Low > High)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(577, 'en', 'Num of Sale (High > Low)', 'Num of Sale (High > Low)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(578, 'en', 'Num of Sale (Low > High)', 'Num of Sale (Low > High)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(579, 'en', 'Base Price (High > Low)', 'Base Price (High > Low)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(580, 'en', 'Base Price (Low > High)', 'Base Price (Low > High)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(581, 'en', 'Type & Enter', 'Type & Enter', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(582, 'en', 'Added By', 'Added By', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(583, 'en', 'Num of Sale', 'Num of Sale', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(584, 'en', 'Total Stock', 'Total Stock', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(585, 'en', 'Todays Deal', 'Todays Deal', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(586, 'en', 'Rating', 'Rating', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(587, 'en', 'times', 'times', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(588, 'en', 'Add Nerw Product', 'Add Nerw Product', '2020-11-02 13:15:02', '2020-11-02 13:15:02'),
(589, 'en', 'Product Information', 'Product Information', '2020-11-02 13:15:02', '2020-11-02 13:15:02'),
(590, 'en', 'Unit', 'Unit', '2020-11-02 13:15:02', '2020-11-02 13:15:02'),
(591, 'en', 'Unit (e.g. KG, Pc etc)', 'Unit (e.g. KG, Pc etc)', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(592, 'en', 'Minimum Qty', 'Minimum Qty', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(593, 'en', 'Tags', 'Tags', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(594, 'en', 'Type and hit enter to add a tag', 'Type and hit enter to add a tag', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(595, 'en', 'Barcode', 'Barcode', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(596, 'en', 'Refundable', 'Refundable', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(597, 'en', 'Product Images', 'Product Images', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(598, 'en', 'Gallery Images', 'Gallery Images', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(599, 'en', 'Todays Deal updated successfully', 'Todays Deal updated successfully', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(600, 'en', 'Published products updated successfully', 'Published products updated successfully', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(601, 'en', 'Thumbnail Image', 'Thumbnail Image', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(602, 'en', 'Featured products updated successfully', 'Featured products updated successfully', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(603, 'en', 'Product Videos', 'Product Videos', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(604, 'en', 'Video Provider', 'Video Provider', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(605, 'en', 'Youtube', 'Youtube', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(606, 'en', 'Dailymotion', 'Dailymotion', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(607, 'en', 'Vimeo', 'Vimeo', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(608, 'en', 'Video Link', 'Video Link', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(609, 'en', 'Product Variation', 'Product Variation', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(610, 'en', 'Colors', 'Colors', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(611, 'en', 'Attributes', 'Attributes', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(612, 'en', 'Choose Attributes', 'Choose Attributes', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(613, 'en', 'Choose the attributes of this product and then input values of each attribute', 'Choose the attributes of this product and then input values of each attribute', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(614, 'en', 'Product price + stock', 'Product price + stock', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(616, 'en', 'Unit price', 'Unit price', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(617, 'en', 'Purchase price', 'Purchase price', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(618, 'en', 'Flat', 'Flat', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(619, 'en', 'Percent', 'Percent', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(620, 'en', 'Discount', 'Discount', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(621, 'en', 'Product Description', 'Product Description', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(622, 'en', 'Product Shipping Cost', 'Product Shipping Cost', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(623, 'en', 'Free Shipping', 'Free Shipping', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(624, 'en', 'Flat Rate', 'Flat Rate', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(625, 'en', 'Shipping cost', 'Shipping cost', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(626, 'en', 'PDF Specification', 'PDF Specification', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(627, 'en', 'SEO Meta Tags', 'SEO Meta Tags', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(628, 'en', 'Meta Title', 'Meta Title', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(629, 'en', 'Meta Image', 'Meta Image', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(630, 'en', 'Choice Title', 'Choice Title', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(631, 'en', 'Enter choice values', 'Enter choice values', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(632, 'en', 'All categories', 'All categories', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
(633, 'en', 'Add New category', 'Add New category', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
(634, 'en', 'Type name & Enter', 'Type name & Enter', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
(635, 'en', 'Banner', 'Banner', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
(637, 'en', 'Commission', 'Commission', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
(638, 'en', 'icon', 'icon', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
(639, 'en', 'Featured categories updated successfully', 'Featured categories updated successfully', '2020-11-03 07:12:20', '2020-11-03 07:12:20'),
(640, 'en', 'Hot', 'Hot', '2020-11-03 07:13:12', '2020-11-03 07:13:12'),
(641, 'en', 'Filter by Payment Status', 'Filter by Payment Status', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
(642, 'en', 'Un-Paid', 'Un-Paid', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
(643, 'en', 'Filter by Deliver Status', 'Filter by Deliver Status', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
(644, 'en', 'Pending', 'Pending', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
(645, 'en', 'Type Order code & hit Enter', 'Type Order code & hit Enter', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
(646, 'en', 'Num. of Products', 'Num. of Products', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
(647, 'en', 'Walk In Customer', 'Walk In Customer', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(648, 'en', 'QTY', 'QTY', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(649, 'en', 'Without Shipping Charge', 'Without Shipping Charge', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(650, 'en', 'With Shipping Charge', 'With Shipping Charge', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(651, 'en', 'Pay With Cash', 'Pay With Cash', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(652, 'en', 'Shipping Address', 'Shipping Address', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(653, 'en', 'Close', 'Close', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(654, 'en', 'Select country', 'Select country', '2020-11-03 10:03:21', '2020-11-03 10:03:21'),
(655, 'en', 'Order Confirmation', 'Order Confirmation', '2020-11-03 10:03:21', '2020-11-03 10:03:21'),
(656, 'en', 'Are you sure to confirm this order?', 'Are you sure to confirm this order?', '2020-11-03 10:03:21', '2020-11-03 10:03:21'),
(657, 'en', 'Comfirm Order', 'Comfirm Order', '2020-11-03 10:03:21', '2020-11-03 10:03:21'),
(659, 'en', 'Personal Info', 'Personal Info', '2020-11-03 11:38:15', '2020-11-03 11:38:15'),
(660, 'en', 'Repeat Password', 'Repeat Password', '2020-11-03 11:38:15', '2020-11-03 11:38:15'),
(661, 'en', 'Shop Name', 'Shop Name', '2020-11-03 11:38:15', '2020-11-03 11:38:15'),
(662, 'en', 'Register Your Shop', 'Register Your Shop', '2020-11-03 11:38:15', '2020-11-03 11:38:15'),
(663, 'en', 'Affiliate Informations', 'Affiliate Informations', '2020-11-03 11:39:06', '2020-11-03 11:39:06'),
(664, 'en', 'Affiliate', 'Affiliate', '2020-11-03 11:39:06', '2020-11-03 11:39:06'),
(665, 'en', 'User Info', 'User Info', '2020-11-03 11:39:06', '2020-11-03 11:39:06'),
(667, 'en', 'Installed Addon', 'Installed Addon', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
(668, 'en', 'Available Addon', 'Available Addon', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
(669, 'en', 'Install New Addon', 'Install New Addon', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
(670, 'en', 'Version', 'Version', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
(671, 'en', 'Activated', 'Activated', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
(672, 'en', 'Deactivated', 'Deactivated', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
(673, 'en', 'Activate OTP', 'Activate OTP', '2020-11-03 11:48:20', '2020-11-03 11:48:20'),
(674, 'en', 'OTP will be Used For', 'OTP will be Used For', '2020-11-03 11:48:20', '2020-11-03 11:48:20'),
(675, 'en', 'Settings updated successfully', 'Settings updated successfully', '2020-11-03 11:48:20', '2020-11-03 11:48:20'),
(676, 'en', 'Product Owner', 'Product Owner', '2020-11-03 11:48:46', '2020-11-03 11:48:46'),
(677, 'en', 'Point', 'Point', '2020-11-03 11:48:46', '2020-11-03 11:48:46'),
(678, 'en', 'Set Point for Product Within a Range', 'Set Point for Product Within a Range', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
(679, 'en', 'Set Point for multiple products', 'Set Point for multiple products', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
(680, 'en', 'Min Price', 'Min Price', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
(681, 'en', 'Max Price', 'Max Price', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
(682, 'en', 'Set Point for all Products', 'Set Point for all Products', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
(683, 'en', 'Set Point For ', 'Set Point For ', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
(684, 'en', 'Convert Status', 'Convert Status', '2020-11-03 11:48:58', '2020-11-03 11:48:58'),
(685, 'en', 'Earned At', 'Earned At', '2020-11-03 11:48:59', '2020-11-03 11:48:59'),
(686, 'en', 'Seller Based Selling Report', 'Seller Based Selling Report', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
(687, 'en', 'Sort by verificarion status', 'Sort by verificarion status', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
(688, 'en', 'Approved', 'Approved', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
(689, 'en', 'Non Approved', 'Non Approved', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
(690, 'en', 'Filter', 'Filter', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
(691, 'en', 'Seller Name', 'Seller Name', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
(692, 'en', 'Number of Product Sale', 'Number of Product Sale', '2020-11-03 11:49:36', '2020-11-03 11:49:36'),
(693, 'en', 'Order Amount', 'Order Amount', '2020-11-03 11:49:36', '2020-11-03 11:49:36'),
(694, 'en', 'Facebook Chat Setting', 'Facebook Chat Setting', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(695, 'en', 'Facebook Page ID', 'Facebook Page ID', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(696, 'en', 'Please be carefull when you are configuring Facebook chat. For incorrect configuration you will not get messenger icon on your user-end site.', 'Please be carefull when you are configuring Facebook chat. For incorrect configuration you will not get messenger icon on your user-end site.', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(697, 'en', 'Login into your facebook page', 'Login into your facebook page', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(698, 'en', 'Find the About option of your facebook page', 'Find the About option of your facebook page', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(699, 'en', 'At the very bottom, you can find the \\“Facebook Page ID\\”', 'At the very bottom, you can find the \\“Facebook Page ID\\”', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(700, 'en', 'Go to Settings of your page and find the option of \\\"Advance Messaging\\\"', 'Go to Settings of your page and find the option of \\\"Advance Messaging\\\"', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(701, 'en', 'Scroll down that page and you will get \\\"white listed domain\\\"', 'Scroll down that page and you will get \\\"white listed domain\\\"', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(702, 'en', 'Set your website domain name', 'Set your website domain name', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(703, 'en', 'Google reCAPTCHA Setting', 'Google reCAPTCHA Setting', '2020-11-03 11:51:25', '2020-11-03 11:51:25'),
(704, 'en', 'Site KEY', 'Site KEY', '2020-11-03 11:51:25', '2020-11-03 11:51:25'),
(705, 'en', 'Select Shipping Method', 'Select Shipping Method', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(706, 'en', 'Product Wise Shipping Cost', 'Product Wise Shipping Cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(707, 'en', 'Flat Rate Shipping Cost', 'Flat Rate Shipping Cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(708, 'en', 'Seller Wise Flat Shipping Cost', 'Seller Wise Flat Shipping Cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(709, 'en', 'Note', 'Note', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(710, 'en', 'Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost', 'Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(711, 'en', 'Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed', 'Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(712, 'en', 'Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If a customer purchase 2 product from two seller shipping cost is calculate by addition of each seller flat shipping cost', 'Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If a customer purchase 2 product from two seller shipping cost is calculate by addition of each seller flat shipping cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(713, 'en', 'Flat Rate Cost', 'Flat Rate Cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(714, 'en', 'Shipping Cost for Admin Products', 'Shipping Cost for Admin Products', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(715, 'en', 'Countries', 'Countries', '2020-11-03 11:52:02', '2020-11-03 11:52:02'),
(716, 'en', 'Show/Hide', 'Show/Hide', '2020-11-03 11:52:02', '2020-11-03 11:52:02'),
(717, 'en', 'Country status updated successfully', 'Country status updated successfully', '2020-11-03 11:52:02', '2020-11-03 11:52:02'),
(718, 'en', 'All Subcategories', 'All Subcategories', '2020-11-03 12:27:55', '2020-11-03 12:27:55'),
(719, 'en', 'Add New Subcategory', 'Add New Subcategory', '2020-11-03 12:27:55', '2020-11-03 12:27:55'),
(720, 'en', 'Sub-Categories', 'Sub-Categories', '2020-11-03 12:27:55', '2020-11-03 12:27:55'),
(721, 'en', 'Sub Category Information', 'Sub Category Information', '2020-11-03 12:28:07', '2020-11-03 12:28:07'),
(723, 'en', 'Slug', 'Slug', '2020-11-03 12:28:07', '2020-11-03 12:28:07'),
(724, 'en', 'All Sub Subcategories', 'All Sub Subcategories', '2020-11-03 12:29:12', '2020-11-03 12:29:12'),
(725, 'en', 'Add New Sub Subcategory', 'Add New Sub Subcategory', '2020-11-03 12:29:12', '2020-11-03 12:29:12'),
(726, 'en', 'Sub-Sub-categories', 'Sub-Sub-categories', '2020-11-03 12:29:12', '2020-11-03 12:29:12'),
(727, 'en', 'Make This Default', 'Make This Default', '2020-11-04 08:24:24', '2020-11-04 08:24:24');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(728, 'en', 'Shops', 'Shops', '2020-11-04 11:17:10', '2020-11-04 11:17:10'),
(729, 'en', 'Women Clothing & Fashion', 'Women Clothing & Fashion', '2020-11-04 11:23:12', '2020-11-04 11:23:12'),
(730, 'en', 'Cellphones & Tabs', 'Cellphones & Tabs', '2020-11-04 12:10:41', '2020-11-04 12:10:41'),
(731, 'en', 'Welcome to', 'Welcome to', '2020-11-07 07:14:43', '2020-11-07 07:14:43'),
(732, 'en', 'Create a New Account', 'Create a New Account', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(733, 'en', 'Full Name', 'Full Name', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(734, 'en', 'password', 'password', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(735, 'en', 'Confrim Password', 'Confrim Password', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(736, 'en', 'I agree with the', 'I agree with the', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(737, 'en', 'Terms and Conditions', 'Terms and Conditions', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(738, 'en', 'Register', 'Register', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(739, 'en', 'Already have an account', 'Already have an account', '2020-11-07 07:32:16', '2020-11-07 07:32:16'),
(741, 'en', 'Sign Up with', 'Sign Up with', '2020-11-07 07:32:16', '2020-11-07 07:32:16'),
(742, 'en', 'I agree with the Terms and Conditions', 'I agree with the Terms and Conditions', '2020-11-07 07:34:49', '2020-11-07 07:34:49'),
(745, 'en', 'All Role', 'All Role', '2020-11-07 07:44:28', '2020-11-07 07:44:28'),
(746, 'en', 'Add New Role', 'Add New Role', '2020-11-07 07:44:28', '2020-11-07 07:44:28'),
(747, 'en', 'Roles', 'Roles', '2020-11-07 07:44:28', '2020-11-07 07:44:28'),
(749, 'en', 'Add New Staffs', 'Add New Staffs', '2020-11-07 07:44:36', '2020-11-07 07:44:36'),
(750, 'en', 'Role', 'Role', '2020-11-07 07:44:36', '2020-11-07 07:44:36'),
(751, 'en', 'Frontend Website Name', 'Frontend Website Name', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(752, 'en', 'Website Name', 'Website Name', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(753, 'en', 'Site Motto', 'Site Motto', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(754, 'en', 'Best eCommerce Website', 'Best eCommerce Website', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(755, 'en', 'Site Icon', 'Site Icon', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(756, 'en', 'Website favicon. 32x32 .png', 'Website favicon. 32x32 .png', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(757, 'en', 'Website Base Color', 'Website Base Color', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(758, 'en', 'Hex Color Code', 'Hex Color Code', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(759, 'en', 'Website Base Hover Color', 'Website Base Hover Color', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(760, 'en', 'Update', 'Update', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
(761, 'en', 'Global Seo', 'Global Seo', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
(762, 'en', 'Meta description', 'Meta description', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
(763, 'en', 'Keywords', 'Keywords', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
(764, 'en', 'Separate with coma', 'Separate with coma', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
(765, 'en', 'Website Pages', 'Website Pages', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
(766, 'en', 'All Pages', 'All Pages', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
(767, 'en', 'Add New Page', 'Add New Page', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
(768, 'en', 'URL', 'URL', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
(769, 'en', 'Actions', 'Actions', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
(770, 'en', 'Edit Page Information', 'Edit Page Information', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(771, 'en', 'Page Content', 'Page Content', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(772, 'en', 'Title', 'Title', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(773, 'en', 'Link', 'Link', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(774, 'en', 'Use character, number, hypen only', 'Use character, number, hypen only', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(775, 'en', 'Add Content', 'Add Content', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(776, 'en', 'Seo Fields', 'Seo Fields', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(777, 'en', 'Update Page', 'Update Page', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(778, 'en', 'Default Language', 'Default Language', '2020-11-07 07:50:09', '2020-11-07 07:50:09'),
(779, 'en', 'Add New Language', 'Add New Language', '2020-11-07 07:50:09', '2020-11-07 07:50:09'),
(780, 'en', 'RTL', 'RTL', '2020-11-07 07:50:09', '2020-11-07 07:50:09'),
(781, 'en', 'Translation', 'Translation', '2020-11-07 07:50:09', '2020-11-07 07:50:09'),
(782, 'en', 'Language Information', 'Language Information', '2020-11-07 07:50:23', '2020-11-07 07:50:23'),
(783, 'en', 'Save Page', 'Save Page', '2020-11-07 07:51:27', '2020-11-07 07:51:27'),
(784, 'en', 'Home Page Settings', 'Home Page Settings', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(785, 'en', 'Home Slider', 'Home Slider', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(786, 'en', 'Photos & Links', 'Photos & Links', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(787, 'en', 'Add New', 'Add New', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(788, 'en', 'Home Categories', 'Home Categories', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(789, 'en', 'Home Banner 1 (Max 3)', 'Home Banner 1 (Max 3)', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(790, 'en', 'Banner & Links', 'Banner & Links', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(791, 'en', 'Home Banner 2 (Max 3)', 'Home Banner 2 (Max 3)', '2020-11-07 07:51:36', '2020-11-07 07:51:36'),
(792, 'en', 'Top 10', 'Top 10', '2020-11-07 07:51:36', '2020-11-07 07:51:36'),
(793, 'en', 'Top Categories (Max 10)', 'Top Categories (Max 10)', '2020-11-07 07:51:36', '2020-11-07 07:51:36'),
(794, 'en', 'Top Brands (Max 10)', 'Top Brands (Max 10)', '2020-11-07 07:51:36', '2020-11-07 07:51:36'),
(795, 'en', 'System Name', 'System Name', '2020-11-07 07:54:22', '2020-11-07 07:54:22'),
(796, 'en', 'System Logo - White', 'System Logo - White', '2020-11-07 07:54:22', '2020-11-07 07:54:22'),
(797, 'en', 'Choose Files', 'Choose Files', '2020-11-07 07:54:22', '2020-11-07 07:54:22'),
(798, 'en', 'Will be used in admin panel side menu', 'Will be used in admin panel side menu', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
(799, 'en', 'System Logo - Black', 'System Logo - Black', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
(800, 'en', 'Will be used in admin panel topbar in mobile + Admin login page', 'Will be used in admin panel topbar in mobile + Admin login page', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
(801, 'en', 'System Timezone', 'System Timezone', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
(802, 'en', 'Admin login page background', 'Admin login page background', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
(803, 'en', 'Website Header', 'Website Header', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
(804, 'en', 'Header Setting', 'Header Setting', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
(805, 'en', 'Header Logo', 'Header Logo', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
(806, 'en', 'Show Language Switcher?', 'Show Language Switcher?', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
(807, 'en', 'Show Currency Switcher?', 'Show Currency Switcher?', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
(808, 'en', 'Enable stikcy header?', 'Enable stikcy header?', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
(809, 'en', 'Website Footer', 'Website Footer', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(810, 'en', 'Footer Widget', 'Footer Widget', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(811, 'en', 'About Widget', 'About Widget', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(812, 'en', 'Footer Logo', 'Footer Logo', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(813, 'en', 'About description', 'About description', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(814, 'en', 'Contact Info Widget', 'Contact Info Widget', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(815, 'en', 'Footer contact address', 'Footer contact address', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(816, 'en', 'Footer contact phone', 'Footer contact phone', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(817, 'en', 'Footer contact email', 'Footer contact email', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(818, 'en', 'Link Widget One', 'Link Widget One', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(819, 'en', 'Links', 'Links', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(820, 'en', 'Footer Bottom', 'Footer Bottom', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(821, 'en', 'Copyright Widget ', 'Copyright Widget ', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
(822, 'en', 'Copyright Text', 'Copyright Text', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
(823, 'en', 'Social Link Widget ', 'Social Link Widget ', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
(824, 'en', 'Show Social Links?', 'Show Social Links?', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
(825, 'en', 'Social Links', 'Social Links', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
(826, 'en', 'Payment Methods Widget ', 'Payment Methods Widget ', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
(827, 'en', 'RTL status updated successfully', 'RTL status updated successfully', '2020-11-07 08:36:11', '2020-11-07 08:36:11'),
(828, 'en', 'Language changed to ', 'Language changed to ', '2020-11-07 08:36:27', '2020-11-07 08:36:27'),
(829, 'en', 'Inhouse Product sale report', 'Inhouse Product sale report', '2020-11-07 09:30:25', '2020-11-07 09:30:25'),
(830, 'en', 'Sort by Category', 'Sort by Category', '2020-11-07 09:30:25', '2020-11-07 09:30:25'),
(831, 'en', 'Product wise stock report', 'Product wise stock report', '2020-11-07 09:31:02', '2020-11-07 09:31:02'),
(832, 'en', 'Currency changed to ', 'Currency changed to ', '2020-11-07 12:36:28', '2020-11-07 12:36:28'),
(833, 'en', 'Avatar', 'Avatar', '2020-11-08 09:32:35', '2020-11-08 09:32:35'),
(834, 'en', 'Copy', 'Copy', '2020-11-08 10:03:42', '2020-11-08 10:03:42'),
(835, 'en', 'Variant', 'Variant', '2020-11-08 10:43:02', '2020-11-08 10:43:02'),
(836, 'en', 'Variant Price', 'Variant Price', '2020-11-08 10:43:03', '2020-11-08 10:43:03'),
(837, 'en', 'SKU', 'SKU', '2020-11-08 10:43:03', '2020-11-08 10:43:03'),
(838, 'en', 'Key', 'Key', '2020-11-08 12:35:09', '2020-11-08 12:35:09'),
(839, 'en', 'Value', 'Value', '2020-11-08 12:35:09', '2020-11-08 12:35:09'),
(840, 'en', 'Copy Translations', 'Copy Translations', '2020-11-08 12:35:10', '2020-11-08 12:35:10'),
(841, 'en', 'All Pick-up Points', 'All Pick-up Points', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
(842, 'en', 'Add New Pick-up Point', 'Add New Pick-up Point', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
(843, 'en', 'Manager', 'Manager', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
(844, 'en', 'Location', 'Location', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
(845, 'en', 'Pickup Station Contact', 'Pickup Station Contact', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
(846, 'en', 'Open', 'Open', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
(847, 'en', 'POS Activation for Seller', 'POS Activation for Seller', '2020-11-08 12:35:55', '2020-11-08 12:35:55'),
(848, 'en', 'Order Completed Successfully.', 'Order Completed Successfully.', '2020-11-08 12:36:02', '2020-11-08 12:36:02'),
(849, 'en', 'Text Input', 'Text Input', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
(850, 'en', 'Select', 'Select', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
(851, 'en', 'Multiple Select', 'Multiple Select', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
(852, 'en', 'Radio', 'Radio', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
(853, 'en', 'File', 'File', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
(854, 'en', 'Email Address', 'Email Address', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
(855, 'en', 'Verification Info', 'Verification Info', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
(856, 'en', 'Approval', 'Approval', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
(857, 'en', 'Due Amount', 'Due Amount', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
(858, 'en', 'Show', 'Show', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
(859, 'en', 'Pay Now', 'Pay Now', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
(860, 'en', 'Affiliate User Verification', 'Affiliate User Verification', '2020-11-08 12:40:01', '2020-11-08 12:40:01'),
(861, 'en', 'Reject', 'Reject', '2020-11-08 12:40:01', '2020-11-08 12:40:01'),
(862, 'en', 'Accept', 'Accept', '2020-11-08 12:40:01', '2020-11-08 12:40:01'),
(863, 'en', 'Beauty, Health & Hair', 'Beauty, Health & Hair', '2020-11-08 12:54:17', '2020-11-08 12:54:17'),
(864, 'en', 'Comparison', 'Comparison', '2020-11-08 12:54:33', '2020-11-08 12:54:33'),
(865, 'en', 'Reset Compare List', 'Reset Compare List', '2020-11-08 12:54:33', '2020-11-08 12:54:33'),
(866, 'en', 'Your comparison list is empty', 'Your comparison list is empty', '2020-11-08 12:54:33', '2020-11-08 12:54:33'),
(867, 'en', 'Convert Point To Wallet', 'Convert Point To Wallet', '2020-11-08 13:04:42', '2020-11-08 13:04:42'),
(868, 'en', 'Note: You need to activate wallet option first before using club point addon.', 'Note: You need to activate wallet option first before using club point addon.', '2020-11-08 13:04:43', '2020-11-08 13:04:43'),
(869, 'en', 'Create an account.', 'Create an account.', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(870, 'en', 'Use Email Instead', 'Use Email Instead', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(871, 'en', 'By signing up you agree to our terms and conditions.', 'By signing up you agree to our terms and conditions.', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(872, 'en', 'Create Account', 'Create Account', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(873, 'en', 'Or Join With', 'Or Join With', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(874, 'en', 'Already have an account?', 'Already have an account?', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(875, 'en', 'Log In', 'Log In', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(876, 'en', 'Computer & Accessories', 'Computer & Accessories', '2020-11-09 07:52:05', '2020-11-09 07:52:05'),
(878, 'en', 'Product(s)', 'Product(s)', '2020-11-09 07:52:23', '2020-11-09 07:52:23'),
(879, 'en', 'in your cart', 'in your cart', '2020-11-09 07:52:23', '2020-11-09 07:52:23'),
(880, 'en', 'in your wishlist', 'in your wishlist', '2020-11-09 07:52:23', '2020-11-09 07:52:23'),
(881, 'en', 'you ordered', 'you ordered', '2020-11-09 07:52:24', '2020-11-09 07:52:24'),
(882, 'en', 'Default Shipping Address', 'Default Shipping Address', '2020-11-09 07:52:24', '2020-11-09 07:52:24'),
(883, 'en', 'Sports & outdoor', 'Sports & outdoor', '2020-11-09 07:53:32', '2020-11-09 07:53:32'),
(884, 'en', 'Copied', 'Copied', '2020-11-09 07:54:19', '2020-11-09 07:54:19'),
(885, 'en', 'Copy the Promote Link', 'Copy the Promote Link', '2020-11-09 07:54:19', '2020-11-09 07:54:19'),
(886, 'en', 'Write a review', 'Write a review', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
(887, 'en', 'Your name', 'Your name', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
(888, 'en', 'Comment', 'Comment', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
(889, 'en', 'Your review', 'Your review', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
(890, 'en', 'Submit review', 'Submit review', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
(891, 'en', 'Claire Willis', 'Claire Willis', '2020-11-09 08:05:00', '2020-11-09 08:05:00'),
(892, 'en', 'Germaine Greene', 'Germaine Greene', '2020-11-09 08:05:00', '2020-11-09 08:05:00'),
(893, 'en', 'Product File', 'Product File', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
(894, 'en', 'Choose file', 'Choose file', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
(895, 'en', 'Type to add a tag', 'Type to add a tag', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
(896, 'en', 'Images', 'Images', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
(897, 'en', 'Main Images', 'Main Images', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
(898, 'en', 'Meta Tags', 'Meta Tags', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
(899, 'en', 'Digital Product has been inserted successfully', 'Digital Product has been inserted successfully', '2020-11-09 08:14:25', '2020-11-09 08:14:25'),
(900, 'en', 'Edit Digital Product', 'Edit Digital Product', '2020-11-09 08:14:34', '2020-11-09 08:14:34'),
(901, 'en', 'Select an option', 'Select an option', '2020-11-09 08:14:34', '2020-11-09 08:14:34'),
(902, 'en', 'tax', 'tax', '2020-11-09 08:14:35', '2020-11-09 08:14:35'),
(903, 'en', 'Any question about this product?', 'Any question about this product?', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
(904, 'en', 'Sign in', 'Sign in', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
(905, 'en', 'Login with Google', 'Login with Google', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
(906, 'en', 'Login with Facebook', 'Login with Facebook', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
(907, 'en', 'Login with Twitter', 'Login with Twitter', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
(908, 'en', 'Click to show phone number', 'Click to show phone number', '2020-11-09 08:15:51', '2020-11-09 08:15:51'),
(909, 'en', 'Other Ads of', 'Other Ads of', '2020-11-09 08:15:52', '2020-11-09 08:15:52'),
(910, 'en', 'Store Home', 'Store Home', '2020-11-09 08:54:23', '2020-11-09 08:54:23'),
(911, 'en', 'Top Selling', 'Top Selling', '2020-11-09 08:54:23', '2020-11-09 08:54:23'),
(912, 'en', 'Shop Settings', 'Shop Settings', '2020-11-09 08:55:38', '2020-11-09 08:55:38'),
(913, 'en', 'Visit Shop', 'Visit Shop', '2020-11-09 08:55:38', '2020-11-09 08:55:38'),
(914, 'en', 'Pickup Points', 'Pickup Points', '2020-11-09 08:55:38', '2020-11-09 08:55:38'),
(915, 'en', 'Select Pickup Point', 'Select Pickup Point', '2020-11-09 08:55:38', '2020-11-09 08:55:38'),
(916, 'en', 'Slider Settings', 'Slider Settings', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
(917, 'en', 'Social Media Link', 'Social Media Link', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
(918, 'en', 'Facebook', 'Facebook', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
(919, 'en', 'Twitter', 'Twitter', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
(920, 'en', 'Google', 'Google', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
(921, 'en', 'New Arrival Products', 'New Arrival Products', '2020-11-09 08:56:26', '2020-11-09 08:56:26'),
(922, 'en', 'Check Your Order Status', 'Check Your Order Status', '2020-11-09 09:23:32', '2020-11-09 09:23:32'),
(923, 'en', 'Shipping method', 'Shipping method', '2020-11-09 09:27:40', '2020-11-09 09:27:40'),
(924, 'en', 'Shipped By', 'Shipped By', '2020-11-09 09:27:41', '2020-11-09 09:27:41'),
(925, 'en', 'Image', 'Image', '2020-11-09 09:29:37', '2020-11-09 09:29:37'),
(926, 'en', 'Sub Sub Category', 'Sub Sub Category', '2020-11-09 09:29:37', '2020-11-09 09:29:37'),
(927, 'en', 'Inhouse Products', 'Inhouse Products', '2020-11-09 10:22:32', '2020-11-09 10:22:32'),
(928, 'en', 'Forgot Password?', 'Forgot Password?', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
(929, 'en', 'Enter your email address to recover your password.', 'Enter your email address to recover your password.', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
(930, 'en', 'Email or Phone', 'Email or Phone', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
(931, 'en', 'Send Password Reset Link', 'Send Password Reset Link', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
(932, 'en', 'Back to Login', 'Back to Login', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
(933, 'en', 'index', 'index', '2020-11-09 10:35:29', '2020-11-09 10:35:29'),
(934, 'en', 'Download Your Product', 'Download Your Product', '2020-11-09 10:35:30', '2020-11-09 10:35:30'),
(935, 'en', 'Option', 'Option', '2020-11-09 10:35:30', '2020-11-09 10:35:30'),
(936, 'en', 'Applied Refund Request', 'Applied Refund Request', '2020-11-09 10:35:39', '2020-11-09 10:35:39'),
(937, 'en', 'Item has been renoved from wishlist', 'Item has been renoved from wishlist', '2020-11-09 10:36:04', '2020-11-09 10:36:04'),
(938, 'en', 'Bulk Products Upload', 'Bulk Products Upload', '2020-11-09 10:39:24', '2020-11-09 10:39:24'),
(939, 'en', 'Upload CSV', 'Upload CSV', '2020-11-09 10:39:25', '2020-11-09 10:39:25'),
(940, 'en', 'Create a Ticket', 'Create a Ticket', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
(941, 'en', 'Tickets', 'Tickets', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
(942, 'en', 'Ticket ID', 'Ticket ID', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
(943, 'en', 'Sending Date', 'Sending Date', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
(944, 'en', 'Subject', 'Subject', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
(945, 'en', 'View Details', 'View Details', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
(946, 'en', 'Provide a detailed description', 'Provide a detailed description', '2020-11-09 10:40:26', '2020-11-09 10:40:26'),
(947, 'en', 'Type your reply', 'Type your reply', '2020-11-09 10:40:26', '2020-11-09 10:40:26'),
(948, 'en', 'Send Ticket', 'Send Ticket', '2020-11-09 10:40:26', '2020-11-09 10:40:26'),
(949, 'en', 'Load More', 'Load More', '2020-11-09 10:40:57', '2020-11-09 10:40:57'),
(950, 'en', 'Jewelry & Watches', 'Jewelry & Watches', '2020-11-09 10:47:38', '2020-11-09 10:47:38'),
(951, 'en', 'Filters', 'Filters', '2020-11-09 10:53:54', '2020-11-09 10:53:54'),
(952, 'en', 'Contact address', 'Contact address', '2020-11-09 10:58:46', '2020-11-09 10:58:46'),
(953, 'en', 'Contact phone', 'Contact phone', '2020-11-09 10:58:47', '2020-11-09 10:58:47'),
(954, 'en', 'Contact email', 'Contact email', '2020-11-09 10:58:47', '2020-11-09 10:58:47'),
(955, 'en', 'Filter by', 'Filter by', '2020-11-09 11:00:03', '2020-11-09 11:00:03'),
(956, 'en', 'Condition', 'Condition', '2020-11-09 11:56:13', '2020-11-09 11:56:13'),
(957, 'en', 'All Type', 'All Type', '2020-11-09 11:56:13', '2020-11-09 11:56:13'),
(960, 'en', 'Pay with wallet', 'Pay with wallet', '2020-11-09 12:56:34', '2020-11-09 12:56:34'),
(961, 'en', 'Select variation', 'Select variation', '2020-11-10 07:54:29', '2020-11-10 07:54:29'),
(962, 'en', 'No Product Added', 'No Product Added', '2020-11-10 08:07:53', '2020-11-10 08:07:53'),
(963, 'en', 'Status has been updated successfully', 'Status has been updated successfully', '2020-11-10 08:41:23', '2020-11-10 08:41:23'),
(964, 'en', 'All Seller Packages', 'All Seller Packages', '2020-11-10 09:14:10', '2020-11-10 09:14:10'),
(965, 'en', 'Add New Package', 'Add New Package', '2020-11-10 09:14:10', '2020-11-10 09:14:10'),
(966, 'en', 'Package Logo', 'Package Logo', '2020-11-10 09:14:10', '2020-11-10 09:14:10'),
(967, 'en', 'days', 'days', '2020-11-10 09:14:10', '2020-11-10 09:14:10'),
(968, 'en', 'Create New Seller Package', 'Create New Seller Package', '2020-11-10 09:14:31', '2020-11-10 09:14:31'),
(969, 'en', 'Package Name', 'Package Name', '2020-11-10 09:14:31', '2020-11-10 09:14:31'),
(970, 'en', 'Duration', 'Duration', '2020-11-10 09:14:31', '2020-11-10 09:14:31'),
(971, 'en', 'Validity in number of days', 'Validity in number of days', '2020-11-10 09:14:31', '2020-11-10 09:14:31'),
(972, 'en', 'Update Package Information', 'Update Package Information', '2020-11-10 09:14:59', '2020-11-10 09:14:59'),
(973, 'en', 'Package has been inserted successfully', 'Package has been inserted successfully', '2020-11-10 09:15:14', '2020-11-10 09:15:14'),
(974, 'en', 'Refund Request', 'Refund Request', '2020-11-10 09:17:25', '2020-11-10 09:17:25'),
(975, 'en', 'Reason', 'Reason', '2020-11-10 09:17:25', '2020-11-10 09:17:25'),
(976, 'en', 'Label', 'Label', '2020-11-10 09:20:13', '2020-11-10 09:20:13'),
(977, 'en', 'Select Label', 'Select Label', '2020-11-10 09:20:13', '2020-11-10 09:20:13'),
(978, 'en', 'Multiple Select Label', 'Multiple Select Label', '2020-11-10 09:20:13', '2020-11-10 09:20:13'),
(979, 'en', 'Radio Label', 'Radio Label', '2020-11-10 09:20:13', '2020-11-10 09:20:13'),
(980, 'en', 'Pickup Point Orders', 'Pickup Point Orders', '2020-11-10 09:25:40', '2020-11-10 09:25:40'),
(981, 'en', 'View', 'View', '2020-11-10 09:25:40', '2020-11-10 09:25:40'),
(982, 'en', 'Order #', 'Order #', '2020-11-10 09:25:48', '2020-11-10 09:25:48'),
(983, 'en', 'Order Status', 'Order Status', '2020-11-10 09:25:48', '2020-11-10 09:25:48'),
(984, 'en', 'Total amount', 'Total amount', '2020-11-10 09:25:48', '2020-11-10 09:25:48'),
(986, 'en', 'TOTAL', 'TOTAL', '2020-11-10 09:25:49', '2020-11-10 09:25:49'),
(987, 'en', 'Delivery status has been updated', 'Delivery status has been updated', '2020-11-10 09:25:49', '2020-11-10 09:25:49'),
(988, 'en', 'Payment status has been updated', 'Payment status has been updated', '2020-11-10 09:25:49', '2020-11-10 09:25:49'),
(989, 'en', 'INVOICE', 'INVOICE', '2020-11-10 09:25:58', '2020-11-10 09:25:58'),
(990, 'en', 'Set Refund Time', 'Set Refund Time', '2020-11-10 09:34:04', '2020-11-10 09:34:04'),
(991, 'en', 'Set Time for sending Refund Request', 'Set Time for sending Refund Request', '2020-11-10 09:34:04', '2020-11-10 09:34:04'),
(992, 'en', 'Set Refund Sticker', 'Set Refund Sticker', '2020-11-10 09:34:05', '2020-11-10 09:34:05'),
(993, 'en', 'Sticker', 'Sticker', '2020-11-10 09:34:05', '2020-11-10 09:34:05'),
(994, 'en', 'Refund Request All', 'Refund Request All', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
(995, 'en', 'Order Id', 'Order Id', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
(996, 'en', 'Seller Approval', 'Seller Approval', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
(997, 'en', 'Admin Approval', 'Admin Approval', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
(998, 'en', 'Refund Status', 'Refund Status', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
(1000, 'en', 'No Refund', 'No Refund', '2020-11-10 09:35:27', '2020-11-10 09:35:27'),
(1001, 'en', 'Status updated successfully', 'Status updated successfully', '2020-11-10 09:54:20', '2020-11-10 09:54:20'),
(1002, 'en', 'User Search Report', 'User Search Report', '2020-11-11 06:43:24', '2020-11-11 06:43:24'),
(1003, 'en', 'Search By', 'Search By', '2020-11-11 06:43:24', '2020-11-11 06:43:24'),
(1004, 'en', 'Number searches', 'Number searches', '2020-11-11 06:43:24', '2020-11-11 06:43:24'),
(1005, 'en', 'Sender', 'Sender', '2020-11-11 06:51:49', '2020-11-11 06:51:49'),
(1006, 'en', 'Receiver', 'Receiver', '2020-11-11 06:51:49', '2020-11-11 06:51:49'),
(1007, 'en', 'Verification form updated successfully', 'Verification form updated successfully', '2020-11-11 06:53:29', '2020-11-11 06:53:29'),
(1008, 'en', 'Invalid email or password', 'Invalid email or password', '2020-11-11 07:07:49', '2020-11-11 07:07:49'),
(1009, 'en', 'All Coupons', 'All Coupons', '2020-11-11 07:14:04', '2020-11-11 07:14:04'),
(1010, 'en', 'Add New Coupon', 'Add New Coupon', '2020-11-11 07:14:04', '2020-11-11 07:14:04'),
(1011, 'en', 'Coupon Information', 'Coupon Information', '2020-11-11 07:14:04', '2020-11-11 07:14:04'),
(1012, 'en', 'Start Date', 'Start Date', '2020-11-11 07:14:04', '2020-11-11 07:14:04'),
(1013, 'en', 'End Date', 'End Date', '2020-11-11 07:14:05', '2020-11-11 07:14:05'),
(1014, 'en', 'Product Base', 'Product Base', '2020-11-11 07:14:05', '2020-11-11 07:14:05'),
(1015, 'en', 'Send Newsletter', 'Send Newsletter', '2020-11-11 07:14:10', '2020-11-11 07:14:10'),
(1016, 'en', 'Mobile Users', 'Mobile Users', '2020-11-11 07:14:10', '2020-11-11 07:14:10'),
(1017, 'en', 'SMS subject', 'SMS subject', '2020-11-11 07:14:10', '2020-11-11 07:14:10'),
(1018, 'en', 'SMS content', 'SMS content', '2020-11-11 07:14:10', '2020-11-11 07:14:10'),
(1019, 'en', 'All Flash Delas', 'All Flash Delas', '2020-11-11 07:16:06', '2020-11-11 07:16:06'),
(1020, 'en', 'Create New Flash Dela', 'Create New Flash Dela', '2020-11-11 07:16:06', '2020-11-11 07:16:06'),
(1022, 'en', 'Page Link', 'Page Link', '2020-11-11 07:16:06', '2020-11-11 07:16:06'),
(1023, 'en', 'Flash Deal Information', 'Flash Deal Information', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
(1024, 'en', 'Background Color', 'Background Color', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
(1025, 'en', '#0000ff', '#0000ff', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
(1026, 'en', 'Text Color', 'Text Color', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
(1027, 'en', 'White', 'White', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
(1028, 'en', 'Dark', 'Dark', '2020-11-11 07:16:15', '2020-11-11 07:16:15'),
(1029, 'en', 'Choose Products', 'Choose Products', '2020-11-11 07:16:15', '2020-11-11 07:16:15'),
(1030, 'en', 'Discounts', 'Discounts', '2020-11-11 07:16:20', '2020-11-11 07:16:20'),
(1031, 'en', 'Discount Type', 'Discount Type', '2020-11-11 07:16:20', '2020-11-11 07:16:20'),
(1032, 'en', 'Twillo Credential', 'Twillo Credential', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1033, 'en', 'TWILIO SID', 'TWILIO SID', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1034, 'en', 'TWILIO AUTH TOKEN', 'TWILIO AUTH TOKEN', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1035, 'en', 'TWILIO VERIFY SID', 'TWILIO VERIFY SID', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1036, 'en', 'VALID TWILLO NUMBER', 'VALID TWILLO NUMBER', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1037, 'en', 'Nexmo Credential', 'Nexmo Credential', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1038, 'en', 'NEXMO KEY', 'NEXMO KEY', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1039, 'en', 'NEXMO SECRET', 'NEXMO SECRET', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1040, 'en', 'SSL Wireless Credential', 'SSL Wireless Credential', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1041, 'en', 'SSL SMS API TOKEN', 'SSL SMS API TOKEN', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1042, 'en', 'SSL SMS SID', 'SSL SMS SID', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1043, 'en', 'SSL SMS URL', 'SSL SMS URL', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1044, 'en', 'Fast2SMS Credential', 'Fast2SMS Credential', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1045, 'en', 'AUTH KEY', 'AUTH KEY', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1046, 'en', 'ROUTE', 'ROUTE', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1047, 'en', 'Promotional Use', 'Promotional Use', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1048, 'en', 'Transactional Use', 'Transactional Use', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1050, 'en', 'SENDER ID', 'SENDER ID', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1051, 'en', 'Nexmo OTP', 'Nexmo OTP', '2020-11-11 07:17:42', '2020-11-11 07:17:42'),
(1052, 'en', 'Twillo OTP', 'Twillo OTP', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
(1053, 'en', 'SSL Wireless OTP', 'SSL Wireless OTP', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
(1054, 'en', 'Fast2SMS OTP', 'Fast2SMS OTP', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
(1055, 'en', 'Order Placement', 'Order Placement', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
(1056, 'en', 'Delivery Status Changing Time', 'Delivery Status Changing Time', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
(1057, 'en', 'Paid Status Changing Time', 'Paid Status Changing Time', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
(1058, 'en', 'Send Bulk SMS', 'Send Bulk SMS', '2020-11-11 07:19:14', '2020-11-11 07:19:14'),
(1059, 'en', 'All Subscribers', 'All Subscribers', '2020-11-11 07:21:51', '2020-11-11 07:21:51'),
(1060, 'en', 'Coupon Information Adding', 'Coupon Information Adding', '2020-11-11 07:22:25', '2020-11-11 07:22:25'),
(1061, 'en', 'Coupon Type', 'Coupon Type', '2020-11-11 07:22:25', '2020-11-11 07:22:25'),
(1062, 'en', 'For Products', 'For Products', '2020-11-11 07:22:25', '2020-11-11 07:22:25'),
(1063, 'en', 'For Total Orders', 'For Total Orders', '2020-11-11 07:22:25', '2020-11-11 07:22:25'),
(1064, 'en', 'Add Your Product Base Coupon', 'Add Your Product Base Coupon', '2020-11-11 07:22:42', '2020-11-11 07:22:42'),
(1065, 'en', 'Coupon code', 'Coupon code', '2020-11-11 07:22:42', '2020-11-11 07:22:42'),
(1066, 'en', 'Sub Category', 'Sub Category', '2020-11-11 07:22:42', '2020-11-11 07:22:42'),
(1067, 'en', 'Add More', 'Add More', '2020-11-11 07:22:43', '2020-11-11 07:22:43'),
(1068, 'en', 'Add Your Cart Base Coupon', 'Add Your Cart Base Coupon', '2020-11-11 07:29:40', '2020-11-11 07:29:40'),
(1069, 'en', 'Minimum Shopping', 'Minimum Shopping', '2020-11-11 07:29:40', '2020-11-11 07:29:40'),
(1070, 'en', 'Maximum Discount Amount', 'Maximum Discount Amount', '2020-11-11 07:29:41', '2020-11-11 07:29:41'),
(1071, 'en', 'Coupon Information Update', 'Coupon Information Update', '2020-11-11 08:18:34', '2020-11-11 08:18:34'),
(1073, 'en', 'Please Configure SMTP Setting to work all email sending funtionality', 'Please Configure SMTP Setting to work all email sending funtionality', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1074, 'en', 'Configure Now', 'Configure Now', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1076, 'en', 'Total published products', 'Total published products', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1077, 'en', 'Total sellers products', 'Total sellers products', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1078, 'en', 'Total admin products', 'Total admin products', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1079, 'en', 'Manage Products', 'Manage Products', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1080, 'en', 'Total product category', 'Total product category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1081, 'en', 'Create Category', 'Create Category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1082, 'en', 'Total product sub sub category', 'Total product sub sub category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1083, 'en', 'Create Sub Sub Category', 'Create Sub Sub Category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1084, 'en', 'Total product sub category', 'Total product sub category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1085, 'en', 'Create Sub Category', 'Create Sub Category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1086, 'en', 'Total product brand', 'Total product brand', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1087, 'en', 'Create Brand', 'Create Brand', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1089, 'en', 'Total sellers', 'Total sellers', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1091, 'en', 'Total approved sellers', 'Total approved sellers', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1093, 'en', 'Total pending sellers', 'Total pending sellers', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1094, 'en', 'Manage Sellers', 'Manage Sellers', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1095, 'en', 'Category wise product sale', 'Category wise product sale', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1097, 'en', 'Sale', 'Sale', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1098, 'en', 'Category wise product stock', 'Category wise product stock', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1099, 'en', 'Category Name', 'Category Name', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1100, 'en', 'Stock', 'Stock', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1101, 'en', 'Frontend', 'Frontend', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1103, 'en', 'Home page', 'Home page', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1104, 'en', 'setting', 'setting', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1106, 'en', 'Policy page', 'Policy page', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1107, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1109, 'en', 'General', 'General', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1110, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1111, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1112, 'en', 'Useful link', 'Useful link', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1113, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1114, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1115, 'en', 'Activation', 'Activation', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1116, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1117, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1118, 'en', 'SMTP', 'SMTP', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1119, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1120, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1121, 'en', 'Payment method', 'Payment method', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1122, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1123, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1124, 'en', 'Social media', 'Social media', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1125, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1126, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1127, 'en', 'Business', 'Business', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1128, 'en', 'setting', 'setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1130, 'en', 'setting', 'setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1131, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1132, 'en', 'Seller verification', 'Seller verification', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1133, 'en', 'form setting', 'form setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1134, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1135, 'en', 'Language', 'Language', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1136, 'en', 'setting', 'setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1137, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1139, 'en', 'setting', 'setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1140, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1141, 'en', 'Dashboard', 'Dashboard', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1142, 'en', 'POS System', 'POS System', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1143, 'en', 'POS Manager', 'POS Manager', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1144, 'en', 'POS Configuration', 'POS Configuration', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1145, 'en', 'Products', 'Products', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1146, 'en', 'Add New product', 'Add New product', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1147, 'en', 'All Products', 'All Products', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1148, 'en', 'In House Products', 'In House Products', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1149, 'en', 'Seller Products', 'Seller Products', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1150, 'en', 'Digital Products', 'Digital Products', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1151, 'en', 'Bulk Import', 'Bulk Import', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1152, 'en', 'Bulk Export', 'Bulk Export', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1153, 'en', 'Category', 'Category', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1154, 'en', 'Subcategory', 'Subcategory', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1155, 'en', 'Sub Subcategory', 'Sub Subcategory', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1156, 'en', 'Brand', 'Brand', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1157, 'en', 'Attribute', 'Attribute', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1158, 'en', 'Product Reviews', 'Product Reviews', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1159, 'en', 'Sales', 'Sales', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1160, 'en', 'All Orders', 'All Orders', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1161, 'en', 'Inhouse orders', 'Inhouse orders', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1162, 'en', 'Seller Orders', 'Seller Orders', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1163, 'en', 'Pick-up Point Order', 'Pick-up Point Order', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1164, 'en', 'Refunds', 'Refunds', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1165, 'en', 'Refund Requests', 'Refund Requests', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1166, 'en', 'Approved Refund', 'Approved Refund', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1167, 'en', 'Refund Configuration', 'Refund Configuration', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1168, 'en', 'Customers', 'Customers', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1169, 'en', 'Customer list', 'Customer list', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1170, 'en', 'Classified Products', 'Classified Products', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1171, 'en', 'Classified Packages', 'Classified Packages', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1172, 'en', 'Sellers', 'Sellers', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1173, 'en', 'All Seller', 'All Seller', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1174, 'en', 'Payouts', 'Payouts', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1175, 'en', 'Payout Requests', 'Payout Requests', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1176, 'en', 'Seller Commission', 'Seller Commission', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1177, 'en', 'Seller Packages', 'Seller Packages', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1178, 'en', 'Seller Verification Form', 'Seller Verification Form', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1179, 'en', 'Reports', 'Reports', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1180, 'en', 'In House Product Sale', 'In House Product Sale', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1181, 'en', 'Seller Products Sale', 'Seller Products Sale', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1182, 'en', 'Products Stock', 'Products Stock', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1183, 'en', 'Products wishlist', 'Products wishlist', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1184, 'en', 'User Searches', 'User Searches', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1185, 'en', 'Marketing', 'Marketing', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1186, 'en', 'Flash deals', 'Flash deals', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1187, 'en', 'Newsletters', 'Newsletters', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1188, 'en', 'Bulk SMS', 'Bulk SMS', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1189, 'en', 'Subscribers', 'Subscribers', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1190, 'en', 'Coupon', 'Coupon', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1191, 'en', 'Support', 'Support', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1192, 'en', 'Ticket', 'Ticket', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1193, 'en', 'Product Queries', 'Product Queries', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1194, 'en', 'Website Setup', 'Website Setup', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1195, 'en', 'Header', 'Header', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1196, 'en', 'Footer', 'Footer', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1197, 'en', 'Pages', 'Pages', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1198, 'en', 'Appearance', 'Appearance', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1199, 'en', 'Setup & Configurations', 'Setup & Configurations', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1200, 'en', 'General Settings', 'General Settings', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1201, 'en', 'Features activation', 'Features activation', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1202, 'en', 'Languages', 'Languages', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1203, 'en', 'Currency', 'Currency', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1204, 'en', 'Pickup point', 'Pickup point', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1205, 'en', 'SMTP Settings', 'SMTP Settings', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1206, 'en', 'Payment Methods', 'Payment Methods', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1207, 'en', 'File System Configuration', 'File System Configuration', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1208, 'en', 'Social media Logins', 'Social media Logins', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1209, 'en', 'Analytics Tools', 'Analytics Tools', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1210, 'en', 'Facebook Chat', 'Facebook Chat', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1211, 'en', 'Google reCAPTCHA', 'Google reCAPTCHA', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1212, 'en', 'Shipping Configuration', 'Shipping Configuration', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1213, 'en', 'Shipping Countries', 'Shipping Countries', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1214, 'en', 'Affiliate System', 'Affiliate System', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1215, 'en', 'Affiliate Registration Form', 'Affiliate Registration Form', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1216, 'en', 'Affiliate Configurations', 'Affiliate Configurations', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1217, 'en', 'Affiliate Users', 'Affiliate Users', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1218, 'en', 'Referral Users', 'Referral Users', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1219, 'en', 'Affiliate Withdraw Requests', 'Affiliate Withdraw Requests', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1220, 'en', 'Offline Payment System', 'Offline Payment System', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1221, 'en', 'Manual Payment Methods', 'Manual Payment Methods', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1222, 'en', 'Offline Wallet Recharge', 'Offline Wallet Recharge', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1223, 'en', 'Offline Customer Package Payments', 'Offline Customer Package Payments', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1224, 'en', 'Offline Seller Package Payments', 'Offline Seller Package Payments', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1225, 'en', 'Paytm Payment Gateway', 'Paytm Payment Gateway', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1226, 'en', 'Set Paytm Credentials', 'Set Paytm Credentials', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1227, 'en', 'Club Point System', 'Club Point System', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1228, 'en', 'Club Point Configurations', 'Club Point Configurations', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1229, 'en', 'Set Product Point', 'Set Product Point', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1230, 'en', 'User Points', 'User Points', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1231, 'en', 'OTP System', 'OTP System', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1232, 'en', 'OTP Configurations', 'OTP Configurations', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1233, 'en', 'Set OTP Credentials', 'Set OTP Credentials', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1234, 'en', 'Staffs', 'Staffs', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1235, 'en', 'All staffs', 'All staffs', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1236, 'en', 'Staff permissions', 'Staff permissions', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1237, 'en', 'Addon Manager', 'Addon Manager', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1238, 'en', 'Browse Website', 'Browse Website', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1239, 'en', 'POS', 'POS', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1240, 'en', 'Notifications', 'Notifications', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1241, 'en', 'new orders', 'new orders', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1242, 'en', 'user-image', 'user-image', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1243, 'en', 'Profile', 'Profile', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1244, 'en', 'Logout', 'Logout', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1247, 'en', 'Page Not Found!', 'Page Not Found!', '2020-11-11 13:10:28', '2020-11-11 13:10:28'),
(1249, 'en', 'The page you are looking for has not been found on our server.', 'The page you are looking for has not been found on our server.', '2020-11-11 13:10:28', '2020-11-11 13:10:28'),
(1253, 'en', 'Registration', 'Registration', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1255, 'en', 'I am shopping for...', 'I am shopping for...', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1257, 'en', 'Compare', 'Compare', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1259, 'en', 'Wishlist', 'Wishlist', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1261, 'en', 'Cart', 'Cart', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1263, 'en', 'Your Cart is empty', 'Your Cart is empty', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1265, 'en', 'Categories', 'Categories', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1267, 'en', 'See All', 'See All', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1269, 'en', 'Seller Policy', 'Seller Policy', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1271, 'en', 'Return Policy', 'Return Policy', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1273, 'en', 'Support Policy', 'Support Policy', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1275, 'en', 'Privacy Policy', 'Privacy Policy', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1277, 'en', 'Your Email Address', 'Your Email Address', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1279, 'en', 'Subscribe', 'Subscribe', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1281, 'en', 'Contact Info', 'Contact Info', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1283, 'en', 'Address', 'Address', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1285, 'en', 'Phone', 'Phone', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1287, 'en', 'Email', 'Email', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1288, 'en', 'Login', 'Login', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1289, 'en', 'My Account', 'My Account', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1291, 'en', 'Login', 'Login', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1293, 'en', 'Order History', 'Order History', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1295, 'en', 'My Wishlist', 'My Wishlist', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1297, 'en', 'Track Order', 'Track Order', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1299, 'en', 'Be an affiliate partner', 'Be an affiliate partner', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1301, 'en', 'Be a Seller', 'Be a Seller', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1303, 'en', 'Apply Now', 'Apply Now', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1305, 'en', 'Confirmation', 'Confirmation', '2020-11-11 13:10:30', '2020-11-11 13:10:30');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(1307, 'en', 'Delete confirmation message', 'Delete confirmation message', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1309, 'en', 'Cancel', 'Cancel', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1312, 'en', 'Delete', 'Delete', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1313, 'en', 'Item has been added to compare list', 'Item has been added to compare list', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1314, 'en', 'Please login first', 'Please login first', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1315, 'en', 'Total Earnings From', 'Total Earnings From', '2020-11-12 08:01:11', '2020-11-12 08:01:11'),
(1316, 'en', 'Client Subscription', 'Client Subscription', '2020-11-12 08:01:12', '2020-11-12 08:01:12'),
(1317, 'en', 'Product category', 'Product category', '2020-11-12 08:03:46', '2020-11-12 08:03:46'),
(1318, 'en', 'Product sub sub category', 'Product sub sub category', '2020-11-12 08:03:46', '2020-11-12 08:03:46'),
(1319, 'en', 'Product sub category', 'Product sub category', '2020-11-12 08:03:46', '2020-11-12 08:03:46'),
(1320, 'en', 'Product brand', 'Product brand', '2020-11-12 08:03:46', '2020-11-12 08:03:46'),
(1321, 'en', 'Top Client Packages', 'Top Client Packages', '2020-11-12 08:05:21', '2020-11-12 08:05:21'),
(1322, 'en', 'Top Freelancer Packages', 'Top Freelancer Packages', '2020-11-12 08:05:21', '2020-11-12 08:05:21'),
(1323, 'en', 'Number of sale', 'Number of sale', '2020-11-12 09:13:09', '2020-11-12 09:13:09'),
(1324, 'en', 'Number of Stock', 'Number of Stock', '2020-11-12 09:16:02', '2020-11-12 09:16:02'),
(1325, 'en', 'Top 10 Products', 'Top 10 Products', '2020-11-12 10:02:29', '2020-11-12 10:02:29'),
(1326, 'en', 'Top 12 Products', 'Top 12 Products', '2020-11-12 10:02:39', '2020-11-12 10:02:39'),
(1327, 'en', 'Admin can not be a seller', 'Admin can not be a seller', '2020-11-12 11:30:19', '2020-11-12 11:30:19'),
(1328, 'en', 'Filter by Rating', 'Filter by Rating', '2020-11-15 08:01:15', '2020-11-15 08:01:15'),
(1329, 'en', 'Published reviews updated successfully', 'Published reviews updated successfully', '2020-11-15 08:01:15', '2020-11-15 08:01:15'),
(1330, 'en', 'Refund Sticker has been updated successfully', 'Refund Sticker has been updated successfully', '2020-11-15 08:17:12', '2020-11-15 08:17:12'),
(1331, 'en', 'Edit Product', 'Edit Product', '2020-11-15 10:31:54', '2020-11-15 10:31:54'),
(1332, 'en', 'Meta Images', 'Meta Images', '2020-11-15 10:32:12', '2020-11-15 10:32:12'),
(1333, 'en', 'Update Product', 'Update Product', '2020-11-15 10:32:12', '2020-11-15 10:32:12'),
(1334, 'en', 'Product has been deleted successfully', 'Product has been deleted successfully', '2020-11-15 10:32:57', '2020-11-15 10:32:57'),
(1335, 'en', 'Your Profile has been updated successfully!', 'Your Profile has been updated successfully!', '2020-11-15 11:10:42', '2020-11-15 11:10:42'),
(1336, 'en', 'Upload limit has been reached. Please upgrade your package.', 'Upload limit has been reached. Please upgrade your package.', '2020-11-15 11:13:45', '2020-11-15 11:13:45'),
(1337, 'en', 'Add Your Product', 'Add Your Product', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1338, 'en', 'Select a category', 'Select a category', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1339, 'en', 'Select a brand', 'Select a brand', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1340, 'en', 'Product Unit', 'Product Unit', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1341, 'en', 'Minimum Qty.', 'Minimum Qty.', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1342, 'en', 'Product Tag', 'Product Tag', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1343, 'en', 'Type & hit enter', 'Type & hit enter', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1344, 'en', 'Videos', 'Videos', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1345, 'en', 'Video From', 'Video From', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1346, 'en', 'Video URL', 'Video URL', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1347, 'en', 'Customer Choice', 'Customer Choice', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1348, 'en', 'PDF', 'PDF', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1349, 'en', 'Choose PDF', 'Choose PDF', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1350, 'en', 'Select Category', 'Select Category', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1351, 'en', 'Target Category', 'Target Category', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1352, 'en', 'subsubcategory', 'subsubcategory', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1353, 'en', 'Search Category', 'Search Category', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1354, 'en', 'Search SubCategory', 'Search SubCategory', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1355, 'en', 'Search SubSubCategory', 'Search SubSubCategory', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1356, 'en', 'Update your product', 'Update your product', '2020-11-15 11:39:14', '2020-11-15 11:39:14'),
(1357, 'en', 'Product has been updated successfully', 'Product has been updated successfully', '2020-11-15 11:51:36', '2020-11-15 11:51:36'),
(1358, 'en', 'Add Your Digital Product', 'Add Your Digital Product', '2020-11-15 12:24:21', '2020-11-15 12:24:21'),
(1359, 'en', 'Active eCommerce CMS Update Process', 'Active eCommerce CMS Update Process', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1361, 'en', 'Codecanyon purchase code', 'Codecanyon purchase code', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1362, 'en', 'Database Name', 'Database Name', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1363, 'en', 'Database Username', 'Database Username', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1364, 'en', 'Database Password', 'Database Password', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1365, 'en', 'Database Hostname', 'Database Hostname', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1366, 'en', 'Update Now', 'Update Now', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1368, 'en', 'Congratulations', 'Congratulations', '2020-11-16 07:55:14', '2020-11-16 07:55:14'),
(1369, 'en', 'You have successfully completed the updating process. Please Login to continue', 'You have successfully completed the updating process. Please Login to continue', '2020-11-16 07:55:14', '2020-11-16 07:55:14'),
(1370, 'en', 'Go to Home', 'Go to Home', '2020-11-16 07:55:14', '2020-11-16 07:55:14'),
(1371, 'en', 'Login to Admin panel', 'Login to Admin panel', '2020-11-16 07:55:14', '2020-11-16 07:55:14'),
(1372, 'en', 'S3 File System Credentials', 'S3 File System Credentials', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1373, 'en', 'AWS_ACCESS_KEY_ID', 'AWS_ACCESS_KEY_ID', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1374, 'en', 'AWS_SECRET_ACCESS_KEY', 'AWS_SECRET_ACCESS_KEY', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1375, 'en', 'AWS_DEFAULT_REGION', 'AWS_DEFAULT_REGION', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1376, 'en', 'AWS_BUCKET', 'AWS_BUCKET', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1377, 'en', 'AWS_URL', 'AWS_URL', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1378, 'en', 'S3 File System Activation', 'S3 File System Activation', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1379, 'en', 'Your phone number', 'Your phone number', '2020-11-17 05:50:10', '2020-11-17 05:50:10'),
(1380, 'en', 'Zip File', 'Zip File', '2020-11-17 06:58:45', '2020-11-17 06:58:45'),
(1381, 'en', 'Install', 'Install', '2020-11-17 06:58:45', '2020-11-17 06:58:45'),
(1382, 'en', 'This version is not capable of installing Addons, Please update.', 'This version is not capable of installing Addons, Please update.', '2020-11-17 06:59:11', '2020-11-17 06:59:11'),
(1383, 'bd', 'Welcome to', 'Welcome to', '2021-02-10 05:07:05', '2021-02-10 05:07:05'),
(1384, 'bd', 'Login to your account.', 'Login to your account.', '2021-02-10 05:07:05', '2021-02-10 05:07:05'),
(1385, 'bd', 'Email', 'Email', '2021-02-10 05:07:05', '2021-02-10 05:07:05'),
(1386, 'bd', 'Password', 'Password', '2021-02-10 05:07:05', '2021-02-10 05:07:05'),
(1387, 'bd', 'Remember Me', 'Remember Me', '2021-02-10 05:07:05', '2021-02-10 05:07:05'),
(1388, 'bd', 'Login', 'Login', '2021-02-10 05:07:05', '2021-02-10 05:07:05'),
(1389, 'bd', 'Invalid email or password', 'Invalid email or password', '2021-02-10 05:07:12', '2021-02-10 05:07:12'),
(1390, 'bd', 'Page Not Found!', 'Page Not Found!', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1391, 'bd', 'The page you are looking for has not been found on our server.', 'The page you are looking for has not been found on our server.', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1392, 'bd', 'Registration', 'Registration', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1393, 'bd', 'I am shopping for...', 'I am shopping for...', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1394, 'bd', 'Compare', 'Compare', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1395, 'bd', 'Wishlist', 'Wishlist', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1396, 'bd', 'Cart', 'Cart', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1397, 'bd', 'Your Cart is empty', 'Your Cart is empty', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1398, 'bd', 'Categories', 'Categories', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1399, 'bd', 'See All', 'See All', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1400, 'bd', 'Terms & conditions', 'Terms & conditions', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1401, 'bd', 'Return Policy', 'Return Policy', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1402, 'bd', 'Support Policy', 'Support Policy', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1403, 'bd', 'Privacy Policy', 'Privacy Policy', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1404, 'bd', 'Your Email Address', 'Your Email Address', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1405, 'bd', 'Subscribe', 'Subscribe', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1406, 'bd', 'Contact Info', 'Contact Info', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1407, 'bd', 'Address', 'Address', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1408, 'bd', 'Phone', 'Phone', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1409, 'bd', 'My Account', 'My Account', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1410, 'bd', 'Order History', 'Order History', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1411, 'bd', 'My Wishlist', 'My Wishlist', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1412, 'bd', 'Track Order', 'Track Order', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1413, 'bd', 'Be a Seller', 'Be a Seller', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1414, 'bd', 'Apply Now', 'Apply Now', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1415, 'bd', 'Confirmation', 'Confirmation', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1416, 'bd', 'Delete confirmation message', 'Delete confirmation message', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1417, 'bd', 'Cancel', 'Cancel', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1418, 'bd', 'Delete', 'Delete', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1419, 'bd', 'Item has been added to compare list', 'Item has been added to compare list', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1420, 'bd', 'Please login first', 'Please login first', '2021-02-10 05:08:12', '2021-02-10 05:08:12'),
(1421, 'bd', 'Top 10 Categories', 'Top 10 Categories', '2021-02-10 05:08:19', '2021-02-10 05:08:19'),
(1422, 'bd', 'View All Categories', 'View All Categories', '2021-02-10 05:08:19', '2021-02-10 05:08:19'),
(1423, 'bd', 'Top 10 Brands', 'Top 10 Brands', '2021-02-10 05:08:19', '2021-02-10 05:08:19'),
(1424, 'bd', 'View All Brands', 'View All Brands', '2021-02-10 05:08:19', '2021-02-10 05:08:19'),
(1425, 'bd', 'Best Sellers', 'Best Sellers', '2021-02-10 05:08:20', '2021-02-10 05:08:20'),
(1426, 'bd', 'Best Selling', 'Best Selling', '2021-02-10 05:08:20', '2021-02-10 05:08:20'),
(1427, 'bd', 'Top 20', 'Top 20', '2021-02-10 05:08:20', '2021-02-10 05:08:20'),
(1428, 'bd', 'Featured Products', 'Featured Products', '2021-02-10 05:08:20', '2021-02-10 05:08:20'),
(1429, 'bd', 'Visit Store', 'Visit Store', '2021-02-10 05:08:20', '2021-02-10 05:08:20'),
(1430, 'bd', 'Forgot password?', 'Forgot password?', '2021-02-10 05:08:25', '2021-02-10 05:08:25'),
(1431, 'bd', 'Dont have an account?', 'Dont have an account?', '2021-02-10 05:08:25', '2021-02-10 05:08:25'),
(1432, 'bd', 'Register Now', 'Register Now', '2021-02-10 05:08:25', '2021-02-10 05:08:25'),
(1433, 'bd', 'Enter your email address to recover your password.', 'Enter your email address to recover your password.', '2021-02-10 05:08:34', '2021-02-10 05:08:34'),
(1434, 'bd', 'Send Password Reset Link', 'Send Password Reset Link', '2021-02-10 05:08:34', '2021-02-10 05:08:34'),
(1435, 'bd', 'Back to Login', 'Back to Login', '2021-02-10 05:08:34', '2021-02-10 05:08:34'),
(1436, 'bd', 'Password Reset', 'Password Reset', '2021-02-10 05:08:38', '2021-02-10 05:08:38'),
(1437, 'bd', 'Something went wrong!', 'Something went wrong!', '2021-02-10 05:08:38', '2021-02-10 05:08:38'),
(1438, 'bd', 'Sorry for the inconvenience, but we\'re working on it.', 'Sorry for the inconvenience, but we\'re working on it.', '2021-02-10 05:08:38', '2021-02-10 05:08:38'),
(1439, 'bd', 'Error code', 'Error code', '2021-02-10 05:08:38', '2021-02-10 05:08:38'),
(1440, 'bd', 'My Panel', 'My Panel', '2021-02-10 05:09:12', '2021-02-10 05:09:12'),
(1441, 'bd', 'Logout', 'Logout', '2021-02-10 05:09:12', '2021-02-10 05:09:12'),
(1442, 'bd', 'Please Configure SMTP Setting to work all email sending functionality', 'Please Configure SMTP Setting to work all email sending functionality', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1443, 'bd', 'Configure Now', 'Configure Now', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1444, 'bd', 'Total', 'Total', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1445, 'bd', 'Customer', 'Customer', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1446, 'bd', 'Order', 'Order', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1447, 'bd', 'Product category', 'Product category', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1448, 'bd', 'Product brand', 'Product brand', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1449, 'bd', 'Products', 'Products', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1450, 'bd', 'Sellers', 'Sellers', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1451, 'bd', 'Category wise product sale', 'Category wise product sale', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1452, 'bd', 'Category wise product stock', 'Category wise product stock', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1453, 'bd', 'Top 12 Products', 'Top 12 Products', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1454, 'bd', 'Total published products', 'Total published products', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1455, 'bd', 'Total sellers products', 'Total sellers products', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1456, 'bd', 'Total admin products', 'Total admin products', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1457, 'bd', 'Total sellers', 'Total sellers', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1458, 'bd', 'Total approved sellers', 'Total approved sellers', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1459, 'bd', 'Total pending sellers', 'Total pending sellers', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1460, 'bd', 'Number of sale', 'Number of sale', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1461, 'bd', 'Number of Stock', 'Number of Stock', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1462, 'bd', 'Search in menu', 'Search in menu', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1463, 'bd', 'Dashboard', 'Dashboard', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1464, 'bd', 'Add New product', 'Add New product', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1465, 'bd', 'All Products', 'All Products', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1466, 'bd', 'In House Products', 'In House Products', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1467, 'bd', 'Seller Products', 'Seller Products', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1468, 'bd', 'Digital Products', 'Digital Products', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1469, 'bd', 'Bulk Import', 'Bulk Import', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1470, 'bd', 'Bulk Export', 'Bulk Export', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1471, 'bd', 'Category', 'Category', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1472, 'bd', 'Brand', 'Brand', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1473, 'bd', 'Attribute', 'Attribute', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1474, 'bd', 'Product Reviews', 'Product Reviews', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1475, 'bd', 'Sales', 'Sales', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1476, 'bd', 'All Orders', 'All Orders', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1477, 'bd', 'Inhouse orders', 'Inhouse orders', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1478, 'bd', 'Seller Orders', 'Seller Orders', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1479, 'bd', 'Pick-up Point Order', 'Pick-up Point Order', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1480, 'bd', 'Customers', 'Customers', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1481, 'bd', 'Customer list', 'Customer list', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1482, 'bd', 'All Seller', 'All Seller', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1483, 'bd', 'Payouts', 'Payouts', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1484, 'bd', 'Payout Requests', 'Payout Requests', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1485, 'bd', 'Seller Commission', 'Seller Commission', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1486, 'bd', 'Seller Verification Form', 'Seller Verification Form', '2021-02-10 05:09:16', '2021-02-10 05:09:16'),
(1487, 'bd', 'Uploaded Files', 'Uploaded Files', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1488, 'bd', 'Reports', 'Reports', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1489, 'bd', 'In House Product Sale', 'In House Product Sale', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1490, 'bd', 'Seller Products Sale', 'Seller Products Sale', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1491, 'bd', 'Products Stock', 'Products Stock', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1492, 'bd', 'Products wishlist', 'Products wishlist', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1493, 'bd', 'User Searches', 'User Searches', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1494, 'bd', 'Marketing', 'Marketing', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1495, 'bd', 'Flash deals', 'Flash deals', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1496, 'bd', 'Newsletters', 'Newsletters', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1497, 'bd', 'Subscribers', 'Subscribers', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1498, 'bd', 'Coupon', 'Coupon', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1499, 'bd', 'Support', 'Support', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1500, 'bd', 'Ticket', 'Ticket', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1501, 'bd', 'Product Queries', 'Product Queries', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1502, 'bd', 'Website Setup', 'Website Setup', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1503, 'bd', 'Header', 'Header', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1504, 'bd', 'Footer', 'Footer', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1505, 'bd', 'Pages', 'Pages', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1506, 'bd', 'Appearance', 'Appearance', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1507, 'bd', 'Setup & Configurations', 'Setup & Configurations', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1508, 'bd', 'General Settings', 'General Settings', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1509, 'bd', 'Features activation', 'Features activation', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1510, 'bd', 'Languages', 'Languages', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1511, 'bd', 'Currency', 'Currency', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1512, 'bd', 'Pickup point', 'Pickup point', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1513, 'bd', 'SMTP Settings', 'SMTP Settings', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1514, 'bd', 'Payment Methods', 'Payment Methods', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1515, 'bd', 'File System Configuration', 'File System Configuration', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1516, 'bd', 'Social media Logins', 'Social media Logins', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1517, 'bd', 'Analytics Tools', 'Analytics Tools', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1518, 'bd', 'Facebook Chat', 'Facebook Chat', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1519, 'bd', 'Google reCAPTCHA', 'Google reCAPTCHA', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1520, 'bd', 'Shipping Configuration', 'Shipping Configuration', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1521, 'bd', 'Shipping Countries', 'Shipping Countries', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1522, 'bd', 'Shipping Cities', 'Shipping Cities', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1523, 'bd', 'Staffs', 'Staffs', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1524, 'bd', 'All staffs', 'All staffs', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1525, 'bd', 'Staff permissions', 'Staff permissions', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1526, 'bd', 'System', 'System', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1527, 'bd', 'Update', 'Update', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1528, 'bd', 'Server status', 'Server status', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1529, 'bd', 'Addon Manager', 'Addon Manager', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1530, 'bd', 'Browse Website', 'Browse Website', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1531, 'bd', 'Notifications', 'Notifications', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1532, 'bd', 'Profile', 'Profile', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1533, 'bd', 'Nothing Found', 'Nothing Found', '2021-02-10 05:09:17', '2021-02-10 05:09:17'),
(1534, 'bd', 'General', 'General', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1535, 'bd', 'Frontend Website Name', 'Frontend Website Name', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1536, 'bd', 'Website Name', 'Website Name', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1537, 'bd', 'Site Motto', 'Site Motto', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1538, 'bd', 'Best eCommerce Website', 'Best eCommerce Website', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1539, 'bd', 'Site Icon', 'Site Icon', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1540, 'bd', 'Browse', 'Browse', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1541, 'bd', 'Choose File', 'Choose File', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1542, 'bd', 'Website favicon. 32x32 .png', 'Website favicon. 32x32 .png', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1543, 'bd', 'Website Base Color', 'Website Base Color', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1544, 'bd', 'Hex Color Code', 'Hex Color Code', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1545, 'bd', 'Website Base Hover Color', 'Website Base Hover Color', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1546, 'bd', 'Global SEO', 'Global SEO', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1547, 'bd', 'Meta Title', 'Meta Title', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1548, 'bd', 'Meta description', 'Meta description', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1549, 'bd', 'Keywords', 'Keywords', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1550, 'bd', 'Separate with coma', 'Separate with coma', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1551, 'bd', 'Meta Image', 'Meta Image', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1552, 'bd', 'Cookies Agreement', 'Cookies Agreement', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1553, 'bd', 'Cookies Agreement Text', 'Cookies Agreement Text', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1554, 'bd', 'Show Cookies Agreement?', 'Show Cookies Agreement?', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1555, 'bd', 'Custom Script', 'Custom Script', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1556, 'bd', 'Header custom script - before </head>', 'Header custom script - before </head>', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1557, 'bd', 'Write script with <script> tag', 'Write script with <script> tag', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1558, 'bd', 'Footer custom script - before </body>', 'Footer custom script - before </body>', '2021-02-10 05:09:26', '2021-02-10 05:09:26'),
(1559, 'bd', 'Website Pages', 'Website Pages', '2021-02-10 05:09:29', '2021-02-10 05:09:29'),
(1560, 'bd', 'All Pages', 'All Pages', '2021-02-10 05:09:29', '2021-02-10 05:09:29'),
(1561, 'bd', 'Add New Page', 'Add New Page', '2021-02-10 05:09:29', '2021-02-10 05:09:29'),
(1562, 'bd', 'Name', 'Name', '2021-02-10 05:09:29', '2021-02-10 05:09:29'),
(1563, 'bd', 'URL', 'URL', '2021-02-10 05:09:29', '2021-02-10 05:09:29'),
(1564, 'bd', 'Actions', 'Actions', '2021-02-10 05:09:29', '2021-02-10 05:09:29'),
(1565, 'bd', 'Delete Confirmation', 'Delete Confirmation', '2021-02-10 05:09:29', '2021-02-10 05:09:29'),
(1566, 'bd', 'Are you sure to delete this?', 'Are you sure to delete this?', '2021-02-10 05:09:29', '2021-02-10 05:09:29'),
(1567, 'bd', 'Website Footer', 'Website Footer', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1568, 'bd', 'Footer Widget', 'Footer Widget', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1569, 'bd', 'About Widget', 'About Widget', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1570, 'bd', 'Footer Logo', 'Footer Logo', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1571, 'bd', 'About description', 'About description', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1572, 'bd', 'Contact Info Widget', 'Contact Info Widget', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1573, 'bd', 'Contact address', 'Contact address', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1574, 'bd', 'Contact phone', 'Contact phone', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1575, 'bd', 'Contact email', 'Contact email', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1576, 'bd', 'Link Widget One', 'Link Widget One', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1577, 'bd', 'Title', 'Title', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1578, 'bd', 'Links', 'Links', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1579, 'bd', 'Add New', 'Add New', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1580, 'bd', 'Footer Bottom', 'Footer Bottom', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1581, 'bd', 'Copyright Widget ', 'Copyright Widget ', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1582, 'bd', 'Copyright Text', 'Copyright Text', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1583, 'bd', 'Social Link Widget ', 'Social Link Widget ', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1584, 'bd', 'Show Social Links?', 'Show Social Links?', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1585, 'bd', 'Social Links', 'Social Links', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1586, 'bd', 'Payment Methods Widget ', 'Payment Methods Widget ', '2021-02-10 05:09:33', '2021-02-10 05:09:33'),
(1587, 'bd', 'Website Header', 'Website Header', '2021-02-10 05:09:44', '2021-02-10 05:09:44'),
(1588, 'bd', 'Header Setting', 'Header Setting', '2021-02-10 05:09:44', '2021-02-10 05:09:44'),
(1589, 'bd', 'Header Logo', 'Header Logo', '2021-02-10 05:09:45', '2021-02-10 05:09:45'),
(1590, 'bd', 'Show Language Switcher?', 'Show Language Switcher?', '2021-02-10 05:09:45', '2021-02-10 05:09:45'),
(1591, 'bd', 'Show Currency Switcher?', 'Show Currency Switcher?', '2021-02-10 05:09:45', '2021-02-10 05:09:45'),
(1592, 'bd', 'Enable stikcy header?', 'Enable stikcy header?', '2021-02-10 05:09:45', '2021-02-10 05:09:45'),
(1593, 'bd', 'All cities', 'All cities', '2021-02-10 05:09:55', '2021-02-10 05:09:55'),
(1594, 'bd', 'Cities', 'Cities', '2021-02-10 05:09:55', '2021-02-10 05:09:55'),
(1595, 'bd', 'Type name & Enter', 'Type name & Enter', '2021-02-10 05:09:55', '2021-02-10 05:09:55'),
(1596, 'bd', 'Country', 'Country', '2021-02-10 05:09:55', '2021-02-10 05:09:55'),
(1597, 'bd', 'Cost', 'Cost', '2021-02-10 05:09:55', '2021-02-10 05:09:55'),
(1598, 'bd', 'Options', 'Options', '2021-02-10 05:09:55', '2021-02-10 05:09:55'),
(1599, 'bd', 'Add New city', 'Add New city', '2021-02-10 05:09:55', '2021-02-10 05:09:55'),
(1600, 'bd', 'Save', 'Save', '2021-02-10 05:09:55', '2021-02-10 05:09:55'),
(1601, 'bd', 'Countries', 'Countries', '2021-02-10 05:09:58', '2021-02-10 05:09:58'),
(1602, 'bd', 'Code', 'Code', '2021-02-10 05:09:58', '2021-02-10 05:09:58'),
(1603, 'bd', 'Show/Hide', 'Show/Hide', '2021-02-10 05:09:58', '2021-02-10 05:09:58'),
(1604, 'bd', 'Country status updated successfully', 'Country status updated successfully', '2021-02-10 05:09:58', '2021-02-10 05:09:58'),
(1605, 'bd', 'Something went wrong', 'Something went wrong', '2021-02-10 05:09:58', '2021-02-10 05:09:58'),
(1606, 'bd', 'Select Shipping Method', 'Select Shipping Method', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1607, 'bd', 'Product Wise Shipping Cost', 'Product Wise Shipping Cost', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1608, 'bd', 'Flat Rate Shipping Cost', 'Flat Rate Shipping Cost', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1609, 'bd', 'Seller Wise Flat Shipping Cost', 'Seller Wise Flat Shipping Cost', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1610, 'bd', 'Area Wise Flat Shipping Cost', 'Area Wise Flat Shipping Cost', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1611, 'bd', 'Note', 'Note', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1612, 'bd', 'Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost', 'Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1613, 'bd', 'Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed', 'Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1614, 'bd', 'Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If customers purchase 2 product from two seller shipping cost is calculated by addition of each seller flat shipping cost', 'Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If customers purchase 2 product from two seller shipping cost is calculated by addition of each seller flat shipping cost', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1615, 'bd', 'Area Wise Flat Shipping Cost calulation: Fixed rate for each area. If customers purchase multiple products from one seller shipping cost is calculated by the customer shipping area. To configure area wise shipping cost go to ', 'Area Wise Flat Shipping Cost calulation: Fixed rate for each area. If customers purchase multiple products from one seller shipping cost is calculated by the customer shipping area. To configure area wise shipping cost go to ', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1616, 'bd', 'Flat Rate Cost', 'Flat Rate Cost', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1617, 'bd', '1. Flat rate shipping cost is applicable if Flat rate shipping is enabled.', '1. Flat rate shipping cost is applicable if Flat rate shipping is enabled.', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1618, 'bd', 'Shipping Cost for Admin Products', 'Shipping Cost for Admin Products', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1619, 'bd', '1. Shipping cost for admin is applicable if Seller wise shipping cost is enabled.', '1. Shipping cost for admin is applicable if Seller wise shipping cost is enabled.', '2021-02-10 05:10:01', '2021-02-10 05:10:01'),
(1620, 'bd', 'All Pick-up Points', 'All Pick-up Points', '2021-02-10 05:11:09', '2021-02-10 05:11:09'),
(1621, 'bd', 'Add New Pick-up Point', 'Add New Pick-up Point', '2021-02-10 05:11:09', '2021-02-10 05:11:09'),
(1622, 'bd', 'Brands', 'Brands', '2021-02-10 05:11:09', '2021-02-10 05:11:09'),
(1623, 'bd', 'Manager', 'Manager', '2021-02-10 05:11:09', '2021-02-10 05:11:09'),
(1624, 'bd', 'Location', 'Location', '2021-02-10 05:11:09', '2021-02-10 05:11:09'),
(1625, 'bd', 'Pickup Station Contact', 'Pickup Station Contact', '2021-02-10 05:11:09', '2021-02-10 05:11:09'),
(1626, 'bd', 'Status', 'Status', '2021-02-10 05:11:09', '2021-02-10 05:11:09'),
(1627, 'bd', 'New Password', 'New Password', '2021-02-10 05:11:55', '2021-02-10 05:11:55'),
(1628, 'bd', 'Confirm Password', 'Confirm Password', '2021-02-10 05:11:55', '2021-02-10 05:11:55'),
(1629, 'bd', 'Avatar', 'Avatar', '2021-02-10 05:11:55', '2021-02-10 05:11:55'),
(1630, 'bd', 'Select File', 'Select File', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1631, 'bd', 'Upload New', 'Upload New', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1632, 'bd', 'Sort by newest', 'Sort by newest', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1633, 'bd', 'Sort by oldest', 'Sort by oldest', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1634, 'bd', 'Sort by smallest', 'Sort by smallest', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1635, 'bd', 'Sort by largest', 'Sort by largest', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1636, 'bd', 'Selected Only', 'Selected Only', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1637, 'bd', 'Search your files', 'Search your files', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1638, 'bd', 'No files found', 'No files found', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1639, 'bd', '0 File selected', '0 File selected', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1640, 'bd', 'Clear', 'Clear', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1641, 'bd', 'Prev', 'Prev', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1642, 'bd', 'Next', 'Next', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1643, 'bd', 'Add Files', 'Add Files', '2021-02-10 05:12:14', '2021-02-10 05:12:14'),
(1644, 'bd', 'Your Profile has been updated successfully!', 'Your Profile has been updated successfully!', '2021-02-10 05:13:03', '2021-02-10 05:13:03'),
(1645, 'bd', 'Product Information', 'Product Information', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1646, 'bd', 'Product Name', 'Product Name', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1647, 'bd', 'Unit', 'Unit', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1648, 'bd', 'Unit (e.g. KG, Pc etc)', 'Unit (e.g. KG, Pc etc)', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1649, 'bd', 'Minimum Qty', 'Minimum Qty', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1650, 'bd', 'Tags', 'Tags', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1651, 'bd', 'Type and hit enter to add a tag', 'Type and hit enter to add a tag', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1652, 'bd', 'This is used for search. Input those words by which cutomer can find this product.', 'This is used for search. Input those words by which cutomer can find this product.', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1653, 'bd', 'Product Images', 'Product Images', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1654, 'bd', 'Gallery Images', 'Gallery Images', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1655, 'bd', 'These images are visible in product details page gallery. Use 600x600 sizes images.', 'These images are visible in product details page gallery. Use 600x600 sizes images.', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1656, 'bd', 'Thumbnail Image', 'Thumbnail Image', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1657, 'bd', 'This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.', 'This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1658, 'bd', 'Product Videos', 'Product Videos', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1659, 'bd', 'Video Provider', 'Video Provider', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1660, 'bd', 'Youtube', 'Youtube', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1661, 'bd', 'Dailymotion', 'Dailymotion', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1662, 'bd', 'Vimeo', 'Vimeo', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1663, 'bd', 'Video Link', 'Video Link', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1664, 'bd', 'Use proper link without extra parameter. Don\'t use short share link/embeded iframe code.', 'Use proper link without extra parameter. Don\'t use short share link/embeded iframe code.', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1665, 'bd', 'Product Variation', 'Product Variation', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1666, 'bd', 'Colors', 'Colors', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1667, 'bd', 'Attributes', 'Attributes', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1668, 'bd', 'Choose Attributes', 'Choose Attributes', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1669, 'bd', 'Choose the attributes of this product and then input values of each attribute', 'Choose the attributes of this product and then input values of each attribute', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1670, 'bd', 'Product price + stock', 'Product price + stock', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1671, 'bd', 'Unit price', 'Unit price', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1672, 'bd', 'Purchase price', 'Purchase price', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1673, 'bd', 'Tax', 'Tax', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1674, 'bd', 'Flat', 'Flat', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1675, 'bd', 'Percent', 'Percent', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1676, 'bd', 'Discount', 'Discount', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1677, 'bd', 'Quantity', 'Quantity', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1678, 'bd', 'Product Description', 'Product Description', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1679, 'bd', 'Description', 'Description', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1680, 'bd', 'Product Shipping Cost', 'Product Shipping Cost', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1681, 'bd', 'Free Shipping', 'Free Shipping', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1682, 'bd', 'Flat Rate', 'Flat Rate', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1683, 'bd', 'Shipping cost', 'Shipping cost', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1684, 'bd', 'PDF Specification', 'PDF Specification', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1685, 'bd', 'SEO Meta Tags', 'SEO Meta Tags', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1686, 'bd', 'Save Product', 'Save Product', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1687, 'bd', 'Choice Title', 'Choice Title', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1688, 'bd', 'Enter choice values', 'Enter choice values', '2021-02-10 05:13:11', '2021-02-10 05:13:11'),
(1689, 'bd', 'All Product', 'All Product', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1690, 'bd', 'All Sellers', 'All Sellers', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1691, 'bd', 'Sort By', 'Sort By', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1692, 'bd', 'Rating (High > Low)', 'Rating (High > Low)', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1693, 'bd', 'Rating (Low > High)', 'Rating (Low > High)', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1694, 'bd', 'Num of Sale (High > Low)', 'Num of Sale (High > Low)', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1695, 'bd', 'Num of Sale (Low > High)', 'Num of Sale (Low > High)', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1696, 'bd', 'Base Price (High > Low)', 'Base Price (High > Low)', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1697, 'bd', 'Base Price (Low > High)', 'Base Price (Low > High)', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1698, 'bd', 'Type & Enter', 'Type & Enter', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1699, 'bd', 'Added By', 'Added By', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1700, 'bd', 'Num of Sale', 'Num of Sale', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1701, 'bd', 'Total Stock', 'Total Stock', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1702, 'bd', 'Base Price', 'Base Price', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1703, 'bd', 'Todays Deal', 'Todays Deal', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1704, 'bd', 'Rating', 'Rating', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1705, 'bd', 'Published', 'Published', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1706, 'bd', 'Featured', 'Featured', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1707, 'bd', 'Todays Deal updated successfully', 'Todays Deal updated successfully', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1708, 'bd', 'Published products updated successfully', 'Published products updated successfully', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1709, 'bd', 'Featured products updated successfully', 'Featured products updated successfully', '2021-02-10 05:13:13', '2021-02-10 05:13:13'),
(1710, 'bd', 'Add New Digital Product', 'Add New Digital Product', '2021-02-10 05:13:17', '2021-02-10 05:13:17'),
(1711, 'bd', 'Photo', 'Photo', '2021-02-10 05:13:17', '2021-02-10 05:13:17'),
(1712, 'bd', 'Product Bulk Upload', 'Product Bulk Upload', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1713, 'bd', 'Step 1', 'Step 1', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1714, 'bd', 'Download the skeleton file and fill it with proper data', 'Download the skeleton file and fill it with proper data', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1715, 'bd', 'You can download the example file to understand how the data must be filled', 'You can download the example file to understand how the data must be filled', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1716, 'bd', 'Once you have downloaded and filled the skeleton file, upload it in the form below and submit', 'Once you have downloaded and filled the skeleton file, upload it in the form below and submit', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1717, 'bd', 'After uploading products you need to edit them and set product\'s images and choices', 'After uploading products you need to edit them and set product\'s images and choices', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1718, 'bd', 'Download CSV', 'Download CSV', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1719, 'bd', 'Step 2', 'Step 2', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1720, 'bd', 'Category and Brand should be in numerical id', 'Category and Brand should be in numerical id', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1721, 'bd', 'You can download the pdf to get Category and Brand id', 'You can download the pdf to get Category and Brand id', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1722, 'bd', 'Download Category', 'Download Category', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1723, 'bd', 'Download Brand', 'Download Brand', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1724, 'bd', 'Upload Product File', 'Upload Product File', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1725, 'bd', 'Upload CSV', 'Upload CSV', '2021-02-10 05:13:18', '2021-02-10 05:13:18'),
(1726, 'bd', 'All categories', 'All categories', '2021-02-10 05:13:27', '2021-02-10 05:13:27'),
(1727, 'bd', 'Add New category', 'Add New category', '2021-02-10 05:13:27', '2021-02-10 05:13:27'),
(1728, 'bd', 'Parent Category', 'Parent Category', '2021-02-10 05:13:27', '2021-02-10 05:13:27'),
(1729, 'bd', 'Level', 'Level', '2021-02-10 05:13:27', '2021-02-10 05:13:27'),
(1730, 'bd', 'Banner', 'Banner', '2021-02-10 05:13:27', '2021-02-10 05:13:27'),
(1731, 'bd', 'Icon', 'Icon', '2021-02-10 05:13:27', '2021-02-10 05:13:27'),
(1732, 'bd', 'Commission', 'Commission', '2021-02-10 05:13:27', '2021-02-10 05:13:27'),
(1733, 'bd', 'Edit', 'Edit', '2021-02-10 05:13:27', '2021-02-10 05:13:27'),
(1734, 'bd', 'Featured categories updated successfully', 'Featured categories updated successfully', '2021-02-10 05:13:27', '2021-02-10 05:13:27'),
(1735, 'bd', 'All Brands', 'All Brands', '2021-02-10 05:13:30', '2021-02-10 05:13:30'),
(1736, 'bd', 'Logo', 'Logo', '2021-02-10 05:13:30', '2021-02-10 05:13:30'),
(1737, 'bd', 'Add New Brand', 'Add New Brand', '2021-02-10 05:13:30', '2021-02-10 05:13:30'),
(1738, 'bd', '120x80', '120x80', '2021-02-10 05:13:30', '2021-02-10 05:13:30'),
(1739, 'bd', 'Installed Addon', 'Installed Addon', '2021-02-10 05:18:37', '2021-02-10 05:18:37'),
(1740, 'bd', 'Available Addon', 'Available Addon', '2021-02-10 05:18:37', '2021-02-10 05:18:37'),
(1741, 'bd', 'Install/Update Addon', 'Install/Update Addon', '2021-02-10 05:18:37', '2021-02-10 05:18:37'),
(1742, 'bd', 'No Addon Installed', 'No Addon Installed', '2021-02-10 05:18:37', '2021-02-10 05:18:37'),
(1743, 'bd', 'Status updated successfully', 'Status updated successfully', '2021-02-10 05:18:37', '2021-02-10 05:18:37'),
(1744, 'bd', 'All Attributes', 'All Attributes', '2021-02-10 05:24:47', '2021-02-10 05:24:47'),
(1745, 'bd', 'Add New Attribute', 'Add New Attribute', '2021-02-10 05:24:47', '2021-02-10 05:24:47'),
(1746, 'bd', 'Google reCAPTCHA Setting', 'Google reCAPTCHA Setting', '2021-02-10 05:32:40', '2021-02-10 05:32:40'),
(1747, 'bd', 'Site KEY', 'Site KEY', '2021-02-10 05:32:40', '2021-02-10 05:32:40'),
(1748, 'bd', 'Facebook Chat Setting', 'Facebook Chat Setting', '2021-02-10 05:33:29', '2021-02-10 05:33:29'),
(1749, 'bd', 'Facebook Page ID', 'Facebook Page ID', '2021-02-10 05:33:29', '2021-02-10 05:33:29'),
(1750, 'bd', 'Please be carefull when you are configuring Facebook chat. For incorrect configuration you will not get messenger icon on your user-end site.', 'Please be carefull when you are configuring Facebook chat. For incorrect configuration you will not get messenger icon on your user-end site.', '2021-02-10 05:33:29', '2021-02-10 05:33:29'),
(1751, 'bd', 'Login into your facebook page', 'Login into your facebook page', '2021-02-10 05:33:29', '2021-02-10 05:33:29'),
(1752, 'bd', 'Find the About option of your facebook page', 'Find the About option of your facebook page', '2021-02-10 05:33:29', '2021-02-10 05:33:29'),
(1753, 'bd', 'At the very bottom, you can find the \\“Facebook Page ID\\”', 'At the very bottom, you can find the \\“Facebook Page ID\\”', '2021-02-10 05:33:29', '2021-02-10 05:33:29'),
(1754, 'bd', 'Go to Settings of your page and find the option of \\\"Advance Messaging\\\"', 'Go to Settings of your page and find the option of \\\"Advance Messaging\\\"', '2021-02-10 05:33:29', '2021-02-10 05:33:29'),
(1755, 'bd', 'Scroll down that page and you will get \\\"white listed domain\\\"', 'Scroll down that page and you will get \\\"white listed domain\\\"', '2021-02-10 05:33:29', '2021-02-10 05:33:29'),
(1756, 'bd', 'Set your website domain name', 'Set your website domain name', '2021-02-10 05:33:29', '2021-02-10 05:33:29'),
(1757, 'bd', 'Facebook Pixel Setting', 'Facebook Pixel Setting', '2021-02-10 05:33:35', '2021-02-10 05:33:35'),
(1758, 'bd', 'Facebook Pixel', 'Facebook Pixel', '2021-02-10 05:33:35', '2021-02-10 05:33:35'),
(1759, 'bd', 'Facebook Pixel ID', 'Facebook Pixel ID', '2021-02-10 05:33:35', '2021-02-10 05:33:35'),
(1760, 'bd', 'Please be carefull when you are configuring Facebook pixel.', 'Please be carefull when you are configuring Facebook pixel.', '2021-02-10 05:33:35', '2021-02-10 05:33:35'),
(1761, 'bd', 'Log in to Facebook and go to your Ads Manager account', 'Log in to Facebook and go to your Ads Manager account', '2021-02-10 05:33:35', '2021-02-10 05:33:35'),
(1762, 'bd', 'Open the Navigation Bar and select Events Manager', 'Open the Navigation Bar and select Events Manager', '2021-02-10 05:33:35', '2021-02-10 05:33:35'),
(1763, 'bd', 'Copy your Pixel ID from underneath your Site Name and paste the number into Facebook Pixel ID field', 'Copy your Pixel ID from underneath your Site Name and paste the number into Facebook Pixel ID field', '2021-02-10 05:33:35', '2021-02-10 05:33:35'),
(1764, 'bd', 'Google Analytics Setting', 'Google Analytics Setting', '2021-02-10 05:33:35', '2021-02-10 05:33:35'),
(1765, 'bd', 'Google Analytics', 'Google Analytics', '2021-02-10 05:33:35', '2021-02-10 05:33:35'),
(1766, 'bd', 'Tracking ID', 'Tracking ID', '2021-02-10 05:33:35', '2021-02-10 05:33:35'),
(1767, 'bd', 'HTTPS Activation', 'HTTPS Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1768, 'bd', 'Maintenance Mode', 'Maintenance Mode', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1769, 'bd', 'Maintenance Mode Activation', 'Maintenance Mode Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1770, 'bd', 'Classified Product Activate', 'Classified Product Activate', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1771, 'bd', 'Classified Product', 'Classified Product', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1772, 'bd', 'Business Related', 'Business Related', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1773, 'bd', 'Vendor System Activation', 'Vendor System Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1774, 'bd', 'Wallet System Activation', 'Wallet System Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1775, 'bd', 'Coupon System Activation', 'Coupon System Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1776, 'bd', 'Pickup Point Activation', 'Pickup Point Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1777, 'bd', 'Conversation Activation', 'Conversation Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1778, 'bd', 'Guest Checkout Activation', 'Guest Checkout Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1779, 'bd', 'Category-based Commission', 'Category-based Commission', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1780, 'bd', 'After activate this option Seller commision will be disabled and You need to set commission on each category otherwise Admin will not get any commision', 'After activate this option Seller commision will be disabled and You need to set commission on each category otherwise Admin will not get any commision', '2021-02-10 05:33:39', '2021-02-10 05:33:39');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(1781, 'bd', 'Set Commisssion Now', 'Set Commisssion Now', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1782, 'bd', 'Email Verification', 'Email Verification', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1783, 'bd', 'Payment Related', 'Payment Related', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1784, 'bd', 'Paypal Payment Activation', 'Paypal Payment Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1785, 'bd', 'You need to configure Paypal correctly to enable this feature', 'You need to configure Paypal correctly to enable this feature', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1786, 'bd', 'Stripe Payment Activation', 'Stripe Payment Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1787, 'bd', 'SSlCommerz Activation', 'SSlCommerz Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1788, 'bd', 'Instamojo Payment Activation', 'Instamojo Payment Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1789, 'bd', 'You need to configure Instamojo Payment correctly to enable this feature', 'You need to configure Instamojo Payment correctly to enable this feature', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1790, 'bd', 'Razor Pay Activation', 'Razor Pay Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1791, 'bd', 'You need to configure Razor correctly to enable this feature', 'You need to configure Razor correctly to enable this feature', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1792, 'bd', 'PayStack Activation', 'PayStack Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1793, 'bd', 'You need to configure PayStack correctly to enable this feature', 'You need to configure PayStack correctly to enable this feature', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1794, 'bd', 'VoguePay Activation', 'VoguePay Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1795, 'bd', 'You need to configure VoguePay correctly to enable this feature', 'You need to configure VoguePay correctly to enable this feature', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1796, 'bd', 'Payhere Activation', 'Payhere Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1797, 'bd', 'Ngenius Activation', 'Ngenius Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1798, 'bd', 'You need to configure Ngenius correctly to enable this feature', 'You need to configure Ngenius correctly to enable this feature', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1799, 'bd', 'Iyzico Activation', 'Iyzico Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1800, 'bd', 'You need to configure iyzico correctly to enable this feature', 'You need to configure iyzico correctly to enable this feature', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1801, 'bd', 'Bkash Activation', 'Bkash Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1802, 'bd', 'You need to configure bkash correctly to enable this feature', 'You need to configure bkash correctly to enable this feature', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1803, 'bd', 'Nagad Activation', 'Nagad Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1804, 'bd', 'You need to configure nagad correctly to enable this feature', 'You need to configure nagad correctly to enable this feature', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1805, 'bd', 'Cash Payment Activation', 'Cash Payment Activation', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1806, 'bd', 'Social Media Login', 'Social Media Login', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1807, 'bd', 'Facebook login', 'Facebook login', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1808, 'bd', 'You need to configure Facebook Client correctly to enable this feature', 'You need to configure Facebook Client correctly to enable this feature', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1809, 'bd', 'Google login', 'Google login', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1810, 'bd', 'You need to configure Google Client correctly to enable this feature', 'You need to configure Google Client correctly to enable this feature', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1811, 'bd', 'Twitter login', 'Twitter login', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1812, 'bd', 'You need to configure Twitter Client correctly to enable this feature', 'You need to configure Twitter Client correctly to enable this feature', '2021-02-10 05:33:39', '2021-02-10 05:33:39'),
(1813, 'bd', 'Paypal Credential', 'Paypal Credential', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1814, 'bd', 'Paypal Client Id', 'Paypal Client Id', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1815, 'bd', 'Paypal Client Secret', 'Paypal Client Secret', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1816, 'bd', 'Stripe Credential', 'Stripe Credential', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1817, 'bd', 'Stripe Key', 'Stripe Key', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1818, 'bd', 'Stripe Secret', 'Stripe Secret', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1819, 'bd', 'Bkash Credential', 'Bkash Credential', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1820, 'bd', 'BKASH CHECKOUT APP KEY', 'BKASH CHECKOUT APP KEY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1821, 'bd', 'BKASH CHECKOUT APP SECRET', 'BKASH CHECKOUT APP SECRET', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1822, 'bd', 'BKASH CHECKOUT USER NAME', 'BKASH CHECKOUT USER NAME', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1823, 'bd', 'BKASH CHECKOUT PASSWORD', 'BKASH CHECKOUT PASSWORD', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1824, 'bd', 'Bkash Sandbox Mode', 'Bkash Sandbox Mode', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1825, 'bd', 'Nagad Credential', 'Nagad Credential', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1826, 'bd', 'NAGAD MODE', 'NAGAD MODE', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1827, 'bd', 'NAGAD MERCHANT ID', 'NAGAD MERCHANT ID', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1828, 'bd', 'NAGAD MERCHANT NUMBER', 'NAGAD MERCHANT NUMBER', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1829, 'bd', 'NAGAD PG PUBLIC KEY', 'NAGAD PG PUBLIC KEY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1830, 'bd', 'NAGAD MERCHANT PRIVATE KEY', 'NAGAD MERCHANT PRIVATE KEY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1831, 'bd', 'Sslcommerz Credential', 'Sslcommerz Credential', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1832, 'bd', 'Sslcz Store Id', 'Sslcz Store Id', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1833, 'bd', 'Sslcz store password', 'Sslcz store password', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1834, 'bd', 'Sslcommerz Sandbox Mode', 'Sslcommerz Sandbox Mode', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1835, 'bd', 'RazorPay Credential', 'RazorPay Credential', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1836, 'bd', 'RAZOR KEY', 'RAZOR KEY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1837, 'bd', 'RAZOR SECRET', 'RAZOR SECRET', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1838, 'bd', 'Instamojo Credential', 'Instamojo Credential', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1839, 'bd', 'API KEY', 'API KEY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1840, 'bd', 'IM API KEY', 'IM API KEY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1841, 'bd', 'AUTH TOKEN', 'AUTH TOKEN', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1842, 'bd', 'IM AUTH TOKEN', 'IM AUTH TOKEN', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1843, 'bd', 'Instamojo Sandbox Mode', 'Instamojo Sandbox Mode', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1844, 'bd', 'PayStack Credential', 'PayStack Credential', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1845, 'bd', 'PUBLIC KEY', 'PUBLIC KEY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1846, 'bd', 'SECRET KEY', 'SECRET KEY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1847, 'bd', 'MERCHANT EMAIL', 'MERCHANT EMAIL', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1848, 'bd', 'Payhere Credential', 'Payhere Credential', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1849, 'bd', 'PAYHERE MERCHANT ID', 'PAYHERE MERCHANT ID', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1850, 'bd', 'PAYHERE SECRET', 'PAYHERE SECRET', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1851, 'bd', 'PAYHERE CURRENCY', 'PAYHERE CURRENCY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1852, 'bd', 'Payhere Sandbox Mode', 'Payhere Sandbox Mode', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1853, 'bd', 'Ngenius Credential', 'Ngenius Credential', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1854, 'bd', 'NGENIUS OUTLET ID', 'NGENIUS OUTLET ID', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1855, 'bd', 'NGENIUS API KEY', 'NGENIUS API KEY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1856, 'bd', 'NGENIUS CURRENCY', 'NGENIUS CURRENCY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1857, 'bd', 'VoguePay Credential', 'VoguePay Credential', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1858, 'bd', 'MERCHANT ID', 'MERCHANT ID', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1859, 'bd', 'Sandbox Mode', 'Sandbox Mode', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1860, 'bd', 'Iyzico Credential', 'Iyzico Credential', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1861, 'bd', 'IYZICO_API_KEY', 'IYZICO_API_KEY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1862, 'bd', 'IYZICO API KEY', 'IYZICO API KEY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1863, 'bd', 'IYZICO_SECRET_KEY', 'IYZICO_SECRET_KEY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1864, 'bd', 'IYZICO SECRET KEY', 'IYZICO SECRET KEY', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1865, 'bd', 'IYZICO Sandbox Mode', 'IYZICO Sandbox Mode', '2021-02-10 05:34:33', '2021-02-10 05:34:33'),
(1866, 'bd', 'Settings updated successfully', 'Settings updated successfully', '2021-02-10 05:34:40', '2021-02-10 05:34:40'),
(1867, 'bd', 'All Role', 'All Role', '2021-02-10 05:35:01', '2021-02-10 05:35:01'),
(1868, 'bd', 'Add New Role', 'Add New Role', '2021-02-10 05:35:01', '2021-02-10 05:35:01'),
(1869, 'bd', 'Roles', 'Roles', '2021-02-10 05:35:01', '2021-02-10 05:35:01'),
(1870, 'bd', 'Add New Staffs', 'Add New Staffs', '2021-02-10 05:35:04', '2021-02-10 05:35:04'),
(1871, 'bd', 'Role', 'Role', '2021-02-10 05:35:04', '2021-02-10 05:35:04'),
(1872, 'bd', 'Update your system', 'Update your system', '2021-02-10 05:35:08', '2021-02-10 05:35:08'),
(1873, 'bd', 'Current verion', 'Current verion', '2021-02-10 05:35:08', '2021-02-10 05:35:08'),
(1874, 'bd', 'Make sure your server has matched with all requirements.', 'Make sure your server has matched with all requirements.', '2021-02-10 05:35:08', '2021-02-10 05:35:08'),
(1875, 'bd', 'Check Here', 'Check Here', '2021-02-10 05:35:08', '2021-02-10 05:35:08'),
(1876, 'bd', 'Download latest version from codecanyon.', 'Download latest version from codecanyon.', '2021-02-10 05:35:08', '2021-02-10 05:35:08'),
(1877, 'bd', 'Extract downloaded zip. You will find updates.zip file in those extraced files.', 'Extract downloaded zip. You will find updates.zip file in those extraced files.', '2021-02-10 05:35:08', '2021-02-10 05:35:08'),
(1878, 'bd', 'Upload that zip file here and click update now.', 'Upload that zip file here and click update now.', '2021-02-10 05:35:08', '2021-02-10 05:35:08'),
(1879, 'bd', 'If you are using any addon make sure to update those addons after updating.', 'If you are using any addon make sure to update those addons after updating.', '2021-02-10 05:35:08', '2021-02-10 05:35:08'),
(1880, 'bd', 'Update Now', 'Update Now', '2021-02-10 05:35:08', '2021-02-10 05:35:08'),
(1881, 'bd', 'Server information', 'Server information', '2021-02-10 05:35:17', '2021-02-10 05:35:17'),
(1882, 'bd', 'Current Version', 'Current Version', '2021-02-10 05:35:17', '2021-02-10 05:35:17'),
(1883, 'bd', 'Required Version', 'Required Version', '2021-02-10 05:35:17', '2021-02-10 05:35:17'),
(1884, 'bd', 'php.ini Config', 'php.ini Config', '2021-02-10 05:35:17', '2021-02-10 05:35:17'),
(1885, 'bd', 'Config Name', 'Config Name', '2021-02-10 05:35:17', '2021-02-10 05:35:17'),
(1886, 'bd', 'Current', 'Current', '2021-02-10 05:35:17', '2021-02-10 05:35:17'),
(1887, 'bd', 'Recommended', 'Recommended', '2021-02-10 05:35:17', '2021-02-10 05:35:17'),
(1888, 'bd', 'Extensions information', 'Extensions information', '2021-02-10 05:35:17', '2021-02-10 05:35:17'),
(1889, 'bd', 'Extension Name', 'Extension Name', '2021-02-10 05:35:17', '2021-02-10 05:35:17'),
(1890, 'bd', 'Filesystem Permissions', 'Filesystem Permissions', '2021-02-10 05:35:17', '2021-02-10 05:35:17'),
(1891, 'bd', 'File or Folder', 'File or Folder', '2021-02-10 05:35:17', '2021-02-10 05:35:17'),
(1892, 'bd', 'System Name', 'System Name', '2021-02-10 05:36:03', '2021-02-10 05:36:03'),
(1893, 'bd', 'System Logo - White', 'System Logo - White', '2021-02-10 05:36:03', '2021-02-10 05:36:03'),
(1894, 'bd', 'Choose Files', 'Choose Files', '2021-02-10 05:36:03', '2021-02-10 05:36:03'),
(1895, 'bd', 'Will be used in admin panel side menu', 'Will be used in admin panel side menu', '2021-02-10 05:36:03', '2021-02-10 05:36:03'),
(1896, 'bd', 'System Logo - Black', 'System Logo - Black', '2021-02-10 05:36:03', '2021-02-10 05:36:03'),
(1897, 'bd', 'Will be used in admin panel topbar in mobile + Admin login page', 'Will be used in admin panel topbar in mobile + Admin login page', '2021-02-10 05:36:03', '2021-02-10 05:36:03'),
(1898, 'bd', 'System Timezone', 'System Timezone', '2021-02-10 05:36:03', '2021-02-10 05:36:03'),
(1899, 'bd', 'Admin login page background', 'Admin login page background', '2021-02-10 05:36:03', '2021-02-10 05:36:03'),
(1900, 'bd', 'Default Language', 'Default Language', '2021-02-10 05:36:12', '2021-02-10 05:36:12'),
(1901, 'bd', 'Add New Language', 'Add New Language', '2021-02-10 05:36:12', '2021-02-10 05:36:12'),
(1902, 'bd', 'Language', 'Language', '2021-02-10 05:36:12', '2021-02-10 05:36:12'),
(1903, 'bd', 'RTL', 'RTL', '2021-02-10 05:36:12', '2021-02-10 05:36:12'),
(1904, 'bd', 'Translation', 'Translation', '2021-02-10 05:36:12', '2021-02-10 05:36:12'),
(1905, 'bd', 'System Default Currency', 'System Default Currency', '2021-02-10 05:36:16', '2021-02-10 05:36:16'),
(1906, 'bd', 'Set Currency Formats', 'Set Currency Formats', '2021-02-10 05:36:16', '2021-02-10 05:36:16'),
(1907, 'bd', 'Symbol Format', 'Symbol Format', '2021-02-10 05:36:16', '2021-02-10 05:36:16'),
(1908, 'bd', 'Decimal Separator', 'Decimal Separator', '2021-02-10 05:36:16', '2021-02-10 05:36:16'),
(1909, 'bd', 'No of decimals', 'No of decimals', '2021-02-10 05:36:16', '2021-02-10 05:36:16'),
(1910, 'bd', 'All Currencies', 'All Currencies', '2021-02-10 05:36:16', '2021-02-10 05:36:16'),
(1911, 'bd', 'Add New Currency', 'Add New Currency', '2021-02-10 05:36:16', '2021-02-10 05:36:16'),
(1912, 'bd', 'Currency name', 'Currency name', '2021-02-10 05:36:16', '2021-02-10 05:36:16'),
(1913, 'bd', 'Currency symbol', 'Currency symbol', '2021-02-10 05:36:16', '2021-02-10 05:36:16'),
(1914, 'bd', 'Currency code', 'Currency code', '2021-02-10 05:36:16', '2021-02-10 05:36:16'),
(1915, 'bd', 'Exchange rate', 'Exchange rate', '2021-02-10 05:36:16', '2021-02-10 05:36:16'),
(1916, 'bd', 'Currency Status updated successfully', 'Currency Status updated successfully', '2021-02-10 05:36:16', '2021-02-10 05:36:16'),
(1917, 'bd', 'Type', 'Type', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1918, 'bd', 'Sendmail', 'Sendmail', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1919, 'bd', 'SMTP', 'SMTP', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1920, 'bd', 'Mailgun', 'Mailgun', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1921, 'bd', 'MAIL HOST', 'MAIL HOST', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1922, 'bd', 'MAIL PORT', 'MAIL PORT', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1923, 'bd', 'MAIL USERNAME', 'MAIL USERNAME', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1924, 'bd', 'MAIL PASSWORD', 'MAIL PASSWORD', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1925, 'bd', 'MAIL ENCRYPTION', 'MAIL ENCRYPTION', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1926, 'bd', 'MAIL FROM ADDRESS', 'MAIL FROM ADDRESS', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1927, 'bd', 'MAIL FROM NAME', 'MAIL FROM NAME', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1928, 'bd', 'MAILGUN DOMAIN', 'MAILGUN DOMAIN', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1929, 'bd', 'MAILGUN SECRET', 'MAILGUN SECRET', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1930, 'bd', 'Save Configuration', 'Save Configuration', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1931, 'bd', 'Test SMTP configuration', 'Test SMTP configuration', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1932, 'bd', 'Enter your email address', 'Enter your email address', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1933, 'bd', 'Send test email', 'Send test email', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1934, 'bd', 'Instruction', 'Instruction', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1935, 'bd', 'Please be carefull when you are configuring SMTP. For incorrect configuration you will get error at the time of order place, new registration, sending newsletter.', 'Please be carefull when you are configuring SMTP. For incorrect configuration you will get error at the time of order place, new registration, sending newsletter.', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1936, 'bd', 'For Non-SSL', 'For Non-SSL', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1937, 'bd', 'Select sendmail for Mail Driver if you face any issue after configuring smtp as Mail Driver ', 'Select sendmail for Mail Driver if you face any issue after configuring smtp as Mail Driver ', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1938, 'bd', 'Set Mail Host according to your server Mail Client Manual Settings', 'Set Mail Host according to your server Mail Client Manual Settings', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1939, 'bd', 'Set Mail port as 587', 'Set Mail port as 587', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1940, 'bd', 'Set Mail Encryption as ssl if you face issue with tls', 'Set Mail Encryption as ssl if you face issue with tls', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1941, 'bd', 'For SSL', 'For SSL', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1942, 'bd', 'Set Mail port as 465', 'Set Mail port as 465', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1943, 'bd', 'Set Mail Encryption as ssl', 'Set Mail Encryption as ssl', '2021-02-10 05:36:58', '2021-02-10 05:36:58'),
(1944, 'bd', 'Google Login Credential', 'Google Login Credential', '2021-02-10 05:37:05', '2021-02-10 05:37:05'),
(1945, 'bd', 'Client ID', 'Client ID', '2021-02-10 05:37:05', '2021-02-10 05:37:05'),
(1946, 'bd', 'Google Client ID', 'Google Client ID', '2021-02-10 05:37:05', '2021-02-10 05:37:05'),
(1947, 'bd', 'Client Secret', 'Client Secret', '2021-02-10 05:37:05', '2021-02-10 05:37:05'),
(1948, 'bd', 'Google Client Secret', 'Google Client Secret', '2021-02-10 05:37:05', '2021-02-10 05:37:05'),
(1949, 'bd', 'Facebook Login Credential', 'Facebook Login Credential', '2021-02-10 05:37:05', '2021-02-10 05:37:05'),
(1950, 'bd', 'App ID', 'App ID', '2021-02-10 05:37:05', '2021-02-10 05:37:05'),
(1951, 'bd', 'Facebook Client ID', 'Facebook Client ID', '2021-02-10 05:37:05', '2021-02-10 05:37:05'),
(1952, 'bd', 'App Secret', 'App Secret', '2021-02-10 05:37:05', '2021-02-10 05:37:05'),
(1953, 'bd', 'Facebook Client Secret', 'Facebook Client Secret', '2021-02-10 05:37:05', '2021-02-10 05:37:05'),
(1954, 'bd', 'Twitter Login Credential', 'Twitter Login Credential', '2021-02-10 05:37:05', '2021-02-10 05:37:05'),
(1955, 'bd', 'Twitter Client ID', 'Twitter Client ID', '2021-02-10 05:37:05', '2021-02-10 05:37:05'),
(1956, 'bd', 'Twitter Client Secret', 'Twitter Client Secret', '2021-02-10 05:37:05', '2021-02-10 05:37:05'),
(1957, 'bd', 'Zip File', 'Zip File', '2021-02-10 05:38:42', '2021-02-10 05:38:42'),
(1958, 'bd', 'Install/Update', 'Install/Update', '2021-02-10 05:38:42', '2021-02-10 05:38:42'),
(1959, 'bd', 'Addon nstalled successfully', 'Addon nstalled successfully', '2021-02-10 05:39:01', '2021-02-10 05:39:01'),
(1960, 'bd', 'Version', 'Version', '2021-02-10 05:39:01', '2021-02-10 05:39:01'),
(1961, 'bd', 'POS System', 'POS System', '2021-02-10 05:39:01', '2021-02-10 05:39:01'),
(1962, 'bd', 'POS Manager', 'POS Manager', '2021-02-10 05:39:01', '2021-02-10 05:39:01'),
(1963, 'bd', 'POS Configuration', 'POS Configuration', '2021-02-10 05:39:01', '2021-02-10 05:39:01'),
(1964, 'bd', 'POS', 'POS', '2021-02-10 05:39:01', '2021-02-10 05:39:01'),
(1965, 'bd', 'POS Activation for Seller', 'POS Activation for Seller', '2021-02-10 05:41:01', '2021-02-10 05:41:01'),
(1966, 'bd', 'Home', 'Home', '2021-02-10 06:19:11', '2021-02-10 06:19:11'),
(1967, 'bd', 'All Customers', 'All Customers', '2021-02-10 06:26:35', '2021-02-10 06:26:35'),
(1968, 'bd', 'Type email or name & Enter', 'Type email or name & Enter', '2021-02-10 06:26:35', '2021-02-10 06:26:35'),
(1969, 'bd', 'Email Address', 'Email Address', '2021-02-10 06:26:35', '2021-02-10 06:26:35'),
(1970, 'bd', 'Package', 'Package', '2021-02-10 06:26:35', '2021-02-10 06:26:35'),
(1971, 'bd', 'Wallet Balance', 'Wallet Balance', '2021-02-10 06:26:35', '2021-02-10 06:26:35'),
(1972, 'bd', 'Log in as this Customer', 'Log in as this Customer', '2021-02-10 06:26:35', '2021-02-10 06:26:35'),
(1973, 'bd', 'Ban this Customer', 'Ban this Customer', '2021-02-10 06:26:35', '2021-02-10 06:26:35'),
(1974, 'bd', 'Do you really want to ban this Customer?', 'Do you really want to ban this Customer?', '2021-02-10 06:26:35', '2021-02-10 06:26:35'),
(1975, 'bd', 'Proceed!', 'Proceed!', '2021-02-10 06:26:35', '2021-02-10 06:26:35'),
(1976, 'bd', 'Do you really want to unban this Customer?', 'Do you really want to unban this Customer?', '2021-02-10 06:26:35', '2021-02-10 06:26:35'),
(1977, 'bd', 'This addon is updated successfully', 'This addon is updated successfully', '2021-02-10 06:54:08', '2021-02-10 06:54:08'),
(1978, 'bd', 'S3 File System Credentials', 'S3 File System Credentials', '2021-02-10 07:10:19', '2021-02-10 07:10:19'),
(1979, 'bd', 'AWS_ACCESS_KEY_ID', 'AWS_ACCESS_KEY_ID', '2021-02-10 07:10:19', '2021-02-10 07:10:19'),
(1980, 'bd', 'AWS_SECRET_ACCESS_KEY', 'AWS_SECRET_ACCESS_KEY', '2021-02-10 07:10:19', '2021-02-10 07:10:19'),
(1981, 'bd', 'AWS_DEFAULT_REGION', 'AWS_DEFAULT_REGION', '2021-02-10 07:10:19', '2021-02-10 07:10:19'),
(1982, 'bd', 'AWS_BUCKET', 'AWS_BUCKET', '2021-02-10 07:10:19', '2021-02-10 07:10:19'),
(1983, 'bd', 'AWS_URL', 'AWS_URL', '2021-02-10 07:10:19', '2021-02-10 07:10:19'),
(1984, 'bd', 'S3 File System Activation', 'S3 File System Activation', '2021-02-10 07:10:19', '2021-02-10 07:10:19'),
(1985, 'bd', 'Club Point System', 'Club Point System', '2021-02-10 23:32:02', '2021-02-10 23:32:02'),
(1986, 'bd', 'Club Point Configurations', 'Club Point Configurations', '2021-02-10 23:32:02', '2021-02-10 23:32:02'),
(1987, 'bd', 'Set Product Point', 'Set Product Point', '2021-02-10 23:32:02', '2021-02-10 23:32:02'),
(1988, 'bd', 'User Points', 'User Points', '2021-02-10 23:32:02', '2021-02-10 23:32:02'),
(1989, 'bd', 'Convert Point To Wallet', 'Convert Point To Wallet', '2021-02-10 23:33:07', '2021-02-10 23:33:07'),
(1990, 'bd', 'Set Point For ', 'Set Point For ', '2021-02-10 23:33:07', '2021-02-10 23:33:07'),
(1991, 'bd', 'Points', 'Points', '2021-02-10 23:33:07', '2021-02-10 23:33:07'),
(1992, 'bd', 'Note: You need to activate wallet option first before using club point addon.', 'Note: You need to activate wallet option first before using club point addon.', '2021-02-10 23:33:07', '2021-02-10 23:33:07'),
(1993, 'bd', 'Product Owner', 'Product Owner', '2021-02-10 23:33:12', '2021-02-10 23:33:12'),
(1994, 'bd', 'Point', 'Point', '2021-02-10 23:33:12', '2021-02-10 23:33:12'),
(1995, 'bd', 'Set Point for Product Within a Range', 'Set Point for Product Within a Range', '2021-02-10 23:33:12', '2021-02-10 23:33:12'),
(1996, 'bd', 'Set Point for multiple products', 'Set Point for multiple products', '2021-02-10 23:33:12', '2021-02-10 23:33:12'),
(1997, 'bd', 'Min Price', 'Min Price', '2021-02-10 23:33:12', '2021-02-10 23:33:12'),
(1998, 'bd', 'Max Price', 'Max Price', '2021-02-10 23:33:12', '2021-02-10 23:33:12'),
(1999, 'bd', 'Set Point for all Products', 'Set Point for all Products', '2021-02-10 23:33:12', '2021-02-10 23:33:12'),
(2000, 'bd', 'Convert Status', 'Convert Status', '2021-02-10 23:33:18', '2021-02-10 23:33:18'),
(2001, 'bd', 'Earned At', 'Earned At', '2021-02-10 23:33:18', '2021-02-10 23:33:18'),
(2002, 'bd', 'Barcode', 'Barcode', '2021-02-10 23:38:12', '2021-02-10 23:38:12'),
(2003, 'bd', 'Variant', 'Variant', '2021-02-10 23:44:32', '2021-02-10 23:44:32'),
(2004, 'bd', 'Variant Price', 'Variant Price', '2021-02-10 23:44:32', '2021-02-10 23:44:32'),
(2005, 'bd', 'SKU', 'SKU', '2021-02-10 23:44:32', '2021-02-10 23:44:32'),
(2006, 'bd', 'Attribute has been deleted successfully', 'Attribute has been deleted successfully', '2021-02-10 23:45:50', '2021-02-10 23:45:50'),
(2007, 'bd', 'Attribute has been inserted successfully', 'Attribute has been inserted successfully', '2021-02-10 23:45:58', '2021-02-10 23:45:58'),
(2008, 'bd', 'Category Information', 'Category Information', '2021-02-10 23:52:50', '2021-02-10 23:52:50'),
(2009, 'bd', 'No Parent', 'No Parent', '2021-02-10 23:52:50', '2021-02-10 23:52:50'),
(2010, 'bd', 'Physical', 'Physical', '2021-02-10 23:52:50', '2021-02-10 23:52:50'),
(2011, 'bd', 'Digital', 'Digital', '2021-02-10 23:52:50', '2021-02-10 23:52:50'),
(2012, 'bd', '200x200', '200x200', '2021-02-10 23:52:50', '2021-02-10 23:52:50'),
(2013, 'bd', '32x32', '32x32', '2021-02-10 23:52:50', '2021-02-10 23:52:50'),
(2014, 'bd', 'Category has been inserted successfully', 'Category has been inserted successfully', '2021-02-10 23:53:19', '2021-02-10 23:53:19'),
(2015, 'bd', 'Brand has been inserted successfully', 'Brand has been inserted successfully', '2021-02-10 23:53:50', '2021-02-10 23:53:50'),
(2016, 'bd', 'Product has been inserted successfully', 'Product has been inserted successfully', '2021-02-10 23:58:11', '2021-02-10 23:58:11'),
(2017, 'bd', 'times', 'times', '2021-02-10 23:58:11', '2021-02-10 23:58:11'),
(2018, 'bd', 'Duplicate', 'Duplicate', '2021-02-10 23:58:11', '2021-02-10 23:58:11'),
(2019, 'bd', 'Add to wishlist', 'Add to wishlist', '2021-02-10 23:58:35', '2021-02-10 23:58:35'),
(2020, 'bd', 'Add to compare', 'Add to compare', '2021-02-10 23:58:35', '2021-02-10 23:58:35'),
(2021, 'bd', 'Add to cart', 'Add to cart', '2021-02-10 23:58:35', '2021-02-10 23:58:35'),
(2022, 'bd', 'Club Point', 'Club Point', '2021-02-10 23:58:35', '2021-02-10 23:58:35'),
(2023, 'bd', 'reviews', 'reviews', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2024, 'bd', 'In stock', 'In stock', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2025, 'bd', 'Sold by', 'Sold by', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2026, 'bd', 'Inhouse product', 'Inhouse product', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2027, 'bd', 'Message Seller', 'Message Seller', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2028, 'bd', 'Price', 'Price', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2029, 'bd', 'available', 'available', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2030, 'bd', 'Total Price', 'Total Price', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2031, 'bd', 'Buy Now', 'Buy Now', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2032, 'bd', 'Share', 'Share', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2033, 'bd', 'customer reviews', 'customer reviews', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2034, 'bd', 'Top Selling Products', 'Top Selling Products', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2035, 'bd', 'Download', 'Download', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2036, 'bd', 'There have been no reviews for this product yet.', 'There have been no reviews for this product yet.', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2037, 'bd', 'Related products', 'Related products', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2038, 'bd', 'Any query about this product', 'Any query about this product', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2039, 'bd', 'Your Question', 'Your Question', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2040, 'bd', 'Send', 'Send', '2021-02-10 23:58:44', '2021-02-10 23:58:44'),
(2041, 'bd', 'Item added to your cart!', 'Item added to your cart!', '2021-02-10 23:59:12', '2021-02-10 23:59:12'),
(2042, 'bd', 'Back to shopping', 'Back to shopping', '2021-02-10 23:59:12', '2021-02-10 23:59:12'),
(2043, 'bd', 'Proceed to Checkout', 'Proceed to Checkout', '2021-02-10 23:59:12', '2021-02-10 23:59:12'),
(2044, 'bd', 'Cart Items', 'Cart Items', '2021-02-10 23:59:12', '2021-02-10 23:59:12'),
(2045, 'bd', 'Subtotal', 'Subtotal', '2021-02-10 23:59:12', '2021-02-10 23:59:12'),
(2046, 'bd', 'View cart', 'View cart', '2021-02-10 23:59:12', '2021-02-10 23:59:12'),
(2047, 'bd', 'Checkout', 'Checkout', '2021-02-10 23:59:12', '2021-02-10 23:59:12'),
(2048, 'bd', '1. My Cart', '1. My Cart', '2021-02-10 23:59:15', '2021-02-10 23:59:15'),
(2049, 'bd', '2. Shipping info', '2. Shipping info', '2021-02-10 23:59:15', '2021-02-10 23:59:15'),
(2050, 'bd', '3. Delivery info', '3. Delivery info', '2021-02-10 23:59:15', '2021-02-10 23:59:15'),
(2051, 'bd', '4. Payment', '4. Payment', '2021-02-10 23:59:15', '2021-02-10 23:59:15'),
(2052, 'bd', '5. Confirmation', '5. Confirmation', '2021-02-10 23:59:15', '2021-02-10 23:59:15'),
(2053, 'bd', 'Product', 'Product', '2021-02-10 23:59:15', '2021-02-10 23:59:15'),
(2054, 'bd', 'Remove', 'Remove', '2021-02-10 23:59:15', '2021-02-10 23:59:15'),
(2055, 'bd', 'Return to shop', 'Return to shop', '2021-02-10 23:59:15', '2021-02-10 23:59:15'),
(2056, 'bd', 'Continue to Shipping', 'Continue to Shipping', '2021-02-10 23:59:15', '2021-02-10 23:59:15'),
(2057, 'bd', 'Or', 'Or', '2021-02-10 23:59:15', '2021-02-10 23:59:15'),
(2058, 'bd', 'Guest Checkout', 'Guest Checkout', '2021-02-10 23:59:15', '2021-02-10 23:59:15'),
(2059, 'bd', 'Add New Address', 'Add New Address', '2021-02-10 23:59:23', '2021-02-10 23:59:23'),
(2060, 'bd', 'Continue to Delivery Info', 'Continue to Delivery Info', '2021-02-10 23:59:23', '2021-02-10 23:59:23'),
(2061, 'bd', 'New Address', 'New Address', '2021-02-10 23:59:23', '2021-02-10 23:59:23'),
(2062, 'bd', 'Your Address', 'Your Address', '2021-02-10 23:59:23', '2021-02-10 23:59:23'),
(2063, 'bd', 'City', 'City', '2021-02-10 23:59:23', '2021-02-10 23:59:23'),
(2064, 'bd', 'Your City', 'Your City', '2021-02-10 23:59:23', '2021-02-10 23:59:23'),
(2065, 'bd', 'Postal code', 'Postal code', '2021-02-10 23:59:23', '2021-02-10 23:59:23'),
(2066, 'bd', 'Your Postal Code', 'Your Postal Code', '2021-02-10 23:59:23', '2021-02-10 23:59:23'),
(2067, 'bd', '+880', '+880', '2021-02-10 23:59:23', '2021-02-10 23:59:23'),
(2068, 'bd', 'Please add shipping address', 'Please add shipping address', '2021-02-10 23:59:31', '2021-02-10 23:59:31'),
(2069, 'bd', 'Continue to Payment', 'Continue to Payment', '2021-02-11 00:00:13', '2021-02-11 00:00:13'),
(2070, 'bd', 'Select a payment option', 'Select a payment option', '2021-02-11 00:00:16', '2021-02-11 00:00:16'),
(2071, 'bd', 'Iyzico', 'Iyzico', '2021-02-11 00:00:16', '2021-02-11 00:00:16'),
(2072, 'bd', 'Nagad', 'Nagad', '2021-02-11 00:00:16', '2021-02-11 00:00:16'),
(2073, 'bd', 'Bkash', 'Bkash', '2021-02-11 00:00:16', '2021-02-11 00:00:16'),
(2074, 'bd', 'Cash on Delivery', 'Cash on Delivery', '2021-02-11 00:00:16', '2021-02-11 00:00:16'),
(2075, 'bd', 'I agree to the', 'I agree to the', '2021-02-11 00:00:16', '2021-02-11 00:00:16'),
(2076, 'bd', 'terms and conditions', 'terms and conditions', '2021-02-11 00:00:16', '2021-02-11 00:00:16'),
(2077, 'bd', 'Complete Order', 'Complete Order', '2021-02-11 00:00:16', '2021-02-11 00:00:16'),
(2078, 'bd', 'Summary', 'Summary', '2021-02-11 00:00:16', '2021-02-11 00:00:16'),
(2079, 'bd', 'Items', 'Items', '2021-02-11 00:00:16', '2021-02-11 00:00:16'),
(2080, 'bd', 'Total Club point', 'Total Club point', '2021-02-11 00:00:16', '2021-02-11 00:00:16'),
(2081, 'bd', 'Total Shipping', 'Total Shipping', '2021-02-11 00:00:16', '2021-02-11 00:00:16'),
(2082, 'bd', 'You need to agree with our policies', 'You need to agree with our policies', '2021-02-11 00:00:16', '2021-02-11 00:00:16'),
(2083, 'bd', 'Your order has been placed', 'Your order has been placed', '2021-02-11 00:00:29', '2021-02-11 00:00:29'),
(2084, 'bd', 'new orders', 'new orders', '2021-02-11 00:01:23', '2021-02-11 00:01:23'),
(2085, 'bd', 'Seller Payments', 'Seller Payments', '2021-02-11 00:01:33', '2021-02-11 00:01:33'),
(2086, 'bd', 'Date', 'Date', '2021-02-11 00:01:33', '2021-02-11 00:01:33'),
(2087, 'bd', 'Seller', 'Seller', '2021-02-11 00:01:33', '2021-02-11 00:01:33'),
(2088, 'bd', 'Amount', 'Amount', '2021-02-11 00:01:33', '2021-02-11 00:01:33'),
(2089, 'bd', 'Payment Details', 'Payment Details', '2021-02-11 00:01:33', '2021-02-11 00:01:33'),
(2090, 'bd', 'Label', 'Label', '2021-02-11 00:01:36', '2021-02-11 00:01:36'),
(2091, 'bd', 'Text Input', 'Text Input', '2021-02-11 00:01:36', '2021-02-11 00:01:36'),
(2092, 'bd', 'Select', 'Select', '2021-02-11 00:01:36', '2021-02-11 00:01:36'),
(2093, 'bd', 'Multiple Select', 'Multiple Select', '2021-02-11 00:01:36', '2021-02-11 00:01:36'),
(2094, 'bd', 'Radio', 'Radio', '2021-02-11 00:01:36', '2021-02-11 00:01:36'),
(2095, 'bd', 'File', 'File', '2021-02-11 00:01:36', '2021-02-11 00:01:36'),
(2096, 'bd', 'Select Label', 'Select Label', '2021-02-11 00:01:36', '2021-02-11 00:01:36'),
(2097, 'bd', 'Multiple Select Label', 'Multiple Select Label', '2021-02-11 00:01:36', '2021-02-11 00:01:36'),
(2098, 'bd', 'Radio Label', 'Radio Label', '2021-02-11 00:01:36', '2021-02-11 00:01:36'),
(2099, 'bd', 'Edit Product', 'Edit Product', '2021-02-11 00:02:47', '2021-02-11 00:02:47'),
(2100, 'bd', 'Translatable', 'Translatable', '2021-02-11 00:02:47', '2021-02-11 00:02:47'),
(2101, 'bd', 'Type to add a tag', 'Type to add a tag', '2021-02-11 00:02:47', '2021-02-11 00:02:47'),
(2102, 'bd', 'Meta Images', 'Meta Images', '2021-02-11 00:02:47', '2021-02-11 00:02:47'),
(2103, 'bd', 'Slug', 'Slug', '2021-02-11 00:02:47', '2021-02-11 00:02:47'),
(2104, 'bd', 'Update Product', 'Update Product', '2021-02-11 00:02:47', '2021-02-11 00:02:47'),
(2105, 'bd', 'Product has been updated successfully', 'Product has been updated successfully', '2021-02-11 00:16:53', '2021-02-11 00:16:53'),
(2106, 'bd', 'Affiliate System', 'Affiliate System', '2021-02-11 02:44:32', '2021-02-11 02:44:32'),
(2107, 'bd', 'Affiliate Registration Form', 'Affiliate Registration Form', '2021-02-11 02:44:32', '2021-02-11 02:44:32'),
(2108, 'bd', 'Affiliate Configurations', 'Affiliate Configurations', '2021-02-11 02:44:32', '2021-02-11 02:44:32'),
(2109, 'bd', 'Affiliate Users', 'Affiliate Users', '2021-02-11 02:44:32', '2021-02-11 02:44:32'),
(2110, 'bd', 'Referral Users', 'Referral Users', '2021-02-11 02:44:32', '2021-02-11 02:44:32'),
(2111, 'bd', 'Affiliate Withdraw Requests', 'Affiliate Withdraw Requests', '2021-02-11 02:44:32', '2021-02-11 02:44:32'),
(2112, 'bd', 'Basic Affiliate', 'Basic Affiliate', '2021-02-11 02:44:41', '2021-02-11 02:44:41'),
(2113, 'bd', 'User Registration & First Purchase', 'User Registration & First Purchase', '2021-02-11 02:44:41', '2021-02-11 02:44:41'),
(2114, 'bd', 'Product Sharing Affiliate', 'Product Sharing Affiliate', '2021-02-11 02:44:41', '2021-02-11 02:44:41'),
(2115, 'bd', 'Product Sharing and Purchasing', 'Product Sharing and Purchasing', '2021-02-11 02:44:41', '2021-02-11 02:44:41'),
(2116, 'bd', 'Product Sharing Affiliate (Category Wise)', 'Product Sharing Affiliate (Category Wise)', '2021-02-11 02:44:41', '2021-02-11 02:44:41'),
(2117, 'bd', 'Verification Info', 'Verification Info', '2021-02-11 02:44:48', '2021-02-11 02:44:48'),
(2118, 'bd', 'Approval', 'Approval', '2021-02-11 02:44:48', '2021-02-11 02:44:48'),
(2119, 'bd', 'Due Amount', 'Due Amount', '2021-02-11 02:44:48', '2021-02-11 02:44:48'),
(2120, 'bd', 'Show', 'Show', '2021-02-11 02:44:48', '2021-02-11 02:44:48'),
(2121, 'bd', 'Pay Now', 'Pay Now', '2021-02-11 02:44:48', '2021-02-11 02:44:48'),
(2122, 'bd', 'Payment History', 'Payment History', '2021-02-11 02:44:48', '2021-02-11 02:44:48'),
(2123, 'bd', 'Approved sellers updated successfully', 'Approved sellers updated successfully', '2021-02-11 02:44:48', '2021-02-11 02:44:48'),
(2124, 'bd', 'Refferal Users', 'Refferal Users', '2021-02-11 02:44:51', '2021-02-11 02:44:51'),
(2125, 'bd', 'Reffered By', 'Reffered By', '2021-02-11 02:44:51', '2021-02-11 02:44:51'),
(2126, 'bd', 'Affiliate Withdraw Request', 'Affiliate Withdraw Request', '2021-02-11 02:44:55', '2021-02-11 02:44:55'),
(2127, 'bd', 'Affiliate Withdraw Request Reject', 'Affiliate Withdraw Request Reject', '2021-02-11 02:44:55', '2021-02-11 02:44:55'),
(2128, 'bd', 'Are you sure, You want to reject this?', 'Are you sure, You want to reject this?', '2021-02-11 02:44:55', '2021-02-11 02:44:55'),
(2129, 'bd', 'Reject', 'Reject', '2021-02-11 02:44:55', '2021-02-11 02:44:55'),
(2130, 'bd', 'Be an affiliate partner', 'Be an affiliate partner', '2021-02-11 02:50:01', '2021-02-11 02:50:01'),
(2131, 'bd', 'Offline Payment System', 'Offline Payment System', '2021-02-11 02:50:21', '2021-02-11 02:50:21'),
(2132, 'bd', 'Manual Payment Methods', 'Manual Payment Methods', '2021-02-11 02:50:21', '2021-02-11 02:50:21'),
(2133, 'bd', 'Offline Wallet Recharge', 'Offline Wallet Recharge', '2021-02-11 02:50:21', '2021-02-11 02:50:21'),
(2134, 'bd', 'Add New Payment Method', 'Add New Payment Method', '2021-02-11 02:50:39', '2021-02-11 02:50:39'),
(2135, 'bd', 'Manual Payment Method', 'Manual Payment Method', '2021-02-11 02:50:39', '2021-02-11 02:50:39'),
(2136, 'bd', 'Heading', 'Heading', '2021-02-11 02:50:39', '2021-02-11 02:50:39'),
(2137, 'bd', 'Offline Wallet Recharge Requests', 'Offline Wallet Recharge Requests', '2021-02-11 02:50:42', '2021-02-11 02:50:42'),
(2138, 'bd', 'Method', 'Method', '2021-02-11 02:50:42', '2021-02-11 02:50:42'),
(2139, 'bd', 'TXN ID', 'TXN ID', '2021-02-11 02:50:42', '2021-02-11 02:50:42'),
(2140, 'bd', 'Money has been added successfully', 'Money has been added successfully', '2021-02-11 02:50:42', '2021-02-11 02:50:42'),
(2141, 'bd', 'Bulk SMS', 'Bulk SMS', '2021-02-11 02:51:07', '2021-02-11 02:51:07'),
(2142, 'bd', 'OTP System', 'OTP System', '2021-02-11 02:51:07', '2021-02-11 02:51:07'),
(2143, 'bd', 'OTP Configurations', 'OTP Configurations', '2021-02-11 02:51:07', '2021-02-11 02:51:07'),
(2144, 'bd', 'Set OTP Credentials', 'Set OTP Credentials', '2021-02-11 02:51:07', '2021-02-11 02:51:07'),
(2145, 'bd', 'Twillo Credential', 'Twillo Credential', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2146, 'bd', 'TWILIO SID', 'TWILIO SID', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2147, 'bd', 'TWILIO AUTH TOKEN', 'TWILIO AUTH TOKEN', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2148, 'bd', 'TWILIO VERIFY SID', 'TWILIO VERIFY SID', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2149, 'bd', 'VALID TWILLO NUMBER', 'VALID TWILLO NUMBER', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2150, 'bd', 'Nexmo Credential', 'Nexmo Credential', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2151, 'bd', 'NEXMO KEY', 'NEXMO KEY', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2152, 'bd', 'NEXMO SECRET', 'NEXMO SECRET', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2153, 'bd', 'SSL Wireless Credential', 'SSL Wireless Credential', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2154, 'bd', 'SSL SMS API TOKEN', 'SSL SMS API TOKEN', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2155, 'bd', 'SSL SMS SID', 'SSL SMS SID', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2156, 'bd', 'SSL SMS URL', 'SSL SMS URL', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2157, 'bd', 'Fast2SMS Credential', 'Fast2SMS Credential', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2158, 'bd', 'AUTH KEY', 'AUTH KEY', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2159, 'bd', 'ROUTE', 'ROUTE', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2160, 'bd', 'Promotional Use', 'Promotional Use', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2161, 'bd', 'Transactional Use', 'Transactional Use', '2021-02-11 02:51:16', '2021-02-11 02:51:16'),
(2162, 'bd', 'SENDER ID', 'SENDER ID', '2021-02-11 02:51:17', '2021-02-11 02:51:17'),
(2163, 'bd', 'MIMO Credential', 'MIMO Credential', '2021-02-11 02:51:17', '2021-02-11 02:51:17'),
(2164, 'bd', 'MIMO_USERNAME', 'MIMO_USERNAME', '2021-02-11 02:51:17', '2021-02-11 02:51:17'),
(2165, 'bd', 'MIMO_PASSWORD', 'MIMO_PASSWORD', '2021-02-11 02:51:17', '2021-02-11 02:51:17'),
(2166, 'bd', 'MIMO_SENDER_ID', 'MIMO_SENDER_ID', '2021-02-11 02:51:17', '2021-02-11 02:51:17'),
(2167, 'bd', 'Activate OTP', 'Activate OTP', '2021-02-11 02:51:21', '2021-02-11 02:51:21'),
(2168, 'bd', 'Nexmo OTP', 'Nexmo OTP', '2021-02-11 02:51:21', '2021-02-11 02:51:21'),
(2169, 'bd', 'Twillo OTP', 'Twillo OTP', '2021-02-11 02:51:21', '2021-02-11 02:51:21'),
(2170, 'bd', 'SSL Wireless OTP', 'SSL Wireless OTP', '2021-02-11 02:51:21', '2021-02-11 02:51:21'),
(2171, 'bd', 'Fast2SMS OTP', 'Fast2SMS OTP', '2021-02-11 02:51:21', '2021-02-11 02:51:21'),
(2172, 'bd', 'MIMO OTP', 'MIMO OTP', '2021-02-11 02:51:21', '2021-02-11 02:51:21'),
(2173, 'bd', 'OTP will be Used For', 'OTP will be Used For', '2021-02-11 02:51:21', '2021-02-11 02:51:21'),
(2174, 'bd', 'Order Placement', 'Order Placement', '2021-02-11 02:51:21', '2021-02-11 02:51:21'),
(2175, 'bd', 'Delivery Status Changing Time', 'Delivery Status Changing Time', '2021-02-11 02:51:21', '2021-02-11 02:51:21'),
(2176, 'bd', 'Paid Status Changing Time', 'Paid Status Changing Time', '2021-02-11 02:51:21', '2021-02-11 02:51:21'),
(2177, 'bd', 'Refunds', 'Refunds', '2021-02-11 02:52:16', '2021-02-11 02:52:16'),
(2178, 'bd', 'Refund Requests', 'Refund Requests', '2021-02-11 02:52:16', '2021-02-11 02:52:16'),
(2179, 'bd', 'Approved Refund', 'Approved Refund', '2021-02-11 02:52:16', '2021-02-11 02:52:16'),
(2180, 'bd', 'Refund Configuration', 'Refund Configuration', '2021-02-11 02:52:16', '2021-02-11 02:52:16'),
(2181, 'bd', 'User Search Report', 'User Search Report', '2021-02-11 02:52:23', '2021-02-11 02:52:23'),
(2182, 'bd', 'Search By', 'Search By', '2021-02-11 02:52:23', '2021-02-11 02:52:23'),
(2183, 'bd', 'Number searches', 'Number searches', '2021-02-11 02:52:23', '2021-02-11 02:52:23'),
(2184, 'bd', 'Product Wish Report', 'Product Wish Report', '2021-02-11 02:52:24', '2021-02-11 02:52:24'),
(2185, 'bd', 'Sort by Category', 'Sort by Category', '2021-02-11 02:52:24', '2021-02-11 02:52:24'),
(2186, 'bd', 'Filter', 'Filter', '2021-02-11 02:52:24', '2021-02-11 02:52:24'),
(2187, 'bd', 'Number of Wish', 'Number of Wish', '2021-02-11 02:52:24', '2021-02-11 02:52:24'),
(2188, 'bd', 'Product wise stock report', 'Product wise stock report', '2021-02-11 02:52:27', '2021-02-11 02:52:27'),
(2189, 'bd', 'Stock', 'Stock', '2021-02-11 02:52:27', '2021-02-11 02:52:27'),
(2190, 'bd', 'Seller Based Selling Report', 'Seller Based Selling Report', '2021-02-11 02:52:31', '2021-02-11 02:52:31'),
(2191, 'bd', 'Sort by verificarion status', 'Sort by verificarion status', '2021-02-11 02:52:31', '2021-02-11 02:52:31'),
(2192, 'bd', 'Approved', 'Approved', '2021-02-11 02:52:31', '2021-02-11 02:52:31'),
(2193, 'bd', 'Non Approved', 'Non Approved', '2021-02-11 02:52:31', '2021-02-11 02:52:31'),
(2194, 'bd', 'Seller Name', 'Seller Name', '2021-02-11 02:52:31', '2021-02-11 02:52:31'),
(2195, 'bd', 'Shop Name', 'Shop Name', '2021-02-11 02:52:31', '2021-02-11 02:52:31'),
(2196, 'bd', 'Number of Product Sale', 'Number of Product Sale', '2021-02-11 02:52:31', '2021-02-11 02:52:31'),
(2197, 'bd', 'Order Amount', 'Order Amount', '2021-02-11 02:52:31', '2021-02-11 02:52:31'),
(2198, 'bd', 'Inhouse Product sale report', 'Inhouse Product sale report', '2021-02-11 02:52:34', '2021-02-11 02:52:34'),
(2199, 'bd', 'All Flash Deals', 'All Flash Deals', '2021-02-11 02:53:25', '2021-02-11 02:53:25'),
(2200, 'bd', 'Create New Flash Deal', 'Create New Flash Deal', '2021-02-11 02:53:25', '2021-02-11 02:53:25'),
(2201, 'bd', 'Start Date', 'Start Date', '2021-02-11 02:53:25', '2021-02-11 02:53:25'),
(2202, 'bd', 'End Date', 'End Date', '2021-02-11 02:53:25', '2021-02-11 02:53:25'),
(2203, 'bd', 'Page Link', 'Page Link', '2021-02-11 02:53:25', '2021-02-11 02:53:25'),
(2204, 'bd', 'Send Newsletter', 'Send Newsletter', '2021-02-11 02:53:28', '2021-02-11 02:53:28'),
(2205, 'bd', 'Emails', 'Emails', '2021-02-11 02:53:28', '2021-02-11 02:53:28'),
(2206, 'bd', 'Users', 'Users', '2021-02-11 02:53:28', '2021-02-11 02:53:28'),
(2207, 'bd', 'Newsletter subject', 'Newsletter subject', '2021-02-11 02:53:28', '2021-02-11 02:53:28'),
(2208, 'bd', 'Newsletter content', 'Newsletter content', '2021-02-11 02:53:28', '2021-02-11 02:53:28'),
(2209, 'bd', 'Send Bulk SMS', 'Send Bulk SMS', '2021-02-11 02:53:32', '2021-02-11 02:53:32'),
(2210, 'bd', 'Mobile Users', 'Mobile Users', '2021-02-11 02:53:32', '2021-02-11 02:53:32'),
(2211, 'bd', 'SMS subject', 'SMS subject', '2021-02-11 02:53:32', '2021-02-11 02:53:32'),
(2212, 'bd', 'SMS content', 'SMS content', '2021-02-11 02:53:32', '2021-02-11 02:53:32'),
(2213, 'bd', 'All Subscribers', 'All Subscribers', '2021-02-11 02:53:39', '2021-02-11 02:53:39'),
(2214, 'bd', 'All Coupons', 'All Coupons', '2021-02-11 02:53:42', '2021-02-11 02:53:42'),
(2215, 'bd', 'Add New Coupon', 'Add New Coupon', '2021-02-11 02:53:42', '2021-02-11 02:53:42'),
(2216, 'bd', 'Coupon Information', 'Coupon Information', '2021-02-11 02:53:42', '2021-02-11 02:53:42'),
(2217, 'bd', 'All uploaded files', 'All uploaded files', '2021-02-11 02:53:53', '2021-02-11 02:53:53'),
(2218, 'bd', 'Upload New File', 'Upload New File', '2021-02-11 02:53:53', '2021-02-11 02:53:53'),
(2219, 'bd', 'All files', 'All files', '2021-02-11 02:53:53', '2021-02-11 02:53:53'),
(2220, 'bd', 'Search', 'Search', '2021-02-11 02:53:53', '2021-02-11 02:53:53'),
(2221, 'bd', 'Details Info', 'Details Info', '2021-02-11 02:53:53', '2021-02-11 02:53:53'),
(2222, 'bd', 'Copy Link', 'Copy Link', '2021-02-11 02:53:53', '2021-02-11 02:53:53'),
(2223, 'bd', 'Are you sure to delete this file?', 'Are you sure to delete this file?', '2021-02-11 02:53:53', '2021-02-11 02:53:53'),
(2224, 'bd', 'File Info', 'File Info', '2021-02-11 02:53:53', '2021-02-11 02:53:53'),
(2225, 'bd', 'Link copied to clipboard', 'Link copied to clipboard', '2021-02-11 02:53:53', '2021-02-11 02:53:53'),
(2226, 'bd', 'Oops, unable to copy', 'Oops, unable to copy', '2021-02-11 02:53:53', '2021-02-11 02:53:53'),
(2227, 'bd', 'Email Or Phone', 'Email Or Phone', '2021-02-11 02:54:11', '2021-02-11 02:54:11'),
(2228, 'bd', 'Use country code before number', 'Use country code before number', '2021-02-11 02:54:11', '2021-02-11 02:54:11'),
(2229, 'bd', 'Attribute Information', 'Attribute Information', '2021-02-11 02:56:08', '2021-02-11 02:56:08'),
(2230, 'bd', 'Refund Request All', 'Refund Request All', '2021-02-11 03:34:31', '2021-02-11 03:34:31'),
(2231, 'bd', 'Order Code', 'Order Code', '2021-02-11 03:34:31', '2021-02-11 03:34:31'),
(2232, 'bd', 'Seller Approval', 'Seller Approval', '2021-02-11 03:34:31', '2021-02-11 03:34:31'),
(2233, 'bd', 'Refund Status', 'Refund Status', '2021-02-11 03:34:31', '2021-02-11 03:34:31'),
(2234, 'bd', 'Approval has been done successfully', 'Approval has been done successfully', '2021-02-11 03:34:31', '2021-02-11 03:34:31'),
(2235, 'bd', 'Refund has been sent successfully', 'Refund has been sent successfully', '2021-02-11 03:34:31', '2021-02-11 03:34:31'),
(2236, 'bd', 'Admin Approval', 'Admin Approval', '2021-02-11 03:34:33', '2021-02-11 03:34:33'),
(2237, 'bd', 'Set Refund Time', 'Set Refund Time', '2021-02-11 03:34:35', '2021-02-11 03:34:35'),
(2238, 'bd', 'Set Time for sending Refund Request', 'Set Time for sending Refund Request', '2021-02-11 03:34:35', '2021-02-11 03:34:35'),
(2239, 'bd', 'Set Refund Sticker', 'Set Refund Sticker', '2021-02-11 03:34:35', '2021-02-11 03:34:35'),
(2240, 'bd', 'Sticker', 'Sticker', '2021-02-11 03:34:35', '2021-02-11 03:34:35'),
(2241, 'bd', 'Filter by date', 'Filter by date', '2021-02-11 03:34:43', '2021-02-11 03:34:43'),
(2242, 'bd', 'Type Order code & hit Enter', 'Type Order code & hit Enter', '2021-02-11 03:34:43', '2021-02-11 03:34:43'),
(2243, 'bd', 'Num. of Products', 'Num. of Products', '2021-02-11 03:34:43', '2021-02-11 03:34:43'),
(2244, 'bd', 'Delivery Status', 'Delivery Status', '2021-02-11 03:34:43', '2021-02-11 03:34:43'),
(2245, 'bd', 'Payment Method', 'Payment Method', '2021-02-11 03:34:43', '2021-02-11 03:34:43'),
(2246, 'bd', 'Payment Status', 'Payment Status', '2021-02-11 03:34:43', '2021-02-11 03:34:43'),
(2247, 'bd', 'Refund', 'Refund', '2021-02-11 03:34:43', '2021-02-11 03:34:43'),
(2248, 'bd', 'Pickup Point Orders', 'Pickup Point Orders', '2021-02-11 03:34:45', '2021-02-11 03:34:45'),
(2249, 'bd', 'Filter by Payment Status', 'Filter by Payment Status', '2021-02-11 03:34:48', '2021-02-11 03:34:48'),
(2250, 'bd', 'Paid', 'Paid', '2021-02-11 03:34:48', '2021-02-11 03:34:48'),
(2251, 'bd', 'Un-Paid', 'Un-Paid', '2021-02-11 03:34:48', '2021-02-11 03:34:48'),
(2252, 'bd', 'Filter by Deliver Status', 'Filter by Deliver Status', '2021-02-11 03:34:48', '2021-02-11 03:34:48'),
(2253, 'bd', 'Pending', 'Pending', '2021-02-11 03:34:48', '2021-02-11 03:34:48'),
(2254, 'bd', 'Confirmed', 'Confirmed', '2021-02-11 03:34:48', '2021-02-11 03:34:48'),
(2255, 'bd', 'On delivery', 'On delivery', '2021-02-11 03:34:48', '2021-02-11 03:34:48'),
(2256, 'bd', 'Delivered', 'Delivered', '2021-02-11 03:34:48', '2021-02-11 03:34:48'),
(2257, 'bd', 'New', 'New', '2021-02-11 03:34:48', '2021-02-11 03:34:48'),
(2258, 'bd', 'Unpaid', 'Unpaid', '2021-02-11 03:34:48', '2021-02-11 03:34:48'),
(2259, 'bd', 'No Refund', 'No Refund', '2021-02-11 03:34:48', '2021-02-11 03:34:48'),
(2260, 'bd', 'View', 'View', '2021-02-11 03:34:48', '2021-02-11 03:34:48'),
(2261, 'bd', 'Download Invoice', 'Download Invoice', '2021-02-11 03:34:48', '2021-02-11 03:34:48'),
(2262, 'bd', 'Conversations', 'Conversations', '2021-02-11 03:36:45', '2021-02-11 03:36:45'),
(2263, 'bd', 'Sender', 'Sender', '2021-02-11 03:36:45', '2021-02-11 03:36:45'),
(2264, 'bd', 'Receiver', 'Receiver', '2021-02-11 03:36:45', '2021-02-11 03:36:45'),
(2265, 'bd', 'Seller Withdraw Request', 'Seller Withdraw Request', '2021-02-11 03:36:52', '2021-02-11 03:36:52'),
(2266, 'bd', 'Total Amount to Pay', 'Total Amount to Pay', '2021-02-11 03:36:52', '2021-02-11 03:36:52'),
(2267, 'bd', 'Requested Amount', 'Requested Amount', '2021-02-11 03:36:52', '2021-02-11 03:36:52'),
(2268, 'bd', 'Message', 'Message', '2021-02-11 03:36:52', '2021-02-11 03:36:52');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(2269, 'bd', 'of seller product price will be deducted from seller earnings', 'of seller product price will be deducted from seller earnings', '2021-02-11 03:36:54', '2021-02-11 03:36:54'),
(2270, 'bd', 'This commission only works when Category Based Commission is turned off from Business Settings', 'This commission only works when Category Based Commission is turned off from Business Settings', '2021-02-11 03:36:54', '2021-02-11 03:36:54'),
(2271, 'bd', 'Commission doesn\'t work if seller package system add-on is activated', 'Commission doesn\'t work if seller package system add-on is activated', '2021-02-11 03:36:54', '2021-02-11 03:36:54'),
(2272, 'bd', 'Filters', 'Filters', '2021-02-11 03:38:53', '2021-02-11 03:38:53'),
(2273, 'bd', 'Price range', 'Price range', '2021-02-11 03:38:53', '2021-02-11 03:38:53'),
(2274, 'bd', 'Filter by color', 'Filter by color', '2021-02-11 03:38:53', '2021-02-11 03:38:53'),
(2275, 'bd', 'Filter by', 'Filter by', '2021-02-11 03:38:53', '2021-02-11 03:38:53'),
(2276, 'bd', 'Newest', 'Newest', '2021-02-11 03:38:53', '2021-02-11 03:38:53'),
(2277, 'bd', 'Oldest', 'Oldest', '2021-02-11 03:38:53', '2021-02-11 03:38:53'),
(2278, 'bd', 'Price low to high', 'Price low to high', '2021-02-11 03:38:53', '2021-02-11 03:38:53'),
(2279, 'bd', 'Price high to low', 'Price high to low', '2021-02-11 03:38:54', '2021-02-11 03:38:54'),
(2280, 'bd', 'Seller Packages', 'Seller Packages', '2021-02-11 04:01:36', '2021-02-11 04:01:36'),
(2281, 'bd', 'Offline Seller Package Payments', 'Offline Seller Package Payments', '2021-02-11 04:01:37', '2021-02-11 04:01:37'),
(2282, 'bd', 'Add New Seller', 'Add New Seller', '2021-02-11 04:02:17', '2021-02-11 04:02:17'),
(2283, 'bd', 'Filter by Approval', 'Filter by Approval', '2021-02-11 04:02:17', '2021-02-11 04:02:17'),
(2284, 'bd', 'Non-Approved', 'Non-Approved', '2021-02-11 04:02:17', '2021-02-11 04:02:17'),
(2285, 'bd', 'Type name or email & Enter', 'Type name or email & Enter', '2021-02-11 04:02:17', '2021-02-11 04:02:17'),
(2286, 'bd', 'Due to seller', 'Due to seller', '2021-02-11 04:02:17', '2021-02-11 04:02:17'),
(2287, 'bd', 'Log in as this Seller', 'Log in as this Seller', '2021-02-11 04:02:17', '2021-02-11 04:02:17'),
(2288, 'bd', 'Go to Payment', 'Go to Payment', '2021-02-11 04:02:17', '2021-02-11 04:02:17'),
(2289, 'bd', 'Ban this seller', 'Ban this seller', '2021-02-11 04:02:17', '2021-02-11 04:02:17'),
(2290, 'bd', 'Do you really want to ban this seller?', 'Do you really want to ban this seller?', '2021-02-11 04:02:17', '2021-02-11 04:02:17'),
(2291, 'bd', 'Store Home', 'Store Home', '2021-02-11 04:26:12', '2021-02-11 04:26:12'),
(2292, 'bd', 'Top Selling', 'Top Selling', '2021-02-11 04:26:12', '2021-02-11 04:26:12'),
(2293, 'bd', 'New Arrival Products', 'New Arrival Products', '2021-02-11 04:26:12', '2021-02-11 04:26:12'),
(2294, 'bd', 'Admin can not be a seller', 'Admin can not be a seller', '2021-02-11 04:40:42', '2021-02-11 04:40:42'),
(2295, 'bd', 'Register your shop', 'Register your shop', '2021-02-11 04:40:57', '2021-02-11 04:40:57'),
(2296, 'bd', 'Personal Info', 'Personal Info', '2021-02-11 04:40:57', '2021-02-11 04:40:57'),
(2297, 'bd', 'Your Name', 'Your Name', '2021-02-11 04:40:57', '2021-02-11 04:40:57'),
(2298, 'bd', 'Your Email', 'Your Email', '2021-02-11 04:40:57', '2021-02-11 04:40:57'),
(2299, 'bd', 'Your Password', 'Your Password', '2021-02-11 04:40:57', '2021-02-11 04:40:57'),
(2300, 'bd', 'Repeat Password', 'Repeat Password', '2021-02-11 04:40:57', '2021-02-11 04:40:57'),
(2301, 'bd', 'Basic Info', 'Basic Info', '2021-02-11 04:40:57', '2021-02-11 04:40:57'),
(2302, 'bd', 'Choose image', 'Choose image', '2021-02-11 04:40:57', '2021-02-11 04:40:57'),
(2303, 'bd', 'Your Shop has been created successfully!', 'Your Shop has been created successfully!', '2021-02-11 04:41:53', '2021-02-11 04:41:53'),
(2304, 'bd', 'Purchase History', 'Purchase History', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2305, 'bd', 'Downloads', 'Downloads', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2306, 'bd', 'Sent Refund Request', 'Sent Refund Request', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2307, 'bd', 'Orders', 'Orders', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2308, 'bd', 'Received Refund Request', 'Received Refund Request', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2309, 'bd', 'Shop Setting', 'Shop Setting', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2310, 'bd', 'Money Withdraw', 'Money Withdraw', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2311, 'bd', 'Earning Points', 'Earning Points', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2312, 'bd', 'Support Ticket', 'Support Ticket', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2313, 'bd', 'Manage Profile', 'Manage Profile', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2314, 'bd', 'Sold Amount', 'Sold Amount', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2315, 'bd', 'Your sold amount (current month)', 'Your sold amount (current month)', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2316, 'bd', 'Total Sold', 'Total Sold', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2317, 'bd', 'Last Month Sold', 'Last Month Sold', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2318, 'bd', 'Shop Settings', 'Shop Settings', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2319, 'bd', 'Visit Shop', 'Visit Shop', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2320, 'bd', 'Shop Logo', 'Shop Logo', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2321, 'bd', 'Shop Address', 'Shop Address', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2322, 'bd', 'Banner Settings', 'Banner Settings', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2323, 'bd', 'Banners', 'Banners', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2324, 'bd', 'We had to limit height to maintian consistancy. In some device both side of the banner might be cropped for height limitation.', 'We had to limit height to maintian consistancy. In some device both side of the banner might be cropped for height limitation.', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2325, 'bd', 'Social Media Link', 'Social Media Link', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2326, 'bd', 'Facebook', 'Facebook', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2327, 'bd', 'Insert link with https ', 'Insert link with https ', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2328, 'bd', 'Twitter', 'Twitter', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2329, 'bd', 'Google', 'Google', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2330, 'bd', 'Item has been added to wishlist', 'Item has been added to wishlist', '2021-02-11 04:41:54', '2021-02-11 04:41:54'),
(2331, 'bd', 'Total sale', 'Total sale', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2332, 'bd', 'Total earnings', 'Total earnings', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2333, 'bd', 'Successful orders', 'Successful orders', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2334, 'bd', 'Total orders', 'Total orders', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2335, 'bd', 'Pending orders', 'Pending orders', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2336, 'bd', 'Cancelled orders', 'Cancelled orders', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2337, 'bd', 'Verify Now', 'Verify Now', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2338, 'bd', 'Purchased Package', 'Purchased Package', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2339, 'bd', 'Package Not Found', 'Package Not Found', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2340, 'bd', 'Upgrade Package', 'Upgrade Package', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2341, 'bd', 'Shop', 'Shop', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2342, 'bd', 'Manage & organize your shop', 'Manage & organize your shop', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2343, 'bd', 'Go to setting', 'Go to setting', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2344, 'bd', 'Payment', 'Payment', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2345, 'bd', 'Configure your payment method', 'Configure your payment method', '2021-02-11 04:42:17', '2021-02-11 04:42:17'),
(2346, 'bd', 'Your Phone', 'Your Phone', '2021-02-11 04:42:32', '2021-02-11 04:42:32'),
(2347, 'bd', 'Payment Setting', 'Payment Setting', '2021-02-11 04:42:32', '2021-02-11 04:42:32'),
(2348, 'bd', 'Cash Payment', 'Cash Payment', '2021-02-11 04:42:32', '2021-02-11 04:42:32'),
(2349, 'bd', 'Bank Payment', 'Bank Payment', '2021-02-11 04:42:32', '2021-02-11 04:42:32'),
(2350, 'bd', 'Bank Name', 'Bank Name', '2021-02-11 04:42:32', '2021-02-11 04:42:32'),
(2351, 'bd', 'Bank Account Name', 'Bank Account Name', '2021-02-11 04:42:32', '2021-02-11 04:42:32'),
(2352, 'bd', 'Bank Account Number', 'Bank Account Number', '2021-02-11 04:42:32', '2021-02-11 04:42:32'),
(2353, 'bd', 'Bank Routing Number', 'Bank Routing Number', '2021-02-11 04:42:32', '2021-02-11 04:42:32'),
(2354, 'bd', 'Update Profile', 'Update Profile', '2021-02-11 04:42:32', '2021-02-11 04:42:32'),
(2355, 'bd', 'Change your email', 'Change your email', '2021-02-11 04:42:32', '2021-02-11 04:42:32'),
(2356, 'bd', 'Sending Email...', 'Sending Email...', '2021-02-11 04:42:32', '2021-02-11 04:42:32'),
(2357, 'bd', 'Verify', 'Verify', '2021-02-11 04:42:32', '2021-02-11 04:42:32'),
(2358, 'bd', 'Update Email', 'Update Email', '2021-02-11 04:42:32', '2021-02-11 04:42:32'),
(2359, 'bd', 'Select your country', 'Select your country', '2021-02-11 04:42:33', '2021-02-11 04:42:33'),
(2360, 'bd', 'Shop Verification', 'Shop Verification', '2021-02-11 04:43:23', '2021-02-11 04:43:23'),
(2361, 'bd', 'Apply', 'Apply', '2021-02-11 04:43:23', '2021-02-11 04:43:23'),
(2362, 'bd', 'Applied Refund Request', 'Applied Refund Request', '2021-02-11 04:53:51', '2021-02-11 04:53:51'),
(2363, 'bd', 'Order id', 'Order id', '2021-02-11 04:53:51', '2021-02-11 04:53:51'),
(2364, 'bd', 'Bulk Products Upload', 'Bulk Products Upload', '2021-02-11 04:53:55', '2021-02-11 04:53:55'),
(2365, 'bd', '1. Download the skeleton file and fill it with data.', '1. Download the skeleton file and fill it with data.', '2021-02-11 04:53:55', '2021-02-11 04:53:55'),
(2366, 'bd', '2. You can download the example file to understand how the data must be filled.', '2. You can download the example file to understand how the data must be filled.', '2021-02-11 04:53:55', '2021-02-11 04:53:55'),
(2367, 'bd', '3. Once you have downloaded and filled the skeleton file, upload it in the form below and submit.', '3. Once you have downloaded and filled the skeleton file, upload it in the form below and submit.', '2021-02-11 04:53:55', '2021-02-11 04:53:55'),
(2368, 'bd', '4. After uploading products you need to edit them and set products images and choices.', '4. After uploading products you need to edit them and set products images and choices.', '2021-02-11 04:53:55', '2021-02-11 04:53:55'),
(2369, 'bd', '1. Category and Brand should be in numerical id.', '1. Category and Brand should be in numerical id.', '2021-02-11 04:53:55', '2021-02-11 04:53:55'),
(2370, 'bd', '2. You can download the pdf to get Category and Brand id.', '2. You can download the pdf to get Category and Brand id.', '2021-02-11 04:53:55', '2021-02-11 04:53:55'),
(2371, 'bd', 'Upload CSV File', 'Upload CSV File', '2021-02-11 04:53:55', '2021-02-11 04:53:55'),
(2372, 'bd', 'CSV', 'CSV', '2021-02-11 04:53:55', '2021-02-11 04:53:55'),
(2373, 'bd', 'Remaining Uploads', 'Remaining Uploads', '2021-02-11 04:54:24', '2021-02-11 04:54:24'),
(2374, 'bd', 'No Package Found', 'No Package Found', '2021-02-11 04:54:24', '2021-02-11 04:54:24'),
(2375, 'bd', 'Refund Request', 'Refund Request', '2021-02-11 04:54:33', '2021-02-11 04:54:33'),
(2376, 'bd', 'Reason', 'Reason', '2021-02-11 04:54:34', '2021-02-11 04:54:34'),
(2377, 'bd', 'Comment', 'Comment', '2021-02-11 04:54:36', '2021-02-11 04:54:36'),
(2378, 'bd', 'Pending Balance', 'Pending Balance', '2021-02-11 04:54:48', '2021-02-11 04:54:48'),
(2379, 'bd', 'Send Withdraw Request', 'Send Withdraw Request', '2021-02-11 04:54:48', '2021-02-11 04:54:48'),
(2380, 'bd', 'Withdraw Request history', 'Withdraw Request history', '2021-02-11 04:54:48', '2021-02-11 04:54:48'),
(2381, 'bd', 'Send A Withdraw Request', 'Send A Withdraw Request', '2021-02-11 04:54:48', '2021-02-11 04:54:48'),
(2382, 'bd', 'You do not have enough balance to send withdraw request', 'You do not have enough balance to send withdraw request', '2021-02-11 04:54:48', '2021-02-11 04:54:48'),
(2383, 'bd', 'My Points', 'My Points', '2021-02-11 04:54:54', '2021-02-11 04:54:54'),
(2384, 'bd', ' Points', ' Points', '2021-02-11 04:54:54', '2021-02-11 04:54:54'),
(2385, 'bd', 'Wallet Money', 'Wallet Money', '2021-02-11 04:54:54', '2021-02-11 04:54:54'),
(2386, 'bd', 'Point Earning history', 'Point Earning history', '2021-02-11 04:54:54', '2021-02-11 04:54:54'),
(2387, 'bd', 'Converted', 'Converted', '2021-02-11 04:54:54', '2021-02-11 04:54:54'),
(2388, 'bd', 'Action', 'Action', '2021-02-11 04:54:54', '2021-02-11 04:54:54'),
(2389, 'bd', 'Convert has been done successfully Check your Wallets', 'Convert has been done successfully Check your Wallets', '2021-02-11 04:54:54', '2021-02-11 04:54:54'),
(2390, 'bd', 'Create a Ticket', 'Create a Ticket', '2021-02-11 04:55:04', '2021-02-11 04:55:04'),
(2391, 'bd', 'Tickets', 'Tickets', '2021-02-11 04:55:04', '2021-02-11 04:55:04'),
(2392, 'bd', 'Ticket ID', 'Ticket ID', '2021-02-11 04:55:04', '2021-02-11 04:55:04'),
(2393, 'bd', 'Sending Date', 'Sending Date', '2021-02-11 04:55:04', '2021-02-11 04:55:04'),
(2394, 'bd', 'Subject', 'Subject', '2021-02-11 04:55:04', '2021-02-11 04:55:04'),
(2395, 'bd', 'Provide a detailed description', 'Provide a detailed description', '2021-02-11 04:55:04', '2021-02-11 04:55:04'),
(2396, 'bd', 'Type your reply', 'Type your reply', '2021-02-11 04:55:04', '2021-02-11 04:55:04'),
(2397, 'bd', 'Send Ticket', 'Send Ticket', '2021-02-11 04:55:04', '2021-02-11 04:55:04'),
(2398, 'bd', 'Role Information', 'Role Information', '2021-02-11 04:57:43', '2021-02-11 04:57:43'),
(2399, 'bd', 'Permissions', 'Permissions', '2021-02-11 04:57:43', '2021-02-11 04:57:43'),
(2400, 'bd', 'Order Details', 'Order Details', '2021-02-11 04:58:43', '2021-02-11 04:58:43'),
(2401, 'bd', 'Order #', 'Order #', '2021-02-11 04:58:43', '2021-02-11 04:58:43'),
(2402, 'bd', 'Order Status', 'Order Status', '2021-02-11 04:58:43', '2021-02-11 04:58:43'),
(2403, 'bd', 'Order Date', 'Order Date', '2021-02-11 04:58:43', '2021-02-11 04:58:43'),
(2404, 'bd', 'Total amount', 'Total amount', '2021-02-11 04:58:43', '2021-02-11 04:58:43'),
(2405, 'bd', 'Delivery Type', 'Delivery Type', '2021-02-11 04:58:43', '2021-02-11 04:58:43'),
(2406, 'bd', 'Qty', 'Qty', '2021-02-11 04:58:43', '2021-02-11 04:58:43'),
(2407, 'bd', 'Home Delivery', 'Home Delivery', '2021-02-11 04:58:43', '2021-02-11 04:58:43'),
(2408, 'bd', 'Sub Total', 'Sub Total', '2021-02-11 04:58:43', '2021-02-11 04:58:43'),
(2409, 'bd', 'Shipping', 'Shipping', '2021-02-11 04:58:43', '2021-02-11 04:58:43'),
(2410, 'bd', 'Delivery status has been updated', 'Delivery status has been updated', '2021-02-11 04:58:43', '2021-02-11 04:58:43'),
(2411, 'bd', 'Payment status has been updated', 'Payment status has been updated', '2021-02-11 04:58:43', '2021-02-11 04:58:43'),
(2412, 'bd', 'Product has been duplicated successfully', 'Product has been duplicated successfully', '2021-02-13 02:41:08', '2021-02-13 02:41:08'),
(2413, 'bd', 'Back to uploaded files', 'Back to uploaded files', '2021-02-13 03:45:11', '2021-02-13 03:45:11'),
(2414, 'bd', 'Drag & drop your files', 'Drag & drop your files', '2021-02-13 03:45:11', '2021-02-13 03:45:11'),
(2415, 'bd', 'Refundable', 'Refundable', '2021-02-13 03:47:48', '2021-02-13 03:47:48'),
(2416, 'bd', 'File deleted successfully', 'File deleted successfully', '2021-02-13 04:14:52', '2021-02-13 04:14:52'),
(2417, 'en', 'Search in menu', 'Search in menu', '2021-02-13 05:04:17', '2021-02-13 05:04:17'),
(2418, 'en', 'Uploaded Files', 'Uploaded Files', '2021-02-13 05:04:17', '2021-02-13 05:04:17'),
(2419, 'en', 'Shipping Cities', 'Shipping Cities', '2021-02-13 05:04:18', '2021-02-13 05:04:18'),
(2420, 'en', 'System', 'System', '2021-02-13 05:04:18', '2021-02-13 05:04:18'),
(2421, 'en', 'Server status', 'Server status', '2021-02-13 05:04:18', '2021-02-13 05:04:18'),
(2422, 'en', 'Nothing Found', 'Nothing Found', '2021-02-13 05:04:18', '2021-02-13 05:04:18'),
(2423, 'en', 'All cities', 'All cities', '2021-02-13 05:04:41', '2021-02-13 05:04:41'),
(2424, 'en', 'Cities', 'Cities', '2021-02-13 05:04:41', '2021-02-13 05:04:41'),
(2425, 'en', 'Cost', 'Cost', '2021-02-13 05:04:41', '2021-02-13 05:04:41'),
(2426, 'en', 'Add New city', 'Add New city', '2021-02-13 05:04:41', '2021-02-13 05:04:41'),
(2427, 'en', 'Search your files', 'Search your files', '2021-02-13 05:05:01', '2021-02-13 05:05:01'),
(2428, 'en', 'Please Configure SMTP Setting to work all email sending functionality', 'Please Configure SMTP Setting to work all email sending functionality', '2021-02-13 05:07:40', '2021-02-13 05:07:40'),
(2429, 'en', 'Order', 'Order', '2021-02-13 05:07:40', '2021-02-13 05:07:40'),
(2430, 'en', 'Back To Home', 'Back To Home', '2021-02-13 05:15:34', '2021-02-13 05:15:34'),
(2431, 'en', 'HTTPS Activation', 'HTTPS Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2432, 'en', 'Maintenance Mode', 'Maintenance Mode', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2433, 'en', 'Maintenance Mode Activation', 'Maintenance Mode Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2434, 'en', 'Classified Product Activate', 'Classified Product Activate', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2435, 'en', 'Classified Product', 'Classified Product', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2436, 'en', 'Business Related', 'Business Related', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2437, 'en', 'Vendor System Activation', 'Vendor System Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2438, 'en', 'Wallet System Activation', 'Wallet System Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2439, 'en', 'Coupon System Activation', 'Coupon System Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2440, 'en', 'Pickup Point Activation', 'Pickup Point Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2441, 'en', 'Conversation Activation', 'Conversation Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2442, 'en', 'Guest Checkout Activation', 'Guest Checkout Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2443, 'en', 'Category-based Commission', 'Category-based Commission', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2444, 'en', 'After activate this option Seller commision will be disabled and You need to set commission on each category otherwise Admin will not get any commision', 'After activate this option Seller commision will be disabled and You need to set commission on each category otherwise Admin will not get any commision', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2445, 'en', 'Set Commisssion Now', 'Set Commisssion Now', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2446, 'en', 'Email Verification', 'Email Verification', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2447, 'en', 'Payment Related', 'Payment Related', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2448, 'en', 'Paypal Payment Activation', 'Paypal Payment Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2449, 'en', 'You need to configure Paypal correctly to enable this feature', 'You need to configure Paypal correctly to enable this feature', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2450, 'en', 'Stripe Payment Activation', 'Stripe Payment Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2451, 'en', 'SSlCommerz Activation', 'SSlCommerz Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2452, 'en', 'Instamojo Payment Activation', 'Instamojo Payment Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2453, 'en', 'You need to configure Instamojo Payment correctly to enable this feature', 'You need to configure Instamojo Payment correctly to enable this feature', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2454, 'en', 'Razor Pay Activation', 'Razor Pay Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2455, 'en', 'You need to configure Razor correctly to enable this feature', 'You need to configure Razor correctly to enable this feature', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2456, 'en', 'PayStack Activation', 'PayStack Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2457, 'en', 'You need to configure PayStack correctly to enable this feature', 'You need to configure PayStack correctly to enable this feature', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2458, 'en', 'VoguePay Activation', 'VoguePay Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2459, 'en', 'You need to configure VoguePay correctly to enable this feature', 'You need to configure VoguePay correctly to enable this feature', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2460, 'en', 'Payhere Activation', 'Payhere Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2461, 'en', 'Ngenius Activation', 'Ngenius Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2462, 'en', 'You need to configure Ngenius correctly to enable this feature', 'You need to configure Ngenius correctly to enable this feature', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2463, 'en', 'Iyzico Activation', 'Iyzico Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2464, 'en', 'You need to configure iyzico correctly to enable this feature', 'You need to configure iyzico correctly to enable this feature', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2465, 'en', 'Bkash Activation', 'Bkash Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2466, 'en', 'You need to configure bkash correctly to enable this feature', 'You need to configure bkash correctly to enable this feature', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2467, 'en', 'Nagad Activation', 'Nagad Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2468, 'en', 'You need to configure nagad correctly to enable this feature', 'You need to configure nagad correctly to enable this feature', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2469, 'en', 'Cash Payment Activation', 'Cash Payment Activation', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2470, 'en', 'Social Media Login', 'Social Media Login', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2471, 'en', 'Facebook login', 'Facebook login', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2472, 'en', 'You need to configure Facebook Client correctly to enable this feature', 'You need to configure Facebook Client correctly to enable this feature', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2473, 'en', 'Google login', 'Google login', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2474, 'en', 'You need to configure Google Client correctly to enable this feature', 'You need to configure Google Client correctly to enable this feature', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2475, 'en', 'Twitter login', 'Twitter login', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2476, 'en', 'You need to configure Twitter Client correctly to enable this feature', 'You need to configure Twitter Client correctly to enable this feature', '2021-02-13 05:29:08', '2021-02-13 05:29:08'),
(2477, 'en', 'Cookies Agreement', 'Cookies Agreement', '2021-02-13 05:29:19', '2021-02-13 05:29:19'),
(2478, 'en', 'Cookies Agreement Text', 'Cookies Agreement Text', '2021-02-13 05:29:19', '2021-02-13 05:29:19'),
(2479, 'en', 'Show Cookies Agreement?', 'Show Cookies Agreement?', '2021-02-13 05:29:19', '2021-02-13 05:29:19'),
(2480, 'en', 'Custom Script', 'Custom Script', '2021-02-13 05:29:19', '2021-02-13 05:29:19'),
(2481, 'en', 'Header custom script - before </head>', 'Header custom script - before </head>', '2021-02-13 05:29:19', '2021-02-13 05:29:19'),
(2482, 'en', 'Write script with <script> tag', 'Write script with <script> tag', '2021-02-13 05:29:19', '2021-02-13 05:29:19'),
(2483, 'en', 'Footer custom script - before </body>', 'Footer custom script - before </body>', '2021-02-13 05:29:19', '2021-02-13 05:29:19'),
(2484, 'en', 'Best Selling Advertisement ', 'Best Selling Advertisement ', '2021-02-13 05:39:23', '2021-02-13 05:39:23'),
(2485, 'en', 'Best Selling Advertisement Image', 'Best Selling Advertisement Image', '2021-02-13 05:40:24', '2021-02-13 05:40:24'),
(2486, 'en', 'Will be used in Left Side of Best Selling Addvertisement Section ', 'Will be used in Left Side of Best Selling Addvertisement Section ', '2021-02-13 05:43:31', '2021-02-13 05:43:31'),
(2487, 'en', 'Something went wrong!', 'Something went wrong!', '2021-02-13 22:47:59', '2021-02-13 22:47:59'),
(2488, 'en', 'Sorry for the inconvenience, but we\'re working on it.', 'Sorry for the inconvenience, but we\'re working on it.', '2021-02-13 22:47:59', '2021-02-13 22:47:59'),
(2489, 'en', 'Error code', 'Error code', '2021-02-13 22:47:59', '2021-02-13 22:47:59'),
(2490, 'en', 'Best Seller Advertisement Image', 'Best Seller Advertisement Image', '2021-02-14 00:16:55', '2021-02-14 00:16:55'),
(2491, 'en', 'Will be used in Left Side of Best Seller Addvertisement Section ', 'Will be used in Left Side of Best Seller Addvertisement Section ', '2021-02-14 00:16:55', '2021-02-14 00:16:55'),
(2492, 'en', 'Featured Products Advertisement Image', 'Featured Products Advertisement Image', '2021-02-14 00:29:52', '2021-02-14 00:29:52'),
(2493, 'en', 'Will be used in Left Side of Featured Products Addvertisement Section ', 'Will be used in Left Side of Featured Products Addvertisement Section ', '2021-02-14 00:29:52', '2021-02-14 00:29:52'),
(2494, 'en', 'Parent Category', 'Parent Category', '2021-02-14 02:51:53', '2021-02-14 02:51:53'),
(2495, 'en', 'Level', 'Level', '2021-02-14 02:51:53', '2021-02-14 02:51:53'),
(2496, 'en', 'Use Phone Instead', 'Use Phone Instead', '2021-02-14 18:56:39', '2021-02-14 18:56:39'),
(2497, 'en', 'Registration successfull.', 'Registration successfull.', '2021-02-14 18:57:47', '2021-02-14 18:57:47'),
(2498, 'en', 'Verify Now', 'Verify Now', '2021-02-14 19:39:12', '2021-02-14 19:39:12'),
(2499, 'en', 'Shop Verification', 'Shop Verification', '2021-02-14 19:39:27', '2021-02-14 19:39:27'),
(2500, 'en', 'Shop Logo', 'Shop Logo', '2021-02-14 19:39:36', '2021-02-14 19:39:36'),
(2501, 'en', 'Shop Address', 'Shop Address', '2021-02-14 19:39:36', '2021-02-14 19:39:36'),
(2502, 'en', 'Banner Settings', 'Banner Settings', '2021-02-14 19:39:36', '2021-02-14 19:39:36'),
(2503, 'en', 'Banners', 'Banners', '2021-02-14 19:39:36', '2021-02-14 19:39:36'),
(2504, 'en', 'We had to limit height to maintian consistancy. In some device both side of the banner might be cropped for height limitation.', 'We had to limit height to maintian consistancy. In some device both side of the banner might be cropped for height limitation.', '2021-02-14 19:39:36', '2021-02-14 19:39:36'),
(2505, 'en', 'Insert link with https ', 'Insert link with https ', '2021-02-14 19:39:36', '2021-02-14 19:39:36'),
(2506, 'en', 'We have limited banner height to maintain UI. We had to crop from both left & right side in view for different devices to make it responsive. Before designing banner keep these points in mind.', 'We have limited banner height to maintain UI. We had to crop from both left & right side in view for different devices to make it responsive. Before designing banner keep these points in mind.', '2021-02-14 19:43:02', '2021-02-14 19:43:02'),
(2507, 'en', 'Home Banner 3 (Max 3)', 'Home Banner 3 (Max 3)', '2021-02-14 19:43:02', '2021-02-14 19:43:02'),
(2508, 'en', 'Product Image', 'Product Image', '2021-02-14 19:48:44', '2021-02-14 19:48:44'),
(2509, 'en', 'This is used for search. Input those words by which cutomer can find this product.', 'This is used for search. Input those words by which cutomer can find this product.', '2021-02-14 20:12:41', '2021-02-14 20:12:41'),
(2510, 'en', 'These images are visible in product details page gallery. Use 600x600 sizes images.', 'These images are visible in product details page gallery. Use 600x600 sizes images.', '2021-02-14 20:12:41', '2021-02-14 20:12:41'),
(2511, 'en', 'This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.', 'This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.', '2021-02-14 20:12:41', '2021-02-14 20:12:41'),
(2512, 'en', 'Use proper link without extra parameter. Don\'t use short share link/embeded iframe code.', 'Use proper link without extra parameter. Don\'t use short share link/embeded iframe code.', '2021-02-14 20:12:41', '2021-02-14 20:12:41'),
(2513, 'en', 'Save Product', 'Save Product', '2021-02-14 20:12:42', '2021-02-14 20:12:42'),
(2514, 'en', 'Install/Update Addon', 'Install/Update Addon', '2021-02-15 11:21:37', '2021-02-15 11:21:37'),
(2515, 'en', 'Install/Update', 'Install/Update', '2021-02-15 11:21:56', '2021-02-15 11:21:56'),
(2516, 'en', 'This addon is updated successfully', 'This addon is updated successfully', '2021-02-15 11:22:31', '2021-02-15 11:22:31'),
(2517, 'en', 'of seller product price will be deducted from seller earnings', 'of seller product price will be deducted from seller earnings', '2021-02-15 11:33:18', '2021-02-15 11:33:18'),
(2518, 'en', 'This commission only works when Category Based Commission is turned off from Business Settings', 'This commission only works when Category Based Commission is turned off from Business Settings', '2021-02-15 11:33:18', '2021-02-15 11:33:18'),
(2519, 'en', 'Commission doesn\'t work if seller package system add-on is activated', 'Commission doesn\'t work if seller package system add-on is activated', '2021-02-15 11:33:18', '2021-02-15 11:33:18'),
(2520, 'en', 'Approved sellers updated successfully', 'Approved sellers updated successfully', '2021-02-16 11:23:50', '2021-02-16 11:23:50'),
(2521, 'en', 'Translatable', 'Translatable', '2021-02-16 16:38:42', '2021-02-16 16:38:42'),
(2522, 'en', 'Product has been inserted successfully', 'Product has been inserted successfully', '2021-02-16 16:46:46', '2021-02-16 16:46:46'),
(2523, 'en', 'Product has been duplicated successfully', 'Product has been duplicated successfully', '2021-02-16 16:46:55', '2021-02-16 16:46:55'),
(2524, 'en', 'Email or Phone already exists.', 'Email or Phone already exists.', '2021-02-16 17:04:34', '2021-02-16 17:04:34'),
(2525, 'en', 'All uploaded files', 'All uploaded files', '2021-02-16 23:33:28', '2021-02-16 23:33:28'),
(2526, 'en', 'Upload New File', 'Upload New File', '2021-02-16 23:33:28', '2021-02-16 23:33:28'),
(2527, 'en', 'All files', 'All files', '2021-02-16 23:33:28', '2021-02-16 23:33:28'),
(2528, 'en', 'Search', 'Search', '2021-02-16 23:33:28', '2021-02-16 23:33:28'),
(2529, 'en', 'Details Info', 'Details Info', '2021-02-16 23:33:28', '2021-02-16 23:33:28'),
(2530, 'en', 'Copy Link', 'Copy Link', '2021-02-16 23:33:28', '2021-02-16 23:33:28'),
(2531, 'en', 'Are you sure to delete this file?', 'Are you sure to delete this file?', '2021-02-16 23:33:28', '2021-02-16 23:33:28'),
(2532, 'en', 'File Info', 'File Info', '2021-02-16 23:33:28', '2021-02-16 23:33:28'),
(2533, 'en', 'Link copied to clipboard', 'Link copied to clipboard', '2021-02-16 23:33:28', '2021-02-16 23:33:28'),
(2534, 'en', 'Oops, unable to copy', 'Oops, unable to copy', '2021-02-16 23:33:28', '2021-02-16 23:33:28'),
(2535, 'en', 'Edit and Update Customer wallet', 'Edit and Update Customer wallet', '2021-02-17 00:09:21', '2021-02-17 00:09:21'),
(2536, 'en', 'Add New Brand', 'Add New Brand', '2021-02-17 00:10:00', '2021-02-17 00:10:00'),
(2537, 'en', '120x80', '120x80', '2021-02-17 00:10:00', '2021-02-17 00:10:00'),
(2538, 'en', 'MIMO OTP', 'MIMO OTP', '2021-02-17 00:10:48', '2021-02-17 00:10:48'),
(2539, 'en', 'MIMO Credential', 'MIMO Credential', '2021-02-17 00:10:55', '2021-02-17 00:10:55'),
(2540, 'en', 'MIMO_USERNAME', 'MIMO_USERNAME', '2021-02-17 00:10:55', '2021-02-17 00:10:55'),
(2541, 'en', 'MIMO_PASSWORD', 'MIMO_PASSWORD', '2021-02-17 00:10:55', '2021-02-17 00:10:55'),
(2542, 'en', 'MIMO_SENDER_ID', 'MIMO_SENDER_ID', '2021-02-17 00:10:55', '2021-02-17 00:10:55'),
(2543, 'en', 'Seller Withdraw Request', 'Seller Withdraw Request', '2021-02-17 00:12:53', '2021-02-17 00:12:53'),
(2544, 'en', 'Seller', 'Seller', '2021-02-17 00:12:53', '2021-02-17 00:12:53'),
(2545, 'en', 'Total Amount to Pay', 'Total Amount to Pay', '2021-02-17 00:12:53', '2021-02-17 00:12:53'),
(2546, 'en', 'Requested Amount', 'Requested Amount', '2021-02-17 00:12:53', '2021-02-17 00:12:53'),
(2547, 'en', 'Seller Wallet', 'Seller Wallet', '2021-02-17 00:18:48', '2021-02-17 00:18:48'),
(2548, 'en', 'Customer Wallet', 'Customer Wallet', '2021-02-17 00:19:28', '2021-02-17 00:19:28'),
(2549, 'en', 'Please add shipping address', 'Please add shipping address', '2021-02-17 00:23:52', '2021-02-17 00:23:52'),
(2550, 'en', 'Wallet', 'Wallet', '2021-02-17 00:34:05', '2021-02-17 00:34:05'),
(2551, 'en', 'Filter by date', 'Filter by date', '2021-02-17 05:09:09', '2021-02-17 05:09:09'),
(2552, 'en', 'Bkash', 'Bkash', '2021-02-17 05:09:09', '2021-02-17 05:09:09'),
(2553, 'en', 'Wallet Edit', 'Wallet Edit', '2021-02-17 07:15:08', '2021-02-17 07:15:08'),
(2554, 'en', 'Customers Wallet', 'Customers Wallet', '2021-02-17 07:17:00', '2021-02-17 07:17:00'),
(2555, 'en', 'All Customers', 'All Customers', '2021-02-17 22:36:43', '2021-02-17 22:36:43'),
(2556, 'en', 'Type email or name & Enter', 'Type email or name & Enter', '2021-02-17 22:36:43', '2021-02-17 22:36:43'),
(2557, 'en', 'Package', 'Package', '2021-02-17 22:36:43', '2021-02-17 22:36:43'),
(2558, 'en', 'Wallet Balance', 'Wallet Balance', '2021-02-17 22:36:43', '2021-02-17 22:36:43'),
(2559, 'en', 'Log in as this Customer', 'Log in as this Customer', '2021-02-17 22:36:43', '2021-02-17 22:36:43'),
(2560, 'en', 'Ban this Customer', 'Ban this Customer', '2021-02-17 22:36:43', '2021-02-17 22:36:43'),
(2561, 'en', 'Do you really want to ban this Customer?', 'Do you really want to ban this Customer?', '2021-02-17 22:36:43', '2021-02-17 22:36:43'),
(2562, 'en', 'Proceed!', 'Proceed!', '2021-02-17 22:36:43', '2021-02-17 22:36:43'),
(2563, 'en', 'Do you really want to unban this Customer?', 'Do you really want to unban this Customer?', '2021-02-17 22:36:43', '2021-02-17 22:36:43'),
(2564, 'en', 'Wallet Amount', 'Wallet Amount', '2021-02-21 23:04:21', '2021-02-21 23:04:21'),
(2565, 'en', 'Approval has been done successfully', 'Approval has been done successfully', '2021-02-21 23:05:05', '2021-02-21 23:05:05'),
(2566, 'en', 'Refund has been sent successfully', 'Refund has been sent successfully', '2021-02-21 23:05:05', '2021-02-21 23:05:05'),
(2567, 'en', 'Pickup Point Information', 'Pickup Point Information', '2021-02-21 23:06:40', '2021-02-21 23:06:40'),
(2568, 'en', 'Pickup Point Status', 'Pickup Point Status', '2021-02-21 23:06:40', '2021-02-21 23:06:40'),
(2569, 'en', 'Pick-up Point Manager', 'Pick-up Point Manager', '2021-02-21 23:06:40', '2021-02-21 23:06:40'),
(2570, 'en', 'System Default Currency', 'System Default Currency', '2021-02-21 23:06:54', '2021-02-21 23:06:54'),
(2571, 'en', 'Set Currency Formats', 'Set Currency Formats', '2021-02-21 23:06:54', '2021-02-21 23:06:54'),
(2572, 'en', 'Symbol Format', 'Symbol Format', '2021-02-21 23:06:54', '2021-02-21 23:06:54'),
(2573, 'en', 'Decimal Separator', 'Decimal Separator', '2021-02-21 23:06:54', '2021-02-21 23:06:54'),
(2574, 'en', 'No of decimals', 'No of decimals', '2021-02-21 23:06:54', '2021-02-21 23:06:54'),
(2575, 'en', 'All Currencies', 'All Currencies', '2021-02-21 23:06:54', '2021-02-21 23:06:54'),
(2576, 'en', 'Add New Currency', 'Add New Currency', '2021-02-21 23:06:54', '2021-02-21 23:06:54'),
(2577, 'en', 'Currency name', 'Currency name', '2021-02-21 23:06:54', '2021-02-21 23:06:54'),
(2578, 'en', 'Currency symbol', 'Currency symbol', '2021-02-21 23:06:54', '2021-02-21 23:06:54'),
(2579, 'en', 'Currency code', 'Currency code', '2021-02-21 23:06:54', '2021-02-21 23:06:54'),
(2580, 'en', 'Currency Status updated successfully', 'Currency Status updated successfully', '2021-02-21 23:06:54', '2021-02-21 23:06:54'),
(2581, 'en', 'Basic Affiliate', 'Basic Affiliate', '2021-02-21 23:08:49', '2021-02-21 23:08:49'),
(2582, 'en', 'User Registration & First Purchase', 'User Registration & First Purchase', '2021-02-21 23:08:49', '2021-02-21 23:08:49'),
(2583, 'en', 'Product Sharing Affiliate', 'Product Sharing Affiliate', '2021-02-21 23:08:49', '2021-02-21 23:08:49'),
(2584, 'en', 'Product Sharing and Purchasing', 'Product Sharing and Purchasing', '2021-02-21 23:08:49', '2021-02-21 23:08:49'),
(2585, 'en', 'Product Sharing Affiliate (Category Wise)', 'Product Sharing Affiliate (Category Wise)', '2021-02-21 23:08:49', '2021-02-21 23:08:49'),
(2586, 'en', 'Refferal Users', 'Refferal Users', '2021-02-21 23:09:21', '2021-02-21 23:09:21'),
(2587, 'en', 'Reffered By', 'Reffered By', '2021-02-21 23:09:21', '2021-02-21 23:09:21'),
(2588, 'en', 'Affiliate Withdraw Request', 'Affiliate Withdraw Request', '2021-02-21 23:09:26', '2021-02-21 23:09:26'),
(2589, 'en', 'Affiliate Withdraw Request Reject', 'Affiliate Withdraw Request Reject', '2021-02-21 23:09:26', '2021-02-21 23:09:26'),
(2590, 'en', 'Are you sure, You want to reject this?', 'Are you sure, You want to reject this?', '2021-02-21 23:09:26', '2021-02-21 23:09:26'),
(2591, 'en', 'Sendmail', 'Sendmail', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2592, 'en', 'Mailgun', 'Mailgun', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2593, 'en', 'MAIL HOST', 'MAIL HOST', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2594, 'en', 'MAIL PORT', 'MAIL PORT', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2595, 'en', 'MAIL USERNAME', 'MAIL USERNAME', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2596, 'en', 'MAIL PASSWORD', 'MAIL PASSWORD', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2597, 'en', 'MAIL ENCRYPTION', 'MAIL ENCRYPTION', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2598, 'en', 'MAIL FROM ADDRESS', 'MAIL FROM ADDRESS', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2599, 'en', 'MAIL FROM NAME', 'MAIL FROM NAME', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2600, 'en', 'MAILGUN DOMAIN', 'MAILGUN DOMAIN', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2601, 'en', 'MAILGUN SECRET', 'MAILGUN SECRET', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2602, 'en', 'Save Configuration', 'Save Configuration', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2603, 'en', 'Test SMTP configuration', 'Test SMTP configuration', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2604, 'en', 'Enter your email address', 'Enter your email address', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2605, 'en', 'Send test email', 'Send test email', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2606, 'en', 'Instruction', 'Instruction', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2607, 'en', 'Please be carefull when you are configuring SMTP. For incorrect configuration you will get error at the time of order place, new registration, sending newsletter.', 'Please be carefull when you are configuring SMTP. For incorrect configuration you will get error at the time of order place, new registration, sending newsletter.', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2608, 'en', 'For Non-SSL', 'For Non-SSL', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2609, 'en', 'Select sendmail for Mail Driver if you face any issue after configuring smtp as Mail Driver ', 'Select sendmail for Mail Driver if you face any issue after configuring smtp as Mail Driver ', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2610, 'en', 'Set Mail Host according to your server Mail Client Manual Settings', 'Set Mail Host according to your server Mail Client Manual Settings', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2611, 'en', 'Set Mail port as 587', 'Set Mail port as 587', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2612, 'en', 'Set Mail Encryption as ssl if you face issue with tls', 'Set Mail Encryption as ssl if you face issue with tls', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2613, 'en', 'For SSL', 'For SSL', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2614, 'en', 'Set Mail port as 465', 'Set Mail port as 465', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2615, 'en', 'Set Mail Encryption as ssl', 'Set Mail Encryption as ssl', '2021-02-22 02:06:58', '2021-02-22 02:06:58'),
(2616, 'en', 'H', 'H', '2021-02-22 04:02:47', '2021-02-22 04:02:47'),
(2617, 'en', 'Update Customer wallet', 'Update Customer wallet', '2021-02-22 04:17:55', '2021-02-22 04:17:55');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `file_original_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `extension` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `user_id`, `file_size`, `extension`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ImageRight', 'uploads/all/58gLM2vj76GJrsdwfRmKs33ZjcuZjwc24iduTgth.png', 9, 82447, 'png', 'image', '2021-02-10 05:12:58', '2021-02-10 05:12:58', NULL),
(2, 'Apple-iphone-12-Pro-Max', 'uploads/all/uhzt2GMCQ7GLd4vDir8pjcpKqeRSfqDlBTYqZRV6.jpg', 9, 45420, 'jpg', 'image', '2021-02-10 23:43:09', '2021-02-10 23:43:09', NULL),
(3, 'protidin', 'uploads/all/rZ1lA2rQm6KQi2bPJeNHFuiDfEgYqKFxkmlMoBnD.png', 9, 8170, 'png', 'image', '2021-02-11 03:05:55', '2021-02-11 03:05:55', NULL),
(4, 'Artboard – 9', 'uploads/all/M630OWXqoZOxdAvZ01iaeTKtG58yPMgsz06snyjn.png', 9, 4323, 'png', 'image', '2021-02-11 03:19:42', '2021-02-11 03:19:42', NULL),
(5, 'Protidin Fav', 'uploads/all/yjBDi7aSDSGeeVsgYs8g9hzLakVyyGLB4KCBcBWx.png', 9, 510, 'png', 'image', '2021-02-11 03:36:06', '2021-02-11 03:36:06', NULL),
(6, 'Web-Design', 'uploads/all/hrFKjemcB0Ke4Mj3m2ZeSrPvlThEz1lvQFyek8tb.jpg', 9, 425260, 'jpg', 'image', '2021-02-13 02:51:21', '2021-02-13 04:14:52', '2021-02-13 04:14:52'),
(7, 'Web', 'uploads/all/jPEFUyNR8erbYPab1njesGZgVKyMcmO01AdlDkjU.jpg', 9, 465142, 'jpg', 'image', '2021-02-13 04:15:03', '2021-02-13 04:15:03', NULL),
(8, 'Protidin', 'uploads/all/L0gaGTWZklmXxpogv3fFtKP2eSAtptAudVfyAoXw.png', 9, 12700, 'png', 'image', '2021-02-13 05:09:02', '2021-02-13 05:09:02', NULL),
(9, '89437141_1404743296400437_1443875800557289472_o', 'uploads/all/9AszNBRN6GcI3xtoZvCOWNozLNeF2vxPMHNT8LWL.jpg', 9, 410835, 'jpg', 'image', '2021-02-13 06:31:27', '2021-02-13 06:31:27', NULL),
(10, 'BRINJAL-PICKLE--Facebook-ad', 'uploads/all/6IRMpKDHX74xo46e3amspW7BZTEBkuW3gfdTsGoz.jpg', 9, 61665, 'jpg', 'image', '2021-02-14 19:26:25', '2021-02-14 19:26:25', NULL),
(11, '00b87939-2ba3-4c42-b2ff-d6994a470ebb', 'uploads/all/Wdo1g4ppRGrUCffYGbU8ZivxaXK1NRt4ylR4Kxru.jpg', 9, 135288, 'jpg', 'image', '2021-02-14 19:54:42', '2021-02-14 19:54:42', NULL),
(12, 'bde603e2-2e5f-4457-a8d8-5ead68e8f84b', 'uploads/all/Nm4mKWgsskOtjwAvUfBAwDfTHNL1nBVNrterfZcy.jpg', 9, 116267, 'jpg', 'image', '2021-02-14 19:54:42', '2021-02-14 19:54:42', NULL),
(13, '13312640_521987308009378_8130662651230097576_n', 'uploads/all/VTzUQ8ZQ8fVXu0Pr8Jax0KdhPtEfxQSvjDScouGy.jpg', 9, 99841, 'jpg', 'image', '2021-02-14 19:54:42', '2021-02-14 19:54:42', NULL),
(14, 'Narayngonj_2', 'uploads/all/xvYt5TT23TmrYMYwl4sEfNqShyvbcLTlsM0nbh3r.jpg', 9, 586756, 'jpg', 'image', '2021-02-14 19:54:43', '2021-02-14 19:54:43', NULL),
(15, '3-IMG_2454', 'uploads/all/qM2jHHpptATkb3LWBKg6JIM2xCenfzJPCVFBJ8Dw.jpg', 9, 1323636, 'jpeg', 'image', '2021-02-15 17:02:08', '2021-02-15 17:02:08', NULL),
(16, 'Samsung-Galaxy-A21s', 'uploads/all/n7Kb3klyEDIraj7DYQZ0BVJ5vjYQPJS4ozUZcebb.jpg', 9, 40467, 'jpg', 'image', '2021-02-16 16:45:14', '2021-02-16 16:45:14', NULL),
(17, 'Samsung-Galaxy-A21s', 'uploads/all/FrDSfMWMeDS4sfklxu6XAeQk5gBQx5TawiiUDDrm.jpg', 9, 40467, 'jpg', 'image', '2021-02-16 23:44:02', '2021-02-16 23:44:02', NULL),
(18, 'dried_plum_100gm', 'uploads/all/WNaA7Bbtfaxlj0harZB6C4ei8hM59ffDwRukvjhi.png', 9, 158008, 'png', 'image', '2021-02-16 23:50:36', '2021-02-16 23:50:36', NULL),
(19, 'premium_grape_jelly_500gm', 'uploads/all/VHxPMaH8nJpbFDfTJrkylQj47fxISbosuDP4B99c.png', 9, 165095, 'png', 'image', '2021-02-16 23:51:04', '2021-02-16 23:51:04', NULL),
(20, 'alubukhara_pickle_450gm', 'uploads/all/JbifRDIJoEBpX3tKU3hdqTH51vaQXIvPbf1pYyYK.png', 9, 195085, 'png', 'image', '2021-02-16 23:51:23', '2021-02-16 23:51:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'customer',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_email_verificiation_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` double(20,2) NOT NULL DEFAULT 0.00,
  `banned` tinyint(4) NOT NULL DEFAULT 0,
  `referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `referred_by`, `provider_id`, `user_type`, `name`, `email`, `email_verified_at`, `verification_code`, `new_email_verificiation_code`, `password`, `remember_token`, `avatar`, `avatar_original`, `address`, `country`, `city`, `postal_code`, `phone`, `balance`, `banned`, `referral_code`, `customer_package_id`, `remaining_uploads`, `created_at`, `updated_at`) VALUES
(3, NULL, NULL, 'seller', 'Mr. Seller', 'seller@example.com', '2018-12-11 18:00:00', NULL, NULL, '$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm', '1zoU4eQxnOC5yxRWLsTzMNBPpJuOvTk4g3GMUVYIrbGijiXHOfIlFq0wHrIn', 'https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50', NULL, 'Demo address', 'US', 'Demo city', '1234', NULL, 0.00, 0, '3dLUoHsR1l', NULL, NULL, '2018-10-07 04:42:57', '2020-03-05 01:33:22'),
(8, NULL, NULL, 'customer', 'Mr. Customer', 'customer@example.com', '2018-12-11 18:00:00', NULL, NULL, '$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm', '9ndcz5o7xgnuxctJIbvUQcP41QKmgnWCc7JDSnWdHOvipOP2AijpamCNafEe', 'https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50', NULL, 'Demo address', 'US', 'Demo city', '1234', NULL, 0.00, 0, '8zJTyXTlTT', NULL, NULL, '2018-10-07 04:42:57', '2020-03-03 04:26:11'),
(9, NULL, NULL, 'admin', 'firoz', 'firoz@sysable.tech', '2021-02-10 05:02:01', '301230', NULL, '$2y$10$Ocb.CGMzP56vqNqaqabYqeeXTKJQTQ0ZbSefP6HxlFJwUrpUFeZ/q', NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2021-02-10 05:07:01', '2021-02-14 04:33:15'),
(10, NULL, NULL, 'seller', 'protidin-shop', 'alamin@gmail.com', '2021-02-11 04:02:53', NULL, NULL, '$2y$10$Ii4cp/xLXpg/cDJcBCiCbuJW9X6I7yidXGIQPi0P61UqlannYLs1K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2021-02-11 04:41:53', '2021-02-11 04:41:53'),
(11, NULL, NULL, 'customer', 'Al-Amin', 'alamin1@gmail.com', '2021-02-14 18:02:47', NULL, NULL, '$2y$10$7XcHNG2YljqjXg9kPMxD2.NfrlwsHvoP3i7ZlnkOX38Q0l9bml7U.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2021-02-14 18:57:47', '2021-02-14 18:57:47'),
(12, NULL, NULL, 'customer', 'Kabir', 'firoz@Gmail.com', '2021-02-16 17:02:25', NULL, NULL, '$2y$10$374hMdy3N5lKGyCBNi/jf.PpB7QNZIZMQHs3g5SdPQ1cnrT3KVbwi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2021-02-16 17:05:25', '2021-02-16 17:05:25'),
(13, NULL, NULL, 'customer', 'Al-Amin', 'customer@gmail.com', '2021-02-17 00:02:21', NULL, NULL, '$2y$10$E4uqtE6.9tHJxXHQ0rf49OwI5Dle.4jtByzNTASB559snulq0YGhO', '85cLBA9CdSMaRD94VIbT7y7251DmwjMy6LqtA1SG7ImKkgFusu8usfjkzonR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2021-02-17 00:22:21', '2021-02-17 00:22:21');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `approval` int(1) NOT NULL DEFAULT 0,
  `offline_payment` int(1) NOT NULL DEFAULT 0,
  `reciept` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_configs`
--
ALTER TABLE `affiliate_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_options`
--
ALTER TABLE `affiliate_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_withdraw_requests`
--
ALTER TABLE `affiliate_withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_translations`
--
ALTER TABLE `brand_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city_translations`
--
ALTER TABLE `city_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `club_points`
--
ALTER TABLE `club_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `club_point_details`
--
ALTER TABLE `club_point_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_packages`
--
ALTER TABLE `customer_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_package_payments`
--
ALTER TABLE `customer_package_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_package_translations`
--
ALTER TABLE `customer_package_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_products`
--
ALTER TABLE `customer_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_product_translations`
--
ALTER TABLE `customer_product_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_rwallets`
--
ALTER TABLE `customer_rwallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_settings`
--
ALTER TABLE `customer_wallet_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_translations`
--
ALTER TABLE `flash_deal_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_payment_methods`
--
ALTER TABLE `manual_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp_configurations`
--
ALTER TABLE `otp_configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_points`
--
ALTER TABLE `pickup_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_point_translations`
--
ALTER TABLE `pickup_point_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `tags` (`tags`(255));

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_translations`
--
ALTER TABLE `role_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `searches`
--
ALTER TABLE `searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `seller_packages`
--
ALTER TABLE `seller_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_withdraw_requests`
--
ALTER TABLE `seller_withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_settings`
--
ALTER TABLE `seo_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_configs`
--
ALTER TABLE `affiliate_configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_options`
--
ALTER TABLE `affiliate_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_withdraw_requests`
--
ALTER TABLE `affiliate_withdraw_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brand_translations`
--
ALTER TABLE `brand_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_translations`
--
ALTER TABLE `city_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `club_points`
--
ALTER TABLE `club_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `club_point_details`
--
ALTER TABLE `club_point_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_packages`
--
ALTER TABLE `customer_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_package_payments`
--
ALTER TABLE `customer_package_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_package_translations`
--
ALTER TABLE `customer_package_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_products`
--
ALTER TABLE `customer_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_product_translations`
--
ALTER TABLE `customer_product_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_rwallets`
--
ALTER TABLE `customer_rwallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_wallet_settings`
--
ALTER TABLE `customer_wallet_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deal_translations`
--
ALTER TABLE `flash_deal_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manual_payment_methods`
--
ALTER TABLE `manual_payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `otp_configurations`
--
ALTER TABLE `otp_configurations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickup_points`
--
ALTER TABLE `pickup_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickup_point_translations`
--
ALTER TABLE `pickup_point_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_translations`
--
ALTER TABLE `role_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `searches`
--
ALTER TABLE `searches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seller_packages`
--
ALTER TABLE `seller_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_withdraw_requests`
--
ALTER TABLE `seller_withdraw_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seo_settings`
--
ALTER TABLE `seo_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2618;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
