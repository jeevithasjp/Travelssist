-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2023 at 01:09 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourism_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `title`, `content`, `created_at`) VALUES
(7, 'avd', 'aa', '2023-07-08 16:46:02'),
(8, '', '', '2023-07-17 10:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `blog_videos`
--

CREATE TABLE `blog_videos` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_videos`
--

INSERT INTO `blog_videos` (`id`, `post_id`, `title`, `video_url`, `created_at`) VALUES
(7, 7, 'avd', 'uploads/WhatsApp 2023-01-18 22-10-35.mp4', '2023-07-08 16:46:02'),
(8, 8, '', 'uploads/', '2023-07-17 10:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `book_list`
--

CREATE TABLE `book_list` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `package_id` int(30) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending,1=confirm, 2=cancelled\r\n',
  `schedule` date DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_list`
--

INSERT INTO `book_list` (`id`, `user_id`, `package_id`, `status`, `schedule`, `date_created`) VALUES
(35, 7, 11, 3, '2023-07-10', '2023-07-06 19:37:39'),
(36, 7, 11, 0, '2023-07-22', '2023-07-06 19:38:17'),
(37, 7, 11, 2, '2023-07-07', '2023-07-06 19:51:29'),
(38, 7, 9, 3, '2023-07-07', '2023-07-06 21:58:27'),
(39, 7, 12, 2, '2023-07-12', '2023-07-10 17:39:44'),
(40, 7, 13, 3, '2023-07-17', '2023-07-17 15:47:26'),
(41, 7, 13, 2, '2023-07-18', '2023-07-17 16:01:49');

-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

CREATE TABLE `inquiry` (
  `id` int(30) NOT NULL,
  `name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiry`
--

INSERT INTO `inquiry` (`id`, `name`, `email`, `subject`, `message`, `status`, `date_created`) VALUES
(6, 'asdasd', 'asdasd@asdasd.com', 'asdasd', 'asdasd', 1, '2021-06-19 10:19:27'),
(8, 'pan', 'manju@gmail.com', 'hhh', 'mmm', 1, '2023-06-29 21:45:10'),
(9, 'Jeevitha', 'jeevithasjp12345@gmail.com', 'About the transportation', 'it would be nice if there was interactive maps added ', 0, '2023-07-17 16:10:37');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(30) NOT NULL,
  `title` text DEFAULT NULL,
  `tour_location` text DEFAULT NULL,
  `cost` double NOT NULL,
  `description` text DEFAULT NULL,
  `upload_path` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 =active ,2 = Inactive',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `title`, `tour_location`, `cost`, `description`, `upload_path`, `status`, `date_created`) VALUES
(9, 'North India Package1', 'Delhi (Red fort, India Gate, Taj Mahal), Rajasthan( Mt. Abu, Udaipur, Jaipur), Haryana', 34000, '&lt;h3&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: &amp;quot;Comic Sans MS&amp;quot;; font-size: 18px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;&lt;b&gt;&lt;i&gt;Experience the best of North India with the Golden Triangle Tour. This 6-day and 5-night tour takes you on a journey through the historical and cultural wonders of Delhi, Agra, and Jaipur.&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/h3&gt;&lt;h3&gt;&lt;br&gt;&lt;/h3&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;First day: Delhi Visit&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Explore the magnificent Red Fort and witness its grandeur.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Pay homage to India Gate, a war memorial dedicated to Indian soldiers&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Visit the iconic Taj Mahal in Agra, one of the Seven Wonders of the World&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Enjoy shopping in the vibrant local bazaars&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Breakfast and dinner will be provided at The Pink Hotel. (Morning check-in for luggage storage)&lt;/span&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Day 2: Travel to Rajasthan ( Train :20473 Chetak Express 7:52pm - 7:50pm)&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Discover the enchanting Udaipur Palace and immerse yourself in its architectural beauty&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Relax and enjoy the serene Udaipur Lake.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Breakfast and dinn&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;﻿&lt;/span&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;er will be served with a beautiful lake view at Lake View Hotel. (Morning check-in, next day check-out by 9 AM)&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Day3: Mt Abu ( Train: 12990 - AII DDR EXPRESS 10:23am - 11:05am)&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Embark on a trek and admire the breathtaking views of Mt Abu&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Witness the mesmerizing sunset over the hills&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Enjoy lunch and dinner at HillLock Hotel.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Day 4: Jaipur (Train :12915 - ASHRAM EXPRESS 10:35pm - 4:20am)&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Explore the captivating city of Jaipur and visit its famous attractions&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Breakfast and lunch will be served at Hotel Golden Heritage. Overnight stay.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Day 5: Travel to Haryana(Train :09635 Jaipur - Rewari Specia&lt;span style=&quot;color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: medium; text-wrap: nowrap;&quot;&gt;l&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;9:21am - 1:50pm )&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Discover the vibrant cities of Faridabad and Gurgaon in Haryana&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Enjoy dinner and a comfortable stay at Hotel Royal.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Day 6: One day in Hans Resort&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Spend a day of relaxation and rejuvenation at Hans Resort.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;This tour offers a perfect blend of history, culture, and natural beauty, providing you with unforgettable memories.&#039;);&lt;/p&gt;', 'uploads/package_9', 1, '2023-06-21 17:53:57'),
(10, 'Haryana ', 'Gurgaon, Kurukshetra, Faridabad, Panipat', 26000, '&lt;p&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family: &amp;quot;Comic Sans MS&amp;quot;;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;background-color: rgb(247, 247, 248); color: rgb(55, 65, 81); font-family: &amp;quot;Comic Sans MS&amp;quot;; font-size: 16px; white-space-collapse: preserve;&quot;&gt;Embark on a fascinating journey through the vibrant cities and historical sites of Gurgaon, Faridabad, Panipat, and Kurukshetra. This 4-day tour will take you on an immersive cultural and historical exploration of these captivating destinations in the state of Haryana, India&lt;/span&gt;&lt;span style=&quot;background-color: rgb(247, 247, 248); color: rgb(55, 65, 81); font-family: &amp;quot;Comic Sans MS&amp;quot;; font-size: 16px; white-space-collapse: preserve;&quot;&gt;.&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Comic Sans MS&amp;quot;;&quot;&gt;&lt;b&gt;&lt;i&gt;      On the final day, you&#039;ll travel to Kurukshetra, a legendary land associated with the epic Mahabharata. Experience the serenity of Brahma Sarovar, delve into the teachings of Lord Krishna at Jyotisar, and pay homage at Bhishma Kund. Immerse yourself in the spiritual and cultural heritage of Kurukshetra before concluding your journey.&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;background-color: rgb(247, 247, 248); color: rgb(55, 65, 81); font-family: &amp;quot;Comic Sans MS&amp;quot;; font-size: 16px; white-space-collapse: preserve;&quot;&gt;&lt;b&gt;&lt;i&gt;      Throughout the tour, you&#039;ll be accompanied by the comfort of private transportation and relish delicious meals at each destination. Get ready to delve into the rich history, spirituality, and natural beauty of these captivating cities in Haryana&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;background-color: rgb(247, 247, 248); color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve;&quot;&gt;.&lt;/span&gt;Day1:&amp;nbsp;Gurgaon&amp;nbsp;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Damdama Lake: Enjoy the serene beauty of Damdama Lake and engage in activities like boating and kayaking&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Manesar: Explore the town of Manesar and visit its attractions and landmarks.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Breakfast and Dinner: Enjoy delicious meals at Treebo Trend Sai Village, your accommodation for the night.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Day 2: Faridabad (Train: Manesar to Faridabad 8:37am- 11:45am Amritsar-Indore Express)&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Baba Farid&#039;s Tomb: Visit the mausoleum of Baba Farid, a revered Sufi saint&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Camp Dhauj Lake: Experience adventure activities like rock climbing and rappelling at Camp Dhauj Lake.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;font color=&quot;#374151&quot; face=&quot;S&ouml;hne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji&quot;&gt;&lt;span style=&quot;font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Enjoy local street food.&lt;/span&gt;&lt;/font&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Day :3&amp;nbsp;Panipat( Train: Faridabad to Panipat&amp;nbsp; 8:30pm - 11:37pm Jhelum Express)&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Tomb of Bu-Ali Shah Kalandar: Pay homage at the tomb of Bu-Ali Shah Kalandar, a Sufi saint.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Kabuli Bagh Mosque: Visit the historic Kabuli Bagh Mosque, known for its architectural beauty.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Devi Temple: Seek blessings at the Devi Temple in Panipat&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Shopping: Explore local markets and indulge in shopping for traditional items.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Breakfast and Dinner: Relish meals at Hotel Abinandan, your accommodation for two nights.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Day 4: Kurukshetra (Train: Panipat to Kurukshetra 8:51am - 9:32am Kalka Shatabdi Express)&amp;nbsp;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Brahma Sarovar: Visit the sacred Brahma Sarovar, a holy water tank in Kurukshetra&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Jyotisar: Explore Jyotisar, the birthplace of the Bhagavad Gita.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Bhishma Kund: Visit Bhishma Kund, a revered site associated with the Mahabharata.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Krishna Museum: Learn about Lord Krishna and his teachings at the Krishna Museum.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Shopping: Enjoy shopping for handicrafts and souvenirs in Kurukshetra.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/package_10', 1, '2023-06-21 19:53:23'),
(11, 'Jammu and Kashmir', 'Pahalgam, Gulmarg, Srinagar, Sanarmarg', 43000, '&lt;p&gt;Day1: Srinagar&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Shankaracharya Temple&lt;/li&gt;&lt;li&gt;Nishat Bagh&lt;/li&gt;&lt;li&gt;Dal Lake&lt;/li&gt;&lt;li&gt;Stay, Breakfast and Dinner in Houseboat Altaf (Dal Lake)&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Day 2:Pahalgam (Cab can be booked by contacting)&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Betaab Valley&lt;/li&gt;&lt;li&gt;Kolahoi Glacier&lt;/li&gt;&lt;li&gt;Lolab Valley&lt;/li&gt;&lt;li&gt;Camping and Dinner in Exploring Kashmir Tours and Treks&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Day 3:Gulmarg&amp;nbsp;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;(Cab can be booked by contacting)&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Gulmarg Gondala&lt;/span&gt;&lt;/li&gt;&lt;li&gt;Sledge RIde Gulmarg&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Apharwat Peak&lt;/span&gt;&lt;/li&gt;&lt;li&gt;Breakfast and Dinner in The Khyber Himalayan Resort &amp;amp; Spa&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Day 4:&amp;nbsp;Sanarmarg&amp;nbsp;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;(Cab can be booked by contacting)&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Thajiwas Glacier&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Kashmir Great Lakes Trek&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Breakfast and Dinner in Oswal Cottage&lt;br&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 'uploads/package_11', 1, '2023-06-21 20:13:14'),
(12, 'Exotic Beach Getaway', 'Goa, Lakshadweep Islands, Kerala', 43000, '&lt;p&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: &amp;quot;Comic Sans MS&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;&lt;b&gt;Escape to paradise with our Exotic Beach Getaway tour. Experience the sun, sand, and crystal-clear waters of Goa, Andaman Islands, and Kerala. Spend your days relaxing on pristine beaches, indulging in water sports, and exploring the rich marine life. This 7-day tour is the ultimate beach lover&#039;s dream. No travel charges included u can use your own vehicles, this package include accomdations charges only.&lt;/b&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Day 1 Goa:&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Start your day by visiting Baga Beach, known for its lively atmosphere and water sports activities.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Explore Aguada Fort, a 17th-century Portuguese fort offering panoramic views of the Arabian Sea.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;In the evening, visit the Saturday Night Market in Arpora, where you can shop for souvenirs, clothing, accessories, and more.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Enjoy a delightful stay, lunch, and beachside dinner at Acron Waterfront Resort.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Day 2: Old Goa and journey to Kerala&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Explore the historical sites of Old Goa, including the Church of St. Cajetan and the Archaeological Museum and Portrait Gallery.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;If time permits, make a quick stop at the majestic Dudhsagar Waterfalls.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Leave Goa and embark on your journey to Kerala.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt; &lt;/span&gt;Day 3 :  A quick stop in Udupi&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Take a quick stop in Udupi, known for its famous Krishna Temple.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Spend some time at the beach and enjoy the serene surroundings.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Day 4:  Kochi (Kerala)Day 5: Amritara The Poovath Beachfront Heritage, Fort Kochi (one day relax)&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Visit Cherai Beach, a picturesque stretch of coastline offering pristine sands and tranquil waters.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Explore Mattancherry Palace, also known as the Dutch Palace, famous for its stunning murals and architecture.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Take the Ernakulam-Fort Kochi Ferry to reach your houseboat at Cochin. Enjoy a stay and dinner onboard the houseboat or at Amritara The Poovath Beachfront Heritage in Fort Kochi.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Day 5: &lt;/span&gt;&lt;span style=&quot;color: rgb(33, 42, 48); font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 16px;&quot;&gt;Amritara The Poovath Beachfront Heritage, Fort Kochi (one day relax)&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Take a leisurely day to explore Fort Kochi&#039;s attractions, including the Fort Kochi Viewpoint and the scenic beach.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Enjoy mesmerizing views of sunset and sunrise, and take a peaceful beach walk&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(33, 42, 48); font-family: &amp;quot;TT Hoves Variable&amp;quot;, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, sans-serif; font-size: 16px;&quot;&gt;Day 6: Kochi to Agatti lsland (Flight Alliance ari included in the package 1hr 25 min 9:10-10:35)&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Take a flight from Kochi to Agatti Island (included in the package). The flight duration is approximately 1 hour and 25 minutes (&lt;/span&gt;9:10-10:35)&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Explore the beautiful lagoon of Agatti Island and indulge in activities like snorkeling and diving at Ammathi Suuba Dive.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Stay at the Agatti Island Beach Resort, where you can relax and enjoy the island vibes.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;day 7: &lt;/span&gt;&lt;span style=&quot;background-color: rgb(247, 247, 248); color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve;&quot;&gt; Return to Kochi&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Head back to Kochi and conclude your tour with wonderful memories of your beach getaway.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/package_12', 1, '2023-07-09 18:21:17');
INSERT INTO `packages` (`id`, `title`, `tour_location`, `cost`, `description`, `upload_path`, `status`, `date_created`) VALUES
(13, 'Backwaters Bliss', 'Kerala Backwaters', 13500, '&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: &amp;quot;Comic Sans MS&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;&lt;b&gt;&lt;i&gt;Experience the serenity of Kerala&#039;s backwaters with our Backwaters Bliss tour. Cruise along the tranquil backwaters in a traditional houseboat, surrounded by lush greenery and picturesque landscapes. Indulge in local cuisine, witness traditional performances, and immerse yourself in the peaceful ambiance. This 3-day tour promises relaxation and rejuvenation&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;Day 1:&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 18px;&quot;&gt;Kerala Backwater Houseboat Day Cruise in Aleppey (6 hrs )&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;background-color: rgb(247, 247, 248); color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve;&quot;&gt;Hotel pickup in Fort Kochi, Wellingdon Island, Kundanoor, or Ernakulam MG Road. A private air-conditioned vehicle will pick you upi. After the houseboat cruise, you will be dropped off at Fort Kochi as well. The private vehicle ensures a comfortable and convenient transportation experience throughout the tour.&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;font-size: var(--viator-font-size-title-02); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 600; color: rgb(0, 0, 0); font-family: Aeonik, Helvetica, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; font-weight: 400; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Deluxe or standard non-AC houseboat for a relaxing backwater cruise in Alleppey. Enjoy the scenic views and serenity of the backwaters.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=&quot;font-size: var(--viator-font-size-title-02); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 600; color: rgb(0, 0, 0); font-family: Aeonik, Helvetica, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; font-weight: 400; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Lunch will be served on the houseboat.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=&quot;font-size: var(--viator-font-size-title-02); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 600; color: rgb(0, 0, 0); font-family: Aeonik, Helvetica, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; font-weight: 400; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;After the cruise, drop to Fort Kochi.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(0, 0, 0); font-family: Aeonik, Helvetica, Arial, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(0, 0, 0); font-family: Aeonik, Helvetica, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;font-size: 18px; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Day 1: F&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;﻿&lt;/span&gt;&lt;span style=&quot;font-size: 18px; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;ort Kochi&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(0, 0, 0); font-family: Aeonik, Helvetica, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Exploring attractions like Vasco da Gama Square and the Fort Kochi Viewpoint.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(0, 0, 0); font-family: Aeonik, Helvetica, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Stay overnight and have dinner at The Tower House, a 17th-century heritage hotel in Fort Kochi.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;Day 2: Kerala Backwater Cruise (Kochi to Ernakulam, Boat Jetty to Janatha Junction)&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Embark on a two-night, two-day backwater cruise experience.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Enjoy the enchanting beauty of the backwaters as you cruise along the tranquil waterways&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Witness the picturesque landscapes, coconut groves, and traditional village life.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Experience the local culture and traditions through performances onboard the houseboat.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Indulge in delicious Kerala cuisine prepared by the onboard chef.&lt;/span&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Stay overnight on the houseboat&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;background-color: rgb(247, 247, 248); color: rgb(55, 65, 81); font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 18px; white-space-collapse: preserve;&quot;&gt;Day &lt;/span&gt;&lt;span style=&quot;font-size: 18px; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;﻿&lt;/span&gt;&lt;span style=&quot;background-color: rgb(247, 247, 248); color: rgb(55, 65, 81); font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 18px; white-space-collapse: preserve;&quot;&gt;3:&lt;/span&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;﻿&lt;/span&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Continue your backwater cruise and savor the final moments of tranquility.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Disembark from the houseboat and travel back to Fort Kochi.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Conclude your tour with beautiful memories of the serene backwaters of Kerala.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;font color=&quot;#374151&quot; face=&quot;S&ouml;hne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji&quot;&gt;&lt;span style=&quot;font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);&quot;&gt;Enjoy your trip..!&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;', 'uploads/package_13', 1, '2023-07-09 19:09:33');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`id`, `package_id`, `username`, `name`, `card_number`, `expiry_date`, `cvv`, `created_at`) VALUES
(22, 11, 'JEEVItha', 'Jeevitha p', '597615973694', '2024-08-06', '897', '2023-07-06 14:07:39'),
(28, 9, 'JEEVItha', 'jeevi', '789632541987', '2024-07-12', '987', '2023-07-06 16:28:27'),
(29, 12, 'j', 'pan', '78945612396', '2023-07-11', '789', '2023-07-10 12:09:38'),
(30, 12, 'j', 'pan', '78945612396', '2023-07-11', '789', '2023-07-10 12:09:44'),
(31, 12, 'JEEVItha', '78', '8', '2023-07-11', '8', '2023-07-10 12:26:22'),
(32, 13, 'JEEVItha', 'Jeevitha P', '56985623147', '2025-08-17', '784', '2023-07-17 10:17:07'),
(33, 13, 'JEEVItha', 'Jeevitha P', '56985623147', '2025-08-17', '784', '2023-07-17 10:17:25'),
(34, 13, 'JEEVItha', 'Jeevitha p', '56987451396', '2025-08-17', '897', '2023-07-17 10:31:42'),
(35, 13, 'JEEVItha', 'Jeevitha p', '56987451396', '2025-08-17', '897', '2023-07-17 10:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `rate_review`
--

CREATE TABLE `rate_review` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `package_id` int(30) NOT NULL,
  `rate` int(11) NOT NULL,
  `review` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rate_review`
--

INSERT INTO `rate_review` (`id`, `user_id`, `package_id`, `rate`, `review`, `date_created`) VALUES
(3, 5, 8, 5, '<p>Sample</p>', '2021-06-19 11:53:16'),
(4, 5, 8, 3, '&lt;p&gt;Sample feedback only&lt;/p&gt;', '2021-06-19 13:49:26'),
(5, 1, 9, 4, '&lt;p&gt;Only draw back is the transportation&lt;/p&gt;', '2023-07-01 17:51:08'),
(6, 7, 13, 4, '&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Arial Black&amp;quot;;&quot;&gt;Kerala:&lt;/span&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;&lt;i&gt;&lt;u&gt;It was a nice trip.&lt;/u&gt;&lt;/i&gt;&lt;/li&gt;&lt;/ol&gt;', '2023-07-17 16:08:37');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'TRAVELSSIST'),
(6, 'short_name', 'Travel Guide Website'),
(11, 'logo', 'uploads/1687526580_images.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1687352640_mainimg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `travel_planner`
--

CREATE TABLE `travel_planner` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `suggestion` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Not Reviewed, 1 = Reviewed',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1620201300_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-18 16:47:05'),
(6, 'Jeevitha ', 'P', 'JEEVI', '02a094ab7855ff2835184d4ba18e0c58', NULL, NULL, 0, '2023-06-18 21:51:43', NULL),
(7, 'Jeevitha ', 'P', 'JEEVItha', '48279488612f398cef851d59e6d7715a', 'uploads/1688659800_SKM_9822.JPG', NULL, 0, '2023-06-18 21:53:17', '2023-07-06 21:40:43'),
(9, 'Jane ', 'Smith', 'janesmith', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, 0, '2023-07-09 16:06:07', NULL),
(10, 'Michael', 'Johnson', 'michaeljohnson', 'b9ab194ad321cfa1349ff008191f9176', NULL, NULL, 0, '2023-07-09 16:06:42', NULL),
(11, ' Emily', 'Brown', 'emilybrown', '2138cb5b0302e84382dd9b3677576b24', NULL, NULL, 0, '2023-07-09 16:08:04', NULL),
(12, 'David', 'Wilson', 'davidwilson', '0cf0607937013cb58d79a7d3c59d4e11', NULL, NULL, 0, '2023-07-09 16:08:33', NULL),
(13, 'Jeevitha', 'p', 'jeevitha p', '653be0aa3f3956beebb3a891fc99991a', NULL, NULL, 0, '2023-07-17 15:36:22', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_videos`
--
ALTER TABLE `blog_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `book_list`
--
ALTER TABLE `book_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `rate_review`
--
ALTER TABLE `rate_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `travel_planner`
--
ALTER TABLE `travel_planner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `blog_videos`
--
ALTER TABLE `blog_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `book_list`
--
ALTER TABLE `book_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `inquiry`
--
ALTER TABLE `inquiry`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `rate_review`
--
ALTER TABLE `rate_review`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `travel_planner`
--
ALTER TABLE `travel_planner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_videos`
--
ALTER TABLE `blog_videos`
  ADD CONSTRAINT `blog_videos_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`);

--
-- Constraints for table `travel_planner`
--
ALTER TABLE `travel_planner`
  ADD CONSTRAINT `travel_planner_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
