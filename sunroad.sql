-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2019 at 04:24 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sunroad`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(10) UNSIGNED NOT NULL,
  `timeline_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `about` text COLLATE utf8_unicode_ci NOT NULL,
  `preview_id` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `privacy` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `album_media`
--

CREATE TABLE `album_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `album_id` int(10) UNSIGNED NOT NULL,
  `media_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_user`
--

CREATE TABLE `announcement_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `announcement_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `parent_id`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Airport', 'description about Airport', 1, 1, '2019-03-06 23:53:31', '2019-03-06 23:53:31', NULL),
(2, 'Automotive', 'description about Automotive', 2, 1, '2019-03-06 23:53:31', '2019-03-06 23:53:31', NULL),
(3, 'Bank/Financial Services', 'description about Bank/Financial Services', 3, 1, '2019-03-06 23:53:31', '2019-03-06 23:53:31', NULL),
(4, 'Bar', 'description about Bar', 4, 1, '2019-03-06 23:53:31', '2019-03-06 23:53:31', NULL),
(5, 'Book Store', 'description about Book Store', 5, 1, '2019-03-06 23:53:31', '2019-03-06 23:53:31', NULL),
(6, 'Business Services', 'description about Business Services', 6, 1, '2019-03-06 23:53:31', '2019-03-06 23:53:31', NULL),
(7, 'Church/Religious Organization', 'description about Church/Religious Organization', 7, 1, '2019-03-06 23:53:31', '2019-03-06 23:53:31', NULL),
(8, 'Club', 'description about Club', 8, 1, '2019-03-06 23:53:31', '2019-03-06 23:53:31', NULL),
(9, 'Concert Venue', 'description about Concert Venue', 9, 1, '2019-03-06 23:53:31', '2019-03-06 23:53:31', NULL),
(10, 'Doctor', 'description about Doctor', 10, 1, '2019-03-06 23:53:31', '2019-03-06 23:53:31', NULL),
(11, 'Education', 'description about Education', 11, 1, '2019-03-06 23:53:31', '2019-03-06 23:53:31', NULL),
(12, 'Event Planning/Event Services', 'description about Event Planning/Event Services', 12, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(13, 'Home Improvement', 'description about Home Improvement', 13, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(14, 'Hotel', 'description about Hotel', 14, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(15, 'Landmark', 'description about Landmark', 15, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(16, 'category1', 'description about category1', 16, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(17, 'category2', 'description about category2', 17, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(18, 'category3', 'description about category3', 18, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(19, 'category4', 'description about category4', 19, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(20, 'category5', 'description about category5', 20, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(21, 'category6', 'description about category6', 21, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(22, 'category7', 'description about category7', 22, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(23, 'category8', 'description about category8', 23, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(24, 'category9', 'description about category9', 24, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(25, 'category10', 'description about category10', 25, 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `media_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `description`, `user_id`, `parent_id`, `created_at`, `updated_at`, `deleted_at`, `media_id`) VALUES
(2, 2, 'Test- nice photo ', 3, NULL, '2019-05-14 01:26:06', '2019-05-14 01:26:06', NULL, NULL),
(3, 2, 'My messages aren’t working but I saw you said hi', 3, NULL, '2019-05-14 18:32:08', '2019-05-14 18:32:08', NULL, NULL),
(4, 2, 'I just fixed and uploaded new build\nIt will be released tomorrow ', 6, NULL, '2019-05-14 18:45:31', '2019-05-14 18:45:31', NULL, NULL),
(5, 2, 'I sent msg in new build, you can receive msg in new build.', 6, NULL, '2019-05-14 19:02:23', '2019-05-14 19:02:23', NULL, NULL),
(7, 4, 'Doesn’t work', 3, NULL, '2019-05-21 23:11:10', '2019-05-21 23:11:10', NULL, NULL),
(10, 16, 'The audio still doesn’t work.. if I play- it plays but the scroll doesn’t work and if I do scroll- it doesn’t follow it just replays. Once it plays, I can’t click it again to play or pause.', 3, NULL, '2019-05-28 04:20:37', '2019-05-28 04:20:37', NULL, NULL),
(11, 19, 'So rosy', 3, NULL, '2019-05-28 05:25:04', '2019-05-28 05:25:04', NULL, NULL),
(12, 2, 'Hi ', 20, NULL, '2019-05-28 05:54:56', '2019-05-28 05:54:56', NULL, NULL),
(13, 16, 'Audio is not working well', 20, NULL, '2019-05-28 05:57:56', '2019-05-28 05:57:56', NULL, NULL),
(14, 16, 'Working now?', 20, NULL, '2019-05-29 03:04:44', '2019-05-29 03:04:44', NULL, NULL),
(15, 16, 'Ok?', 20, NULL, '2019-05-29 03:10:34', '2019-05-29 03:10:34', NULL, NULL),
(16, 27, 'Cool wat- er ', 22, NULL, '2019-06-02 03:43:07', '2019-06-02 03:43:07', NULL, NULL),
(18, 33, 'This one works but the scroller doesn’t show the time in bottom right corner', 3, NULL, '2019-06-05 01:22:45', '2019-06-05 01:22:45', NULL, NULL),
(19, 33, 'My messenger doesn’t work so I can’t reply to you ', 3, NULL, '2019-06-06 01:48:25', '2019-06-06 01:48:25', NULL, NULL),
(20, 36, 'Is the scroller working on your end?', 3, NULL, '2019-06-07 04:33:31', '2019-06-07 04:33:31', NULL, NULL),
(21, 37, 'Works!! ????????????', 3, NULL, '2019-06-07 22:34:34', '2019-06-07 22:34:34', NULL, NULL),
(22, 36, 'Yes', 6, NULL, '2019-06-07 23:01:59', '2019-06-07 23:01:59', NULL, NULL),
(23, 37, 'Yes', 6, NULL, '2019-06-07 23:02:33', '2019-06-07 23:02:33', NULL, NULL),
(24, 43, 'Can’t see anything...or your newsfeed ????????????‍♂️', 14, NULL, '2019-06-11 01:45:14', '2019-06-11 01:45:14', NULL, NULL),
(25, 43, 'Really? Hmmm... it may need to update. We fixed a bunch and that happened when the developer updated. I couldn’t see jenny’s timeline at first.', 3, NULL, '2019-06-11 01:46:51', '2019-06-11 01:46:51', NULL, NULL),
(26, 48, 'Wow, I didn’t see the woman looking up at first. Beautiful. Also with my timeline- you may need to update the app or delete and get again since you got in before a few updates. Sorry for the inconvenience!', 3, NULL, '2019-06-11 02:01:19', '2019-06-11 02:01:19', NULL, NULL),
(27, 50, 'Man it’s like a dream. Beautiful', 3, NULL, '2019-06-12 16:55:46', '2019-06-12 16:55:46', NULL, NULL),
(28, 56, 'Love this', 3, NULL, '2019-06-15 23:32:20', '2019-06-15 23:32:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment_likes`
--

CREATE TABLE `comment_likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `timeline_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `invite_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timeline_post_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_user`
--

CREATE TABLE `event_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(10) UNSIGNED NOT NULL,
  `follower_id` int(10) UNSIGNED NOT NULL,
  `leader_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `isnew` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `follower_id`, `leader_id`, `status`, `isnew`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 6, 'approved', 0, '2019-05-14 01:25:37', NULL, NULL),
