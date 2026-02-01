-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 23, 2023 at 07:45 AM
-- Server version: 8.0.30
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `betbaji_server`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_super` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `image`, `email`, `password`, `is_super`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '64e58afdc6072758.jpg', 'admin@admin.com', '$2y$10$af3.R/xXonvtXsSQRsBS0OGVXegjB6TWoH3zq9M6yKYqej6nVYUti', 1, NULL, '2022-02-24 00:10:39', '2023-08-23 04:28:45'),
(2, 'Support', NULL, 'support@gmail.com', '$2y$10$z8z2WANEc4emLfKvMOuDHOXq1lbLy/6c2Xnb3wR63YVt..MatpaEe', 0, NULL, '2022-11-06 12:34:30', '2023-06-08 09:47:20');

-- --------------------------------------------------------

--
-- Table structure for table `advertises`
--

CREATE TABLE `advertises` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicks` int NOT NULL,
  `image_redirect_url` mediumtext COLLATE utf8mb4_unicode_ci,
  `script` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bet_invests`
--

CREATE TABLE `bet_invests` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `match_id` int DEFAULT NULL,
  `betquestion_id` int DEFAULT NULL,
  `betoption_id` int DEFAULT NULL,
  `invest_amount` decimal(11,2) DEFAULT '0.00',
  `return_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `charge` decimal(11,2) DEFAULT '0.00',
  `remaining_balance` decimal(11,2) DEFAULT '0.00',
  `ratio` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'default 0, win 1, lose -1, refund 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bet_options`
--

CREATE TABLE `bet_options` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` int NOT NULL,
  `match_id` int NOT NULL,
  `option_name` text COLLATE utf8mb4_unicode_ci,
  `invest_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0.001',
  `return_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0.001',
  `min_amo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0.001',
  `ratio1` text COLLATE utf8mb4_unicode_ci,
  `ratio2` text COLLATE utf8mb4_unicode_ci,
  `bet_limit` decimal(8,2) DEFAULT '2000.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bet_questions`
--

CREATE TABLE `bet_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `match_id` bigint DEFAULT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` tinyint(1) NOT NULL DEFAULT '0',
  `limit` bigint NOT NULL DEFAULT '5',
  `end_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_cat_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `image`, `title`, `slug`, `description`, `blog_cat_id`, `created_at`, `updated_at`) VALUES
(1, '646196677b986559.png', 'The Basics of Online Sports Betting - Learning the Specific Bets', 'the-basics-of-online-sports-betting-learning-the-specific-bets', 'Betting on sports is done for the thrill of the game and to make money. While betting on sports can seem almost impossible, especially in today\'s competitive world, it is actually fairly simple. First, you will need to understand the basics of what types of bets are placed. Second, you will need to find a local, or online sportsbook to bet at. Finally, if traditional gambling doesn\'t suit you, you can always set up your own fantasy sport\'s league. Once you learn the fundamentals, you will be on your way to gambling on sports in no time!', 1, '2022-03-14 00:25:50', '2023-05-15 02:20:46'),
(2, '62663fede88e7375.png', 'How to Bet on Sports for Beginners : 12 Tips to Know', 'how-to-bet-on-sports-for-beginners-12-tips-to-know', 'Betting on sports is done for the thrill of the game and to make money. While betting on sports can seem almost impossible, especially in today\'s competitive world, it is actually fairly simple. First, you will need to understand the basics of what types of bets are placed. Second, you will need to find a local, or online sportsbook to bet at. Finally, if traditional gambling doesn\'t suit you, you can always set up your own fantasy sport\'s league. Once you learn the fundamentals, you will be on your way to gambling on sports in no time!', 1, '2022-04-15 05:43:59', '2023-05-15 02:26:49'),
(3, '637a3db5a14fe177.jpg', 'How To Make Money From Free Bets Using Matched Betting', 'how-to-make-money-from-free-bets-using-matched-betting', 'Pellentesque eu ante sed diam placerat molestie vitae vitae ligula.', 1, '2022-04-15 05:44:16', '2022-11-20 14:46:13'),
(4, '637a3bed3bdd2721.jpg', 'The Basics of Online Sports Betting the Specific Bets', 'the-basics-of-online-sports-betting-the-specific-bets', 'Pellentesque eu ante sed diam placerat molestie vitae vitae ligula.', 1, '2022-04-15 05:44:33', '2022-11-20 14:39:45'),
(5, '637a3b3a8224e910.jpg', 'How to Get Started With Sports Betting', 'how-to-get-started-with-sports-betting', 'We have a team of hard-working sports betting content writers ready to offer the best content for your website. They can create all kinds of sports betting content, from sports betting strategy articles to reviews of sports books. By covering a wide range of topics, we can help your business to stand out from its competitors, helping you reach potential players looking for great sports books.', 1, '2022-09-05 02:04:45', '2022-11-20 14:35:38'),
(6, '646197e728b7d933.png', 'Put your money down on the totals. Totals is commonly', 'put-your-money-down-on-the-totals-totals-is-commonly', 'Betting on sports is done for the thrill of the game and to make money. While betting on sports can seem almost impossible, especially in today\'s competitive world, it is actually fairly simple. First, you will need to understand the basics of what types of bets are placed. Second, you will need to find a local, or online sportsbook to bet at. Finally, if traditional gambling doesn\'t suit you, you can always set up your own fantasy sport\'s league. Once you learn the fundamentals, you will be on your way to gambling on sports in no time!', 1, '2023-05-15 02:24:39', '2023-05-15 02:26:01');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Batting', 'batting', '2022-03-14 00:25:08', '2022-03-14 00:25:08'),
(2, 'zabbix', 'zabbix', '2023-06-01 15:24:08', '2023-06-01 15:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`, `icon`) VALUES
(1, 'American Football', 'american-football', 1, '2023-08-23 04:03:29', '2023-08-23 04:59:43', 'futbol'),
(2, 'Aussie Rules', 'aussie-rules', 1, '2023-08-23 04:03:29', '2023-08-23 04:59:32', 'football-ball'),
(3, 'Baseball', 'baseball', 1, '2023-08-23 04:03:29', '2023-08-23 04:59:10', 'baseball-ball'),
(4, 'Basketball', 'basketball', 1, '2023-08-23 04:03:29', '2023-08-23 04:58:59', 'basketball-ball'),
(5, 'Boxing', 'boxing', 1, '2023-08-23 04:03:29', '2023-08-23 04:58:45', 'boxing-glove'),
(6, 'Cricket', 'cricket', 1, '2023-08-23 04:03:29', '2023-08-23 04:58:14', 'baseball-ball'),
(7, 'Golf', 'golf', 1, '2023-08-23 04:03:29', '2023-08-23 04:58:01', 'golf-ball'),
(8, 'Ice Hockey', 'ice-hockey', 1, '2023-08-23 04:03:29', '2023-08-23 04:57:51', 'hockey-puck'),
(9, 'Mixed Martial Arts', 'mixed-martial-arts', 1, '2023-08-23 04:03:29', '2023-08-23 04:57:39', 'palette'),
(10, 'Politics', 'politics', 1, '2023-08-23 04:03:29', '2023-08-23 04:03:29', NULL),
(11, 'Rugby League', 'rugby-league', 1, '2023-08-23 04:03:29', '2023-08-23 04:57:13', 'football-ball'),
(12, 'Rugby Union', 'rugby-union', 1, '2023-08-23 04:03:29', '2023-08-23 04:57:18', 'football-ball'),
(13, 'Soccer', 'soccer', 1, '2023-08-23 04:03:29', '2023-08-23 04:57:00', 'futbol'),
(14, 'Tennis', 'tennis', 1, '2023-08-23 04:03:30', '2023-08-23 04:56:36', 'table-tennis');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `gateway_id` int NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usd_amo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `try` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_requests`
--

CREATE TABLE `deposit_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `deposit_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `gateway_id` bigint NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usd_amo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `r_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_des` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT '0 = pending, 1 = accepted, 2 = reject',
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '''0''',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `shortcodes` text COLLATE utf8mb4_unicode_ci COMMENT 'object',
  `email_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `act`, `name`, `subj`, `email_body`, `shortcodes`, `email_status`, `created_at`, `updated_at`) VALUES