(2, 3, 2, 'pending', 1, '2019-05-14 02:08:58', NULL, NULL),
(4, 6, 2, 'pending', 1, '2019-05-14 17:37:39', NULL, NULL),
(5, 3, 15, 'pending', 1, '2019-05-21 20:23:29', NULL, NULL),
(6, 17, 3, 'approved', 0, '2019-05-21 23:04:11', NULL, NULL),
(7, 3, 13, 'pending', 1, '2019-05-22 17:54:17', NULL, NULL),
(10, 6, 20, 'approved', 0, '2019-05-26 20:53:11', NULL, NULL),
(11, 22, 3, 'approved', 0, '2019-05-28 04:30:49', NULL, NULL),
(12, 6, 10, 'pending', 1, '2019-05-28 04:37:15', NULL, NULL),
(13, 6, 12, 'pending', 1, '2019-05-29 17:06:05', NULL, NULL),
(14, 14, 3, 'approved', 0, '2019-05-31 20:13:10', NULL, NULL),
(15, 3, 23, 'approved', 0, '2019-06-02 05:48:31', NULL, NULL),
(16, 8, 14, 'approved', 0, '2019-06-08 17:58:06', NULL, NULL),
(17, 3, 24, 'approved', 0, '2019-06-10 19:57:57', NULL, NULL),
(18, 25, 3, 'approved', 0, '2019-06-10 22:48:16', NULL, NULL),
(19, 25, 8, 'pending', 1, '2019-06-10 22:48:25', NULL, NULL),
(20, 25, 14, 'approved', 0, '2019-06-10 22:48:35', NULL, NULL),
(21, 25, 20, 'pending', 1, '2019-06-11 01:43:47', NULL, NULL),
(22, 3, 27, 'approved', 0, '2019-06-11 15:37:42', NULL, NULL),
(23, 3, 26, 'approved', 0, '2019-06-11 16:03:43', NULL, NULL),
(24, 3, 21, 'pending', 1, '2019-06-11 16:20:15', NULL, NULL),
(25, 3, 28, 'pending', 1, '2019-06-13 04:06:37', NULL, NULL),
(26, 29, 17, 'pending', 1, '2019-06-13 11:16:36', NULL, NULL),
(27, 27, 2, 'pending', 1, '2019-06-13 23:12:56', NULL, NULL),
(28, 27, 6, 'approved', 0, '2019-06-13 23:13:04', NULL, NULL),
(29, 27, 7, 'pending', 1, '2019-06-13 23:13:10', NULL, NULL),
(30, 27, 14, 'approved', 0, '2019-06-13 23:13:17', NULL, NULL),
(31, 27, 17, 'pending', 1, '2019-06-13 23:13:25', NULL, NULL),
(32, 27, 22, 'pending', 1, '2019-06-13 23:13:34', NULL, NULL),
(33, 3, 30, 'pending', 1, '2019-06-15 17:53:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL DEFAULT '0',
  `sender_id` int(11) NOT NULL DEFAULT '0',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `timeline_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `member_privacy` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `post_privacy` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `event_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE `group_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hashtags`
--

CREATE TABLE `hashtags` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `last_trend_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `count` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `source` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `title`, `type`, `source`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2019-03-06-16-26-24download.jpg', 'image', '2019-03-06-16-26-24download.jpg', '2019-03-07 00:26:24', '2019-03-07 00:26:24', NULL),
(2, 'download.jpg', 'image', '2019-03-06-23-48-03download.jpg', '2019-03-07 07:48:03', '2019-03-07 07:48:03', NULL),
(3, 'unchecked.png', 'image', '2019-03-07-18-34-46unchecked.png', '2019-03-08 02:34:46', '2019-03-08 02:34:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `thread_id`, `user_id`, `body`, `read`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 6, 'Hi', 0, '2019-05-14 18:30:57', '2019-05-14 18:30:57', NULL),
(2, 1, 3, 'Test', 0, '2019-05-17 21:03:56', '2019-05-17 21:03:56', NULL),
(3, 1, 3, 'Cool, the profile is now on here but still not on the top right when I view my window. I’ll check if bio saves and if not, we can update later!', 0, '2019-05-17 21:35:34', '2019-05-17 21:35:34', NULL),
(4, 1, 3, 'Also doesn’t let me delete other chat and still has notification even when I don’t have a notification for messages', 0, '2019-05-17 21:36:08', '2019-05-17 21:36:08', NULL),
(5, 1, 3, 'Bio doesn’t save but picture does!', 0, '2019-05-17 21:37:40', '2019-05-17 21:37:40', NULL),
(6, 2, 3, 'Hi', 0, '2019-05-21 23:08:09', '2019-05-21 23:08:09', NULL),
(7, 1, 6, 'Regarding Bio, I will update in next version ', 0, '2019-05-22 03:14:01', '2019-05-22 03:14:01', NULL),
(8, 1, 6, 'Are you receiving Push notification even though you removed it?', 0, '2019-05-22 03:15:09', '2019-05-22 03:15:09', NULL),
(9, 1, 3, 'Yes I’m getting them and they don’t leave', 0, '2019-05-22 03:17:10', '2019-05-22 03:17:10', NULL),
(10, 1, 6, 'Let me check code', 0, '2019-05-22 13:40:20', '2019-05-22 13:40:20', NULL),
(11, 1, 6, 'Any issues for chat?', 0, '2019-05-22 13:41:41', '2019-05-22 13:41:41', NULL),
(12, 1, 3, 'Besides notifications not going away, I also can’t delete messages still', 0, '2019-05-22 15:32:22', '2019-05-22 15:32:22', NULL),
(13, 1, 3, 'Also friend function doesn’t work. If I add a friend- it goes in my friend tab even though they didn’t accept', 0, '2019-05-22 17:55:05', '2019-05-22 17:55:05', NULL),
(14, 1, 3, 'I also get notifications for messages I send', 0, '2019-05-22 18:05:38', '2019-05-22 18:05:38', NULL),
(15, 1, 6, 'Let me update code in this week', 0, '2019-05-22 18:06:22', '2019-05-22 18:06:22', NULL),
(16, 1, 3, 'Cool thanks ', 0, '2019-05-22 18:06:44', '2019-05-22 18:06:44', NULL),
(17, 3, 20, 'Hi', 0, '2019-05-26 17:29:01', '2019-05-26 17:29:01', NULL),
(18, 3, 20, 'Dffghj', 0, '2019-05-26 17:29:56', '2019-05-26 17:29:56', NULL),
(19, 3, 20, 'Hi', 0, '2019-05-26 17:30:41', '2019-05-26 17:30:41', NULL),
(20, 3, 20, 'Yes\nHow are you', 0, '2019-05-26 17:33:16', '2019-05-26 17:33:16', NULL),
(21, 3, 20, '1dfdfd', 0, '2019-05-26 17:39:23', '2019-05-26 17:39:23', NULL),
(22, 3, 20, '1dfdfd', 0, '2019-05-26 17:40:35', '2019-05-26 17:40:35', NULL),
(23, 3, 20, 'test', 0, '2019-05-26 17:44:33', '2019-05-26 17:44:33', NULL),
(24, 3, 20, 'test', 0, '2019-05-26 17:44:52', '2019-05-26 17:44:52', NULL),
(25, 3, 20, 'test', 0, '2019-05-26 17:46:39', '2019-05-26 17:46:39', NULL),
(26, 3, 20, 'test', 0, '2019-05-26 17:47:36', '2019-05-26 17:47:36', NULL),
(27, 3, 20, 'test', 0, '2019-05-26 17:47:53', '2019-05-26 17:47:53', NULL),
(28, 3, 20, 'test', 0, '2019-05-26 17:58:03', '2019-05-26 17:58:03', NULL),
(29, 3, 6, 'Uffg ', 0, '2019-05-26 18:00:10', '2019-05-26 18:00:10', NULL),
(30, 3, 20, 'Ghgg ', 0, '2019-05-26 18:00:29', '2019-05-26 18:00:29', NULL),
(31, 3, 20, 'test', 0, '2019-05-26 18:00:50', '2019-05-26 18:00:50', NULL),
(32, 3, 6, 'test', 0, '2019-05-26 18:02:29', '2019-05-26 18:02:29', NULL),
(33, 3, 20, 'test', 0, '2019-05-26 18:03:07', '2019-05-26 18:03:07', NULL),
(34, 3, 20, 'test', 0, '2019-05-26 18:08:40', '2019-05-26 18:08:40', NULL),
(35, 3, 20, 'test', 0, '2019-05-26 18:08:40', '2019-05-26 18:08:40', NULL),
(36, 3, 20, 'test', 0, '2019-05-26 18:10:35', '2019-05-26 18:10:35', NULL),
(37, 3, 20, 'test', 0, '2019-05-26 18:10:40', '2019-05-26 18:10:40', NULL),
(38, 3, 20, 'test', 0, '2019-05-26 18:10:52', '2019-05-26 18:10:52', NULL),
(39, 3, 20, 'test', 0, '2019-05-26 18:11:24', '2019-05-26 18:11:24', NULL),
(40, 3, 20, 'test', 0, '2019-05-26 18:23:21', '2019-05-26 18:23:21', NULL),
(41, 3, 20, 'test', 0, '2019-05-26 18:29:07', '2019-05-26 18:29:07', NULL),
(42, 3, 20, 'test', 0, '2019-05-26 18:30:26', '2019-05-26 18:30:26', NULL),
(43, 3, 20, 'test', 0, '2019-05-26 18:31:09', '2019-05-26 18:31:09', NULL),
(44, 3, 20, 'test', 0, '2019-05-26 18:33:13', '2019-05-26 18:33:13', NULL),
(45, 3, 20, 'test', 0, '2019-05-26 18:34:15', '2019-05-26 18:34:15', NULL),
(46, 3, 20, 'test', 0, '2019-05-26 18:35:09', '2019-05-26 18:35:09', NULL),
(47, 3, 20, 'test', 0, '2019-05-26 18:40:57', '2019-05-26 18:40:57', NULL),
(48, 3, 20, 'test', 0, '2019-05-26 18:42:32', '2019-05-26 18:42:32', NULL),
(49, 3, 20, 'test', 0, '2019-05-26 18:42:36', '2019-05-26 18:42:36', NULL),
(50, 3, 20, 'test', 0, '2019-05-26 18:45:16', '2019-05-26 18:45:16', NULL),
(51, 3, 20, 'test', 0, '2019-05-26 18:46:12', '2019-05-26 18:46:12', NULL),
(52, 3, 20, 'test', 0, '2019-05-26 18:46:32', '2019-05-26 18:46:32', NULL),
(53, 3, 6, 'test', 0, '2019-05-26 18:47:27', '2019-05-26 18:47:27', NULL),
(54, 3, 6, 'test', 0, '2019-05-26 18:48:57', '2019-05-26 18:48:57', NULL),
(55, 3, 6, 'test', 0, '2019-05-26 18:50:08', '2019-05-26 18:50:08', NULL),
(56, 3, 6, 'Dgh', 0, '2019-05-26 18:53:36', '2019-05-26 18:53:36', NULL),
(57, 3, 20, 'Fdff', 0, '2019-05-26 18:55:37', '2019-05-26 18:55:37', NULL),
(58, 3, 20, 'Dgg', 0, '2019-05-26 18:57:38', '2019-05-26 18:57:38', NULL),
(59, 3, 20, 'Gdff', 0, '2019-05-26 18:57:44', '2019-05-26 18:57:44', NULL),
(60, 3, 20, 'Yryyh ', 0, '2019-05-26 18:58:54', '2019-05-26 18:58:54', NULL),
(61, 3, 20, 'Hi ', 0, '2019-05-26 18:58:54', '2019-05-26 18:58:54', NULL),
(62, 3, 20, 'Fff', 0, '2019-05-26 18:58:54', '2019-05-26 18:58:54', NULL),
(63, 3, 20, 'Fff ', 0, '2019-05-26 18:59:31', '2019-05-26 18:59:31', NULL),
(64, 3, 20, 'Tdff', 0, '2019-05-26 18:59:47', '2019-05-26 18:59:47', NULL),
(65, 3, 20, 'Hfffgcc', 0, '2019-05-26 19:00:08', '2019-05-26 19:00:08', NULL),
(66, 3, 20, 'Fff', 0, '2019-05-26 19:01:24', '2019-05-26 19:01:24', NULL),
(67, 3, 20, 'Fdfff', 0, '2019-05-26 19:01:32', '2019-05-26 19:01:32', NULL),
(68, 3, 20, 'Fdff ', 0, '2019-05-26 19:02:24', '2019-05-26 19:02:24', NULL),
(69, 3, 6, 'test', 0, '2019-05-26 19:08:12', '2019-05-26 19:08:12', NULL),
(70, 3, 6, 'test', 0, '2019-05-26 19:08:53', '2019-05-26 19:08:53', NULL),
(71, 3, 6, 'test', 0, '2019-05-26 19:11:41', '2019-05-26 19:11:41', NULL),
(72, 3, 6, 'test', 0, '2019-05-26 19:11:47', '2019-05-26 19:11:47', NULL),
(73, 3, 6, 'test', 0, '2019-05-26 19:12:36', '2019-05-26 19:12:36', NULL),
(74, 3, 6, 'test', 0, '2019-05-26 19:12:43', '2019-05-26 19:12:43', NULL),
(75, 3, 20, 'test', 0, '2019-05-26 19:13:00', '2019-05-26 19:13:00', NULL),
(76, 3, 20, 'test', 0, '2019-05-26 19:16:06', '2019-05-26 19:16:06', NULL),
(77, 3, 6, 'test', 0, '2019-05-26 19:16:29', '2019-05-26 19:16:29', NULL),
(78, 3, 6, 'test', 0, '2019-05-26 19:19:32', '2019-05-26 19:19:32', NULL),
(79, 3, 6, 'test', 0, '2019-05-26 19:19:53', '2019-05-26 19:19:53', NULL),
(80, 3, 20, 'test', 0, '2019-05-26 19:20:12', '2019-05-26 19:20:12', NULL),
(81, 3, 20, 'test', 0, '2019-05-26 19:24:15', '2019-05-26 19:24:15', NULL),
(82, 3, 20, 'test', 0, '2019-05-26 19:27:13', '2019-05-26 19:27:13', NULL),
(83, 3, 20, 'test', 0, '2019-05-26 19:27:53', '2019-05-26 19:27:53', NULL),
(84, 3, 20, 'test', 0, '2019-05-26 19:28:34', '2019-05-26 19:28:34', NULL),
(85, 3, 20, 'test', 0, '2019-05-26 19:29:01', '2019-05-26 19:29:01', NULL),
(86, 3, 20, 'test', 0, '2019-05-26 19:33:09', '2019-05-26 19:33:09', NULL),
(87, 3, 20, 'test', 0, '2019-05-26 19:34:04', '2019-05-26 19:34:04', NULL),
(88, 3, 20, 'test', 0, '2019-05-26 19:36:23', '2019-05-26 19:36:23', NULL),
(89, 3, 20, 'test', 0, '2019-05-26 19:37:55', '2019-05-26 19:37:55', NULL),
(90, 3, 20, 'test', 0, '2019-05-26 19:39:59', '2019-05-26 19:39:59', NULL),
(91, 3, 20, 'test', 0, '2019-05-26 19:41:14', '2019-05-26 19:41:14', NULL),
(92, 3, 20, 'test', 0, '2019-05-26 19:42:11', '2019-05-26 19:42:11', NULL),
(93, 3, 20, 'test', 0, '2019-05-26 19:42:42', '2019-05-26 19:42:42', NULL),
(94, 3, 20, 'test', 0, '2019-05-26 20:00:47', '2019-05-26 20:00:47', NULL),
(95, 3, 20, 'test', 0, '2019-05-26 20:02:04', '2019-05-26 20:02:04', NULL),
(96, 3, 6, 'test', 0, '2019-05-26 20:02:48', '2019-05-26 20:02:48', NULL),
(97, 3, 6, 'test', 0, '2019-05-26 20:05:40', '2019-05-26 20:05:40', NULL),
(98, 3, 20, 'test', 0, '2019-05-26 20:06:03', '2019-05-26 20:06:03', NULL),
(99, 3, 6, 'test', 0, '2019-05-26 20:06:29', '2019-05-26 20:06:29', NULL),
(100, 3, 6, 'test', 0, '2019-05-26 20:07:51', '2019-05-26 20:07:51', NULL),
(101, 3, 20, 'test', 0, '2019-05-26 20:08:00', '2019-05-26 20:08:00', NULL),
(102, 3, 20, 'test', 0, '2019-05-26 20:09:13', '2019-05-26 20:09:13', NULL),
(103, 3, 6, 'test', 0, '2019-05-26 20:09:25', '2019-05-26 20:09:25', NULL),
(104, 3, 6, 'test', 0, '2019-05-26 20:11:35', '2019-05-26 20:11:35', NULL),
(105, 3, 6, 'test', 0, '2019-05-26 20:11:45', '2019-05-26 20:11:45', NULL),
(106, 3, 20, 'test', 0, '2019-05-26 20:11:56', '2019-05-26 20:11:56', NULL),
(107, 3, 20, 'test', 0, '2019-05-26 20:12:04', '2019-05-26 20:12:04', NULL),
(108, 3, 20, 'test', 0, '2019-05-26 20:12:27', '2019-05-26 20:12:27', NULL),
(109, 3, 20, 'test', 0, '2019-05-26 20:19:54', '2019-05-26 20:19:54', NULL),
(110, 3, 20, 'test', 0, '2019-05-26 20:22:22', '2019-05-26 20:22:22', NULL),
(111, 3, 20, 'test', 0, '2019-05-26 20:23:07', '2019-05-26 20:23:07', NULL),
(112, 3, 20, 'test', 0, '2019-05-26 20:24:02', '2019-05-26 20:24:02', NULL),
(113, 3, 20, 'test', 0, '2019-05-26 20:24:59', '2019-05-26 20:24:59', NULL),
(114, 3, 20, 'test', 0, '2019-05-26 20:26:07', '2019-05-26 20:26:07', NULL),
(115, 3, 20, 'test', 0, '2019-05-26 20:28:45', '2019-05-26 20:28:45', NULL),
(116, 3, 20, 'test', 0, '2019-05-26 20:28:56', '2019-05-26 20:28:56', NULL),
(117, 3, 20, 'test', 0, '2019-05-26 20:28:56', '2019-05-26 20:28:56', NULL),
(118, 3, 20, 'test', 0, '2019-05-26 20:30:18', '2019-05-26 20:30:18', NULL),
(119, 3, 6, 'test', 0, '2019-05-26 20:30:33', '2019-05-26 20:30:33', NULL),
(120, 3, 6, '1dfdfd', 0, '2019-05-26 20:32:32', '2019-05-26 20:32:32', NULL),
(121, 3, 20, '1dfdfd', 0, '2019-05-26 20:32:50', '2019-05-26 20:32:50', NULL),
(122, 3, 20, 'Ffg', 0, '2019-05-26 20:34:36', '2019-05-26 20:34:36', NULL),
(123, 3, 6, 'Gdhh', 0, '2019-05-26 20:34:56', '2019-05-26 20:34:56', NULL),
(124, 3, 6, 'Hi', 0, '2019-05-26 20:36:08', '2019-05-26 20:36:08', NULL),
(125, 3, 20, 'Hi', 0, '2019-05-26 20:59:01', '2019-05-26 20:59:01', NULL),
(126, 1, 6, 'Friends function and notifications of message are working well', 0, '2019-05-26 21:01:23', '2019-05-26 21:01:23', NULL),
(127, 1, 6, 'Regarding deleting message, do you want to delete one message of messages you sent or do you want to delete whole chat with user?\nLatter is already implemented ', 0, '2019-05-26 21:04:36', '2019-05-26 21:04:36', NULL),
(128, 1, 3, 'Whole chat. Right now it doesn’t work for me. Later we could delete one message but I’d like to start with whole chat. Right now it says that I cant', 0, '2019-05-26 21:45:40', '2019-05-26 21:45:40', NULL),
(129, 1, 3, 'Says failed to delete user', 0, '2019-05-26 21:46:00', '2019-05-26 21:46:00', NULL),
(130, 1, 6, 'When you swipe left, are you seeing delete option?\nAnd click delete?', 0, '2019-05-26 21:47:58', '2019-05-26 21:47:58', NULL),
(131, 1, 3, 'Yes it says are you sure? And then when I click yes it says failed to delete user', 0, '2019-05-26 21:48:24', '2019-05-26 21:48:24', NULL),
(132, 1, 6, 'Can you tell me the name of user you want to delete?', 0, '2019-05-26 21:49:27', '2019-05-26 21:49:27', NULL),
(133, 1, 6, 'I just tested for different 2 devices\nBoth of them are working well', 0, '2019-05-26 21:51:15', '2019-05-26 21:51:15', NULL),
(134, 1, 3, 'Flyerson and andrew', 0, '2019-05-26 21:55:25', '2019-05-26 21:55:25', NULL),
(135, 1, 3, 'Both have not accepted my requests but that too is a little strange. They aren’t my friends but show up as friends and they’re in my inbox though they haven’t accepted', 0, '2019-05-26 21:56:21', '2019-05-26 21:56:21', NULL),
(136, 1, 6, 'Now you can’t see them in your friends inbox, if they didn’t accept ', 0, '2019-05-26 21:58:12', '2019-05-26 21:58:12', NULL),
(137, 1, 3, 'Okay cool', 0, '2019-05-26 21:59:06', '2019-05-26 21:59:06', NULL),
(138, 1, 6, 'Let me check about delete chats right now\nI was able to delete user who already accepted my request.\nFor user that didn’t accept my request, I am also getting error \nI am checking now', 0, '2019-05-26 22:01:16', '2019-05-26 22:01:16', NULL),
(139, 1, 6, 'I submitted new build to App Store \nIt is in review now\nIt will be approved soon ', 0, '2019-05-27 13:14:23', '2019-05-27 13:14:23', NULL),
(140, 1, 3, 'Thank you so much Elena', 0, '2019-05-27 15:49:05', '2019-05-27 15:49:05', NULL),
(141, 1, 6, 'Regarding music scrollbar, It was working well for local platform.\nI think something is changed when uploading to aws db\nLet me have a look\nIs there any feedback else it?', 0, '2019-05-28 04:24:17', '2019-05-28 04:24:17', NULL),
(142, 1, 3, 'Still testing. The time doesn’t play on the side to follow with music. I haven’t tried to create a profile yet', 0, '2019-05-28 04:26:20', '2019-05-28 04:26:20', NULL),
(143, 1, 3, 'Also the profile photo doesn’t save when I click the side menu', 0, '2019-05-28 04:27:02', '2019-05-28 04:27:02', NULL),
(144, 1, 6, 'I just tried to change profile photo \nIt is working well\nCan you tell me in other words?', 0, '2019-05-28 04:34:26', '2019-05-28 04:34:26', NULL),
(145, 1, 3, 'My messenger doesn’t work with my wife. Says failed. I started a profile for her. The dimensions for photos is not as before- now smaller. Also when I send a friend request it gives me a notification which I don’t need. The receiver should get. Let me check the bio real fast. ', 0, '2019-05-28 04:34:47', '2019-05-28 04:34:47', NULL),
(146, 4, 3, 'Hi', 0, '2019-05-28 04:35:02', '2019-05-28 04:35:02', NULL),
(147, 1, 3, 'It also says everything is 4:30 am even when I’m messaging her and it’s 9:35', 0, '2019-05-28 04:35:46', '2019-05-28 04:35:46', NULL),
(148, 4, 22, 'Test', 0, '2019-05-28 04:36:25', '2019-05-28 04:36:25', NULL),
(149, 4, 22, 'Okay now it works', 0, '2019-05-28 04:36:37', '2019-05-28 04:36:37', NULL),
(150, 1, 3, 'Okay now it works. Just said failed and then when I logged into hers it went through. But it has the wrong profile photo. Has my face to her profile but back in my profile it works well.', 0, '2019-05-28 04:38:26', '2019-05-28 04:38:26', NULL),
(151, 1, 6, 'Are you testing with her on one device?', 0, '2019-05-28 04:39:22', '2019-05-28 04:39:22', NULL),
(152, 1, 3, 'Yes. Maybe that’s the problem. Also says “Me said” instead of “I said” which is small fix later', 0, '2019-05-28 04:42:11', '2019-05-28 04:42:11', NULL),
(153, 1, 3, 'I’ll check on hers', 0, '2019-05-28 04:42:15', '2019-05-28 04:42:15', NULL),
(154, 1, 6, 'I am so confused \nCan you send doc for feedback on upwork?', 0, '2019-05-28 04:42:52', '2019-05-28 04:42:52', NULL),
(155, 1, 3, 'Yes! Will do. I know, confusing. I’ll write it out with screenshots. Thanks!', 0, '2019-05-28 04:43:31', '2019-05-28 04:43:31', NULL),
(156, 1, 6, 'Ok\nThank you ', 0, '2019-05-28 04:43:46', '2019-05-28 04:43:46', NULL),
(157, 4, 22, 'Hi how are you', 0, '2019-05-28 04:45:35', '2019-05-28 04:45:35', NULL),
(158, 4, 3, 'Hey check out my soundcloud', 0, '2019-05-28 04:47:56', '2019-05-28 04:47:56', NULL),
(159, 4, 22, 'What’s your link', 0, '2019-05-28 04:53:29', '2019-05-28 04:53:29', NULL),
(160, 1, 3, 'Sent!', 0, '2019-05-30 22:28:05', '2019-05-30 22:28:05', NULL),
(161, 5, 3, 'Thanks for hopping on board again. Still fixes to be made but close to where it was on new server', 0, '2019-05-31 21:25:01', '2019-05-31 21:25:01', NULL),
(162, 1, 6, 'I am uploading new build to App Store now ', 0, '2019-06-05 01:02:26', '2019-06-05 01:02:26', NULL),
(163, 1, 6, 'I have one question \n“Profile photo doesn’t save”\nIt means app doesn’t save your gmail photo?', 0, '2019-06-05 01:03:57', '2019-06-05 01:03:57', NULL),
(164, 1, 6, 'Do you receive my msg?', 0, '2019-06-05 01:05:52', '2019-06-05 01:05:52', NULL),
(165, 1, 3, 'Thank you. I’m thinking of shutting down AWS. It costs way way way too much for just my wife and I. We barely used it and it’s super expensive. Unless they made an error.', 0, '2019-06-05 01:19:29', '2019-06-05 01:19:29', NULL),
(166, 1, 3, 'Profile doesn’t save as in the photo when I push the menu button. I’ll see if it does now', 0, '2019-06-05 01:19:59', '2019-06-05 01:19:59', NULL),
(167, 1, 6, 'Did you try to change profile photo?', 0, '2019-06-05 01:22:22', '2019-06-05 01:22:22', NULL),
(168, 1, 6, 'How much cost for amazon?', 0, '2019-06-05 01:22:45', '2019-06-05 01:22:45', NULL),
(169, 1, 3, 'Now works. With just you my wife and I on it costs well over 100 dollars a month. Average is 30 a month or 20 a month it said. So at this point, I wouldn’t want more users if just three users cost 100 a month', 0, '2019-06-05 01:25:36', '2019-06-05 01:25:36', NULL),
(170, 1, 6, 'Ok I will think other cheap web hosting', 0, '2019-06-05 01:37:42', '2019-06-05 01:37:42', NULL),
(171, 1, 6, 'I have to fix scrolling of audio', 0, '2019-06-05 01:37:45', '2019-06-05 01:37:45', NULL),
(172, 1, 6, 'If you drop your payment from amazon, it will be closed automatically ', 0, '2019-06-05 01:38:55', '2019-06-05 01:38:55', NULL),
(173, 1, 6, 'Please give me access of amazon so I can fix the issue of scrolling of audio ', 0, '2019-06-05 01:39:39', '2019-06-05 01:39:39', NULL),
(174, 1, 3, 'Okay I think I sent one to you just now. Is your email still Elena.ionkina@hotmail', 0, '2019-06-05 01:54:17', '2019-06-05 01:54:17', NULL),
(175, 1, 6, 'Yes', 0, '2019-06-05 02:06:13', '2019-06-05 02:06:13', NULL),
(176, 1, 3, 'If you login, can you change the aws rds to the free tier? That’s what is costing so much is the rds data. Right now it’s the highest one. That is, if you can access through the email ', 0, '2019-06-05 02:15:49', '2019-06-05 02:15:49', NULL),
(177, 1, 6, 'I got it', 0, '2019-06-05 02:16:38', '2019-06-05 02:16:38', NULL),
(178, 4, 3, 'She fixed some things so hopefully better', 0, '2019-06-05 04:13:07', '2019-06-05 04:13:07', NULL),
(179, 1, 6, 'Hi', 0, '2019-06-06 00:56:17', '2019-06-06 00:56:17', NULL),
(180, 1, 6, 'I can’t access to amazon', 0, '2019-06-06 00:56:35', '2019-06-06 00:56:35', NULL),
(181, 1, 6, 'I created aws account before \nBut it was closed \nPlease give me account directly ', 0, '2019-06-06 00:57:30', '2019-06-06 00:57:30', NULL),
(182, 1, 6, 'Messenger is working now', 0, '2019-06-06 02:23:49', '2019-06-06 02:23:49', NULL),
(183, 1, 6, 'I was working on backend ', 0, '2019-06-06 02:24:04', '2019-06-06 02:24:04', NULL),
(184, 1, 6, 'Please reply here', 0, '2019-06-06 02:24:13', '2019-06-06 02:24:13', NULL),
(185, 1, 3, 'Hello', 0, '2019-06-06 02:25:02', '2019-06-06 02:25:02', NULL),
(186, 1, 3, 'Okay working', 0, '2019-06-06 02:25:07', '2019-06-06 02:25:07', NULL),
(187, 1, 6, 'Password?', 0, '2019-06-06 02:29:01', '2019-06-06 02:29:01', NULL),
(188, 1, 3, 'Onsunroad', 0, '2019-06-06 02:32:51', '2019-06-06 02:32:51', NULL),
(189, 1, 3, 'FirstAidArts2019', 0, '2019-06-06 02:33:02', '2019-06-06 02:33:02', NULL),
(190, 1, 6, 'Ok', 0, '2019-06-06 02:33:43', '2019-06-06 02:33:43', NULL),
(191, 1, 6, 'Ok', 0, '2019-06-06 02:34:11', '2019-06-06 02:34:11', NULL),
(192, 1, 6, 'I will upload new build now', 0, '2019-06-07 23:03:45', '2019-06-07 23:03:45', NULL),
(193, 1, 3, 'Thank you- it got rejected but I think it’s because the profile they test with doesn’t have any friends so the newsfeed is blank.', 0, '2019-06-08 19:43:40', '2019-06-08 19:43:40', NULL),
(194, 1, 6, 'I will add text\nWhen user didn’t post anything yet and there’s no friends yet, it will be blank.\nWhat should it say?\nCan you give me text?', 0, '2019-06-08 23:06:53', '2019-06-08 23:06:53', NULL),
(195, 1, 6, '“There is no news feed. Please have friends or post your article.”\nIs it ok?', 0, '2019-06-08 23:24:14', '2019-06-08 23:24:14', NULL),
(196, 1, 3, 'There is currently nothing in your newsfeed. Post an article or add friends to view!', 0, '2019-06-09 00:09:48', '2019-06-09 00:09:48', NULL),
(197, 1, 6, 'Ok', 0, '2019-06-09 00:10:33', '2019-06-09 00:10:33', NULL),
(198, 5, 3, 'How’s it going? Haven’t seen you in a while!', 0, '2019-06-09 21:11:44', '2019-06-09 21:11:44', NULL),
(199, 4, 3, 'Okay she updated so you can browse around', 0, '2019-06-10 03:03:33', '2019-06-10 03:03:33', NULL),
(200, 6, 3, 'Hi and thanks!', 0, '2019-06-10 23:54:08', '2019-06-10 23:54:08', NULL),
(201, 5, 14, 'Going ok, been sick with a cold for a while. Getting ready for an exhibit June 14-19 at the Langston Hughes Cultural Center in Seattle. I’ll be showing 3 pieces of my artwork. How have you been doing? ', 0, '2019-06-11 00:06:10', '2019-06-11 00:06:10', NULL),
(202, 5, 3, 'Wow that’s awesome! Yeah I think it was last week at the conference that Miss J said you were coming down with something. The weather has been so weird. Iris too had a cold a few days. I bought a piece today from value village! Lol you can see it on my newsfeed but there’s a site where you can appraise work for 19 dollars. It’s really cool! So I’m appraising it to see if I can resell', 0, '2019-06-11 00:12:41', '2019-06-11 00:12:41', NULL),
(203, 6, 25, '???? ', 0, '2019-06-11 00:22:47', '2019-06-11 00:22:47', NULL),
(204, 6, 3, 'Thanks for coming on!', 0, '2019-06-11 00:28:14', '2019-06-11 00:28:14', NULL),
(205, 6, 3, 'Let me know if you get these', 0, '2019-06-11 01:36:43', '2019-06-11 01:36:43', NULL),
(206, 6, 25, 'I downloaded the app again, now it seems to work ', 0, '2019-06-11 01:37:50', '2019-06-11 01:37:50', NULL),
(207, 6, 25, 'I got your messages now ', 0, '2019-06-11 01:38:02', '2019-06-11 01:38:02', NULL),
(208, 6, 3, 'Sorry! Thanks for doing that', 0, '2019-06-11 01:38:08', '2019-06-11 01:38:08', NULL),
(209, 6, 25, 'It’s fine! Hope sun road is going well!', 0, '2019-06-11 01:38:38', '2019-06-11 01:38:38', NULL),
(210, 6, 3, 'Always feels like one step forward and two steps back but slowly/surely!', 0, '2019-06-11 01:39:12', '2019-06-11 01:39:12', NULL),
(211, 6, 25, 'I’m sure that is how it goes, with anything in life.... ', 0, '2019-06-11 01:40:16', '2019-06-11 01:40:16', NULL),
(212, 6, 25, 'Can one post videos on here without YouTube or not yet? ', 0, '2019-06-11 01:40:35', '2019-06-11 01:40:35', NULL),
(213, 6, 3, 'Unfortunately not. All the money was spent in the server transfer so we can have more people. As for video- have to figure out how much space would be the maximum length. Hopefully soon. Next would be replying to comments, @ users, and forget password. ', 0, '2019-06-11 01:43:34', '2019-06-11 01:43:34', NULL),
(214, 8, 3, 'Hey Douglas! Thanks so much for the invite but unfortunately can’t make it as jenny’s teaching job is finishing up/schedule clash. Thank you again! Looks incredible!', 0, '2019-06-12 03:41:41', '2019-06-12 03:41:41', NULL),
(215, 5, 3, 'Good luck on the show tomorrow!', 0, '2019-06-13 20:40:14', '2019-06-13 20:40:14', NULL),
(216, 6, 3, 'Would you have a suggestion on how long a clip could be? We would have to keep in mind compressing the file so it doesn’t slow things down. Instagram I think is a minute. What is the video you want to share?', 0, '2019-06-13 20:44:30', '2019-06-13 20:44:30', NULL),
(217, 8, 27, 'No worries! I made a video for the organization that will be showing it that night. Once they show it I’ll make it public and post it here as well! ', 0, '2019-06-13 23:11:01', '2019-06-13 23:11:01', NULL),
(218, 6, 25, 'I think having a YouTube link is good for now as you set up the other stuff for this app. I think when our if you get around to putting in a video capabilities, no more than a minute. These days people want to see things but not for a very long time. I am starting to do more time lapses of my work, trying to get more involved so that when I share my work they can see the process. But I think I should set up a YouTube account. So the longer the video time capabilities the more money it would cost, right? I think your next steps for the app are good ones to work on, before this. ', 0, '2019-06-14 00:13:51', '2019-06-14 00:13:51', NULL),
(219, 6, 3, 'So valuable. Thanks for your insight! Time lapses are incredible. Do you use Instagram and Facebook for art? How do you personally think Sun Road can carve a niche? I’m really adaptable and I want to see what people really want. I know social media is saturated and a lot of these features are there but now that I have this minimized foundation, I want to really hear out the artists. Also, I’d love to interview you. I was going to make it all high tech and buy podcasting gear but maybe I’d start with written word and just get a weekly digital paper going. That would happen in July.', 0, '2019-06-14 00:18:40', '2019-06-14 00:18:40', NULL),
(220, 8, 3, 'Awesome! I’d love to interview you sometime if you don’t mind as well? I was thinking to get all high tech and do video and audio but I’ll just start with written word. Im thinking July but feature new artists and get insight about thoughts on culture. What are your plans after the original two years? Coming back to states?', 0, '2019-06-14 00:20:09', '2019-06-14 00:20:09', NULL),
(221, 6, 25, 'It\'s so hard to find a niche as there are so many things out there available. I love discussions about art, music, history of both topics, history in general and philosophy. I have a hard time finding anyone that likes to discuss topics ( even just for the sake of discussing). I have no idea how that can happen here. You have digs and comments. I think you put encouraging and inspirational quotes or statements. I have before the updated app put up a question to go alongside the work or quote I posted. Whether people engage with the question is the thing. I wish there was some way that questions would be a thing with posting so we can engage with the work. Almost like a requirement, but I don\'t think you can control that. Just saying \"it\'s nice work\" can be done in Instagram and Facebook. I think it\'s  to artists that get involved with this app. Hopefully they share the same vision. ', 0, '2019-06-14 00:27:28', '2019-06-14 00:27:28', NULL),
(222, 6, 25, 'I use Instagram and Facebook at the moment. I want to use patreon at some point once I can build more of a presence. ', 0, '2019-06-14 00:28:21', '2019-06-14 00:28:21', NULL),
(223, 6, 3, 'Okay awesome that’s really helpful. I think for me is that I hate Facebook, Instagram, patreon, Pinterest, and YouTubes monopoly on speech. They are beginning to demonetize, shadowban, and remove users they disagree with. They may call it hate speech, but one must define hate. It’s way too 1984 for my taste and I continue to study these cases overseas in Europe via their governments and the digital frontier that wields this giant sword of censorship. If one is an artist- they should HATE banning speech. But that’s the problem, the culture is hijacked in general. Pinterest just got caught by an inside employee putting a pro life groups organization under pornography censorship. It censored bible verses and Christian terminology and other certain “thought leaders” of that nature. It was a big question mark as to why Pinterest would censor things they disagreed with but then YouTube just deleted that video today. People get deplatformed on patreon and YouTube or demonetized as well more and more. The next six months will be big I think. Anyways, the culture you speak of discussing ideas would have to do with culture. Popular culture is not on the side of discussing ideas. They are on the side of banning those that they disagree with. Side note- id say nice photo only now because it’s essentially beta and I’m just testing that it works! And the reply function obviously needs to be there. I think artists in general are too scared to speak ideas. It would be wonderful to have a space where people are encouraged to speak ideas as artists and for there to be no immense backlash or doxing of people. Sorry this is everywhere but in America right now things are crazy. I see big tech and pop culture being bullies and it’s time to see true artists with ideas rather than propaganda to rise. Renaissance! Just an awakening of minds to engage once more in ideas!', 0, '2019-06-14 00:48:12', '2019-06-14 00:48:12', NULL),
(224, 6, 25, 'Wow that\'s not good about all those platforms. I would discuss more now but I need to get on with my day, but can wrote later. ', 0, '2019-06-14 00:51:24', '2019-06-14 00:51:24', NULL),
(225, 6, 25, 'Write *', 0, '2019-06-14 00:51:37', '2019-06-14 00:51:37', NULL),
(226, 6, 3, 'Yeah no worries! I’ve been studying closely! It’s pretty shocking but even discussing those ideas of censorship is something I don’t want to do. Like 1984 people get suspicious. Have a great day!', 0, '2019-06-14 00:52:40', '2019-06-14 00:52:40', NULL),
(227, 6, 25, 'Wow.... The times we live in....', 0, '2019-06-14 00:54:08', '2019-06-14 00:54:08', NULL),
(228, 6, 3, 'Yeah there’s a lot of danger because civilization wasn’t created for anonymous posting or hiding behind a computer and saying things one wouldn’t say in front of another in conversation. Anyways, what I’m thinking about as I adapt and grow Sun Road would be to start doing interviews, podcasts, video tutorials as well as history, business, and other teachings. I am talking to the city I live in about a building where I would pair the physical with digital and then take that blue print to a bunch of cities worldwide. I think where sun road would differ would be to allow free speech, to hire artists personally within the company, to feature and spotlight new artists, and change culture simply by talking. I went to art school and have hung out with artists here in Seattle and no one has differing opinions. How can creative people all think the same! And then from that, start changing minds and build all the other things I want to do. Right now with the building, we would divide it in three different major categories. Anyways going too long! ', 0, '2019-06-14 02:53:26', '2019-06-14 02:53:26', NULL),
(229, 8, 27, 'That would be grand!! We are in NZ until August. Then Thailand again for another 2 months and then over to Israel for some months. Then God willing Germany. We will be home for Christmas then back at it again! God is forming and shaping this, and we take each day as I is. ', 0, '2019-06-15 22:35:32', '2019-06-15 22:35:32', NULL),
(230, 8, 3, 'Man I would love to team up some way. Right now not sure in what- whether that be in footage or photos or you interviewing unique artists around the world? I just know you have a entrepreneurial spirit and the balls to go out and do it! I don’t find anyone like you over here. ', 0, '2019-06-15 23:33:43', '2019-06-15 23:33:43', NULL),
(231, 8, 3, 'Man that would be terrific! Because what I envision is a ton of things I can’t even begin to write out fully. Includes travel, changing the world, coffee farms, orphanages - just tons beyond social media and culture. But what if you were a host for the sun road videos? Maybe like 5 minute features from cultures around the world? That’s what I’d envision but art in the us and culture in general is hijacked and boring. Since you’re already floating around the world- you could do those quick segments and get sun road attention. Then for monetizing we can figure out a way for you to get paid. I don’t know think about it! It would essentially be- hey it’s Douglas host of sun road art! Today we are interviewing this guest from Israel and his art. Boom done. Same in Thailand. Same in Germany. We seek out interesting artists and shine a light on them.', 0, '2019-06-15 23:40:49', '2019-06-15 23:40:49', NULL),
(232, 5, 14, 'It went well. Made a lot of new contacts....', 0, '2019-06-16 00:57:30', '2019-06-16 00:57:30', NULL),
(233, 5, 3, 'That’s great!', 0, '2019-06-16 03:06:52', '2019-06-16 03:06:52', NULL),
(234, 6, 3, 'Well, without going into detail what would you think of a tck app that connects tcks? I believe artists may be too fearful. When I think of artists or companies- artists are companies. They represent themselves as self brands. If I can’t get “friends” to sign up and talk, I don’t think I can get others to join in. I’m adaptable and am exploring other routes. Just as Instagram started as a yelp type service, or many other companies started as something completely different- I’m looking at other options. Of course I’m still looking at the 5000 square foot venue which may pair well with the app for artists. It would be a blueprint from places around the world in culture and city life. But I have to ask what I set out to do vs where I’m at now. \n\nThoughts? Would tcks like their own app?', 0, '2019-06-19 23:44:22', '2019-06-19 23:44:22', NULL),
(235, 6, 25, 'Have you seen if there are already apps for TCKs? Or sounds interesting. I know there are TCK Facebook groups, so how would the app function as? Lots of forums? Which is fine, just wondering. And how would you make sure it\'s just TCKs in the group? TCKs are very diverse, the dialogue would be fascinating because of that and TCKs tend to not like staying shallow. ', 0, '2019-06-19 23:48:45', '2019-06-19 23:48:45', NULL),
(236, 6, 25, 'It* not or ', 0, '2019-06-19 23:49:02', '2019-06-19 23:49:02', NULL),
(237, 6, 3, 'Haven’t done a lot of digging around. I know there are groups but they don’t seem to be run well. I’m just searching the market and looking at my background. I’ve always been an outsider but I have been reading so much and know this app will be huge no matter what it is. I don’t want to force people to use something that I would find helpful. I know my own story and that I struggled for a decade after Japan to be connected as an artist and as a person. If tcks are like me then maybe they would want an app dedicated to them and maybe that’s where the deeper conversations come. ', 0, '2019-06-20 00:04:19', '2019-06-20 00:04:19', NULL),
(238, 6, 25, 'Yeah I totally understand that sentiment. In some ways we are far advanced when we get out on our own, as TCKS, but in other ways we have not advanced, because of all the constant wave after wave of change and good byes. To this day I realize that. Not always a happy thought. Feeling on the outside is definitely something I have felt too. Not only amI a TCK, I\'m also an Artist. Two very outsider like personas. ', 0, '2019-06-20 00:48:33', '2019-06-20 00:48:33', NULL),
(239, 6, 3, 'Yes! I wrote a memoir on it called monument on Lenora avenue but also another short story called the artist and cathedral. In that, I’m on the outside of both the faith and the arts. I’m Christian but that puts me outside as an artist because of a lot of churches definition of art and lack of care into culture. Then I’m on the outside as an artist because I’m so bored with their thoughts because I once was like them or ran in their circles but am no longer there. I’m on the outside as a tck. But outside can be a good way to look and evaluate life. We have to learn how to use that. It feels like a curse but we have to find the gift ', 0, '2019-06-20 01:10:50', '2019-06-20 01:10:50', NULL),
(240, 6, 25, 'Yes, I agree. Whether people listen or not is not up to us. ', 0, '2019-06-20 01:16:08', '2019-06-20 01:16:08', NULL),
(241, 6, 25, 'Is this idea for TCKs another app as you still pursue SunRoad, or what is happening with SunRoad?', 0, '2019-06-20 01:16:45', '2019-06-20 01:16:45', NULL),
(242, 6, 3, 'I have over 20 grand put into this so I wouldn’t just trash it- id rebrand depending on the desire. It really is hard being an outsider but maybe there’s a way to tap into the outsiders all around the world. I don’t know. I’m just thinking out loud and you’re the only one on the app who knows. Haha it could pair with a physical location- concerts, galleries, etc and be a place to gain revenue for the app and marketing power. Or it could become a tck app and I could change name and branding. Have to be flexible with ideas and test the market. I’m an idealist so thought I could change the art culture but I don’t think it wants change. It wants to keep its brand and that will make unique ideas a taboo.', 0, '2019-06-20 01:24:43', '2019-06-20 01:24:43', NULL),
(243, 6, 25, 'People want to be accepted but if you look at history, artists are outsiders, which, with their observational skills (if they are fine art artists) and musicians, etc. Usually it was interpreting what is going on around them, making bold statements (not readily accepted) or were ahead of their time (Van Gogh as a example. So may be the case with these ideas that you are coming up with. They are good and an app and physics\n locations of galleries and concerts would be cool ideas to discuss through. I think what is difficult is that for physical location ideas, it would have to be what you build in your community that you live in, unless you can \"your\" the idea and travel. With just an app, it can be global. TCKs are all over. I see TCK at galleries online but it\'s not popular. What about virtual, video recorded videos of artists studio and art gallery straight from their homes. So everyone walks around with the artist (virtually) and hear from the artist themselves (as an option). My thoughts are all over the place. Another thought : TCKs struggle with voice because we didn\'t have a voice growing up, or many didn\'t, always depends on the perspective. So how can our voices get heard beyond friend and family and why is that important to have happen. I am not in a community that would be good for art, and it\'s hard. I\'m all over the place in this message I think. ', 0, '2019-06-20 01:38:37', '2019-06-20 01:38:37', NULL),
(244, 6, 25, '\"Tour\" not \"your\"', 0, '2019-06-20 01:39:16', '2019-06-20 01:39:16', NULL),
(245, 6, 3, 'Those are great ideas. I love it. The more I think about artists in general- the more I talk to them and gather information and their overall vibe, I realize that I’m an outsider amongst outsiders. ???? so I don’t feel comfortable saying things to them because I know they could not handle ideas but I can easily be around them and internally disagree with them. But that is the grip of culture. Artists are the few professions where there’s no separation between them and their ideas. So even “friends” are hard to convince just to test the app. They can easily voice their “ideas” on major platforms because those “ideas” are mainstream. They don’t face any backlash. They are just what everyone else on there are saying and it’s this echo chamber of same ideas. That’s what it’s like living in Seattle. It’s what it’s like at art schools or just amongst friends. We all want to belong but at the cost of originality. An artist- why would anyone want a contrary idea? The mainstream will squash you. Look at Kanye. What’s the most controversial thing one can do? It’s not doing anything crazy, it’s wearing a red hat. And what did they do? They crucified him for being someone with an opposing opinion. \n\nSo for me to change the self branding the self marketing that is “art” today- I’m not sure it will work because people don’t even know how to separate ideas from people and just analyze an idea. Everyone is too eager to then bully others into submission and it’s a crazy age really of Orwell esque behavior. I’m no conspiracy theorist but I am intrigued by culture in general. I just thought of TCKs yesterday because maybe there are more like us who want genuine conversation without the fear of immediate consequence or public shaming. Maybe there are outsiders like us everywhere who are struggling- who would like to just have a separate digital space to meet other people who may be different in perspective to the masses.', 0, '2019-06-20 02:16:19', '2019-06-20 02:16:19', NULL),
(246, 6, 25, 'Yes to that. Outsiders. Outside looking in. It\'s so true. No one studies history to see what the purpose of art was. It\'s why it\'s considered so much among the masses as a hobby. Really seems like Orwell world out here....it\'s scary times. We aren\'t trained to look at an idea without connecting that idea to the person who said it. Even in the Christian world it is hard to share other lingo for ideas to discuss.\nYou are an outsider of the outsiders, but more than likely you are the real outsider, others are in denial. \nI know my art doesn\'t make all the statements I feel like saying, it feels so personal. I haven\'t shared much either. I need to do better about that, but also, what\'s the point. There is one, just gotta have a good reason. \nThere seems to really be a bully presence in the world that snuffs out ideas that are not mainstream. If you made an app for outsiders and our ideas, how would that be able to be kept from whatever it whomever is that presence....', 0, '2019-06-20 02:43:03', '2019-06-20 02:43:03', NULL),
(247, 6, 3, 'Wow great question. Yeah it’s a real catch 22. Put out ideas but then people can just harass and attack those ideas. It’s really, really foolish but people don’t know how foolish it is to shut down ideas. Then on the other hand if ideas aren’t discussed, then we have this culture. It’s like knowing your teacher and just saying stuff that you know will get a good grade. I think tcks desire authenticity because we don’t have time to deal with all the small talk of life. I have a really hard time here. We go to church but have no community. Everything feels fake, and yes, I can do that too. I can adapt myself in a fake culture but I’m in no way myself. I’m just the chameleon who is there for the sake of being there. Once I speak ideas then I find myself alone because no one wants to hear that. \n\nYou’ve given me a lot to think about. I have to research the market for a tck app. We are artists but even amongst artists we don’t really belong. I wonder if we would feel at home just around people who can just be themselves.', 0, '2019-06-20 04:00:08', '2019-06-20 04:00:08', NULL),
(248, 6, 25, 'That\'s probably how you can explain how non tcks in different cultures, if they go to university elsewhere, and meet others from their home country, they band together because they can feel the most themselves. It\'s hard to understand that because we are so diverse within the TCK group. Im in an international Bible study but it\'s still not the same. We leave and all go spend time outside of church with their own family\'s and friends from their country, usually, but it\'s still nice to be around diversity. I just feel on the outside anyways.\nI am a chameleon too. It sometimes feels like the same jargon with TCKs, but it\'s good to feel connected. But online connection is still lacking something. I am myself around my close friends (Which aren\'t a lot) and that is fine. But most of my close friends aren\'t near me now so my comfortable, be myself community is too spread out. \nOne of my earliest memories is of an event where I am watching from a window of children playing but not there participating.... And that can really be one of the big threads throughout my life, to this day....even with family and friends. But I\'m participating in my own life, not winning but surviving, one day though. \nPersonally I have a hard time letting my voice heard because if I do say something and no one responds, I grapple with what I say. It\'s a part of my social anxiety. I have a tripod for time lapses but have been thinking of how to use it otherwise, and it would mean me having to talk maybe, like doing live stream or something, but that makes me nervous. Anyways I\'m babbling. \nI\'m in a TCK art group, and most of the time people share their struggles. So many have been through horrific things but feel safe to share and feel encouraged by those in the group. I wonder what an app would do differently than just having a secret or closed Facebook group page. Meet ups online, like a conference call?', 0, '2019-06-20 05:00:05', '2019-06-20 05:00:05', NULL),
(249, 6, 3, 'I think the main thing would be an app dedicated for the one thing. It’s specialized. It’s set apart. I mean, one can find a job on Craigslist but there are job specific sites. One could buy their hair product at Walmart next to the tires, but some go to specialty stores who specialize in that one thing. The main thing from a business point of view would be how to monetize it. Would people be willing to buy in to an app? Some people spend 50 bucks on a haircut. Others spend 10. Are there those out there that believe a group of outsiders are worth investing in because the dollar amount is not matched? It could be- where are you from and where are you now. People could search by origin country to find those who have similar experiences. What books are they reading? How are they coping? What universities offer the best programs? Maybe outsiders are better at finding each other and starting businesses together rather than always trying to fit in? Maybe that deeper connection is like a hidden trust or bond that they don’t have anywhere else? Maybe Sun Road is that trusted brand that the outsiders go to because it’s not just a side branch of a mega company. Would it be cool to have an international tck club at college? Or would it be cooler if that college was FOR tcks especially?\n\nWhat I can’t do is force people to think or post thoughts. What I can do is perhaps gather a group of people who tend to have deeper thoughts and deeper connection. \n\nYou’ve given me a lot to think about. My problem is with my surroundings. Maybe it’s the tck in me that will forever be an outsider. I just need a group of people who are passionate, who understand, and are committed. It’s hard to go deep in a shallow pond. These ideas excite me though.', 0, '2019-06-21 23:01:29', '2019-06-21 23:01:29', NULL),
(250, 6, 25, 'I wish I could also be surrounded by people like that as well. I know a few but they are so busy with their own lives and it\'s hard to meet up, but it\'s not a surrounding.\nA college specifically for TCKS, not some measly club. That would be my answer. Been there, done that with the club. wasnt horrible, wasnt great, but it wasn\'t a TCK group but an international one. But we had a few times where it was just TCKs gathering and we really enjoyed the time and felt comfortable  and relaxed, and didn\'t have to explain our background to each other because that was not important for identity but great to hear for the stories and the life experiences, though different was also similar. But it didn\'t become a regular thing. \nIt may be hard to find the group of deep thinkers that would surround you, but they are out there. \nI could go on this whole example story with the history of Switzerland and how that country came about back in 1291. (I will try to make it short) It was a musketeer like motto. One for all and all for one (the all being the cantons -- what you would call a prefecture or state) there was always fighting in that area and three cantons came together and agreed with protecting and aiding each other  in case of invasion,  so if one got attacked by neighboring areas the other two cantons would go in aide of that Canton (standing up for the beliefs that they put in for their system) as years went by other cantons wanted in to the \"one for all and all for one \" country motto and it grew until the 1850\'s when the last Canton joined in. (Some of these cantons that joined had been what would be France, Italy, Germany or Austria at the time (or whatever was their respective names at that time)... \nI say this that this idea of yours may start small, but you find the few and help each other out in whatever way that looks like, and hopefully others of deep thinking, want to be a part of these ideas and join in to this Sun Road. \nI like bringing up history a lot, it\'s a fascinating big story to look at. And I am, of course, partial to Switzerland\'s history ????. ', 0, '2019-06-22 11:57:48', '2019-06-22 11:57:48', NULL),
(251, 6, 3, 'I will message back soon!', 0, '2019-06-24 17:53:21', '2019-06-24 17:53:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2014_10_12_100000_create_settings_table', 1),
(3, '2014_10_28_175635_create_threads_table', 1),
(4, '2014_10_28_175710_create_messages_table', 1),
(5, '2014_10_28_180224_create_participants_table', 1),
(6, '2014_11_03_154831_add_soft_deletes_to_participants_table', 1),
(7, '2014_11_10_083449_add_nullable_to_last_read_in_participants_table', 1),
(8, '2014_11_20_131739_alter_last_read_in_participants_table', 1),
(9, '2014_12_04_124531_add_softdeletes_to_threads_table', 1),
(10, '2016_05_11_102459_create_categories_table', 1),
(11, '2016_05_11_102459_create_followers_table', 1),
(12, '2016_05_11_102459_create_group_user_table', 1),
(13, '2016_05_11_102459_create_groups_table', 1),
(14, '2016_05_11_102459_create_languages_table', 1),
(15, '2016_05_11_102459_create_media_table', 1),
(16, '2016_05_11_102459_create_page_likes_table', 1),
(17, '2016_05_11_102459_create_page_user_table', 1),
(18, '2016_05_11_102459_create_pages_table', 1),
(19, '2016_05_11_102459_create_post_follows_table', 1),
(20, '2016_05_11_102459_create_post_likes_table', 1),
(21, '2016_05_11_102459_create_post_media_table', 1),
(22, '2016_05_11_102459_create_post_shares_table', 1),
(23, '2016_05_11_102459_create_posts_table', 1),
(24, '2016_05_11_102459_create_timelines_table', 1),
(25, '2016_05_11_102459_create_user_settings_table', 1),
(26, '2016_05_11_102459_create_users_table', 1),
(27, '2016_05_11_102460_create_timeline_reports_table', 1),
(28, '2016_05_11_102500_create_announcement_user_table', 1),
(29, '2016_05_11_102500_create_announcements_table', 1),
(30, '2016_05_11_102500_create_comment_likes_table', 1),
(31, '2016_05_11_102500_create_comments_table', 1),
(32, '2016_05_11_102500_create_hashtags_table', 1),
(33, '2016_05_11_102500_create_notifications_table', 1),
(34, '2016_05_11_102500_create_post_reports_table', 1),
(35, '2016_07_08_170940_create_post_tags_table', 1),
(36, '2016_08_01_123157_entrust_setup_tables', 1),
(37, '2016_08_02_123157_create_foreign_keys', 1),
(38, '2016_08_03_103604_create_static_pages_table', 1),
(39, '2016_08_28_194209_alter_users', 1),
(40, '2016_08_31_174439_insert_settings', 1),
(41, '2016_09_04_022020_database_update_one_dot_two', 1),
(42, '2016_09_05_224813_database_update_one_dot_three', 1),
(43, '2016_10_24_070240_database_update_one_dot_four', 1),
(44, '2016_11_12_064152_database_update_two_dot_one', 1),
(45, '2017_02_26_074925_create_sessions_table', 1),
(46, '2017_03_01_135034_database_update_two_dot_two', 1),
(47, '2017_05_18_035912_create_wallpapers', 1),
(48, '2017_05_18_051905_database_update_three', 1),
(49, '2017_05_25_085951_alter_messages_table', 1),
(50, '2017_07_10_114459_create_saved_timelines_table', 1),
(51, '2017_07_10_124410_create_saved_posts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `msg_request`
--

CREATE TABLE `msg_request` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `isnew` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `msg_request`
--

INSERT INTO `msg_request` (`id`, `sender_id`, `receiver_id`, `state`, `isnew`, `created_at`, `updated_at`) VALUES
(1, 3, 6, 1, 0, '2019-05-14 01:25:50', '2019-06-09 00:10:34'),
(4, 17, 3, 1, 1, '2019-05-21 23:04:15', '2019-05-21 23:07:55'),
(5, 20, 6, 1, 0, '2019-05-26 17:27:54', '2019-05-26 20:59:04'),
(8, 22, 3, 1, 0, '2019-05-28 04:30:55', '2019-05-28 04:53:29'),
(9, 6, 21, 0, 1, '2019-05-29 04:33:44', '2019-05-29 04:33:44'),
(10, 3, 14, 1, 0, '2019-05-31 20:45:28', '2019-06-16 03:06:54'),
(11, 8, 10, 0, 1, '2019-06-08 17:57:33', '2019-06-08 17:57:33'),
(12, 3, 25, 1, 0, '2019-06-10 22:49:07', '2019-06-24 17:53:23'),
(13, 3, 23, 1, 0, '2019-06-11 04:33:00', '2019-06-11 15:37:23'),
(14, 3, 27, 1, 0, '2019-06-11 16:20:22', '2019-06-16 03:07:51'),
(15, 3, 15, 0, 1, '2019-06-13 20:43:19', '2019-06-13 20:43:19');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED DEFAULT NULL,
  `timeline_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `notified_by` int(10) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `post_id`, `timeline_id`, `user_id`, `notified_by`, `seen`, `description`, `type`, `link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 2, NULL, 6, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-05-12 15:48:55', '2019-05-12 15:48:55', NULL),
(7, 2, NULL, 6, 3, 0, 'Jesse McDaniel gave their 2 cents on your posts.', 'comment_post', NULL, '2019-05-14 01:26:06', '2019-05-14 01:26:06', NULL),
(9, 2, NULL, 6, 3, 0, 'Jesse McDaniel gave their 2 cents on your posts.', 'comment_post', NULL, '2019-05-14 18:32:08', '2019-05-14 18:32:08', NULL),
(11, 4, NULL, 17, 3, 1, 'Jesse McDaniel gave their 2 cents on your posts.', 'comment_post', NULL, '2019-05-21 23:11:10', '2019-05-21 23:11:10', NULL),
(13, 4, NULL, 17, 3, 1, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-05-22 18:05:06', '2019-05-22 18:05:06', NULL),
(14, 16, NULL, 6, 3, 0, 'Jesse McDaniel gave their 2 cents on your posts.', 'comment_post', NULL, '2019-05-28 04:20:37', '2019-05-28 04:20:37', NULL),
(15, 16, NULL, 6, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-05-28 04:22:06', '2019-05-28 04:22:06', NULL),
(19, 18, NULL, 22, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-05-28 04:40:14', '2019-05-28 04:40:14', NULL),
(20, 24, NULL, 22, 3, 1, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-05-28 05:24:42', '2019-05-28 05:24:42', NULL),
(21, 23, NULL, 22, 3, 1, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-05-28 05:24:46', '2019-05-28 05:24:46', NULL),
(22, 21, NULL, 22, 3, 1, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-05-28 05:24:49', '2019-05-28 05:24:49', NULL),
(23, 20, NULL, 22, 3, 1, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-05-28 05:24:52', '2019-05-28 05:24:52', NULL),
(24, 19, NULL, 22, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-05-28 05:24:56', '2019-05-28 05:24:56', NULL),
(25, 19, NULL, 22, 3, 0, 'Jesse McDaniel gave their 2 cents on your posts.', 'comment_post', NULL, '2019-05-28 05:25:04', '2019-05-28 05:25:04', NULL),
(26, 2, NULL, 6, 20, 0, 'Andreas Braun gave their 2 cents on your posts.', 'comment_post', NULL, '2019-05-28 05:54:56', '2019-05-28 05:54:56', NULL),
(27, 16, NULL, 6, 20, 0, 'Andreas Braun gave their 2 cents on your posts.', 'comment_post', NULL, '2019-05-28 05:57:56', '2019-05-28 05:57:56', NULL),
(28, 16, NULL, 6, 20, 0, 'Andreas Braun  dug your post', 'dug', NULL, '2019-05-28 05:59:25', '2019-05-28 05:59:25', NULL),
(29, 16, NULL, 6, 20, 0, 'Andreas Braun gave their 2 cents on your posts.', 'comment_post', NULL, '2019-05-29 03:04:44', '2019-05-29 03:04:44', NULL),
(30, 16, NULL, 6, 20, 0, 'Andreas Braun gave their 2 cents on your posts.', 'comment_post', NULL, '2019-05-29 03:10:34', '2019-05-29 03:10:34', NULL),
(31, 3, NULL, 3, 22, 0, 'Jenny McDaniel  dug your post', 'dug', NULL, '2019-06-02 03:42:10', '2019-06-02 03:42:10', NULL),
(32, 7, NULL, 3, 22, 0, 'Jenny McDaniel  dug your post', 'dug', NULL, '2019-06-02 03:42:16', '2019-06-02 03:42:16', NULL),
(33, 8, NULL, 3, 22, 0, 'Jenny McDaniel  dug your post', 'dug', NULL, '2019-06-02 03:42:21', '2019-06-02 03:42:21', NULL),
(34, 17, NULL, 3, 22, 0, 'Jenny McDaniel  dug your post', 'dug', NULL, '2019-06-02 03:42:33', '2019-06-02 03:42:33', NULL),
(35, 25, NULL, 3, 22, 0, 'Jenny McDaniel  dug your post', 'dug', NULL, '2019-06-02 03:42:37', '2019-06-02 03:42:37', NULL),
(36, 27, NULL, 3, 22, 0, 'Jenny McDaniel  dug your post', 'dug', NULL, '2019-06-02 03:42:50', '2019-06-02 03:42:50', NULL),
(37, 27, NULL, 3, 22, 0, 'Jenny McDaniel gave their 2 cents on your posts.', 'comment_post', NULL, '2019-06-02 03:43:07', '2019-06-02 03:43:07', NULL),
(38, 30, NULL, 22, 3, 1, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-02 05:27:23', '2019-06-02 05:27:23', NULL),
(39, 29, NULL, 22, 3, 1, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-02 05:27:26', '2019-06-02 05:27:26', NULL),
(40, 28, NULL, 22, 3, 1, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-02 05:27:30', '2019-06-02 05:27:30', NULL),
(42, 33, NULL, 6, 3, 0, 'Jesse McDaniel gave their 2 cents on your post.', 'comment_post', NULL, '2019-06-05 01:22:45', '2019-06-05 01:22:45', NULL),
(43, 33, NULL, 6, 3, 0, 'Jesse McDaniel gave their 2 cents on your post.', 'comment_post', NULL, '2019-06-06 01:48:25', '2019-06-06 01:48:25', NULL),
(44, 36, NULL, 6, 3, 0, 'Jesse McDaniel gave their 2 cents on your post.', 'comment_post', NULL, '2019-06-07 04:33:31', '2019-06-07 04:33:31', NULL),
(45, 37, NULL, 6, 3, 0, 'Jesse McDaniel gave their 2 cents on your post.', 'comment_post', NULL, '2019-06-07 22:34:34', '2019-06-07 22:34:34', NULL),
(46, 36, NULL, 6, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-07 22:35:01', '2019-06-07 22:35:01', NULL),
(47, 38, NULL, 6, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-09 19:16:42', '2019-06-09 19:16:42', NULL),
(48, 42, NULL, 24, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-10 19:57:50', '2019-06-10 19:57:50', NULL),
(49, 48, NULL, 14, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-11 00:41:20', '2019-06-11 00:41:20', NULL),
(50, 47, NULL, 14, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-11 00:41:33', '2019-06-11 00:41:33', NULL),
(51, 46, NULL, 14, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-11 00:42:02', '2019-06-11 00:42:02', NULL),
(52, 45, NULL, 14, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-11 00:42:31', '2019-06-11 00:42:31', NULL),
(53, 44, NULL, 14, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-11 00:42:35', '2019-06-11 00:42:35', NULL),
(54, 48, NULL, 14, 25, 0, 'Hannah   dug your post', 'dug', NULL, '2019-06-11 01:38:54', '2019-06-11 01:38:54', NULL),
(55, 41, NULL, 3, 25, 0, 'Hannah   dug your post', 'dug', NULL, '2019-06-11 01:39:26', '2019-06-11 01:39:26', NULL),
(56, 43, NULL, 3, 14, 0, 'Mr.T gave their 2 cents on your post.', 'comment_post', NULL, '2019-06-11 01:45:14', '2019-06-11 01:45:14', NULL),
(57, 49, NULL, 24, 3, 1, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-11 02:00:19', '2019-06-11 02:00:19', NULL),
(58, 48, NULL, 14, 3, 0, 'Jesse McDaniel gave their 2 cents on your post.', 'comment_post', NULL, '2019-06-11 02:01:19', '2019-06-11 02:01:19', NULL),
(59, 50, NULL, 27, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-11 15:37:51', '2019-06-11 15:37:51', NULL),
(60, 50, NULL, 27, 3, 0, 'Jesse McDaniel gave their 2 cents on your post.', 'comment_post', NULL, '2019-06-12 16:55:46', '2019-06-12 16:55:46', NULL),
(61, 54, NULL, 28, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-13 04:06:42', '2019-06-13 04:06:42', NULL),
(62, 53, NULL, 28, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-13 04:06:45', '2019-06-13 04:06:45', NULL),
(63, 52, NULL, 28, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-13 04:06:49', '2019-06-13 04:06:49', NULL),
(64, 51, NULL, 28, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-13 04:06:52', '2019-06-13 04:06:52', NULL),
(65, 41, NULL, 3, 27, 0, 'Douglas  dug your post', 'dug', NULL, '2019-06-13 23:11:51', '2019-06-13 23:11:51', NULL),
(66, 43, NULL, 3, 27, 0, 'Douglas  dug your post', 'dug', NULL, '2019-06-13 23:11:53', '2019-06-13 23:11:53', NULL),
(67, 55, NULL, 3, 27, 0, 'Douglas  dug your post', 'dug', NULL, '2019-06-15 22:35:57', '2019-06-15 22:35:57', NULL),
(68, 56, NULL, 27, 3, 0, 'Jesse McDaniel  dug your post', 'dug', NULL, '2019-06-15 23:20:03', '2019-06-15 23:20:03', NULL),
(69, 56, NULL, 27, 3, 0, 'Jesse McDaniel gave their 2 cents on your post.', 'comment_post', NULL, '2019-06-15 23:32:20', '2019-06-15 23:32:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `timeline_id` int(10) UNSIGNED NOT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` int(10) UNSIGNED NOT NULL,
  `message_privacy` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `member_privacy` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timeline_post_privacy` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_likes`
--

CREATE TABLE `page_likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_user`
--

CREATE TABLE `page_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_read` timestamp NULL DEFAULT NULL,
  `block` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `thread_id`, `user_id`, `last_read`, `block`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, '2019-06-09 00:10:34', 0, '2019-05-14 02:51:32', '2019-06-09 00:10:34', NULL),