(1, 'PASS_RESET_CODE', 'Password Reset', 'Password Reset', '<div>We have received a request to reset the password for your account on <b>{{time}} .<br></b></div><div>Requested From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div><div><br></div><br><div><div><div>Your account recovery code is:&nbsp;&nbsp; <font size=\"6\"><b>{{code}}</b></font></div><div><br></div></div></div><div><br></div><div><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><br>', ' {\"code\":\"Password Reset Code\",\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, '2022-03-25 07:24:04', '2022-03-25 01:28:01'),
(2, 'PASS_RESET_DONE', 'Password Reset Confirmation', 'You have Reset your password', '<div><p>\n    You have successfully reset your password.</p><p>You changed from&nbsp; IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}}&nbsp;</b> on <b>{{time}}</b></p><p><b><br></b></p><p><font color=\"#FF0000\"><b>If you did not changed that, Please contact with us as soon as possible.</b></font><br></p></div>', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, '2022-03-25 07:28:23', '2022-03-25 07:28:23'),
(3, 'EVER_CODE', 'Email Verification', 'Please verify your email address', '<div><br></div><div>Thanks For join with us. <br></div><div>Please use below code to verify your email address.<br></div><div><br></div><div>Your email verification code is:<font size=\"6\"><b> {{code}}</b></font></div>', '{\"code\":\"Email Verification code\"}', 1, '2022-03-25 07:28:23', '2022-03-25 07:28:23'),
(4, '2FA_ENABLE', 'Google Two Factor - Enable', 'Google Two Factor Authentication is now  Enabled for Your Account', '<div>You just enabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Enabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, '2022-03-25 07:30:32', '2022-03-25 07:30:32'),
(5, '2FA_DISABLE', 'Google Two Factor Disable', 'Google Two Factor Authentication is now  Disabled for Your Account', '<div>You just Disabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Disabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, '2022-03-25 07:30:32', '2022-03-25 07:30:32'),
(6, 'DEPOSIT_COMPLETE', 'Automated Deposit - Successful', 'Deposit Completed Successfully', '<div>Your deposit of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>has been completed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#000000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br><br></div>', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"method_name\":\"Deposit Method Name\"}', 1, '2022-03-25 07:35:33', '2022-03-25 07:35:33'),
(7, 'DEPOSIT_REQUEST', 'Manual Deposit - User Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br></div>', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_message\":\"Withdraw Payment Message\"}', 1, '2022-03-25 07:35:33', '2022-03-25 07:35:33'),
(8, 'WITHDRAW_REQUEST', 'Manual Withdraw - User Requested', 'Withdraw Request Submitted Successfully', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been submitted Successfully, Please wait for processing days.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You will get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"4\" color=\"#FF0000\"><b><br></b></font></div><div><font size=\"4\" color=\"#FF0000\"><b>This may take {{delay}} to process the payment.</b></font><br></div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br><br><br></div>', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Withdraw Method Name\",\"method_amount\":\"Withdraw Method Amount After Conversion\",\"method_currency\":\"Withdraw Method Currency\",\"post_balance\":\"Your current Balance\",\"delay\":\"Delay time for processing\"}', 1, '2022-10-22 07:35:33', '2022-10-26 10:03:24'),
(9, 'WITHDRAW_REJECT', 'Withdraw - Admin Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been Rejected.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You should get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br></div><div>----</div><div><font size=\"3\"><br></font></div><div><font size=\"3\"> {{amount}} {{currency}} has been <b>refunded </b>to your account and your current Balance is <b>{{post_balance}}</b><b> {{currency}}</b></font></div><div><br></div><div>-----</div><div><br></div><div><font size=\"4\">Details of Rejection :</font></div><div><font size=\"4\"><b>{{admin_details}}</b></font></div><div><br></div><div><br><br><br><br><br><br></div>', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Withdraw Method Name\",\"method_currency\":\"Withdraw Method Currency\",\"method_message\":\"Withdraw Payment Message\"}', 1, '2022-10-25 07:35:33', '2022-10-25 07:35:33'),
(10, 'WITHDRAW_APPROVE', 'Withdraw - Admin  Approved', 'Withdraw Request has been Processed and your money is sent', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been Processed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You will get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div>-----</div><div><br></div><div><font size=\"4\">Details of Processed Payment :</font></div><div><font size=\"4\"><b>{{method_message}}</b></font></div><div><br></div><div><br><br><br><br><br></div>', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Withdraw Method Name\",\"method_currency\":\"Withdraw Method Currency\",\"method_message\":\"Withdraw Payment Message\"}', 1, '2022-10-25 07:35:33', '2022-10-25 07:35:33'),
(11, 'DEPOSIT_APPROVE', 'Manual Deposit - Admin Approved', 'Your Deposit is Approved', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>is Approved .<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br></div>', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\"}', 1, '2022-10-25 07:35:33', '2022-10-25 07:35:33'),
(12, 'DEPOSIT_REJECT', 'Manual Deposit - Admin Rejected', 'Your Deposit Request is Rejected', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} has been rejected</b>.<b><br></b></div><br><div>Transaction Number was : {{trx}}</div><div><br></div><div>if you have any query, feel free to contact us.<br></div><br><div><br><br></div>\n\n\n\n{{method_message}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\"}', 1, '2022-10-25 07:35:33', '2022-10-25 07:35:33'),
(13, 'ADMIN_SUPPORT_REPLY', 'Support Ticket Reply', 'Reply Support Ticket', '<div><p><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong>A member from our support team has replied to the following ticket:</strong></span></p><p><b><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong><br></strong></span></b></p><p><b>[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</b></p><p>----------------------------------------------</p><p>Here is the reply : <br></p><p> {{reply}}<br></p></div><div><br></div>', '{\"ticket_id\":\"Support Ticket ID\", \"ticket_subject\":\"Subject Of Support Ticket\", \"reply\":\"Reply from Staff/Admin\",\"link\":\"Ticket URL For reply\"}', 1, '2022-10-25 07:01:41', '2022-10-25 07:01:41'),
(14, 'REFERRAL_COMMISSION', 'Referral Commission', 'You got referral commission', '<div><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">Congratulations,&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 1rem;\">you got {{amount}} {{currency}} as referral commission</span><span style=\"color: rgb(33, 37, 41); font-size: 1rem;\">.</span></div><div><br></div><div><span style=\"font-weight: bolder; color: rgb(33, 37, 41); font-size: medium;\">Details :&nbsp;</span><br></div><div><br></div><div><span style=\"color: rgb(33, 37, 41);\">Transaction Number :&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">{{trx}}</span><br></div><div><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">{{level}}</span></div><div><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\"><br></span></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}</b></font>', '{\"amount\":\"Commission Amount\",\"post_balance\":\"Users Balance After this operation\",\"level\":\"Level\",\"currency\":\"Site Currency\"}', 1, '2022-10-25 07:01:41', '2022-10-25 07:01:41'),
(15, 'BAL_ADD', 'Balance Add by Admin', 'Your Account has been Credited', '<div>{{amount}} {{currency}} has been added to your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}&nbsp;</b></font>', '{\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\",\"post_message\":\"Balance add Message\"}', 1, '2022-10-25 07:04:44', '2022-10-25 07:04:44'),
(16, 'BAL_SUB', 'Balance Subtracted by Admin', 'Your Account has been Debited', '<div>{{amount}} {{currency}} has been subtracted from your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}</b></font>', '{\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\",\"post_message\":\"Balance Deduct Message\"}', 1, '2022-10-25 07:07:08', '2022-10-25 07:07:08'),
(17, 'BET_PLACED', 'Bet Placed Successfully', 'Your Bet Is Placed Successfully', '<div><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">{{invest_amount}}</span>&nbsp;{{currency}} has been subtracted from your account&nbsp; for placing bet for&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">{{option}}</span>.</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><span style=\"font-weight: bolder; color: rgb(33, 37, 41); font-size: medium;\">Betting Details :&nbsp;</span><br></div><div><br></div><div><span style=\"color: rgb(33, 37, 41);\">Match :&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">{{match}}</span><br></div><div><span style=\"color: rgb(33, 37, 41);\">Question :&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">{{question}}</span><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Bet For :&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">{{option}}</span><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Invest :&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">{{invest_amount}} {{currency}}</span><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Return :&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">{{return_amount}} {{currency}}&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 1rem;\">[If you win]</span><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\"><br></span></div><div><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\"><br></span></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}</b></font>', '{\"trx\":\"Transaction Number\",\"invest_amount\":\"Invested Amount By User For Bet\",\"return_amount\":\"Return Amount For User If Win Bet\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After This Operation\",\"match\":\"Match Name\",\"question\":\"Question\",\"option\":\"Option\"}', 1, '2022-10-25 07:04:44', '2022-10-25 07:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint UNSIGNED NOT NULL,
  `cat_id` bigint NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `cat_id`, `name`, `slug`, `status`, `created_at`, `updated_at`, `key`) VALUES
(1, 1, 'CFL', 'canadian-football-league', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'americanfootball_cfl'),
(2, 1, 'NCAAF', 'us-college-football', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'americanfootball_ncaaf'),
(3, 1, 'NFL', 'us-football', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'americanfootball_nfl'),
(4, 1, 'NFL Preseason', 'us-football', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'americanfootball_nfl_preseason'),
(5, 1, 'NFL Super Bowl Winner', 'super-bowl-winner-20232024', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'americanfootball_nfl_super_bowl_winner'),
(6, 1, 'XFL', 'us-football', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'americanfootball_xfl'),
(7, 2, 'AFL', 'aussie-football', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'aussierules_afl'),
(8, 3, 'MLB', 'major-league-baseball', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'baseball_mlb'),
(9, 3, 'MLB Preseason', 'major-league-baseball', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'baseball_mlb_preseason'),
(10, 3, 'MLB World Series Winner', 'world-series-winner-2023', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'baseball_mlb_world_series_winner'),
(11, 3, 'NCAA Baseball', 'us-college-baseball', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'baseball_ncaa'),
(12, 4, 'Basketball Euroleague', 'basketball-euroleague', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'basketball_euroleague'),
(13, 4, 'NBA', 'us-basketball', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'basketball_nba'),
(14, 4, 'NBA Championship Winner', 'championship-winner-20222023', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'basketball_nba_championship_winner'),
(15, 4, 'NBA Preseason', 'us-basketball', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'basketball_nba_preseason'),
(16, 4, 'NCAAB', 'us-college-basketball', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'basketball_ncaab'),
(17, 4, 'WNBA', 'us-basketball', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'basketball_wnba'),
(18, 5, 'Boxing', 'boxing-bouts', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'boxing_boxing'),
(19, 6, 'Asia Cup', 'asia-cup', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'cricket_asia_cup'),
(20, 6, 'Big Bash', 'big-bash-league', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'cricket_big_bash'),
(21, 6, 'CPLT20', 'caribbean-premier-league', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'cricket_caribbean_premier_league'),
(22, 6, 'ICC World Cup', 'icc-world-cup', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'cricket_icc_world_cup'),
(23, 6, 'International Twenty20', 'international-twenty20', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'cricket_international_t20'),
(24, 6, 'IPL', 'indian-premier-league', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'cricket_ipl'),
(25, 6, 'One Day Internationals', 'one-day-internationals', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'cricket_odi'),
(26, 6, 'Pakistan Super League', 'pakistan-super-league', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'cricket_psl'),
(27, 6, 'T20 Blast', 't20-blast', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'cricket_t20_blast'),
(28, 6, 'Test Matches', 'international-test-matches', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'cricket_test_match'),
(29, 6, 'The Hundred', 'the-hundred', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'cricket_the_hundred'),
(30, 7, 'Masters Tournament Winner', '2024-winner', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'golf_masters_tournament_winner'),
(31, 7, 'PGA Championship Winner', '2024-winner', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'golf_pga_championship_winner'),
(32, 7, 'The Open Winner', '2023-winner', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'golf_the_open_championship_winner'),
(33, 7, 'US Open Winner', '2023-winner', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'golf_us_open_winner'),
(34, 8, 'NHL', 'us-ice-hockey', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'icehockey_nhl'),
(35, 8, 'NHL Championship Winner', 'stanley-cup-winner-20222023', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'icehockey_nhl_championship_winner'),
(36, 8, 'HockeyAllsvenskan', 'swedish-hockey-allsvenskan', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'icehockey_sweden_allsvenskan'),
(37, 8, 'SHL', 'swedish-hockey-league', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'icehockey_sweden_hockey_league'),
(38, 9, 'MMA', 'mixed-martial-arts', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'mma_mixed_martial_arts'),
(39, 10, 'US Presidential Elections Winner', '2024-us-presidential-election-winner', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'politics_us_presidential_election_winner'),
(40, 11, 'NRL', 'aussie-rugby-league', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'rugbyleague_nrl'),
(41, 12, 'World Cup', 'world-cup-2023', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'rugbyunion_world_cup'),
(42, 13, 'Africa Cup of Nations', 'africa-cup-of-nations', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_africa_cup_of_nations'),
(43, 13, 'Primera División - Argentina', 'argentine-primera-division', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_argentina_primera_division'),
(44, 13, 'A-League', 'aussie-soccer', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_australia_aleague'),
(45, 13, 'Austrian Football Bundesliga', 'austrian-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_austria_bundesliga'),
(46, 13, 'Belgium First Div', 'belgian-first-division-a', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_belgium_first_div'),
(47, 13, 'Brazil Série A', 'brasileirao-serie-a', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_brazil_campeonato'),
(48, 13, 'Brazil Série B', 'campeonato-brasileiro-serie-b', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_brazil_serie_b'),
(49, 13, 'Primera División - Chile', 'campeonato-chileno', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_chile_campeonato'),
(50, 13, 'Super League - China', 'chinese-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_china_superleague'),
(51, 13, 'Copa Libertadores', 'conmebol-copa-libertadores', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_conmebol_copa_libertadores'),
(52, 13, 'Denmark Superliga', 'danish-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_denmark_superliga'),
(53, 13, 'Championship', 'efl-championship', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_efl_champ'),
(54, 13, 'EFL Cup', 'league-cup', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_england_efl_cup'),
(55, 13, 'League 1', 'efl-league-1', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_england_league1'),
(56, 13, 'League 2', 'efl-league-2', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_england_league2'),
(57, 13, 'EPL', 'english-premier-league', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_epl'),
(58, 13, 'FA Cup', 'football-association-challenge-cup', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_fa_cup'),
(59, 13, 'FIFA World Cup', 'fifa-world-cup-2022', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_fifa_world_cup'),
(60, 13, 'FIFA World Cup Winner', 'fifa-world-cup-winner-2022', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_fifa_world_cup_winner'),
(61, 13, 'FIFA Women\'s World Cup', 'fifa-womens-world-cup', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_fifa_world_cup_womens'),
(62, 13, 'Veikkausliiga - Finland', 'finnish-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_finland_veikkausliiga'),
(63, 13, 'Ligue 1 - France', 'french-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_france_ligue_one'),
(64, 13, 'Ligue 2 - France', 'french-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_france_ligue_two'),
(65, 13, 'Bundesliga - Germany', 'german-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_germany_bundesliga'),
(66, 13, 'Bundesliga 2 - Germany', 'german-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_germany_bundesliga2'),
(67, 13, '3. Liga - Germany', 'german-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_germany_liga3'),
(68, 13, 'Super League - Greece', 'greek-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_greece_super_league'),
(69, 13, 'Serie A - Italy', 'italian-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_italy_serie_a'),
(70, 13, 'Serie B - Italy', 'italian-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_italy_serie_b'),
(71, 13, 'J League', 'japan-soccer-league', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_japan_j_league'),
(72, 13, 'K League 1', 'korean-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_korea_kleague1'),
(73, 13, 'League of Ireland', 'airtricity-league-premier-division', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_league_of_ireland'),
(74, 13, 'Liga MX', 'mexican-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_mexico_ligamx'),
(75, 13, 'Dutch Eredivisie', 'dutch-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_netherlands_eredivisie'),
(76, 13, 'Eliteserien - Norway', 'norwegian-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_norway_eliteserien'),
(77, 13, 'Ekstraklasa - Poland', 'polish-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_poland_ekstraklasa'),
(78, 13, 'Primeira Liga - Portugal', 'portugese-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_portugal_primeira_liga'),
(79, 13, 'Premier League - Russia', 'russian-soccer', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_russia_premier_league'),
(80, 13, 'La Liga - Spain', 'spanish-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_spain_la_liga'),
(81, 13, 'La Liga 2 - Spain', 'spanish-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_spain_segunda_division'),
(82, 13, 'Premiership - Scotland', 'scottish-premiership', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_spl'),
(83, 13, 'Allsvenskan - Sweden', 'swedish-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_sweden_allsvenskan'),
(84, 13, 'Superettan - Sweden', 'swedish-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_sweden_superettan'),
(85, 13, 'Swiss Superleague', 'swiss-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_switzerland_superleague'),
(86, 13, 'Turkey Super League', 'turkish-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_turkey_super_league'),
(87, 13, 'UEFA Champions', 'european-champions-league', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_uefa_champs_league'),
(88, 13, 'UEFA Champions League Qualification', 'european-champions-league-qualification', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_uefa_champs_league_qualification'),
(89, 13, 'UEFA Europa Conference League', 'uefa-europa-conference-league', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_uefa_europa_conference_league'),
(90, 13, 'UEFA Europa', 'european-europa-league', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_uefa_europa_league'),
(91, 13, 'UEFA Nations League', 'uefa-nations-league', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_uefa_nations_league'),
(92, 13, 'MLS', 'major-league-soccer', 1, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'soccer_usa_mls'),
(93, 14, 'ATP Australian Open', 'mens-singles', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'tennis_atp_aus_open_singles'),
(94, 14, 'ATP French Open', 'mens-singles', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'tennis_atp_french_open'),
(95, 14, 'ATP US Open', 'mens-singles', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'tennis_atp_us_open'),
(96, 14, 'ATP Wimbledon', 'mens-singles', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'tennis_atp_wimbledon'),
(97, 14, 'WTA Australian Open', 'womens-singles', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'tennis_wta_aus_open_singles'),
(98, 14, 'WTA French Open', 'womens-singles', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'tennis_wta_french_open'),
(99, 14, 'WTA US Open', 'womens-singles', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'tennis_wta_us_open'),
(100, 14, 'WTA Wimbledon', 'womens-singles', 0, '2023-08-23 04:03:30', '2023-08-23 04:03:30', 'tennis_wta_wimbledon');

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'object',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `image`, `script`, `shortcode`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawkto-chat', 'Tawk.to', 'tawkto.png', NULL, '{\"app_key\":{\"title\":\"App Key\",\"value\":\"123231\"}}', '0', '2022-02-24 00:10:41', '2022-02-27 00:38:18'),
(2, 'fb-comment', 'Facebook Comment ', 'facebook.png', '---', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', '0', '2022-02-24 00:10:41', '2022-02-27 00:37:32'),
(3, 'google-recaptcha', 'Google Recaptcha 2', 'recaptcha3.png', '6LfFZHYeAAAAAL-8sbCqzigl9xWqMkXGPDG84Znc', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"6LfFZHYeAAAAAL-8sbCqzigl9xWqMkXGPDG84Znc\"}}', '0', '2022-02-24 00:10:41', '2022-03-02 01:12:30'),
(4, 'custom-captcha', 'Custom Captcha', 'custom_captacha.png', '---', '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', '0', '2022-02-24 04:37:49', '2022-09-24 11:08:14');

-- --------------------------------------------------------

--
-- Table structure for table `extra_pages`
--

CREATE TABLE `extra_pages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extra_pages`
--

INSERT INTO `extra_pages` (`id`, `title`, `description`, `created_at`, `updated_at`, `slug`) VALUES
(2, 'Licences Info', 'Licences Info\r\n\r\nWe claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.\r\n\r\n    Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.\r\n    Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.\r\n    Emergency Support - We do not provide emergency support / Phone Support / LiveChat Support. Support may take some hours sometimes.\r\n    Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, & installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.\r\n    Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.\r\n    We Don\'t support any child porn or such material.\r\n    No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.\r\n    No harassing material that may cause people to retaliate against you.\r\n    No phishing pages.\r\n    You may not run any exploitation script from the server. reason can be terminated immediately.\r\n    If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.\r\n    Malicious Botnets are strictly forbidden.\r\n    Spam, mass mailing, or email marketing in any way are strictly forbidden here.\r\n    Malicious hacking materials, trojans, viruses, & malicious bots running or for download are forbidden.\r\n    Resource and cronjob abuse is forbidden and will result in suspension or termination.\r\n    Php/CGI proxies are strictly forbidden.\r\n    CGI-IRC is strictly forbidden.\r\n    No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.\r\n    NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.\r\n\r\nTerms & Questions for Users\r\n\r\nBefore getting to this site, you are consenting to be limited by these site Terms and Questions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.\r\nSupport\r\n\r\nWhenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.\r\n\r\nOn the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:\r\n\r\n    Hang tight for additional update discharge.\r\n    Or on the other hand, enlist a specialist (We offer customization for extra charges).\r\n\r\nOwnership\r\n\r\nYou may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \"with no guarantees\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.\r\nWarranty\r\n\r\nWe don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.\r\nUnauthorized/Illegal Usage\r\n\r\nYou may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.\r\n\r\nYou can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.\r\n\r\nOur Members are liable for all substance posted on the discussion and demo and movement that happens under your record.\r\n\r\nWe hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.\r\n\r\nIf you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.\r\nFiverr, Seoclerks Sellers Or Affiliates\r\n\r\nWe do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk.\r\nPayment/Refund Policy\r\n\r\nNo refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.\r\n\r\nIf you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.\r\nFree Balance / Coupon Policy\r\n\r\nWe offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.', '2022-11-17 05:47:31', '2022-11-17 05:47:31', 'licences-info'),
(3, 'Rules Fot Bet', 'Licences Info\r\n\r\nWe claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.\r\n\r\n    Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.\r\n    Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.\r\n    Emergency Support - We do not provide emergency support / Phone Support / LiveChat Support. Support may take some hours sometimes.\r\n    Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, & installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.\r\n    Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.\r\n    We Don\'t support any child porn or such material.\r\n    No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.\r\n    No harassing material that may cause people to retaliate against you.\r\n    No phishing pages.\r\n    You may not run any exploitation script from the server. reason can be terminated immediately.\r\n    If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.\r\n    Malicious Botnets are strictly forbidden.\r\n    Spam, mass mailing, or email marketing in any way are strictly forbidden here.\r\n    Malicious hacking materials, trojans, viruses, & malicious bots running or for download are forbidden.\r\n    Resource and cronjob abuse is forbidden and will result in suspension or termination.\r\n    Php/CGI proxies are strictly forbidden.\r\n    CGI-IRC is strictly forbidden.\r\n    No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.\r\n    NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.\r\n\r\nTerms & Questions for Users\r\n\r\nBefore getting to this site, you are consenting to be limited by these site Terms and Questions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.\r\nSupport\r\n\r\nWhenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.\r\n\r\nOn the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:\r\n\r\n    Hang tight for additional update discharge.\r\n    Or on the other hand, enlist a specialist (We offer customization for extra charges).\r\n\r\nOwnership\r\n\r\nYou may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \"with no guarantees\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.\r\nWarranty\r\n\r\nWe don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.\r\nUnauthorized/Illegal Usage\r\n\r\nYou may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.\r\n\r\nYou can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.\r\n\r\nOur Members are liable for all substance posted on the discussion and demo and movement that happens under your record.\r\n\r\nWe hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.\r\n\r\nIf you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.\r\nFiverr, Seoclerks Sellers Or Affiliates\r\n\r\nWe do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk.\r\nPayment/Refund Policy\r\n\r\nNo refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.\r\n\r\nIf you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.\r\nFree Balance / Coupon Policy\r\n\r\nWe offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.', '2022-11-17 05:47:44', '2022-11-17 05:47:44', 'rules-fot-bet'),
(4, 'Terms of Service', 'Licences Info\r\n\r\nWe claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.\r\n\r\n    Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.\r\n    Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.\r\n    Emergency Support - We do not provide emergency support / Phone Support / LiveChat Support. Support may take some hours sometimes.\r\n    Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, & installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.\r\n    Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.\r\n    We Don\'t support any child porn or such material.\r\n    No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.\r\n    No harassing material that may cause people to retaliate against you.\r\n    No phishing pages.\r\n    You may not run any exploitation script from the server. reason can be terminated immediately.\r\n    If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.\r\n    Malicious Botnets are strictly forbidden.\r\n    Spam, mass mailing, or email marketing in any way are strictly forbidden here.\r\n    Malicious hacking materials, trojans, viruses, & malicious bots running or for download are forbidden.\r\n    Resource and cronjob abuse is forbidden and will result in suspension or termination.\r\n    Php/CGI proxies are strictly forbidden.\r\n    CGI-IRC is strictly forbidden.\r\n    No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.\r\n    NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.\r\n\r\nTerms & Questions for Users\r\n\r\nBefore getting to this site, you are consenting to be limited by these site Terms and Questions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.\r\nSupport\r\n\r\nWhenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.\r\n\r\nOn the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:\r\n\r\n    Hang tight for additional update discharge.\r\n    Or on the other hand, enlist a specialist (We offer customization for extra charges).\r\n\r\nOwnership\r\n\r\nYou may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \"with no guarantees\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.\r\nWarranty\r\n\r\nWe don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.\r\nUnauthorized/Illegal Usage\r\n\r\nYou may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.\r\n\r\nYou can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.\r\n\r\nOur Members are liable for all substance posted on the discussion and demo and movement that happens under your record.\r\n\r\nWe hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.\r\n\r\nIf you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.\r\nFiverr, Seoclerks Sellers Or Affiliates\r\n\r\nWe do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk.\r\nPayment/Refund Policy\r\n\r\nNo refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.\r\n\r\nIf you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.\r\nFree Balance / Coupon Policy\r\n\r\nWe offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.', '2022-11-17 05:47:56', '2022-11-17 05:47:56', 'terms-of-service'),
(5, 'Privacy Policy', 'Licences Info\r\n\r\nWe claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.\r\n\r\n    Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.\r\n    Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.\r\n    Emergency Support - We do not provide emergency support / Phone Support / LiveChat Support. Support may take some hours sometimes.\r\n    Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, & installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.\r\n    Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.\r\n    We Don\'t support any child porn or such material.\r\n    No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.\r\n    No harassing material that may cause people to retaliate against you.\r\n    No phishing pages.\r\n    You may not run any exploitation script from the server. reason can be terminated immediately.\r\n    If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.\r\n    Malicious Botnets are strictly forbidden.\r\n    Spam, mass mailing, or email marketing in any way are strictly forbidden here.\r\n    Malicious hacking materials, trojans, viruses, & malicious bots running or for download are forbidden.\r\n    Resource and cronjob abuse is forbidden and will result in suspension or termination.\r\n    Php/CGI proxies are strictly forbidden.\r\n    CGI-IRC is strictly forbidden.\r\n    No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.\r\n    NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.\r\n\r\nTerms & Questions for Users\r\n\r\nBefore getting to this site, you are consenting to be limited by these site Terms and Questions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.\r\nSupport\r\n\r\nWhenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.\r\n\r\nOn the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:\r\n\r\n    Hang tight for additional update discharge.\r\n    Or on the other hand, enlist a specialist (We offer customization for extra charges).\r\n\r\nOwnership\r\n\r\nYou may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \"with no guarantees\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.\r\nWarranty\r\n\r\nWe don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.\r\nUnauthorized/Illegal Usage\r\n\r\nYou may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.\r\n\r\nYou can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.\r\n\r\nOur Members are liable for all substance posted on the discussion and demo and movement that happens under your record.\r\n\r\nWe hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.\r\n\r\nIf you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.\r\nFiverr, Seoclerks Sellers Or Affiliates\r\n\r\nWe do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk.\r\nPayment/Refund Policy\r\n\r\nNo refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.\r\n\r\nIf you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.\r\nFree Balance / Coupon Policy\r\n\r\nWe offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.', '2022-11-17 05:48:13', '2022-11-17 05:48:13', 'privacy-policy');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'I want to play at BetBaji, What do i need to do?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum ultrices gravida. Risus commodo viverra maecenas accumsan. eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum ultrices gravida. Risus commodo viverra maecenas accumsan eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum ultrices gravida. Risus commodo viverra maecenas accumsan..', '2022-04-29 23:44:45', '2022-11-20 14:26:08'),
(2, 'How to earn money quickly ?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum ultrices gravida. Risus commodo viverra maecenas accumsan. eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum ultrices gravida. Risus commodo viverra maecenas accumsan eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum ultrices gravida. Risus commodo viverra maecenas accumsan..', '2022-04-29 23:45:01', '2022-11-20 14:27:45'),
(3, 'How do I withdraw money from my Betbaji Bets account?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum ultrices gravida. Risus commodo viverra maecenas accumsan. eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum ultrices gravida. Risus commodo viverra maecenas accumsan eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2022-04-29 23:45:17', '2022-11-20 14:28:50'),
(4, 'How fast do I get paid once I win a bet?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum ultrices gravida. Risus commodo viverra maecenas accumsan. eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum ultrices gravida. Risus commodo viverra maecenas accumsan eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2022-04-29 23:45:35', '2022-11-20 14:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `generals`
--

CREATE TABLE `generals` (
  `id` bigint UNSIGNED NOT NULL,
  `web_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Casino And Game',
  `color_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '#fff',
  `contact_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Berlin,Germany',
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'support@example.com',
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0123654789',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'USD',
  `about_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_section_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_description` longtext COLLATE utf8mb4_unicode_ci,
  `news_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `testimonial_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_subtitle` longtext COLLATE utf8mb4_unicode_ci,
  `copyright_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'All Rights Reserved',
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `sender_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_email_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_description` longtext COLLATE utf8mb4_unicode_ci,
  `email_configuration` text COLLATE utf8mb4_unicode_ci,
  `global_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `global_description` longtext COLLATE utf8mb4_unicode_ci,
  `emailver` tinyint(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_comment` text COLLATE utf8mb4_unicode_ci,
  `admin_nav` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_sidebar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `game_section_title` longtext COLLATE utf8mb4_unicode_ci,
  `event_section_title` longtext COLLATE utf8mb4_unicode_ci,
  `slider_header` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paginate` int NOT NULL,
  `cookie_status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_noti` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email notification, 0 - dont send, 1 - send',
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `market_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amt` int DEFAULT NULL,
  `max_amt` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generals`
--

INSERT INTO `generals` (`id`, `web_name`, `color_code`, `contact_address`, `contact_email`, `contact_phone`, `currency`, `about_title`, `about_section_title`, `about_description`, `news_title`, `testimonial_title`, `contact_title`, `contact_subtitle`, `copyright_text`, `footer_text`, `sender_email`, `sender_email_name`, `email_description`, `email_configuration`, `global_email`, `global_description`, `emailver`, `meta_title`, `meta_tag`, `meta_description`, `currency_symbol`, `fb_comment`, `admin_nav`, `admin_sidebar`, `game_section_title`, `event_section_title`, `slider_header`, `slider_title`, `paginate`, `cookie_status`, `created_at`, `updated_at`, `email_noti`, `timezone`, `api_url`, `api_key`, `market_key`, `min_amt`, `max_amt`) VALUES
(1, NULL, '#000000', 'Berlin,Germany', 'support@example.com', '0123654789', 'usd', 'YOU ARE MOST WELCOME IN GAMING WORLD.', 'Play Online Game & Win Money Unlimited', 'We build software to help people navigate and successfully exit the criminal justice system. To date, Uptrust has helped over\r\n\r\nAmet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequa', 'LATEST NEWS', 'WHAT PEOPLE’S SAY ABOUT GAME STUDIO.', NULL, NULL, 'All Rights Reserved', 'BetBaji is practically an online script that is designed for gamblers to bet directly against each other and not involve any of the traditional bookmakers.', NULL, NULL, 'Hi {{name}}, {{message}} , Thank you', '{\"name\":\"smtp\",\"smtp_host\":null,\"smtp_port\":\"587\",\"smtp_encryption\":\"tls\",\"smtp_username\":null,\"smtp_password\":null}', 'betbaji@wowtheme7.com', 'Hi {{name}}, {{message}} , Thank you', 0, NULL, NULL, NULL, '$', NULL, 'navbar-info', 'sidebar-dark', 'POPULAR GAME', 'PREDICT NOW', 'Play Online Game & Win Money', 'We build software to help people navigate and successfully exit the criminal justice system. To date, Uptrust has helped over', 10, 1, '2022-02-24 00:10:40', '2023-08-23 06:15:32', 1, '\'Asia/Dhaka\'', 'https://api.the-odds-api.com/v4/', NULL, 'unibet', 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` bigint UNSIGNED NOT NULL,
  `cat_id` int NOT NULL,
  `event_id` bigint NOT NULL,
  `team_1_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_2_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_1_slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_2_slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(448, '2014_10_12_100000_create_password_resets_table', 1),
(449, '2019_08_19_000000_create_failed_jobs_table', 1),
(450, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(451, '2022_01_16_110038_create_admins_table', 1),
(452, '2022_01_18_082843_create_faqs_table', 1),
(453, '2022_01_22_065623_create_permission_tables', 1),
(454, '2022_01_23_062032_create_testimonials_table', 1),
(455, '2022_01_23_100556_create_generals_table', 1),
(456, '2022_01_24_095225_create_sliders_table', 1),
(457, '2022_01_24_095410_create_socials_table', 1),
(458, '2022_01_24_095912_create_services_table', 1),
(459, '2022_01_25_074952_create_blog_categories_table', 1),
(460, '2022_01_26_101001_create_extra_pages_table', 1),
(461, '2022_01_26_120236_create_blogs_table', 1),
(462, '2022_01_27_073436_create_languages_table', 1),
(463, '2022_01_30_093247_create_sections_table', 1),
(464, '2022_02_11_174556_create_payment_gateways_table', 1),
(465, '2022_02_13_091107_create_extensions_table', 1),
(466, '2022_02_13_110518_create_advertises_table', 1),
(467, '2022_02_16_095616_create_email_templates_table', 1),
(468, '2022_02_22_084638_create_subscribers_table', 1),
(469, '2022_02_23_064336_create_supports_table', 1),
(470, '2022_02_23_064700_create_support_comments_table', 1),
(471, '2022_02_27_081803_create_deposits_table', 2),
(473, '2014_10_12_000000_create_users_table', 3),
(474, '2022_03_01_063945_create_withdraw_methods_table', 4),
(475, '2022_03_01_112043_create_withdraw_logs_table', 5),
(476, '2022_03_01_112812_create_transactions_table', 6),
(478, '2022_03_02_080755_add_emailver_to_generals_table', 7),
(481, '2022_03_03_055025_create_events_table', 8),
(482, '2022_03_03_055134_create_matches_table', 8),
(483, '2022_03_03_103455_create_bet_questions_table', 9),
(484, '2022_03_03_113318_create_bet_options_table', 10),
(485, '2022_03_04_085314_create_bet_invests_table', 11),
(486, '2022_03_06_080714_create_trxes_table', 12),
(487, '2022_03_06_081004_add_image_type_to_advertises_table', 12),
(488, '2022_03_06_082642_drop_redirect_url_from_advertises_table', 13),
(491, '2022_03_12_081312_create_deposit_requests_table', 16),
(492, '2022_03_13_084521_add_amount_to_deposit_requests_table', 17),
(496, '2022_03_22_074527_create_referrals_table', 18),
(497, '2022_03_24_092631_drop_transaction_id_from_withdraw_logs_table', 19),
(498, '2022_03_12_082203_create_games_table', 20),
(499, '2022_03_12_083825_add_status_to_games_table', 20),
(500, '2022_03_23_182711_add_slug_to_games_table', 20),
(501, '2022_03_25_064001_add_status_to_password_resets_table', 20),
(502, '2022_03_26_065433_add_paid_meta_title_to_generals_table', 20),
(503, '2022_03_26_094810_add_currency_symbol_to_generals_table', 21),
(504, '2022_03_26_052136_add_admin_generals_table', 22),
(505, '2022_03_31_081117_add_image_to_users_table', 23),
(506, '2022_04_16_075615_add_cookie_description_to_generals_table', 24),
(507, '2022_04_16_110114_add_slider_header_to_generals_table', 25),
(511, '2022_05_21_071009_add_type_column_to_transactions_table', 26),
(512, '2022_05_22_063815_drop_trxes_table', 26),
(513, '2022_05_26_072621_add_image_to_admins_table', 27),
(514, '2022_06_13_080023_add_paginate_to_generals_table', 28),
(515, '2022_06_15_060715_drop_emailnoti_from_generals_table', 29),
(516, '2022_07_02_065112_add_about_switch_to_generals_table', 30),
(517, '2022_07_03_071319_create_notifications_table', 31),
(518, '2022_07_04_005309_drop_smtp_encryption_from_generals_table', 32),
(519, '2022_08_24_082020_create_section_btns_table', 33),
(520, '2022_08_24_082616_drop_service_switch_from_generals_table', 33),
(521, '2022_08_24_083340_drop_service_status_from_section_btns_table', 34),
(522, '2022_08_24_083642_drop_name_from_section_btns_table', 35),
(523, '2022_09_05_061751_add_photo_slider_switch_to_section_btns_table', 36),
(524, '2022_09_06_070730_add_slider_thumb_to_section_btns_table', 37),
(525, '2022_09_12_070048_create_categories_table', 38),
(526, '2022_09_12_073111_add_status_to_categories_table', 38),
(527, '2022_09_12_073308_add_cat_id_to_events_table', 38),
(528, '2022_09_16_061132_add_slug_to_extra_pages_table', 39),
(529, '2022_09_16_063246_add_contact_switch_to_section_btns_table', 39),
(530, '2022_10_13_120052_drop_icon_from_categories_table', 40),
(531, '2022_10_13_120306_add_icon_to_events_table', 40),
(532, '2022_10_13_133913_add_cat_id_to_matches_table', 41),
(533, '2022_10_22_172506_add_trx_to_withdraw_logs_table', 42),
(534, '2022_10_25_134224_add_email_noti_to_generals_table', 43),
(535, '2022_10_25_141152_add_timezone_to_generals_table', 44),
(536, '2022_11_12_114830_drop_title_from_sliders_table', 45),
(537, '2022_11_21_162735_add_icon_to_categories_table', 46),
(538, '2022_11_21_162923_drop_icon_from_events_table', 46),
(539, '2022_12_03_175044_drop_slider_thumb_from_section_btns_table', 47),
(540, '2022_12_14_130343_add_key_column_to_events', 48),
(541, '2023_01_06_130937_add_api_key_to_generals_table', 49),
(542, '2023_01_22_175619_add_market_key_to_generals_table', 50),
(543, '2016_06_01_000001_create_oauth_auth_codes_table', 51),
(544, '2016_06_01_000002_create_oauth_access_tokens_table', 51),
(545, '2016_06_01_000003_create_oauth_refresh_tokens_table', 51),
(546, '2016_06_01_000004_create_oauth_clients_table', 51),
(547, '2016_06_01_000005_create_oauth_personal_access_clients_table', 51);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1),
(2, 'App\\Models\\Admin', 2),
(2, 'App\\Models\\Admin', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` tinyint NOT NULL DEFAULT '0',
  `click_url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
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
('04ccf67c37f23fea15ffa78d415af9cd4401fee6b8991e805cfa9cc51a4524a449988d98f7b09228', 6, 1, 'usertoken', '[]', 0, '2023-04-11 06:12:16', '2023-04-11 06:12:16', '2024-04-11 12:12:16'),
('04ce5b634ea648949b54edba87e5f96167d2b0de759ea9700c771d0c242e53718275904b3036e5ed', 22, 1, 'usertoken', '[]', 0, '2023-06-22 16:50:20', '2023-06-22 16:50:20', '2024-06-22 22:50:20'),
('068881dd879c92babde8096f0d0883f7cc4525a2ef4bf483cbb51ae66613d11717c82c6338e6a566', 5, 1, 'usertoken', '[]', 0, '2023-06-23 12:34:13', '2023-06-23 12:34:13', '2024-06-23 18:34:13'),
('06cdd8a6942fa7665ced0e8fc720c4c6dbb26a6d38b992aac98d24ae1c9b8029639001dff4d57f6f', 24, 1, 'usertoken', '[]', 0, '2023-07-15 15:13:13', '2023-07-15 15:13:13', '2024-07-15 21:13:13'),
('087e1477e1e6f67f29ab09772bed2efd82f0e3acf1339ca4c14900589a2d07a278b498ff2bd3516a', 7, 1, 'usertoken', '[]', 0, '2023-05-26 10:38:06', '2023-05-26 10:38:06', '2024-05-26 16:38:06'),
('0b53e4f86995cccfaa80805bf9a23bbb8432a007cc87f0b95b0147a29dddfd5b5fbc0c075837147c', 15, 1, 'usertoken', '[]', 0, '2023-05-31 14:45:18', '2023-05-31 14:45:18', '2024-05-31 20:45:18'),
('22ff6300a627921ead9ee41842192e59b2a18931a922880ef6d92b37f601bfc8287e410322aee29e', 7, 1, 'usertoken', '[]', 0, '2023-05-12 09:10:02', '2023-05-12 09:10:02', '2024-05-12 15:10:02'),
('2754ba6e72b8ef01ab9519da0f06ebbc48dcbf86f22beb286af9043650438c9be98551cfc9e4e61d', 6, 1, 'usertoken', '[]', 0, '2023-04-11 06:11:07', '2023-04-11 06:11:07', '2024-04-11 12:11:07'),
('2bc8f176e384a1d3ce384c8c35ace0dbdcfb00fcfbf7d49af60d3e9b5aa975906bb814e799bb4e22', 7, 1, 'usertoken', '[]', 0, '2023-05-08 17:11:15', '2023-05-08 17:11:15', '2024-05-08 23:11:15'),
('30ca7b530c8bf390a983b102bc32b37960e955e24f7be96f385aadc016b404e8b31af24cbeeef7a9', 11, 1, 'usertoken', '[]', 0, '2023-05-10 10:20:13', '2023-05-10 10:20:13', '2024-05-10 16:20:13'),
('3d324f07378c2c4bda76b9eae2f04fd46acb2f8254a0ba6f15b4f52af981e22c9f74406debb1d412', 17, 1, 'usertoken', '[]', 0, '2023-06-16 13:28:56', '2023-06-16 13:28:56', '2024-06-16 19:28:56'),
('3ea7f5b82fe106d36b20a7baaf63a4ebe8699a01581056b6464ba19f60563a312f261686e0595864', 22, 1, 'usertoken', '[]', 0, '2023-06-22 18:05:30', '2023-06-22 18:05:30', '2024-06-23 00:05:30'),
('402c358f46e6bb0b94d2760dd848e5c15c7f9f5d1fae8fb73aae6a630a953037c83301691d10d3ba', 5, 1, 'usertoken', '[]', 0, '2023-06-28 06:09:03', '2023-06-28 06:09:03', '2024-06-28 12:09:03'),
('412978ad7cecc17211a49f3651d7cebc7a362e6359c04d10411e90e2c5926054748f135069eb23e3', 22, 1, 'usertoken', '[]', 0, '2023-06-22 18:27:54', '2023-06-22 18:27:54', '2024-06-23 00:27:54'),
('4ac4d41014d357438ebf8a94a822492c70f004f11bb3ce66b7edcfb2b2cefd544b4e7dde901b3a9c', 5, 1, 'usertoken', '[]', 0, '2023-06-23 12:30:49', '2023-06-23 12:30:49', '2024-06-23 18:30:49'),
('51eba5008101d6dff3de07a2cf7c9374940588c3a969c0caf24a3e6205f5d1cb7168b9f3b026b37d', 5, 1, 'usertoken', '[]', 0, '2023-06-27 15:14:31', '2023-06-27 15:14:31', '2024-06-27 21:14:31'),
('5552c2b4b3a78f2cb3be05ab5df836c8a2049e880b1da74539b9f66f729c9bb09105fc835108dd56', 6, 1, 'usertoken', '[]', 0, '2023-07-11 09:58:41', '2023-07-11 09:58:41', '2024-07-11 15:58:41'),
('55a9425bba6dc514a3e8524ca7318d72ecf4381fc9df6413c89b1366b17dbe45595eea77c5eb3ffd', 7, 1, 'usertoken', '[]', 0, '2023-05-08 16:24:11', '2023-05-08 16:24:11', '2024-05-08 22:24:11'),
('676d354efb56f0a24d4391fd8d0f2b8b68bcccc1f45653b67e5c63d60aec261203fd44cfc3be5a08', 7, 1, 'usertoken', '[]', 0, '2023-05-08 17:27:04', '2023-05-08 17:27:04', '2024-05-08 23:27:04'),
('788d6bd103dbf38be678585ecea5017ecef40c56a37e8668a031916496551a8681905d5c40ba05b9', 22, 1, 'usertoken', '[]', 0, '2023-06-22 18:24:06', '2023-06-22 18:24:06', '2024-06-23 00:24:06'),
('7b42fd631fcbf33fa01511f04cafcb0ef31e6998f03ceceb3cd5c2382c4690e1c1f308eb1067d18f', 6, 1, 'usertoken', '[]', 0, '2023-04-11 06:11:23', '2023-04-11 06:11:23', '2024-04-11 12:11:23'),
('7bda8296158e779081a7c44ba56e603773a0951ce3d2fae0ddb708a021077c41f6d2cdb299bfbaf6', 6, 1, 'usertoken', '[]', 0, '2023-04-21 09:05:53', '2023-04-21 09:05:53', '2024-04-21 15:05:53'),
('7e6c884adfd83d6228dc62f7729609bcee8c96edb722be2c5ebe26b94f95ea0ee38f23a69227b8e3', 17, 1, 'usertoken', '[]', 0, '2023-05-25 07:58:00', '2023-05-25 07:58:00', '2024-05-25 13:58:00'),
('81e7cdad863151700a9a5410992594ed78269a2a2485d5bd0b1e65f2a95fd6edf7f0d375712217cf', 6, 1, 'usertoken', '[]', 0, '2023-06-27 09:52:43', '2023-06-27 09:52:43', '2024-06-27 15:52:43'),
('83aa60b9201081b266d89c1f19582776ac46c79367b459df8f880ea488bd55bf3c5fa5d8aec2b11c', 6, 1, 'usertoken', '[]', 0, '2023-04-11 05:23:57', '2023-04-11 05:23:57', '2024-04-11 11:23:57'),
('8473ed624d18a87f107cbc052b5c66af70193ab9f137dbd5160a7d1c5ccdacd23e21881ed775a3bb', 16, 1, 'usertoken', '[]', 0, '2023-05-12 08:51:15', '2023-05-12 08:51:15', '2024-05-12 14:51:15'),
('88330c8ca215c094d1d3a717427d8d2fb26a02e549cbfa45bab6f5c066aa235d749bc5c42e49374e', 5, 1, 'usertoken', '[]', 0, '2023-06-28 07:13:14', '2023-06-28 07:13:14', '2024-06-28 13:13:14'),
('a6cdf30e2b689df0ec10fb86da86507e860f50475973356255a8d33a2ca622037a407a343f285416', 7, 1, 'usertoken', '[]', 0, '2023-05-08 17:09:05', '2023-05-08 17:09:05', '2024-05-08 23:09:05'),
('b4d071ac007fd39aa922da6bd29ca2d121419ff82b9d6df88001490104f98372ec026bb5a6eeb120', 7, 1, 'usertoken', '[]', 0, '2023-04-30 14:31:22', '2023-04-30 14:31:22', '2024-04-30 20:31:22'),
('b83f4ecb216bfd562aa0a89a6a55d93f90d91b6424a4715db8428cfb8ab8f53932eaf3da8abf6db6', 5, 1, 'usertoken', '[]', 0, '2023-06-28 06:01:48', '2023-06-28 06:01:48', '2024-06-28 12:01:48'),
('b9588c2e558e5bdb8fd5b338a3cc457cf631498d48926c83890a851db87b4129b6653e3e2f66f3ce', 18, 1, 'usertoken', '[]', 0, '2023-05-31 14:50:56', '2023-05-31 14:50:56', '2024-05-31 20:50:56'),
('c282106b32773c304667c11a18ea506377fa3400a036822b9ca487a1fe99d1ab961982a50e97aea8', 18, 1, 'usertoken', '[]', 0, '2023-05-31 14:44:32', '2023-05-31 14:44:32', '2024-05-31 20:44:32'),
('c346f8bf291b950b8dc6fb432649a1edf270f709406f609f0d57c2632e5eca812635f7c068c03699', 14, 1, 'usertoken', '[]', 0, '2023-05-12 06:45:26', '2023-05-12 06:45:26', '2024-05-12 12:45:26'),
('dcd4124974c01bea314286e5bc44d9a4ff7a4d6807322087fe2463e15866ae070b7dee0339cc6a0f', 6, 1, 'usertoken', '[]', 0, '2023-04-21 08:08:52', '2023-04-21 08:08:52', '2024-04-21 14:08:52'),
('deeb983aa1818d58300726c1a5ef0b2dc7d0a8bbdec535fd9e50d3b4c529eefd0f4925116ad16d0c', 7, 1, 'usertoken', '[]', 0, '2023-05-26 10:09:57', '2023-05-26 10:09:57', '2024-05-26 16:09:57'),
('e10bab6530d42121b34a2d9113fbeaf7edd96f3f8da461cbbed8ea6ec4a870442900077ae5facd14', 7, 1, 'usertoken', '[]', 0, '2023-05-09 15:19:09', '2023-05-09 15:19:09', '2024-05-09 21:19:09'),
('e58f088b14e2230170840e8508e6f49224bd2594c26ba820311aa763a68f02e59d793079c8b508fc', 6, 1, 'usertoken', '[]', 0, '2023-04-11 04:07:57', '2023-04-11 04:07:57', '2024-04-11 10:07:57'),
('e6caa600f53d68f1d628f7fb547b8e1fc9e4bffa385aeb7a94550453f85bf7cc7e09e2d964c1fa74', 7, 1, 'usertoken', '[]', 0, '2023-05-08 17:17:25', '2023-05-08 17:17:25', '2024-05-08 23:17:25'),
('e93838bde9cf9289d4660176bc1afd41f1ca382b7d41471951bfd44b82e36353deea49330842acfe', 7, 1, 'usertoken', '[]', 0, '2023-05-08 16:41:29', '2023-05-08 16:41:29', '2024-05-08 22:41:29'),
('fc94cf124107091aa1e20858fdd798e96af98855ec41c48cc21e16a06626d602ad6bb30a62458e01', 7, 1, 'usertoken', '[]', 0, '2023-04-29 06:24:34', '2023-04-29 06:24:34', '2024-04-29 12:24:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'hU58nzYVQ4WP1SN9YgeUNRgoJZby5PJ2fHfNCq19', NULL, 'http://localhost', 1, 0, 0, '2023-04-10 16:53:21', '2023-04-10 16:53:21'),
(2, NULL, 'Laravel Password Grant Client', 'CXJDbJd4Jt786tyEmsPWunaqeQAkFCFXDJRrqfjg', 'users', 'http://localhost', 0, 1, 0, '2023-04-10 16:53:21', '2023-04-10 16:53:21');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-04-10 16:53:21', '2023-04-10 16:53:21');

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
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`, `status`) VALUES
('subroo.f2119@gmail.com', 'mMx8eKOH8DyAPGRXPozbbiKIp18gdl', '2022-04-30 01:41:57', 0),
('subroo.f2119@gmail.com', 'Zy2fyQGGNP1bydGoKrHuMWDmx5Hp7z', '2022-10-22 00:00:55', 0),
('subroo.f2119@gmail.com', 'XxgSAlrf5VZPaqeSOyOjia0MWFUxDp', '2022-10-23 04:53:44', 0),
('subroo.f2119@gmail.com', '0LsllpVZyg0ubqBiqvXuMBXlsAW5Z7', '2022-10-23 04:58:51', 0),
('subroo.f2119@gmail.com', 'VhWcCfbQ3LITA80pkgEWbu7ygSV4c8', '2022-10-25 21:38:10', 0),
('subroo.f2119@gmail.com', 'BcC8VoIUk6ERuGZVJa3bWOINBmLE4e', '2022-10-25 21:40:34', 0),
('subroo.f2119@gmail.com', 'lnEHuf6qOk4TgWTexgmZnwNOjwlrdk', '2022-10-25 21:40:47', 0),
('subroo.f2119@gmail.com', 'DsgbTKBtC2hPGyteXxmpbpZvicephd', '2022-10-25 21:47:44', 0),
('subroo.f2119@gmail.com', 'mppE1XEXEhQwf2qsfpa26MXbmiVp1m', '2022-10-25 21:47:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum_deposit_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `maximum_deposit_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '100',
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `fixed_charge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `percentage_charge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `gateway_key_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_key_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_key_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_key_four` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `image`, `name`, `minimum_deposit_amount`, `maximum_deposit_amount`, `rate`, `fixed_charge`, `percentage_charge`, `gateway_key_one`, `gateway_key_two`, `gateway_key_three`, `gateway_key_four`, `status`, `created_at`, `updated_at`) VALUES
(1, '644cb79c8b758331.png', 'PayPal', '1', '100', '1', '1', '1', 'ATZaY-59S9cu3jErTAfbySWjTGnmxVLn9sX3_HPmPquS2ZXTx-5EysVeTMYzGlVSlZ7o7hjmbB-KKDbb', 'EPQylGfkBDgaioEt1BNQhyRn2HBhMvk0Ur4gpeDtpRKQt8qbGHs99BSBeByMXJObaHYT-YumLc0KLqgF', 'APP-80W284485P519543T', NULL, 1, '2022-02-27 01:24:46', '2023-04-29 06:22:20'),
(2, '64619344151c5780.png', 'Coinpayment', '1', '100', '1', '0', '0', '0c86e76c1eb1a985736259b110715479', '3KPG3ifVamPrRvXjsU96uZzqix9tZ4dxN6', NULL, NULL, 1, '2022-02-27 01:27:39', '2023-05-15 02:04:52'),
(3, '644cb7940e3d9850.png', 'Stripe', '1', '100', '1', '0', '0', 'sk_test_aat3tzBCCXXBkS4sxY3M8A1B', 'pk_test_AU3G7doZ1sbdpJLj0NaozPBu', NULL, NULL, 1, '2022-02-27 01:28:08', '2023-04-29 06:22:12'),
(4, '6461936d2b01d321.png', 'Payfast', '1', '100', '1', '0', '0', '10021291', '2tlvihaplhxvo', NULL, NULL, 1, '2022-02-27 01:28:35', '2023-05-15 02:05:33'),
(5, '646193d620318362.png', 'Paystack', '1', '100', '1', '0', '0', 'pk_test_f2ec4a4bf603b4a6776c0c6fd3ceb04ecef6fc8e', 'sk_test_0c4a203ba7f22698c7ea4391d40aee72e7541ac2', 'subroo.f2119@gmail.com', NULL, 1, '2022-02-27 01:29:02', '2023-05-15 02:07:18'),
(6, '6461943990679685.png', 'Flutterwave', '1', '100', '1', '0', '0', 'FLWPUBK_TEST-e10f44ad2383bfe93d97cbe93719f2f6-X', 'FLWSECK_TEST-0ad53c369d2c3023c93f6dd5586f4b83-X', 'FLWSECK_TESTe3582f019fde', NULL, 1, '2022-02-27 01:29:31', '2023-05-15 02:08:57'),
(7, '644cb767d0f49515.png', 'Paytm', '1', '100', '1', '0', '0', 'DIY12386817555501617', 'bKMfNxPPf_QdZppa', NULL, NULL, 1, '2022-02-27 01:29:58', '2023-04-29 06:21:27'),
(8, '647c655f8d226116.png', 'Skrill', '1', '100', '1', '0', '0', 'demoqco@sun-fish.com', NULL, NULL, NULL, 1, '2022-02-27 01:30:32', '2023-06-04 10:20:15'),
(9, '647c653e3b0ee267.png', 'Authorize.Net', '1', '100', '1', '0', '0', '7XMs2L4gr6u', '9M2HH6unv99u9V42', NULL, NULL, 1, '2022-03-08 03:02:49', '2023-06-04 10:19:42'),
(10, '647c651a314e7892.png', 'Mollie', '1', '100', '1', '0', '0', 'test_v3UHJrw3K9h2n9WkHkVtp993SKF9G8', NULL, NULL, NULL, 1, '2022-03-09 05:01:15', '2023-06-04 10:19:06'),
(11, '647c64e2e431d514.png', 'instamojo', '1', '100', '1', '0', '0', 'test_d883b3a8d2bc1adc7a535506713', 'test_dc229039d2232a260a2df3f7502', 'https://test.instamojo.com/api/1.1/', NULL, 1, '2022-03-10 05:52:50', '2023-06-04 10:18:10'),
(12, '646192f1f3d6d789.png', 'SecurionPay', '1', '100', '1', '0', '0', 'pk_test_1osHcULHElDE58lrsjxWun4b', 'sk_test_H7rlwnDJDGfp5BmcQhiUU0KR', NULL, NULL, 1, '2022-03-15 04:29:49', '2023-05-15 02:03:30'),
(13, '647c64b74b16c516.png', 'Coingate', '1', '100', '1', '1', '1', '62TWcezrdugjALV2Bz89BEypajZtdZS3sd_j-HMJ', NULL, NULL, NULL, 1, '2022-03-21 00:42:53', '2023-06-04 10:17:27'),
(14, '646192cb7f479192.png', 'Coinbase Commerce', '1', '100', '1', '0', '0', 'f7706d38-37af-4024-83aa-73c82309ef5d', 'e8040850-d191-4a5a-8fe9-bb7b5698832e', NULL, NULL, 1, '2022-03-21 05:06:34', '2023-05-15 02:02:51'),
(15, '6482d319cd6d3251.png', '2checkout', '1', '100', '1', '1', '1', '252477737496', 'lrXOoJTPqrk=', NULL, NULL, 1, '2022-04-23 02:25:52', '2023-06-09 07:22:01'),
(110, '647c668d29f88695.png', 'City Bank', '1', '100', '1', '1', '2', NULL, NULL, NULL, 'Account : 4242 4242 4242 4242', 1, '2022-03-13 02:33:53', '2023-06-04 10:25:17');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'general-store', 'admin', '2022-11-06 12:25:55', '2022-11-06 12:25:55'),
(2, 'general-nav-sidebar', 'admin', '2022-11-06 12:25:55', '2022-11-06 12:25:55'),
(3, 'admin-logo-favicon-index', 'admin', '2022-11-06 12:25:55', '2022-11-06 12:25:55'),
(4, 'admin-gnl-index', 'admin', '2022-11-06 12:25:55', '2022-11-06 12:25:55'),
(5, 'admin-about-index', 'admin', '2022-11-06 12:25:55', '2022-11-06 12:25:55'),
(6, 'admin-contact-index', 'admin', '2022-11-06 12:25:55', '2022-11-06 12:25:55'),
(7, 'admin-extens-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(8, 'admin-breadcrumb-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(9, 'manage-section-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(10, 'section-manage-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(11, 'admin-user-manage', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(12, 'user-view', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(13, 'user-detail-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(14, 'active-user-manage', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(15, 'ban-user-manage', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(16, 'email-unverified-user', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(17, 'username-search', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(18, 'email-search', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(19, 'user-password', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(20, 'user-pass-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(21, 'user-balance', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(22, 'user-balance-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(23, 'user-email', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(24, 'send-mail-user', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(25, 'user-predictions', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(26, 'user-gamelog', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(27, 'user-paymentlog', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(28, 'user-withdrawlog', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(29, 'user-transactionlog', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(30, 'admin-custom-css', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(31, 'admin-custom-css-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(33, 'faq-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(34, 'faq-create', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(35, 'faq-store', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(36, 'faq-show', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(37, 'faq-edit', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(38, 'faq-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(39, 'faq-destroy', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(40, 'testimonial-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(41, 'testimonial-create', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(42, 'testimonial-store', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(43, 'testimonial-show', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(44, 'testimonial-edit', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(45, 'testimonial-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(46, 'testimonial-destroy', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(47, 'news-search', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(48, 'news-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(49, 'news-create', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(50, 'news-store', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(51, 'news-show', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(52, 'news-edit', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(53, 'news-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(54, 'news-destroy', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(55, 'news-category-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(56, 'news-category-create', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(57, 'news-category-store', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(58, 'news-category-show', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(59, 'news-category-edit', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(60, 'news-category-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(61, 'news-category-destroy', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(62, 'slider-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(63, 'social-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(64, 'social-create', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(65, 'social-store', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(66, 'social-show', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(67, 'social-edit', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(68, 'social-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(69, 'social-destroy', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(70, 'service-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(71, 'service-create', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(72, 'service-store', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(73, 'service-show', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(74, 'service-edit', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(75, 'service-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(76, 'service-destroy', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(77, 'extra-page-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(78, 'extra-page-create', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(79, 'extra-page-store', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(80, 'extra-page-show', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(81, 'extra-page-edit', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(82, 'extra-page-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(83, 'extra-page-destroy', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(84, 'section-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(85, 'section-create', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(86, 'section-store', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(87, 'section-show', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(88, 'section-edit', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(89, 'section-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(90, 'section-destroy', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(99, 'admin-referral-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(100, 'admin-referral-update', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(101, 'language-index', 'admin', '2022-11-06 12:25:56', '2022-11-06 12:25:56'),
(102, 'language-create', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(103, 'language-store', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(104, 'language-show', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(105, 'language-edit', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(106, 'language-update', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(107, 'language-destroy', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(108, 'language-key-update', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(109, 'import_lang', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(110, 'extension-index', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(111, 'extension-create', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(112, 'extension-store', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(113, 'extension-show', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(114, 'extension-edit', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(115, 'extension-update', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(116, 'extension-destroy', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(117, 'admin-extension-update', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(118, 'extension-activate', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(119, 'extension-deactivate', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(120, 'advertise-index', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(121, 'advertise-create', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(122, 'advertise-store', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(123, 'advertise-show', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(124, 'advertise-edit', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(125, 'advertise-update', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(126, 'advertise-destroy', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(127, 'admin-advertise-banner', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(128, 'admin-advertise-script', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(129, 'admin-manual-gateway', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(130, 'gateway-index', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(131, 'gateway-create', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(132, 'gateway-store', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(133, 'gateway-show', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(134, 'gateway-edit', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(135, 'gateway-update', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(136, 'gateway-destroy', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(137, 'admin-withdraw-request', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(138, 'admin-withdraw-detail', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(139, 'admin-withdraw-process', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(140, 'admin-withdraw-viewlog', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(141, 'withdraw_log-search', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(142, 'withdraw-index', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(143, 'withdraw-create', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(144, 'withdraw-store', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(145, 'withdraw-show', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(146, 'withdraw-edit', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(147, 'withdraw-update', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(148, 'withdraw-destroy', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(149, 'email-template-index', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(150, 'email-template-create', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(151, 'email-template-store', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(152, 'email-template-show', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(153, 'email-template-edit', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(154, 'email-template-update', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(155, 'email-template-destroy', 'admin', '2022-11-06 12:25:57', '2022-11-06 12:25:57'),
(156, 'admin-email-controls', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(157, 'admin-email-controls-update', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(158, 'admin-global-template', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(159, 'admin-global-template-update', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(160, 'subscriber-index', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(161, 'subscriber-create', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(162, 'subscriber-store', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(163, 'subscriber-show', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(164, 'subscriber-edit', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(165, 'subscriber-update', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(166, 'subscriber-destroy', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(167, 'admin-subscriber-mail', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(168, 'support-index', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(169, 'support-create', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(170, 'support-store', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(171, 'support-show', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(172, 'support-edit', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(173, 'support-update', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(174, 'support-destroy', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(175, 'store-admin-reply', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(176, 'admin-deposit-pending', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(177, 'admin-deposit-showreceipt', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(178, 'admin-deposit-accept', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(179, 'admin-deposit-rejectreq', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(180, 'admin-deposit-acceptedrequests', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(181, 'admin-deposit-depositlog', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(182, 'admin-deposit-rejectedrequests', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(183, 'deposit_log-search', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(184, 'admin-notifications', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(185, 'admin-notification-read', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(186, 'admin-notifications-readall', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(187, 'category-index', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(188, 'category-create', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(189, 'category-store', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(190, 'category-show', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(191, 'category-edit', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(192, 'category-update', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(193, 'category-destroy', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(194, 'tournament-index', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(195, 'tournament-create', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(196, 'tournament-store', 'admin', '2022-11-06 12:25:58', '2022-11-06 12:25:58'),
(197, 'tournament-show', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(198, 'tournament-edit', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(199, 'tournament-update', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(200, 'tournament-destroy', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(201, 'admin-all-bets', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(202, 'admin-pending-bets', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(203, 'admin-won-bets', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(204, 'admin-lost-bets', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(205, 'admin-refunded-bets', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(206, 'admin-all-matches', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(207, 'admin-runing-matches', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(208, 'admin-upcoming-matches', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(209, 'admin-close-event', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(210, 'admin-add-match', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(211, 'admin-store-match', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(212, 'admin-edit-match', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(213, 'admin-update-match', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(214, 'admin-view-question', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(215, 'admin-save-question', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(216, 'admin-update-question', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(217, 'admin-view-option', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(218, 'admin-createnewoption', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(219, 'admin-update-option', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(220, 'admin-awaiting-winner', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(221, 'admin-refundbetinvest', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(222, 'admin-awaiting-winner-userlist', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(223, 'admin-refundbetinvestsingleuser', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(224, 'admin-view-option-endtime', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(225, 'admin-make-winner', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(226, 'admin-bet-option-userlist', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(227, 'roles-index', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(228, 'roles-create', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(229, 'roles-store', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(230, 'roles-show', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(231, 'roles-edit', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(232, 'roles-update', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(233, 'roles-destroy', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(234, 'admin-users-index', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(235, 'admin-users-create', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(236, 'admin-users-store', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(237, 'admin-users-show', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(238, 'admin-users-edit', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(239, 'admin-users-update', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(240, 'admin-users-destroy', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(241, 'permissions-index', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(242, 'permissions-create', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(243, 'permissions-store', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(244, 'permissions-show', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(245, 'permissions-edit', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(246, 'permissions-update', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(247, 'admin-web-index', 'admin', '2022-11-07 10:09:13', '2022-11-07 10:09:13'),
(248, 'slider-create', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(249, 'slider-store', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(250, 'slider-show', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(251, 'slider-edit', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(252, 'slider-update', 'admin', '2022-11-06 12:25:59', '2022-11-06 12:25:59'),
(253, 'slider-destroy', 'admin', '2022-11-06 12:26:00', '2022-11-06 12:26:00'),
(254, 'sports-api-index', 'admin', '2023-01-06 07:19:00', '2023-01-06 07:19:00'),
(255, 'admin-seo-global', 'admin', '2023-04-29 06:58:58', '2023-04-29 06:58:58'),
(256, 'transaction-log-admin', 'admin', '2023-08-23 04:47:16', '2023-08-23 04:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint UNSIGNED NOT NULL,
  `percentage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referrals`
--

INSERT INTO `referrals` (`id`, `percentage`, `created_at`, `updated_at`) VALUES
(1, '2', '2023-06-01 15:40:22', '2023-06-01 15:40:22'),
(2, '4', '2023-06-01 15:40:22', '2023-06-01 15:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '2022-02-24 00:10:39', '2022-02-24 00:10:39'),
(2, 'Support', 'admin', '2022-11-06 12:34:00', '2022-11-06 12:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(246, 1),
(247, 1),
(248, 1),
(249, 1),
(250, 1),
(251, 1),
(252, 1),
(253, 1),
(254, 1),
(255, 1),
(256, 1),
(1, 2),
(2, 2),
(33, 2),
(34, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(109, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(174, 2),
(247, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section_btns`
--

CREATE TABLE `section_btns` (
  `id` bigint UNSIGNED NOT NULL,
  `service_switch` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Deactive',
  `about_switch` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Deactive',
  `testimonial_switch` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Deactive',
  `news_switch` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Deactive',
  `event_switch` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Deactive',
  `leaderboard_switch` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Deactive',
  `contact_switch` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_btns`
--

INSERT INTO `section_btns` (`id`, `service_switch`, `about_switch`, `testimonial_switch`, `news_switch`, `event_switch`, `leaderboard_switch`, `contact_switch`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 1, 1, 1, 1, 1, '2022-08-24 08:38:31', '2023-01-27 16:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `image`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, '62a83297c4bee358.png', 'PLAY', 'Play your fast tournaments against players of similar skill level', '2022-04-15 05:39:58', '2022-06-14 01:02:47'),
(2, '62a832b50fc20441.png', 'FAIR', 'Always compete against players of similar skill level', '2022-04-15 05:40:14', '2022-06-14 01:03:17'),
(3, '62a832cb31c22703.png', 'WIN', 'Fun game play that tests your skills and Win Price', '2022-04-15 05:40:29', '2022-06-14 01:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, '6474522daf117701.png', 1, '2023-04-29 06:28:49', '2023-05-29 07:20:13'),
(2, '64745218791d5810.png', 1, '2023-05-15 01:27:57', '2023-05-29 07:19:52'),
(3, '6474520884af3740.png', 1, '2023-05-15 01:37:34', '2023-05-29 07:19:36'),
(4, '64745175c7ff3416.png', 1, '2023-05-15 01:37:54', '2023-05-29 07:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socials`
--

INSERT INTO `socials` (`id`, `icon`, `link`, `created_at`, `updated_at`) VALUES
(1, 'facebook', 'https://facebook.com/', '2022-04-21 01:24:59', '2022-04-21 01:30:42'),
(2, 'twitter', 'https://twitter.com/', '2022-04-21 01:25:58', '2022-04-21 01:25:58'),
(3, 'instagram', 'https://instagram.com/', '2022-04-21 01:37:34', '2022-04-21 01:37:34'),
(4, 'youtube', 'https://youtube.com/', '2022-04-21 01:44:58', '2022-04-21 01:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `ticket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_comments`
--

CREATE TABLE `support_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `ticket_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `image`, `name`, `designation`, `created_at`, `updated_at`) VALUES
(1, '628f32f1e21fd853.png', 'Arlene McCoy', 'Top Rated Gamer', '2022-04-15 05:50:09', '2022-05-26 01:57:37'),
(2, '628f32e6bd58f816.png', 'Wade Warren', 'Top Rated Gamer', '2022-04-15 05:50:51', '2022-05-26 01:57:26'),
(3, '628f32d9afbcc529.png', 'Ronald Richards', 'Top Rated Gamer', '2022-04-20 03:44:01', '2022-05-26 01:57:14');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `trans_id` bigint NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_bal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_bal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '''+''',
  `status` tinyint(1) NOT NULL COMMENT '0 = Purchase Plan, 1 = Deposit, 2 = Bal Trans, 3 = Withdraw',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tfver` tinyint(1) DEFAULT '0',
  `emailv` int NOT NULL DEFAULT '0',
  `vercode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `balance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `gender` int DEFAULT NULL COMMENT '1 = Male & 0 = Female',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vsent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secretcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `tauth` tinyint(1) NOT NULL DEFAULT '0',
  `ref_id` tinyint(1) DEFAULT NULL,
  `referral_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_logs`
--

CREATE TABLE `withdraw_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `withdraw_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processing_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL COMMENT '0 = pending, 1 = approved, 2 = Reject',
  `method_cur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_amo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chargefx` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chargepc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processing_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `name`, `image`, `min_amo`, `max_amo`, `chargefx`, `chargepc`, `rate`, `processing_day`, `currency`, `status`, `created_at`, `updated_at`) VALUES
(1, 'City Bank', '6239b177594bb521.jpg', '10', '10000', '0', '0', '1', '0-3', 'USD', 1, '2022-03-01 02:56:43', '2022-03-22 05:22:31'),
(2, 'instamojo', '6239b1513750e769.jpg', '10', '1000', '0', '0', '1', '0-3', 'USD', 1, '2022-03-13 06:28:51', '2022-03-22 05:21:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `advertises`
--
ALTER TABLE `advertises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bet_invests`
--
ALTER TABLE `bet_invests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bet_options`
--
ALTER TABLE `bet_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bet_questions`
--
ALTER TABLE `bet_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_requests`
--
ALTER TABLE `deposit_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_pages`
--
ALTER TABLE `extra_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generals`
--
ALTER TABLE `generals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_btns`
--
ALTER TABLE `section_btns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_comments`
--
ALTER TABLE `support_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`);

--
-- Indexes for table `withdraw_logs`
--
ALTER TABLE `withdraw_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `advertises`
--
ALTER TABLE `advertises`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bet_invests`
--
ALTER TABLE `bet_invests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bet_options`
--
ALTER TABLE `bet_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bet_questions`
--
ALTER TABLE `bet_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit_requests`
--
ALTER TABLE `deposit_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `extra_pages`
--
ALTER TABLE `extra_pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `generals`
--
ALTER TABLE `generals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=548;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section_btns`
--
ALTER TABLE `section_btns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_comments`
--
ALTER TABLE `support_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_logs`
--
ALTER TABLE `withdraw_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