(2, 1, 6, '2019-06-25 00:50:27', 0, '2019-05-14 02:51:32', '2019-06-25 00:50:27', NULL),
(3, 2, 17, '2019-05-21 23:07:55', 0, '2019-05-21 23:07:55', '2019-05-21 23:07:55', NULL),
(4, 2, 3, '2019-05-21 23:08:29', 0, '2019-05-21 23:07:55', '2019-05-21 23:08:29', NULL),
(5, 3, 20, '2019-05-26 20:59:04', 1, '2019-05-26 17:28:09', '2019-05-26 20:59:04', NULL),
(6, 3, 6, '2019-05-26 20:59:06', 1, '2019-05-26 17:28:09', '2019-05-26 21:48:22', NULL),
(7, 4, 22, '2019-05-28 04:53:29', 0, '2019-05-28 04:32:38', '2019-05-28 04:53:29', NULL),
(8, 4, 3, '2019-06-10 03:03:34', 0, '2019-05-28 04:32:38', '2019-06-10 03:03:34', NULL),
(9, 5, 3, '2019-06-16 03:06:54', 0, '2019-05-31 20:46:55', '2019-06-16 03:06:54', NULL),
(10, 5, 14, '2019-06-23 04:30:30', 0, '2019-05-31 20:46:55', '2019-06-23 04:30:30', NULL),
(11, 6, 3, '2019-06-24 17:53:23', 0, '2019-06-10 22:54:57', '2019-06-24 17:53:23', NULL),
(12, 6, 25, '2019-06-24 22:00:42', 0, '2019-06-10 22:54:57', '2019-06-24 22:00:42', NULL),
(13, 7, 3, '2019-06-11 15:37:23', 0, '2019-06-11 04:44:06', '2019-06-11 15:37:23', NULL),
(14, 7, 23, '2019-06-11 04:44:06', 0, '2019-06-11 04:44:06', '2019-06-11 04:44:06', NULL),
(15, 8, 3, '2019-06-16 03:07:51', 0, '2019-06-12 03:28:16', '2019-06-16 03:07:51', NULL),
(16, 8, 27, '2019-06-15 22:35:34', 0, '2019-06-12 03:28:16', '2019-06-15 22:35:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('jes.mcdaniel@gmail.com', '$2y$10$5fS3Y1tHm7PDYCTj3rZyuO0F99OrXHv1nA4GyKocwxUk3yOuIyuBa', '2019-05-16 17:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `youtubeURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photoURL` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `photo_width` int(11) DEFAULT NULL,
  `photo_height` int(11) DEFAULT NULL,
  `bandcamURL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hide` tinyint(4) DEFAULT '0',
  `isnew` tinyint(1) NOT NULL DEFAULT '1',
  `audioURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `timeline_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `soundcloud_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soundcloud_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube_video_id` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `shared_post_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `content`, `title`, `youtubeURL`, `photoURL`, `photo_width`, `photo_height`, `bandcamURL`, `hide`, `isnew`, `audioURL`, `description`, `timeline_id`, `user_id`, `active`, `soundcloud_title`, `soundcloud_id`, `youtube_video_id`, `location`, `type`, `created_at`, `updated_at`, `deleted_at`, `shared_post_id`) VALUES
(2, 'Photo story', '', NULL, '1557666065_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 6, 1, NULL, NULL, NULL, NULL, 0, '2019-05-12 14:01:07', '2019-05-12 14:01:07', NULL, NULL),
(3, 'At @Terence Smiths art show where he took first place. Seattle WA', '', NULL, '1558228650_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 3, 1, NULL, NULL, NULL, NULL, 0, '2019-05-19 01:17:30', '2019-05-19 01:17:30', NULL, NULL),
(4, 'Testing audio', '', NULL, NULL, NULL, NULL, NULL, 0, 1, '2019-05-21-23-06-44audio.mp3', '', 1, 17, 1, NULL, NULL, NULL, NULL, 1, '2019-05-21 23:06:44', '2019-05-21 23:06:44', NULL, NULL),
(7, 'Test', '', NULL, '1558548055_image.jpg', NULL, NULL, 'https://jesselmcdaniel.wordpress.com/', 0, 1, NULL, '', 1, 3, 1, NULL, NULL, NULL, NULL, 3, '2019-05-22 18:00:55', '2019-05-22 18:00:55', NULL, NULL),
(8, 'Producer and Songwriter', '', '8GllmsEYZhk', NULL, NULL, NULL, NULL, 0, 1, NULL, '', 1, 3, 1, NULL, NULL, NULL, NULL, 2, '2019-05-22 18:04:17', '2019-05-22 18:04:17', NULL, NULL),
(9, '', '', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '', 1, 20, 1, NULL, NULL, NULL, NULL, 0, '2019-05-26 21:10:43', '2019-05-26 21:10:43', NULL, NULL),
(10, '', '', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '', 1, 20, 1, NULL, NULL, NULL, NULL, 0, '2019-05-26 21:14:07', '2019-05-26 21:14:07', NULL, NULL),
(11, '', '', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '', 1, 20, 1, NULL, NULL, NULL, NULL, 0, '2019-05-26 21:14:51', '2019-05-26 21:14:51', NULL, NULL),
(12, '', '', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '', 1, 20, 1, NULL, NULL, NULL, NULL, 0, '2019-05-26 21:16:48', '2019-05-26 21:16:48', NULL, NULL),
(13, '', '', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '', 1, 20, 1, NULL, NULL, NULL, NULL, 0, '2019-05-26 21:19:22', '2019-05-26 21:19:22', NULL, NULL),
(14, '', '', NULL, NULL, NULL, NULL, NULL, 0, 1, '2019-05-26-21-22-49y.mp3', '', 1, 20, 1, NULL, NULL, NULL, NULL, 0, '2019-05-26 21:22:49', '2019-05-26 21:22:49', NULL, NULL),
(15, '', '', NULL, NULL, NULL, NULL, NULL, 0, 1, '2019-05-26-21-28-25y.mp3', '', 1, 20, 1, NULL, NULL, NULL, NULL, 0, '2019-05-26 21:28:25', '2019-05-26 21:28:25', NULL, NULL),
(16, 'Music story', '', NULL, NULL, NULL, NULL, NULL, 0, 1, '2019-05-26-21-29-30audio.mp3', '', 1, 6, 1, NULL, NULL, NULL, NULL, 1, '2019-05-26 21:29:31', '2019-05-26 21:29:31', NULL, NULL),
(17, 'Grabbing coffee near Oregon.', '', NULL, '1558975647_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 3, 1, NULL, NULL, NULL, NULL, 0, '2019-05-27 16:47:28', '2019-05-27 16:47:28', NULL, NULL),
(18, 'Portland', '', NULL, '1559017917_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 22, 1, NULL, NULL, NULL, NULL, 0, '2019-05-28 04:31:59', '2019-05-28 04:31:59', NULL, NULL),
(19, 'Rose garden in Portlandia ', '', NULL, '1559018939_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 22, 1, NULL, NULL, NULL, NULL, 0, '2019-05-28 04:48:59', '2019-05-28 04:48:59', NULL, NULL),
(20, 'Taken on Facebook messenger camera wow', '', NULL, '1559019017_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 22, 1, NULL, NULL, NULL, NULL, 0, '2019-05-28 04:50:17', '2019-05-28 04:50:17', NULL, NULL),
(21, 'I like this vibrant magenta ', '', NULL, '1559019053_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 22, 1, NULL, NULL, NULL, NULL, 0, '2019-05-28 04:50:53', '2019-05-28 04:50:53', NULL, NULL),
(23, 'Rosey ', '', NULL, '1559019124_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 22, 1, NULL, NULL, NULL, NULL, 0, '2019-05-28 04:52:04', '2019-05-28 04:52:04', NULL, NULL),
(24, 'Twinz', '', NULL, '1559019163_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 22, 1, NULL, NULL, NULL, NULL, 0, '2019-05-28 04:52:43', '2019-05-28 04:52:43', NULL, NULL),
(25, 'Too cool for school', '', NULL, '1559238120_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 3, 1, NULL, NULL, NULL, NULL, 0, '2019-05-30 17:42:02', '2019-05-30 17:42:02', NULL, NULL),
(27, 'The whole world ahead of you.', '', NULL, '1559419642_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 3, 1, NULL, NULL, NULL, NULL, 0, '2019-06-01 20:07:24', '2019-06-01 20:07:24', NULL, NULL),
(28, 'Hair bow headbands ', '', NULL, '1559446870_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 22, 1, NULL, NULL, NULL, NULL, 0, '2019-06-02 03:41:11', '2019-06-02 03:41:11', NULL, NULL),
(29, 'Cool red truck ', '', NULL, '1559447057_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 22, 1, NULL, NULL, NULL, NULL, 0, '2019-06-02 03:44:18', '2019-06-02 03:44:18', NULL, NULL),
(30, 'Gum ball life ', '', NULL, '1559447095_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 22, 1, NULL, NULL, NULL, NULL, 0, '2019-06-02 03:44:56', '2019-06-02 03:44:56', NULL, NULL),
(31, 'Splash', '', NULL, '1559454412_image.jpg', NULL, NULL, NULL, 0, 1, NULL, '', 1, 3, 1, NULL, NULL, NULL, NULL, 0, '2019-06-02 05:46:53', '2019-06-02 05:46:53', NULL, NULL),
(33, 'Audio123', '', NULL, NULL, NULL, NULL, NULL, 0, 1, '2019-06-04-18-20-19audio.mp3', '', 1, 6, 1, NULL, NULL, NULL, NULL, 1, '2019-06-04 18:20:19', '2019-06-04 18:20:19', NULL, NULL),
(36, 'Audio', '', NULL, NULL, NULL, NULL, NULL, 0, 1, '2019-06-06-16-19-00audio.mp3', '', 1, 6, 1, NULL, NULL, NULL, NULL, 1, '2019-06-06 16:19:00', '2019-06-06 16:19:00', NULL, NULL),
(37, 'Audio story fixed', '', NULL, NULL, NULL, NULL, NULL, 0, 1, '2019-06-07-15-39-26audio.mp3', '', 1, 6, 1, NULL, NULL, NULL, NULL, 1, '2019-06-07 15:39:26', '2019-06-07 15:39:26', NULL, NULL),
(38, 'Audio story good work now', '', NULL, NULL, NULL, NULL, NULL, 0, 1, '2019-06-07-16-20-36audio.mp3', '', 1, 6, 1, NULL, NULL, NULL, NULL, 1, '2019-06-07 16:20:36', '2019-06-07 16:20:36', NULL, NULL),
(39, 'Crazy clouds.', '', NULL, '1559933585_image.jpg', 810, 1080, NULL, 0, 1, NULL, '', 1, 3, 1, NULL, NULL, NULL, NULL, 0, '2019-06-07 18:53:05', '2019-06-07 18:53:05', NULL, NULL),
(40, 'Mother’s Day.', '', NULL, '1559946835_image.jpg', 810, 1080, NULL, 0, 1, NULL, '', 1, 3, 1, NULL, NULL, NULL, NULL, 0, '2019-06-07 22:33:55', '2019-06-07 22:33:55', NULL, NULL),
(41, '“Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do.” - Steve Jobs', '', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '', 1, 3, 1, NULL, NULL, NULL, NULL, 0, '2019-06-08 00:14:01', '2019-06-08 00:14:01', NULL, NULL),
(42, 'I shoot art', '', NULL, '1560157591_image.jpg', 640, 960, NULL, 0, 1, NULL, '', 1, 24, 1, NULL, NULL, NULL, NULL, 0, '2019-06-10 09:06:31', '2019-06-10 09:06:31', NULL, NULL),
(43, 'Just bought this on a whim.', '', NULL, '1560198397_image.jpg', 810, 1080, NULL, 0, 1, NULL, '', 1, 3, 1, NULL, NULL, NULL, NULL, 0, '2019-06-10 20:26:37', '2019-06-10 20:26:37', NULL, NULL),
(44, 'Today’s Sketch ', '', NULL, '1560211772_image.jpg', 810, 1080, NULL, 0, 1, NULL, '', 1, 14, 1, NULL, NULL, NULL, NULL, 0, '2019-06-11 00:09:32', '2019-06-11 00:09:32', NULL, NULL),
(45, 'Today’s Sketch ', '', NULL, '1560211818_image.jpg', 864, 1080, NULL, 0, 1, NULL, '', 1, 14, 1, NULL, NULL, NULL, NULL, 0, '2019-06-11 00:10:18', '2019-06-11 00:10:18', NULL, NULL),
(46, 'Today’s Sketch ', '', NULL, '1560211864_image.jpg', 864, 1080, NULL, 0, 1, NULL, '', 1, 14, 1, NULL, NULL, NULL, NULL, 0, '2019-06-11 00:11:04', '2019-06-11 00:11:04', NULL, NULL),
(47, 'Today’s Sketch ', '', NULL, '1560211928_image.jpg', 864, 1080, NULL, 0, 1, NULL, '', 1, 14, 1, NULL, NULL, NULL, NULL, 0, '2019-06-11 00:12:08', '2019-06-11 00:12:08', NULL, NULL),
(48, 'Today’s Sketch ', '', NULL, '1560211997_image.jpg', 812, 1080, NULL, 0, 1, NULL, '', 1, 14, 1, NULL, NULL, NULL, NULL, 0, '2019-06-11 00:13:17', '2019-06-11 00:13:17', NULL, NULL),
(49, 'Shot in Culebra, PR ', '', NULL, '1560217234_image.jpg', 1080, 720, NULL, 0, 1, NULL, '', 1, 24, 1, NULL, NULL, NULL, NULL, 0, '2019-06-11 01:40:34', '2019-06-11 01:40:34', NULL, NULL),
(50, 'Cheers to new beginnings ', '', NULL, '1560234015_image.jpg', 1080, 810, NULL, 0, 1, NULL, '', 1, 27, 1, NULL, NULL, NULL, NULL, 0, '2019-06-11 06:20:15', '2019-06-11 06:20:34', NULL, NULL),
(51, 'Traveling and painting in Iowa this week, visiting for a dental visit and a wedding. I love living in the Caribbean but no one loves there for the medical services lol', '', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '', 1, 28, 1, NULL, NULL, NULL, NULL, 0, '2019-06-12 17:57:23', '2019-06-12 17:58:07', NULL, NULL),
(52, 'A plein pair painting in a vintage cigarette case makes for the perfect traveling art gear!', '', NULL, '1560362419_image.jpg', 918, 1080, NULL, 0, 1, NULL, '', 1, 28, 1, NULL, NULL, NULL, NULL, 0, '2019-06-12 18:00:20', '2019-06-12 18:00:20', NULL, NULL),
(53, 'Brought the watercolor paint gear for the airplane. This is a mini piece that was fun to doodle on the flight from the Caribbean!', '', NULL, '1560362522_image.jpg', 811, 1080, NULL, 0, 1, NULL, '', 1, 28, 1, NULL, NULL, NULL, NULL, 0, '2019-06-12 18:02:02', '2019-06-12 18:02:02', NULL, NULL),
(54, 'Another watercolor doodle from the flight from my home in the Caribbean.', '', NULL, '1560362588_image.jpg', 1080, 832, NULL, 0, 1, NULL, '', 1, 28, 1, NULL, NULL, NULL, NULL, 0, '2019-06-12 18:03:09', '2019-06-12 18:03:09', NULL, NULL),
(55, 'Plant shopping.', '', NULL, '1560635676_image.jpg', 810, 1080, NULL, 0, 1, NULL, '', 1, 3, 1, NULL, NULL, NULL, NULL, 0, '2019-06-15 21:54:36', '2019-06-15 21:54:36', NULL, NULL),
(56, 'I made this for an organization in Thailand. Enjoy! ', '', '1rfqwpunu94', NULL, NULL, NULL, NULL, 0, 1, NULL, '', 1, 27, 1, NULL, NULL, NULL, NULL, 2, '2019-06-15 22:33:26', '2019-06-15 22:33:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_follows`
--

CREATE TABLE `post_follows` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_follows`
--

INSERT INTO `post_follows` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(18, 2, 6, NULL, NULL, NULL),
(19, 2, 3, NULL, NULL, NULL),
(22, 4, 3, NULL, NULL, NULL),
(23, 16, 3, NULL, NULL, NULL),
(27, 18, 3, NULL, NULL, NULL),
(28, 24, 3, NULL, NULL, NULL),
(29, 23, 3, NULL, NULL, NULL),
(30, 21, 3, NULL, NULL, NULL),
(31, 20, 3, NULL, NULL, NULL),
(32, 19, 3, NULL, NULL, NULL),
(33, 16, 20, NULL, NULL, NULL),
(34, 3, 22, NULL, NULL, NULL),
(35, 7, 22, NULL, NULL, NULL),
(36, 8, 22, NULL, NULL, NULL),
(37, 17, 22, NULL, NULL, NULL),
(38, 25, 22, NULL, NULL, NULL),
(39, 27, 22, NULL, NULL, NULL),
(40, 30, 3, NULL, NULL, NULL),
(41, 29, 3, NULL, NULL, NULL),
(42, 28, 3, NULL, NULL, NULL),
(43, 36, 3, NULL, NULL, NULL),
(44, 38, 3, NULL, NULL, NULL),
(45, 42, 3, NULL, NULL, NULL),
(46, 48, 3, NULL, NULL, NULL),
(47, 47, 3, NULL, NULL, NULL),
(48, 46, 3, NULL, NULL, NULL),
(49, 45, 3, NULL, NULL, NULL),
(50, 44, 3, NULL, NULL, NULL),
(51, 48, 25, NULL, NULL, NULL),
(52, 41, 25, NULL, NULL, NULL),
(53, 49, 3, NULL, NULL, NULL),
(54, 50, 3, NULL, NULL, NULL),
(55, 54, 3, NULL, NULL, NULL),
(56, 53, 3, NULL, NULL, NULL),
(57, 52, 3, NULL, NULL, NULL),
(58, 51, 3, NULL, NULL, NULL),
(59, 41, 27, NULL, NULL, NULL),
(60, 43, 27, NULL, NULL, NULL),
(61, 55, 27, NULL, NULL, NULL),
(62, 56, 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(18, 2, 6, '2019-05-12 14:11:13', '2019-05-12 14:11:13'),
(19, 2, 3, '2019-05-12 15:48:55', '2019-05-12 15:48:55'),
(22, 4, 3, '2019-05-22 18:05:06', '2019-05-22 18:05:06'),
(23, 16, 3, '2019-05-28 04:22:06', '2019-05-28 04:22:06'),
(27, 18, 3, '2019-05-28 04:40:14', '2019-05-28 04:40:14'),
(28, 24, 3, '2019-05-28 05:24:42', '2019-05-28 05:24:42'),
(29, 23, 3, '2019-05-28 05:24:46', '2019-05-28 05:24:46'),
(30, 21, 3, '2019-05-28 05:24:49', '2019-05-28 05:24:49'),
(31, 20, 3, '2019-05-28 05:24:52', '2019-05-28 05:24:52'),
(32, 19, 3, '2019-05-28 05:24:56', '2019-05-28 05:24:56'),
(33, 16, 20, '2019-05-28 05:59:25', '2019-05-28 05:59:25'),
(34, 3, 22, '2019-06-02 03:42:10', '2019-06-02 03:42:10'),
(35, 7, 22, '2019-06-02 03:42:16', '2019-06-02 03:42:16'),
(36, 8, 22, '2019-06-02 03:42:21', '2019-06-02 03:42:21'),
(37, 17, 22, '2019-06-02 03:42:33', '2019-06-02 03:42:33'),
(38, 25, 22, '2019-06-02 03:42:37', '2019-06-02 03:42:37'),
(39, 27, 22, '2019-06-02 03:42:50', '2019-06-02 03:42:50'),
(40, 30, 3, '2019-06-02 05:27:23', '2019-06-02 05:27:23'),
(41, 29, 3, '2019-06-02 05:27:26', '2019-06-02 05:27:26'),
(42, 28, 3, '2019-06-02 05:27:30', '2019-06-02 05:27:30'),
(43, 36, 3, '2019-06-07 22:35:01', '2019-06-07 22:35:01'),
(44, 38, 3, '2019-06-09 19:16:42', '2019-06-09 19:16:42'),
(45, 42, 3, '2019-06-10 19:57:50', '2019-06-10 19:57:50'),
(46, 48, 3, '2019-06-11 00:41:20', '2019-06-11 00:41:20'),
(47, 47, 3, '2019-06-11 00:41:33', '2019-06-11 00:41:33'),
(48, 46, 3, '2019-06-11 00:42:02', '2019-06-11 00:42:02'),
(49, 45, 3, '2019-06-11 00:42:31', '2019-06-11 00:42:31'),
(50, 44, 3, '2019-06-11 00:42:35', '2019-06-11 00:42:35'),
(51, 48, 25, '2019-06-11 01:38:54', '2019-06-11 01:38:54'),
(52, 41, 25, '2019-06-11 01:39:26', '2019-06-11 01:39:26'),
(53, 49, 3, '2019-06-11 02:00:19', '2019-06-11 02:00:19'),
(54, 50, 3, '2019-06-11 15:37:51', '2019-06-11 15:37:51'),
(55, 54, 3, '2019-06-13 04:06:42', '2019-06-13 04:06:42'),
(56, 53, 3, '2019-06-13 04:06:45', '2019-06-13 04:06:45'),
(57, 52, 3, '2019-06-13 04:06:49', '2019-06-13 04:06:49'),
(58, 51, 3, '2019-06-13 04:06:52', '2019-06-13 04:06:52'),
(59, 41, 27, '2019-06-13 23:11:51', '2019-06-13 23:11:51'),
(60, 43, 27, '2019-06-13 23:11:53', '2019-06-13 23:11:53'),
(61, 55, 27, '2019-06-15 22:35:57', '2019-06-15 22:35:57'),
(62, 56, 3, '2019-06-15 23:20:03', '2019-06-15 23:20:03');

-- --------------------------------------------------------

--
-- Table structure for table `post_media`
--

CREATE TABLE `post_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `media_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_reports`
--

CREATE TABLE `post_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `reporter_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_shares`
--

CREATE TABLE `post_shares` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'Admin', 'Access to everything', '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(2, 'user', 'User', 'Access limited to user', '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(3, 'moderator', 'Moderator', 'Access limited to moderator', '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(4, 'editor', 'Editor', 'Access limited to editor', '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_posts`
--

CREATE TABLE `saved_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_timelines`
--

CREATE TABLE `saved_timelines` (
  `id` int(10) UNSIGNED NOT NULL,
  `timeline_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'noreply_email', 'noreply@socialite.com', '2019-03-06 23:52:48', '2019-03-06 23:52:48', NULL),
(2, 'language', 'en', '2019-03-06 23:52:48', '2019-03-06 23:52:48', NULL),
(3, 'logo', 'logo.jpg', '2019-03-06 23:52:48', '2019-03-06 23:52:48', NULL),
(4, 'favicon', 'favicon.jpg', '2019-03-06 23:52:48', '2019-03-06 23:52:48', NULL),
(5, 'enable_browse', 'on', '2019-03-06 23:52:48', '2019-03-06 23:52:48', NULL),
(6, 'meta_description', 'Socialite is the FIRST Social networking script developed on Laravel with all enhanced features, Pixel perfect design and extremely user friendly. User interface and user experience are extra added features to Socialite. Months of research, passion and hard work had made the Socialite more flexible, feature-available and very user friendly!', '2019-03-06 23:52:48', '2019-03-06 23:52:48', NULL),
(7, 'meta_keywords', 'facebook clone, laravel, live chat, message, news feed, php social network, php social platform, php socialite, post, social, social network, social networking, social platform, social script, socialite', '2019-03-06 23:52:48', '2019-03-06 23:52:48', NULL),
(8, 'site_tagline', 'Laravel social network script', '2019-03-06 23:52:49', '2019-03-06 23:52:49', NULL),
(9, 'invite_privacy', 'only_admins', '2019-03-06 23:52:52', '2019-03-06 23:52:52', NULL),
(10, 'event_timeline_post_privacy', 'only_guests', '2019-03-06 23:52:52', '2019-03-06 23:52:52', NULL),
(11, 'title_seperator', '|', '2019-03-06 23:52:52', '2019-03-06 23:52:52', NULL),
(12, 'timezone', 'Europe/London', '2019-03-06 23:52:52', '2019-03-06 23:52:52', NULL),
(13, 'enable_rtl', 'off', '2019-03-06 23:52:52', '2019-03-06 23:52:52', NULL),
(14, 'group_event_privacy', 'only_admins', '2019-03-06 23:52:55', '2019-03-06 23:52:55', NULL),
(15, 'footer_languages', 'on', '2019-03-06 23:52:55', '2019-03-06 23:52:55', NULL),
(16, 'linkedin_link', 'http://linkedin.com/', '2019-03-06 23:52:55', '2019-03-06 23:52:55', NULL),
(17, 'instagram_link', 'http://instagram.com/', '2019-03-06 23:52:55', '2019-03-06 23:52:55', NULL),
(18, 'dribbble_link', 'http://dribbble.com/', '2019-03-06 23:52:55', '2019-03-06 23:52:55', NULL),
(19, 'comment_privacy', 'everyone', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(20, 'confirm_follow', 'no', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(21, 'follow_privacy', 'everyone', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(22, 'user_timeline_post_privacy', 'everyone', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(23, 'post_privacy', 'everyone', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(24, 'page_message_privacy', 'everyone', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(25, 'page_timeline_post_privacy', 'everyone', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(26, 'page_member_privacy', 'only_admins', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(27, 'member_privacy', 'only_admins', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(28, 'group_timeline_post_privacy', 'members', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(29, 'group_member_privacy', 'only_admins', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(30, 'site_name', 'Socialite', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(31, 'site_title', 'Socialite', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(32, 'site_url', 'socialite.dev', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(33, 'twitter_link', 'http://twitter.com/', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(34, 'facebook_link', 'http://facebook.com/', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(35, 'youtube_link', 'http://youtube.com/', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(36, 'support_email', 'admin@socialite.com', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(37, 'mail_verification', 'off', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(38, 'captcha', 'off', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(39, 'censored_words', '', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(40, 'birthday', 'off', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(41, 'city', 'off', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(42, 'about', 'Socialite is the FIRST Social networking script developed on Laravel with all enhanced features, Pixel perfect design and extremely user friendly. User interface and user experience are extra added features to Socialite. Months of research, passion and hard work had made the Socialite more flexible, feature-available and very user friendly!', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(43, 'contact_text', 'Contact page description can be here', '2019-03-06 23:53:33', '2019-03-06 23:53:33', NULL),
(44, 'address_on_mail', 'Socialite,<br> Socialite street,<br> India', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(45, 'items_page', '10', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(46, 'min_items_page', '5', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(47, 'user_message_privacy', 'everyone', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(48, 'home_welcome_message', 'Welcome To Socialite Laravel Application', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(49, 'home_widget_one', 'Developed on Twitter Bootstrap which makes the application fully responsive on Desktop, Tablet and Mobile', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(50, 'home_widget_two', 'Powerful Admin panel to manage entire application and all kinds of timelines', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(51, 'home_widget_three', 'Emoticons, hashtags, music, youtube video, photos, hangouts and many others can be posted', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(52, 'home_list_heading', 'Enhancing Features of Socialite', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(53, 'home_feature_one_icon', 'users', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(54, 'home_feature_one', 'Find and connect with real people living through out the world', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(55, 'home_feature_two_icon', 'share-alt', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(56, 'home_feature_two', 'Share your posts in other social networks', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(57, 'home_feature_three_icon', 'link', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(58, 'home_feature_three', 'Add links in your posts with new innovative look', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(59, 'home_feature_four_icon', 'bullhorn', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(60, 'home_feature_four', 'Place your google Adsense through out the application', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(61, 'home_feature_five_icon', 'connectdevelop', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(62, 'home_feature_five', 'Connect to Socialite through Facebook, Twitter, Google Plus and Instagram', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(63, 'home_feature_six_icon', 'save', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(64, 'home_feature_six', 'Now you can save your favourite posts, pages, groups and events', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(65, 'home_feature_seven_icon', 'file-photo-o', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(66, 'home_feature_seven', 'Create your albums and upload the pictures right now', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(67, 'home_feature_eight_icon', 'flag-o', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(68, 'home_feature_eight', 'Any page or a post or a group or an event can be reported', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(69, 'home_feature_nine_icon', 'language', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(70, 'home_feature_nine', 'Socialite is multi-lingual and available in 16 languages', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(71, 'home_feature_ten_icon', 'user-plus', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL),
(72, 'home_feature_ten', 'Affiliate System adds an extra flavour to Socialite', '2019-03-06 23:53:34', '2019-03-06 23:53:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `static_pages`
--

CREATE TABLE `static_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `static_pages`
--

INSERT INTO `static_pages` (`id`, `title`, `slug`, `description`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'about', 'about', 'Illo quasi rem perspiciatis vero vel. Voluptas iste blanditiis molestiae voluptatem minus sit maxime. In est suscipit debitis ut.', 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(2, 'privacy', 'privacy', 'Ratione voluptatem qui ipsam voluptatem corporis. Quos ea eum sunt aut cum. Officiis aspernatur corrupti et alias incidunt. Voluptas quasi inventore debitis iusto officiis.', 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(3, 'disclaimer', 'disclaimer', 'Dolore numquam quas rerum omnis maxime. Consectetur aut velit et esse. Eaque nam reiciendis sequi ipsum et quos. Et dolorum non numquam.', 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL),
(4, 'terms', 'terms', 'Qui et voluptatem fugiat voluptatem sequi voluptatem autem. Eos est sed dolore eligendi occaecati in. Non reiciendis dignissimos numquam saepe minima hic rerum.', 1, '2019-03-06 23:53:32', '2019-03-06 23:53:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`id`, `subject`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', '2019-05-14 02:51:31', '2019-06-09 00:10:33', NULL),
(2, '', '2019-05-21 23:07:55', '2019-05-21 23:08:09', NULL),
(3, '', '2019-05-26 17:28:09', '2019-05-26 20:59:01', NULL),
(4, '', '2019-05-28 04:32:37', '2019-06-10 03:03:33', NULL),
(5, '', '2019-05-31 20:46:54', '2019-06-16 03:06:52', NULL),
(6, '', '2019-06-10 22:54:56', '2019-06-24 17:53:21', NULL),
(7, '', '2019-06-11 04:44:05', '2019-06-11 04:44:05', NULL),
(8, '', '2019-06-12 03:28:13', '2019-06-15 23:40:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timelines`
--

CREATE TABLE `timelines` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `about` text COLLATE utf8_unicode_ci NOT NULL,
  `avatar_id` int(10) UNSIGNED DEFAULT NULL,
  `cover_id` int(10) UNSIGNED DEFAULT NULL,
  `cover_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hide_cover` int(11) NOT NULL DEFAULT '0',
  `background_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `timelines`
--

INSERT INTO `timelines` (`id`, `username`, `name`, `about`, `avatar_id`, `cover_id`, `cover_position`, `type`, `hide_cover`, `background_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'bootstrapguru', 'Admin', 'Some text about me', 1, NULL, NULL, 'user', 0, NULL, '2019-03-06 23:53:32', '2019-03-08 02:34:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timeline_reports`
--

CREATE TABLE `timeline_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `timeline_id` int(10) UNSIGNED NOT NULL,
  `reporter_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `deviceToken` varchar(80) COLLATE utf8_unicode_ci DEFAULT ' ',
  `avg_rating` decimal(3,1) UNSIGNED NOT NULL DEFAULT '3.0',
  `bio` text COLLATE utf8_unicode_ci,
  `creative_field` text COLLATE utf8_unicode_ci,
  `displayName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `emailLogin` tinyint(1) NOT NULL DEFAULT '0',
  `location` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `photoURL` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `badge_number` int(11) NOT NULL DEFAULT '0',
  `timeline_id` int(10) UNSIGNED NOT NULL,
  `verification_code` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `balance` double(8,2) NOT NULL DEFAULT '0.00',
  `birthday` date NOT NULL DEFAULT '1970-01-01',
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hobbies` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interests` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `last_logged` timestamp NULL DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `affiliate_id` int(10) UNSIGNED DEFAULT NULL,
  `language` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dribbble_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `deviceToken`, `avg_rating`, `bio`, `creative_field`, `displayName`, `firstName`, `lastName`, `email`, `password`, `emailLogin`, `location`, `photoURL`, `website`, `badge_number`, `timeline_id`, `verification_code`, `verified`, `email_verified`, `remember_token`, `balance`, `birthday`, `city`, `country`, `designation`, `hobbies`, `interests`, `custom_option1`, `custom_option2`, `custom_option3`, `custom_option4`, `gender`, `active`, `last_logged`, `timezone`, `affiliate_id`, `language`, `facebook_link`, `twitter_link`, `dribbble_link`, `instagram_link`, `youtube_link`, `linkedin_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, '02c7e4493bc8e561d7d06768042b2f8c5db1774cf88cb38880605301f70c581b', '3.0', NULL, 'Commercial Acting', 'Flyerson', 'Fly', 'Flyerson', 'scubasteveo12345@gmail.com', 'password', 0, 'San Francisco', 'https://graph.facebook.com/1755511884594992/picture?type=large', '', 0, 1, 'IdqH0IxWlBIFkGNpAMox0ba8GgXDRT', 0, 1, 'XOsmfEGO2RGHHgYcdJHFqDFzUekYsj', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-11 04:33:33', '2019-05-11 04:34:07', NULL),
(3, 'de12b7925be5286a7336d13058436199a43f2bec25a13c74404d2d132ddb6316', '5.0', 'Founder of Sun Road.', 'Novel Writer', 'Jesse McDaniel', 'Jesse', 'McDaniel ', 'jes.mcdaniel@gmail.com', 'password', 0, 'Seattle', '1559697866_image.jpg', '', 0, 1, 'vmphf9AcfYaC56nPFB8cLvfQVJkmjg', 0, 1, 'Boyi030tL3pMqQDgDPYxyebVLnwAE3', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-11 16:41:59', '2019-06-05 01:24:26', NULL),
(6, 'c6d4b11e9964e9931b8610d7eb260e4be5da7e5215f7ff9b0eda4f5bb72829af', '4.0', NULL, 'Fine Artist', 'Helios', 'Elena', 'Ionkina', 'Elena.ionkina@hotmail.com', '$2y$10$GlvnWeEEwF8Da2BGL/QQ7.z0jBXhDwp/Fwcl2eGH4EBwgXSMVLtl6', 0, 'Kyiv', '1559017973_image.jpg', 'www.google.com', 0, 1, 'FI5rnjkEDxMvByy5T17LQkdDkfT7ET', 0, 1, 'hWMVz39TM5Bb6yLLea4pBdqblaB7Gc', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-12 13:16:05', '2019-06-07 23:30:58', NULL),
(7, ' ', '3.0', NULL, NULL, NULL, NULL, NULL, 'Onsunroad@gmail.com', '$2y$10$wqKv7x3zyihz8xRocVl2m.mHRUmHczClnTMEP7lqXiA0YeEsA27KW', 0, '', '', '', 0, 1, 'sDeNHk96wo2QWuBQtpOFrDV7zojlDI', 0, 1, 'zw5jZJQOriF0xmzZbWdEDXBBoi4zfZ', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-15 20:26:14', '2019-05-15 20:26:14', NULL),
(8, '01e26afe7399baa33ddb06ccf202b80b98ce53d3fad29bf5fddcd43170363ae8', '3.0', NULL, 'Fine Artist', 'Sunroad Admin', NULL, NULL, 'Onsunroad1@gmail.com', '$2y$10$wqKv7x3zyihz8xRocVl2m.mHRUmHczClnTMEP7lqXiA0YeEsA27KW', 0, '', '1560034293_image.jpg', '', 0, 1, 'JYRfZmdIqhWsGWpPSghQKaCmcHgD8u', 0, 1, 'Gp7amBLooN1NxGnBPbyUl6fHYUo0yn', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-15 20:27:10', '2019-06-09 18:20:35', NULL),
(10, '6afcff5481978ebad8c1299d2a0b836b7b5b512146e3e56fe9ed805931d2a20b', '3.0', NULL, 'Graphic Design', 'Olive DaSilva', 'Aieyana “Olive”', 'Da Silva', 'Loveofbears14@icloud.com', '$2y$10$TmXn/k4lInkX3UJrnsZvJucZlNz/cx0jb1xGJiTQEwVPDnbsBwP/6', 0, 'Las Vegas', '1557978496_image.jpg', '', 0, 1, 'pEh9uWgrlANR9Ot6WaMRmdxyxjfEmr', 0, 1, '8ruw7t0mfWwwglYSZ8a72SCX6O2OUT', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-16 03:44:41', '2019-05-16 03:48:16', NULL),
(11, '75d296f086e2704644af2be811d415442915a0244af93cfc1527fa1eb67a0d61', '3.0', NULL, NULL, NULL, NULL, NULL, 'Rosado_928@comcast.net', '$2y$10$ig7Tol6SUSU.YAKu1/1toObmo4.UhmY.936.DftrMepOvl49w9MJO', 0, '', '', '', 0, 1, '0R75gd9M2HaGC7grm3DwIluCLAhklo', 0, 1, 'cIZD9d81iCXgr8w2P85zg3tkFaNWKL', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-16 20:31:25', '2019-05-16 20:33:39', NULL),
(12, 'e02828be27ae894758ad2bc947079d1850d3810b421a37bb8bcb733082b71bed', '3.0', NULL, 'Fine Artist', 'Reagan Russell', 'Reagan', 'Russell', 'reaganrussell8@yahoo.com', '$2y$10$/GdDuq78huMxwxC81AwPjeum6IEWr/mFmtj9lBkIs7WCizP5UMkCG', 0, '', '', '', 0, 1, '7NWCGX6MivaufdpcA9ExEAOdGB1syq', 0, 1, '89uftHeddNJjMTOtqqUCSKmKYqSXJJ', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-18 22:22:57', '2019-05-18 22:26:23', NULL),
(13, 'e6f027e18eff873aa6e69910d36dc33e80374082694b3f8ed42e30d244bc58f0', '3.0', NULL, NULL, NULL, NULL, NULL, 'laurathegreen@gmail.com', 'password', 0, '', 'https://lh4.googleusercontent.com/-aPAzzvYhdGs/AAAAAAAAAAI/AAAAAAAAXa8/SiQXkXwJMbc/s100/photo.jpg', '', 0, 1, 'xQ6PnfjSHDHalR0EZ8ngfHC4m3p6Z1', 0, 1, '0OiJzLX8GtythAXCJV1y1DZSuz3c1S', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-20 18:20:17', '2019-05-20 18:20:17', NULL),
(14, '349f2be128d052235d2cf24fe6709a2e37f2d8b052b521ffa3632f996063079e', '3.0', NULL, 'Fine Artist', 'Mr.T', 'Terence', 'Smith', 'Tledon_smith@hotmail.com', '$2y$10$t2JTzMtj/Jo1CKjbXGxgGuofqk/tn52QoLhAkgxxp99JvxwktK6gy', 0, 'Bellevue ', '1559333519_image.jpg', '', 0, 1, 'N65LxcF98DZrEGUsy1LUC8rJaNjtaP', 0, 1, 'xNcKu8UOveCDPOBLk4Vr9TzrhE1SOa', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-21 17:36:43', '2019-05-31 20:46:28', NULL),
(15, '71bab845ea7382579252a3d591b3adf599ca82621b84bb024a74f7b52bb1dbb6', '3.0', NULL, 'Audio Engineer', 'Andrew Lapinid', 'Andrew', 'Lapinid', 'andrewalapinid@gmail.com', 'password', 0, 'Edmonds', 'https://lh3.googleusercontent.com/-GTslZCnafw8/AAAAAAAAAAI/AAAAAAAAGTE/V44wSPp6YXQ/s100/photo.jpg', '', 0, 1, 'gmrlTtsZiGo0UsAJtNBFttzrYlbF1o', 0, 1, 'Nq53b2NKtp9ddS8PWL46k46a4jhZ3O', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-21 17:37:50', '2019-05-21 17:38:52', NULL),
(16, ' ', '3.0', NULL, NULL, NULL, NULL, NULL, 'Jennyphonsouk@gmail.com', '$2y$10$e0m0w0EgiSX8ZNSAiDn/zOMivVdiU44fybj5LkvQ6/CYVV4hA7NVu', 0, '', '', '', 0, 1, 'JgQNzzVKv5xFHLU1f62BUAIn1sgwlU', 0, 1, 'LoHg0xpt5cZNhrcinmZjuHXVp1T7Rh', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-21 23:00:14', '2019-05-21 23:00:14', NULL),
(17, 'de12b7925be5286a7336d13058436199a43f2bec25a13c74404d2d132ddb6316', '3.0', NULL, 'Audio Engineer', 'Jlmcompositions', 'Jay', 'Vertigo', 'Jlmcompositions@gmail.com', '$2y$10$70U4dOpDc8TlQDo0T0z7Y.3ayhql2G.cZt9wKHqbVT6qJZ6IDF9uC', 0, 'Seattle ', '1558479836_image.jpg', '', 0, 1, 'L7wnDVe4oilwGN7bYmNbBOaz6bL8Eh', 0, 1, 'y9R8quAi4IrczOGVx795PBCCHvtm7N', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-21 23:00:36', '2019-05-21 23:03:56', NULL),
(18, ' ', '3.0', NULL, NULL, NULL, NULL, NULL, 'Tanikella5197@paramusschools.org', '$2y$10$u3BHP/Yu1Hp3Q.QhYBfUP.lYvgdsFAXlejCFKw6H5WX1CgiVYjFTW', 0, '', '', '', 0, 1, 'DuaDHnqIZhceczfBE0yWnJNmAqVavN', 0, 1, 'rU42S89bym6p9TSKy5J9auPQN7rozE', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-24 16:26:31', '2019-05-24 16:26:31', NULL),
(19, ' ', '3.0', NULL, NULL, NULL, NULL, NULL, 'Govindatanikella@yahoo.com', '$2y$10$saLdr0b.rqWHEFg6SHgaXey9EajJlTCsWE/hqp3B8rKcEwWX3Ohga', 0, '', '', '', 0, 1, 'AWz9IyoTlFRbQUBfbtQv7zAPThlfdX', 0, 1, 'z7ulx3hgmD9QzSbY7zeGKbrGWP7wbF', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-24 16:26:51', '2019-05-24 16:26:51', NULL),
(20, '', '3.0', NULL, 'Film', 'Andreas Braun', 'Andreas', 'Braun', 'Andreasbraun117@hotmail.com', '$2y$10$kNOj7a5gZxe1Mjlklqugiu6dOtlx223Ze0jx9HUjETH6XnbjPdZoy', 0, 'Hanau ', '1559782951_image.jpg', 'www.linkedin.com', 0, 1, 'bXP30eLfdoJqmqklKwFyjz6X8DHggr', 0, 1, 'GGYMk8Iz7tiRpYha3OcprB2TqNeSgI', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-26 17:23:36', '2019-06-06 01:04:37', NULL),
(21, '', '3.0', 'I’m glad to have this app.', 'Animator', 'Apollo', 'Daniel', 'Boon', 'danielboon999@hotmail.com', '$2y$10$KUCfuVBNueg3yyRXRthsxeuDflI3y2RNIz4mT9ybPe7Iq.Dr0vEra', 0, 'Amsterdam', '', 'www.google.com', 0, 1, 'NcYcQIhNVpfs8A6Oyz8kZBzujm43oX', 0, 1, 'hL6YToUQIQRYHp43Oa6NbI2yW6hU4E', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-27 03:13:02', '2019-05-27 03:13:58', NULL),
(22, 'a4097ebd63bb38925ca69be7f4cb25146e435d425e1702d89ed928eb8f14132b', '5.0', 'Owner of Love, Jenniris.', 'Vendor', 'Jenny McDaniel', 'Jenny', 'McDaniel', 'lovejenniris@gmail.com', '$2y$10$idJ.CJuPulP9y1kuOBJPCu8EkbbWAc83YcBzM885fHH0Rm/./l526', 0, 'Seattle', '1559018835_image.jpg', '', 0, 1, 'HNeNzkgroy8KxXR9aqBoWcxC2nh0xv', 0, 1, 'MD60bVKhS0S85IgIDZUgQVH5gGkZto', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-28 04:28:12', '2019-06-02 05:27:48', NULL),
(23, '2b5c1d678bb3d0b14786329357e218ef8130bb0a8b14ee95aa12cca05206385b', '3.0', NULL, 'Photography', 'Elko Larrea', 'Elko', 'Larrea', 'elarreaamhs@gmail.com', 'password', 0, 'Renton ', 'https://graph.facebook.com/683559005428100/picture?type=large', '', 0, 1, 'Fsmngym6GF9J4Xx9bMRRbFmOUMKwUP', 0, 1, 'FOiiKvLtWJRUHIXuNZiKB2guWj4iwx', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-01 08:43:37', '2019-06-01 08:44:16', NULL),
(24, '2b0d0e4ada5ab4f009282573dbd237b72f2000a8cf8a5435103965c9ca4c0697', '3.0', 'I am an artist and photographer looking for work. ', 'Photography', 'Shawnsmithart', 'Shawn', 'Smith', 'shawnsmithconsulting@gmail.com', 'password', 0, 'Atlanta', 'https://graph.facebook.com/111699196756893/picture?type=large', '', 0, 1, 'GF3cS8RcAGOATkKQg1fNsRykd876bi', 0, 1, 'XIQ993wOWKvrbkVwGdwO3vxbWs8gVh', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-10 09:03:44', '2019-06-10 09:05:13', NULL),
(25, '553c6e3ee7c1982c2d3790cc244a244b914834af9138fc6787892d3257834c74', '3.0', 'Portrait artist ', 'Fine Artist', 'Hannah ', 'Hannah', 'Schmidt', 'hannahjapana@gmail.com', '$2y$10$yuHPOPkoE/9uAFs1iBCcF.hnwa6VE6SpYeP018D8TYw5W6L5JGI2m', 0, '', '1560206873_image.jpg', '', 0, 1, 'MrqcnraGR3aEZSRl0lkuFvljH291Df', 0, 1, '729hDpUyBCpVd5EWequelz9bdiAfKu', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-10 22:39:45', '2019-06-11 01:36:57', NULL),
(26, '650a27eb6f23d0f24602cacf1310dced7adb2dde0a7376cc34ec85aa41d9619b', '3.0', NULL, 'Songwriter', 'Ai', 'A', 'I', 'adrienne.ivey@gmail.com', 'password', 0, 'Seattle', 'https://lh6.googleusercontent.com/-6sQlPd_bMdI/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3rd4OBh63YBM7UG8AXtOUWguIds-8g/s100/photo.jpg', '', 0, 1, 'V5TOasrTTxGUA3UFt6sJXQWJ4gpRAx', 0, 1, 'qjPJ21RHQcTVGvfTl2yK50bGML14Kd', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-11 03:41:31', '2019-06-11 03:42:35', NULL),
(27, '0ab10382d993c1e17d6a9e23b76629a2c96f1952eea848729a25f5743b90b760', '3.0', 'video and photography. I work to help other ', 'Video', 'Douglas', 'Douglas ', 'Hamilton', 'douglas.scott.hamilton@gmail.com', 'password', 0, 'on the move ', '1560233868_image.jpg', '', 0, 1, 'sllzj2kK4bpLM8yDqNvCiQHyJVsleq', 0, 1, 'kELxciOZcWVUxXBo5zBomjQP4zifhI', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-11 06:15:33', '2019-06-11 06:17:49', NULL),
(28, '508a67bb06a11f1fc5de288462c804f599c8ce19c5e5b7cd11941fae25816c8e', '3.0', 'Caribbean artist and musician, I love plein air painting and playing guitar and singing! ', 'Fine Artist', '2CreateParadise', 'Porschia', 'Denning', 'raindancearts@gmail.com', 'password', 0, 'Saint John ', '1560362165_image.jpg', '', 0, 1, 'JZnsZaeGRhtgglprLxX9cEfz4NzVZb', 0, 1, 'pDNxfme5Lbd5xKiBZigNWZ6trXLC88', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-12 17:53:19', '2019-06-12 17:56:05', NULL),
(29, 'b7c20737cd130b24605faee43d53bf74ce844faca413bd25e65e9f88e036a996', '3.0', 'I’ve dabbled with almost every instrument but never fully committed, I can sing, I’ve travelled the world and toured with a couple major artists and got a taste of their life and want something similar. I just need to find friends who want to create and innovate music.', 'Influencer', 'Holland', 'Holland', 'Soule', 'holland@activist.com', 'password', 0, 'Edmonds ', '1560424440_image.jpg', 'Facebook.com/Hollandx', 0, 1, 'zWwbQkEubRUbmMnBqiHfLxA1xHa3TN', 0, 1, 'TljpydPycT4qh9uk6IpZWRiSTpe9qc', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-13 11:06:59', '2019-06-13 11:15:28', NULL),
(30, '1480561b7d298762cedcf2d07cfed250e3a36ce4b31385ef7cea0f1d7baefab8', '3.0', NULL, 'Podcaster', 'DyerOxley', 'Dyer', 'Oxley', 'dyeroxley@gmail.com', 'password', 0, 'Seattle', 'https://graph.facebook.com/10161739663375401/picture?type=large', '', 0, 1, '4pDtJA0I388b9LXWDKJjHyPrLlEyQP', 0, 1, 'Pjb3ksPOO84oQrj4iPI2c5SsgH6isO', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-15 02:41:32', '2019-06-15 02:42:06', NULL),
(31, 'de702bc3a30731bc43deffc552f6db42ab67ee54ee9c45c3b12084ec9ff3c7fc', '3.0', NULL, 'Miniature Painting', 'Jamie ', 'Jamie', 'Highfill', 'usedeloggers@gmail.com', 'password', 0, 'Las Vegas ', 'https://lh3.googleusercontent.com/-MnjA0WsFbkU/AAAAAAAAAAI/AAAAAAAAAfw/fXYiT0cN9vo/s100/photo.jpg', '', 0, 1, 'GC4qVwF5kyXjDeMiqY6fc7tUSWPxVa', 0, 1, 'TrvUkKEcjsq68exgnpf1trxXPmSGki', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-15 21:38:25', '2019-06-15 21:39:24', NULL),
(32, '4abddef8d3f364e973435a42cf8025cb4b9c7dc3d5d93e4cb8702b9f90f76bf4', '3.0', NULL, 'Fine Artist', 'Lauren', 'Lauren', 'Jackson', 'laurenscreativecapers@gmail.com', '$2y$10$P7vBsQbbBLhKF5V5nWK7yedXPHBd1ndMhigTVOdVrW1JK.G0CHZ52', 0, 'Butler, Indiana', '', '', 0, 1, 'BHiHVbmDckqmAdJlcfBvsKfbrDtZi0', 0, 1, 'K3GO5smppPI5bnR3D79I43XiQsJHpv', 0.00, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-15 23:14:19', '2019-06-15 23:15:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_ratings`
--

CREATE TABLE `user_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `receiver_id` int(10) UNSIGNED NOT NULL,
  `rate` tinyint(3) UNSIGNED NOT NULL,
  `review` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user_ratings`
--

INSERT INTO `user_ratings` (`id`, `sender_id`, `receiver_id`, `rate`, `review`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 6, 4, 'Testing if this works ', '2019-05-22 17:53:18', NULL, NULL),
(2, 3, 22, 5, 'Great to work with ', '2019-05-29 00:25:33', NULL, NULL),
(3, 3, 22, 5, 'Hello', '2019-06-02 05:27:48', NULL, NULL),
(4, 6, 3, 5, 'Test review', '2019-06-05 01:00:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment_privacy` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `follow_privacy` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `post_privacy` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `confirm_follow` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `timeline_post_privacy` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `message_privacy` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `email_follow` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `email_like_post` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `email_post_share` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `email_comment_post` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `email_like_comment` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `email_reply_comment` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `email_join_group` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `email_like_page` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_settings`
--

INSERT INTO `user_settings` (`id`, `user_id`, `comment_privacy`, `follow_privacy`, `post_privacy`, `confirm_follow`, `timeline_post_privacy`, `message_privacy`, `email_follow`, `email_like_post`, `email_post_share`, `email_comment_post`, `email_like_comment`, `email_reply_comment`, `email_join_group`, `email_like_page`) VALUES
(4, 6, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(5, 7, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(6, 8, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(8, 10, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(9, 11, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(10, 12, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(11, 14, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(12, 16, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(13, 17, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(14, 18, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(15, 19, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(16, 20, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(17, 21, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(18, 22, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(19, 25, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(20, 32, 'everyone', 'everyone', 'everyone', 'no', 'everyone', 'everyone', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wallpapers`
--

CREATE TABLE `wallpapers` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `media_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `albums_timeline_id_foreign` (`timeline_id`),
  ADD KEY `albums_preview_id_foreign` (`preview_id`);

--
-- Indexes for table `album_media`
--
ALTER TABLE `album_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_media_album_id_foreign` (`album_id`),
  ADD KEY `album_media_media_id_foreign` (`media_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcement_user`
--
ALTER TABLE `announcement_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcement_user_announcement_id_foreign` (`announcement_id`),
  ADD KEY `announcement_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`),
  ADD KEY `comments_media_id_foreign` (`media_id`);

--
-- Indexes for table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_likes_user_id_foreign` (`user_id`),
  ADD KEY `comment_likes_comment_id_foreign` (`comment_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_timeline_id_foreign` (`timeline_id`),
  ADD KEY `events_user_id_foreign` (`user_id`),
  ADD KEY `events_group_id_foreign` (`group_id`);

--
-- Indexes for table `event_user`
--
ALTER TABLE `event_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_user_event_id_foreign` (`event_id`),
  ADD KEY `event_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followers_follower_id_foreign` (`follower_id`),
  ADD KEY `followers_leader_id_foreign` (`leader_id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_timeline_id_foreign` (`timeline_id`);

--
-- Indexes for table `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_user_group_id_foreign` (`group_id`),
  ADD KEY `group_user_user_id_foreign` (`user_id`),
  ADD KEY `group_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `hashtags`
--
ALTER TABLE `hashtags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
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
-- Indexes for table `msg_request`
--
ALTER TABLE `msg_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_post_id_foreign` (`post_id`),
  ADD KEY `notifications_timeline_id_foreign` (`timeline_id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`),
  ADD KEY `notifications_notified_by_foreign` (`notified_by`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_timeline_id_foreign` (`timeline_id`),
  ADD KEY `pages_category_id_foreign` (`category_id`);

--
-- Indexes for table `page_likes`
--
ALTER TABLE `page_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_likes_page_id_foreign` (`page_id`),
  ADD KEY `page_likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `page_user`
--
ALTER TABLE `page_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_user_page_id_foreign` (`page_id`),
  ADD KEY `page_user_user_id_foreign` (`user_id`),
  ADD KEY `page_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_timeline_id_foreign` (`timeline_id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_shared_post_id_foreign` (`shared_post_id`);

--
-- Indexes for table `post_follows`
--
ALTER TABLE `post_follows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_follows_post_id_foreign` (`post_id`),
  ADD KEY `post_follows_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_likes_post_id_foreign` (`post_id`),
  ADD KEY `post_likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_media`
--
ALTER TABLE `post_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_media_post_id_foreign` (`post_id`),
  ADD KEY `post_media_media_id_foreign` (`media_id`);

--
-- Indexes for table `post_reports`
--
ALTER TABLE `post_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_reports_post_id_foreign` (`post_id`),
  ADD KEY `post_reports_reporter_id_foreign` (`reporter_id`);

--
-- Indexes for table `post_shares`
--
ALTER TABLE `post_shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_shares_post_id_foreign` (`post_id`),
  ADD KEY `post_shares_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tags_post_id_foreign` (`post_id`),
  ADD KEY `post_tags_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saved_posts_post_id_foreign` (`post_id`),
  ADD KEY `saved_posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `saved_timelines`
--
ALTER TABLE `saved_timelines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saved_timelines_timeline_id_foreign` (`timeline_id`),
  ADD KEY `saved_timelines_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_key_index` (`key`);

--
-- Indexes for table `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timelines`
--
ALTER TABLE `timelines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `timelines_username_unique` (`username`),
  ADD KEY `timelines_avatar_id_foreign` (`avatar_id`),
  ADD KEY `timelines_cover_id_foreign` (`cover_id`),
  ADD KEY `timelines_background_id_foreign` (`background_id`);

--
-- Indexes for table `timeline_reports`
--
ALTER TABLE `timeline_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timeline_reports_timeline_id_foreign` (`timeline_id`),
  ADD KEY `timeline_reports_reporter_id_foreign` (`reporter_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_timeline_id_foreign` (`timeline_id`),
  ADD KEY `users_affiliate_id_foreign` (`affiliate_id`);

--
-- Indexes for table `user_ratings`
--
ALTER TABLE `user_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_likes_page_id_foreign` (`sender_id`),
  ADD KEY `page_likes_user_id_foreign` (`receiver_id`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_settings_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallpapers`
--
ALTER TABLE `wallpapers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallpapers_media_id_foreign` (`media_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `album_media`
--
ALTER TABLE `album_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement_user`
--
ALTER TABLE `announcement_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `comment_likes`
--
ALTER TABLE `comment_likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_user`
--
ALTER TABLE `event_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_user`
--
ALTER TABLE `group_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hashtags`
--
ALTER TABLE `hashtags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `msg_request`
--
ALTER TABLE `msg_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_likes`
--
ALTER TABLE `page_likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_user`
--
ALTER TABLE `page_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `post_follows`
--
ALTER TABLE `post_follows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `post_media`
--
ALTER TABLE `post_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_reports`
--
ALTER TABLE `post_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_shares`
--
ALTER TABLE `post_shares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `saved_posts`
--
ALTER TABLE `saved_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_timelines`
--
ALTER TABLE `saved_timelines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `timelines`
--
ALTER TABLE `timelines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timeline_reports`
--
ALTER TABLE `timeline_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user_ratings`
--
ALTER TABLE `user_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `wallpapers`
--
ALTER TABLE `wallpapers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_preview_id_foreign` FOREIGN KEY (`preview_id`) REFERENCES `media` (`id`),
  ADD CONSTRAINT `albums_timeline_id_foreign` FOREIGN KEY (`timeline_id`) REFERENCES `timelines` (`id`);

--
-- Constraints for table `album_media`
--
ALTER TABLE `album_media`
  ADD CONSTRAINT `album_media_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`),
  ADD CONSTRAINT `album_media_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`);

--
-- Constraints for table `announcement_user`
--
ALTER TABLE `announcement_user`
  ADD CONSTRAINT `announcement_user_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`),
  ADD CONSTRAINT `announcement_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD CONSTRAINT `comment_likes_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comment_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `events_timeline_id_foreign` FOREIGN KEY (`timeline_id`) REFERENCES `timelines` (`id`),
  ADD CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `event_user`
--
ALTER TABLE `event_user`
  ADD CONSTRAINT `event_user_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `event_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `followers_leader_id_foreign` FOREIGN KEY (`leader_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_timeline_id_foreign` FOREIGN KEY (`timeline_id`) REFERENCES `timelines` (`id`);

--
-- Constraints for table `group_user`
--
ALTER TABLE `group_user`
  ADD CONSTRAINT `group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_notified_by_foreign` FOREIGN KEY (`notified_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `notifications_timeline_id_foreign` FOREIGN KEY (`timeline_id`) REFERENCES `timelines` (`id`),
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `pages_timeline_id_foreign` FOREIGN KEY (`timeline_id`) REFERENCES `timelines` (`id`);

--
-- Constraints for table `page_likes`
--
ALTER TABLE `page_likes`
  ADD CONSTRAINT `page_likes_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`),
  ADD CONSTRAINT `page_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `page_user`
--
ALTER TABLE `page_user`
  ADD CONSTRAINT `page_user_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`),
  ADD CONSTRAINT `page_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `page_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_shared_post_id_foreign` FOREIGN KEY (`shared_post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `posts_timeline_id_foreign` FOREIGN KEY (`timeline_id`) REFERENCES `timelines` (`id`),
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_follows`
--
ALTER TABLE `post_follows`
  ADD CONSTRAINT `post_follows_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_follows_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_media`
--
ALTER TABLE `post_media`
  ADD CONSTRAINT `post_media_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  ADD CONSTRAINT `post_media_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `post_reports`
--
ALTER TABLE `post_reports`
  ADD CONSTRAINT `post_reports_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_reports_reporter_id_foreign` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_shares`
--
ALTER TABLE `post_shares`
  ADD CONSTRAINT `post_shares_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_shares_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_tags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD CONSTRAINT `saved_posts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `saved_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `saved_timelines`
--
ALTER TABLE `saved_timelines`
  ADD CONSTRAINT `saved_timelines_timeline_id_foreign` FOREIGN KEY (`timeline_id`) REFERENCES `timelines` (`id`),
  ADD CONSTRAINT `saved_timelines_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `timelines`
--
ALTER TABLE `timelines`
  ADD CONSTRAINT `timelines_avatar_id_foreign` FOREIGN KEY (`avatar_id`) REFERENCES `media` (`id`),
  ADD CONSTRAINT `timelines_background_id_foreign` FOREIGN KEY (`background_id`) REFERENCES `media` (`id`),
  ADD CONSTRAINT `timelines_cover_id_foreign` FOREIGN KEY (`cover_id`) REFERENCES `media` (`id`);

--
-- Constraints for table `timeline_reports`
--
ALTER TABLE `timeline_reports`
  ADD CONSTRAINT `timeline_reports_reporter_id_foreign` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `timeline_reports_timeline_id_foreign` FOREIGN KEY (`timeline_id`) REFERENCES `timelines` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_affiliate_id_foreign` FOREIGN KEY (`affiliate_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_timeline_id_foreign` FOREIGN KEY (`timeline_id`) REFERENCES `timelines` (`id`);

--
-- Constraints for table `user_ratings`
--
ALTER TABLE `user_ratings`
  ADD CONSTRAINT `user_ratings_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_ratings_ibfk_3` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallpapers`
--
ALTER TABLE `wallpapers`
  ADD CONSTRAINT `wallpapers_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
