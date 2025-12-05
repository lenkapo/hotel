-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2025 at 09:33 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `alus_g`
--

CREATE TABLE `alus_g` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `alus_g`
--

INSERT INTO `alus_g` (`id`, `name`, `description`) VALUES
(1, 'admin', 'testaa');

-- --------------------------------------------------------

--
-- Table structure for table `alus_gd`
--

CREATE TABLE `alus_gd` (
  `agd_id` int(11) NOT NULL,
  `ag_id` int(11) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `table_is_filter` int(11) DEFAULT NULL,
  `table_where` varchar(50) DEFAULT NULL,
  `table_filter` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `alus_gd`
--

INSERT INTO `alus_gd` (`agd_id`, `ag_id`, `enabled`, `table_name`, `table_is_filter`, `table_where`, `table_filter`) VALUES
(1, 1, 1, 'Test Maul', NULL, NULL, '+1++2++3++5++7+'),
(2, 2, 1, 'tesst', NULL, NULL, '+24+'),
(4, 14, 1, 'teest', NULL, NULL, '+1+'),
(5, 15, 1, 'teest', NULL, NULL, NULL),
(6, 28, 1, 'teest', NULL, NULL, NULL),
(7, 17, 1, 'teest', NULL, NULL, NULL),
(8, 16, 1, 'teest', NULL, NULL, NULL),
(9, 27, 1, 'teest', NULL, NULL, NULL),
(10, 30, 1, 'teest', NULL, NULL, NULL),
(11, 29, 1, 'teest', NULL, NULL, NULL),
(12, 21, 1, 'Ma', NULL, NULL, '+2++10+'),
(13, 20, 1, 'teest', NULL, NULL, NULL),
(14, 22, 1, 'teest', NULL, NULL, NULL),
(15, 31, 1, 'teest', NULL, NULL, NULL),
(17, 24, 1, 'teest', NULL, NULL, '+49++50++51+'),
(18, 25, 1, 'teest', NULL, NULL, NULL),
(19, 26, 1, 'teest', NULL, NULL, '+5+'),
(20, 18, 1, 'teest', NULL, NULL, '+3+'),
(21, 23, 1, 'teest', NULL, NULL, '+234+'),
(22, 33, 1, 'teest', NULL, NULL, NULL),
(23, 34, 1, 'teest', NULL, NULL, NULL),
(25, 88, 1, 'Tables', NULL, NULL, '+1++5++49++50+'),
(26, 89, 1, 'Tables', NULL, NULL, '+5+'),
(27, 86, 1, 'maulanaaaaa', NULL, NULL, '+1+');

-- --------------------------------------------------------

--
-- Table structure for table `alus_la`
--

CREATE TABLE `alus_la` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `alus_mg`
--

CREATE TABLE `alus_mg` (
  `menu_id` int(11) NOT NULL,
  `menu_parent` int(11) NOT NULL,
  `menu_nama` varchar(255) NOT NULL,
  `menu_uri` varchar(255) NOT NULL,
  `menu_target` varchar(255) DEFAULT NULL,
  `menu_icon` varchar(25) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `alus_mg`
--

INSERT INTO `alus_mg` (`menu_id`, `menu_parent`, `menu_nama`, `menu_uri`, `menu_target`, `menu_icon`, `order_num`) VALUES
(11, 30, 'Menus', 'menus', '', 'fa fa-bars fa-fw', 1),
(12, 30, 'Group', 'group', '', 'fa fa-book fa-fw', 2),
(13, 30, 'User', 'users', '', 'fa fa-book fa-fw', 3),
(30, 0, 'Master', '#', '', 'fa fa-bars fa-fw', 1),
(80, 0, 'Kategori Film', 'data_kategori_film', '', 'fa fa-bookmark fa-fw', 1),
(81, 0, 'Film', 'data_film', '', 'fa fa-database fa-fw', 2),
(82, 0, 'Komentar', 'data_comments', '', 'fa fa-comments fa-fw', 3),
(83, 0, 'Review', 'data_reviews', '', 'fa fa-star-half-empty fa-', 4),
(84, 0, 'Check In / Check Out', '#', '', 'fa fa-fax fa-fw', 5),
(85, 84, 'Check In', 'check_in', '', 'fa fa-calendar-plus-o fa-', 5),
(86, 84, 'Check Out', 'check_out', '', 'fa fa-calendar-check-o fa', 5),
(87, 0, 'Data Room', 'Data_room', '', 'fa fa-hotel fa-fw', 5);

-- --------------------------------------------------------

--
-- Table structure for table `alus_mga`
--

CREATE TABLE `alus_mga` (
  `id` int(11) NOT NULL,
  `id_group` mediumint(8) UNSIGNED NOT NULL,
  `id_menu` int(11) NOT NULL,
  `can_view` int(11) DEFAULT NULL,
  `can_edit` int(11) NOT NULL DEFAULT 0,
  `can_add` int(11) NOT NULL DEFAULT 0,
  `can_delete` int(11) NOT NULL DEFAULT 0,
  `psv` datetime DEFAULT NULL,
  `pev` datetime DEFAULT NULL,
  `psed` datetime DEFAULT NULL,
  `peed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `alus_mga`
--

INSERT INTO `alus_mga` (`id`, `id_group`, `id_menu`, `can_view`, `can_edit`, `can_add`, `can_delete`, `psv`, `pev`, `psed`, `peed`) VALUES
(3357, 10, 11, 0, 0, 0, 0, '1970-01-01 12:00:00', '1970-01-01 12:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(3358, 10, 12, 0, 0, 0, 0, '1970-01-01 12:00:00', '1970-01-01 12:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(3359, 10, 13, 0, 0, 0, 0, '1970-01-01 12:00:00', '1970-01-01 12:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(3366, 10, 30, 0, 0, 0, 0, '1970-01-01 12:00:00', '1970-01-01 12:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(3685, 9, 11, 0, 0, 0, 0, '1970-01-01 12:00:00', '1970-01-01 12:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(3686, 9, 30, 1, 0, 0, 0, '1970-01-01 12:00:00', '1970-01-01 12:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(3687, 9, 12, 1, 0, 0, 0, '1970-01-01 12:00:00', '1970-01-01 12:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(3688, 9, 13, 1, 0, 0, 0, '1970-01-01 12:00:00', '1970-01-01 12:00:00', '1970-01-01 00:00:00', '1970-01-01 00:00:00'),
(3911, 1, 30, 1, 0, 0, 0, '2016-09-06 10:55:00', '2016-09-06 10:56:00', '2016-08-08 12:06:00', '2016-08-08 12:06:00'),
(3912, 1, 11, 1, 1, 1, 1, '2016-09-06 10:55:00', '2016-09-06 10:55:00', '2016-08-08 12:06:00', '2016-08-09 13:50:00'),
(3913, 1, 12, 1, 1, 1, 1, '2016-09-06 10:55:00', '2016-09-06 10:55:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00'),
(3914, 1, 13, 1, 1, 1, 1, '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00'),
(3915, 1, 80, 0, 1, 1, 1, '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00'),
(3916, 1, 81, 0, 1, 1, 1, '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00'),
(3917, 1, 82, 0, 1, 1, 1, '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00'),
(3918, 1, 83, 0, 1, 1, 1, '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00'),
(3919, 1, 84, 1, 1, 1, 1, '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00'),
(3920, 1, 85, 1, 1, 1, 1, '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00'),
(3921, 1, 86, 1, 1, 1, 1, '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00'),
(3922, 1, 87, 1, 1, 1, 1, '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00', '1970-01-01 01:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `alus_u`
--

CREATE TABLE `alus_u` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `abc` varchar(100) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `ghi` varchar(255) NOT NULL,
  `def` varchar(255) DEFAULT NULL,
  `mno` varchar(40) DEFAULT NULL,
  `jkl` varchar(40) DEFAULT NULL,
  `stu` int(10) UNSIGNED DEFAULT NULL,
  `pqr` varchar(40) DEFAULT NULL,
  `created_on` int(10) UNSIGNED NOT NULL,
  `last_login` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `ht` int(11) DEFAULT 0,
  `picture` varchar(255) DEFAULT NULL,
  `mdo_id` int(11) DEFAULT NULL,
  `mos_id` int(11) DEFAULT NULL,
  `grup_type` int(11) DEFAULT NULL,
  `bpd_id` int(11) DEFAULT NULL,
  `bpd_id_2` int(11) DEFAULT NULL,
  `staff_pmk_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `alus_u`
--

INSERT INTO `alus_u` (`id`, `username`, `job_title`, `abc`, `ip_address`, `ghi`, `def`, `mno`, `jkl`, `stu`, `pqr`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `ht`, `picture`, `mdo_id`, `mos_id`, `grup_type`, `bpd_id`, `bpd_id_2`, `staff_pmk_id`) VALUES
(64, 'admins', 'admins', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+5Kixew57njDPeg==', '::1', '$2y$08$Y5.LjSOPwGWhCGeoOPaFWemoMrza3Ikbp2/f0D1EYxdbIammngXxO', 'xEfWFClsAdO4BnNm', '', NULL, 1764920936, '', 1469523580, 1764920950, 1, 'User', '', '', '11', 0, '1496118042.jpg', NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'BAGIAN PERLENGKAPAN', 'BAGIAN PERLENGKAPAN', 'MTIzNDU2Nzg5MDEyMzQ1NsGuoJM/yqy8eAN68DTNdlID3W0pjA==', '::1', '$2y$08$JoKZ4fv6BkH5WTWLwW9IfulZAbwPRhawSu5/basXlOukNzemXJuqS', 'Ih49EoG2nF0Zt38O', NULL, NULL, NULL, NULL, 1542868077, 1550670091, 1, 'BAGIAN PERLENGKAPAN', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 1, NULL, NULL, NULL, NULL),
(66, 'DINAS PENDIDIKAN', 'DINAS PENDIDIKAN', 'MTIzNDU2Nzg5MDEyMzQ1Nv2quZ4/3a+0fSdy3TLJexUMnGM=', '::1', '$2y$08$VUKn/N/Oz3h/8IB7somj3ODzqJ3cGYVnLbUw/QESB9MVhCV.zeInG', 'Qoc9aAIiYkGjg9IZ', NULL, NULL, NULL, NULL, 1542868087, 1550991198, 1, 'DINAS PENDIDIKAN', '', NULL, '0', 0, 'avatar_default.png', NULL, 2, NULL, NULL, NULL, NULL),
(67, 'KECAMATAN KAYAN HULU', 'KECAMATAN KAYAN HULU', 'MTIzNDU2Nzg5MDEyMzQ1Nva5/Iwiy6i5IlBV1z7BfldBkGEr', '::1', '$2y$08$amSFXmE4w705SSYY562IM.wr5fvtERPp7sXIFyi04MgZVY2rEhMXS', 'rrptJbn3YVDGJGOF', NULL, NULL, NULL, NULL, 1542868107, 1549440969, 1, 'KECAMATAN KAYAN HULU', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 3, NULL, NULL, NULL, NULL),
(68, 'KECAMATAN MALINAU SELATAN HULU', 'KECAMATAN MALINAU SELATAN HULU', 'MTIzNDU2Nzg5MDEyMzQ1Nvqlppk5z7y8ckkjghPHeloGnyAljoA=', '::1', '$2y$08$54yXxiB4w4TpZrfS8E4k2.8h24NaIjW9txSJQJ5lTnpmT9b.Rbqpi', 'Ftr/Tmqyey/I30FI', NULL, NULL, NULL, NULL, 1542868115, 1551275597, 1, 'KECAMATAN MALINAU SELATAN HULU', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 4, NULL, NULL, NULL, NULL),
(69, 'KECAMATAN MALINAU KOTA', 'KECAMATAN MALINAU KOTA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqlppk5z7y8cidy3TLJexUMnGM=', '::1', '$2y$08$El7EPObwt.3SXLXC/Ra/Pe038PDY5nrJWQJ0Ol8H9dwGC.rU45Ed6', '60TGEWENwJbU2E.t', NULL, NULL, NULL, NULL, 1542868123, 1549271960, 1, 'KECAMATAN MALINAU KOTA', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 5, NULL, NULL, NULL, NULL),
(70, 'BADAN PERENCANAAN PEMBANGUNAN DAERAH DAN LITBANG', 'BADAN PERENCANAAN PEMBANGUNAN DAERAH DAN LITBANG', 'MTIzNDU2Nzg5MDEyMzQ1Nvqlppk5z7y8ckkn8DTNdlID3W0pjA==', '::1', '$2y$08$rxv1uLfYNkY6rsWG1FUF0eO5ai0o0b/yahX1H1cgxKRmRyCVGkKJ6', 'nZnOhCQn1ho5dbWZ', NULL, NULL, NULL, NULL, 1542868130, NULL, 1, 'BADAN PERENCANAAN PEMBANGUNAN DAERAH DAN LITBANG', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 6, NULL, NULL, NULL, NULL),
(71, 'DINAS PERHUBUNGAN', 'DINAS PERHUBUNGAN', 'MTIzNDU2Nzg5MDEyMzQ1NuuqvJsjzb2wcRJn1T3gcFYOmmJogoKq', '::1', '$2y$08$/KMY9ZSiaLqSNvbQ60A.Gu.pNmuM.rQMm6y5Fa6pgGz2xTNi/6bUu', 'UHVMoXEIQ1Jdlkc/', NULL, NULL, NULL, NULL, 1542868139, NULL, 1, 'DINAS PERHUBUNGAN', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 7, NULL, NULL, NULL, NULL),
(72, 'BAGIAN PEMBANGUNAN', 'BAGIAN PEMBANGUNAN', 'MTIzNDU2Nzg5MDEyMzQ1NsGuoJM/yqy8eAN68DTNdlID3W0pjA==', '::1', '$2y$08$Drr9MvhHhfK.mbZoJpmHgOGT2V358Y/XYbadXbqBiTBXKHGOgb68i', 'lMsDc82.X6.iY6ni', NULL, NULL, NULL, NULL, 1542868147, NULL, 1, 'BAGIAN PEMBANGUNAN', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 8, NULL, NULL, NULL, NULL),
(73, 'SEKRETARIAT DPRD', 'SEKRETARIAT DPRD', 'MTIzNDU2Nzg5MDEyMzQ1NvGut4oj0buwfVYhg33KdXsOl3wnjIyuxGBuHcI=', '::1', '$2y$08$1HRiU7/MXyYi4HGQtRlsReLbmyYbmRJVQ6WBPNp1ZCLRGmWVBp.c6', 'V.h09FO10yyZpodC', NULL, NULL, NULL, NULL, 1542868153, NULL, 1, 'SEKRETARIAT DPRD', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 9, NULL, NULL, NULL, NULL),
(74, 'BAGIAN ORGANISASI', 'BAGIAN ORGANISASI', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkJid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$ZFbbTqozjtTDp0L4xJAPPen6cBfKf9F.0PSTjVLhM8a/.tNnpgX4q', 'SSH8uLPH3S1ocJ9x', NULL, NULL, NULL, NULL, 1542868160, 1549447873, 1, 'BAGIAN ORGANISASI', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 10, NULL, NULL, NULL, NULL),
(75, 'BAGIAN PENGADAAN BARANG DAN JASA', 'BAGIAN PENGADAAN BARANG DAN JASA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkJyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$ROEnxItEW6Q/Qe4YAn6QuudF6PLNnTsAg5gjkgmQVNvaIs8cusRQG', 'E4/B7vlEUGSBt/9n', NULL, NULL, NULL, NULL, 1542868167, 1549440721, 1, 'BAGIAN PENGADAAN BARANG DAN JASA', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 11, NULL, NULL, NULL, NULL),
(76, 'BAGIAN PENGELOLAAN PERBATASAN NEGARA', 'BAGIAN PENGELOLAAN PERBATASAN NEGARA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkJCd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$gVBcpIGUsBXQXAop6ZbhnO0wkhm4grqUsikYbNzTubdRpsZsVml9i', 'ywaxdj2lO0vyjt5f', NULL, NULL, NULL, NULL, 1542868175, NULL, 1, 'BAGIAN PENGELOLAAN PERBATASAN NEGARA', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 12, NULL, NULL, NULL, NULL),
(79, 'DINAS PERIKANAN', 'DINAS PERIKANAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkIyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$0IY0nl2KkJMVOxNBo.rpTeTDMWI.7oN6XOp2gKqyZ.PG4EzBUMun2', 'ump1Cg244ldPc4np', NULL, NULL, NULL, NULL, 1542868195, NULL, 1, 'DINAS PERIKANAN', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 15, NULL, NULL, NULL, NULL),
(80, 'DINAS PERTANIAN', 'DINAS PERTANIAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkICd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$DQHmsH7zE6xJtd29MauosunPBgqGN2fml8Kn0JMBxrUhSC9gODKSq', 'm/vUH.JoDbyuWmsX', NULL, NULL, NULL, NULL, 1542868201, NULL, 1, 'DINAS PERTANIAN', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 16, NULL, NULL, NULL, NULL),
(81, 'DINAS PERINDUSTRIAN DAN PERDAGANGAN', 'DINAS PERINDUSTRIAN DAN PERDAGANGAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkISd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$AOnWtOtLE9C2kgvmIjZJJeAQPzsy6wUKYzZK14Vnvt7leqcuABjX2', 'KfwQDwpJFcsNEnHH', NULL, NULL, NULL, NULL, 1542868208, NULL, 1, 'DINAS PERINDUSTRIAN DAN PERDAGANGAN', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 17, NULL, NULL, NULL, NULL),
(82, 'DINAS KEBUDAYAAN DAN PARIWISATA', 'DINAS KEBUDAYAAN DAN PARIWISATA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkLid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$ivq3p0FOZP4/vi6kxtYc4ebkKmx3ZPzZa2qzcAXxCF51FPA6wlIz6', 'Hk6r0krOfpMlJQww', NULL, NULL, NULL, NULL, 1542868214, NULL, 1, 'DINAS KEBUDAYAAN DAN PARIWISATA', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 18, NULL, NULL, NULL, NULL),
(83, 'DINAS KEPEMUDAAN DAN OLAHRAGA', 'DINAS KEPEMUDAAN DAN OLAHRAGA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkLyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$R/fA./V3uYPh2xLWLAC0Zedo3Fr/SRSZZNxfW1shSdYvBWOjX5xrK', 'DMIbULsgw0Cd71wb', NULL, NULL, NULL, NULL, 1542868221, NULL, 1, 'DINAS KEPEMUDAAN DAN OLAHRAGA', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 19, NULL, NULL, NULL, NULL),
(84, 'BADAN KEPEGAWAIAN, PENDIDIKAN DAN PELATIHAN', 'BADAN KEPEGAWAIAN, PENDIDIKAN DAN PELATIHAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnJid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$1sTxGiMpQ/0C1KkU3LHbl.frJhweq1zNzA4bRaEFNRRAWp0AVZ8FK', '00k2AC7bWZWFhzE6', NULL, NULL, NULL, NULL, 1542868234, NULL, 1, 'BADAN KEPEGAWAIAN, PENDIDIKAN DAN PELATIHAN', '', NULL, '0', 0, 'avatar_default.png', NULL, 20, NULL, NULL, NULL, 11),
(85, 'BAGIAN TATA PEMERINTAHAN', 'BAGIAN TATA PEMERINTAHAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnJyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$.BDVTDqvas.GZO.l2HLxY.qSUrLwqvYKhOsYdFxPN8fQx39TX2.a6', 'ul0s6PLnTxEx41E2', NULL, NULL, NULL, NULL, 1542868262, NULL, 1, 'BAGIAN TATA PEMERINTAHAN', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 21, NULL, NULL, NULL, NULL),
(86, 'DINAS PEKERJAAN UMUM, PENATAAN RUANG, PERUMAHAN DAN KAWASAN PEMUKIMAN', 'DINAS PEKERJAAN UMUM, PENATAAN RUANG, PERUMAHAN DA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnJCd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$BKgKiiPmmLn.DO4P.TyOrObIK1W6dvSFiU5NQfbw.zQ5SysDqp1Fy', 'flkveMiVlkIYUuGJ', NULL, NULL, NULL, NULL, 1542868271, NULL, 1, 'DINAS PEKERJAAN UMUM, PENATAAN RUANG, PERUMAHAN DA', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 22, NULL, NULL, NULL, NULL),
(87, 'BADAN SATUAN POLISI PAMONG PRAJA DAN PEMADAM KEBAKARAN', 'BADAN SATUAN POLISI PAMONG PRAJA DAN PEMADAM KEBAK', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnJSd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$x.5JfLsBq1G/SBASCV4QROlZvvGJhCcRdJ9fZ4vAqov7eKln6iRk6', '9XDKlgf/4zdQTV1y', NULL, NULL, NULL, NULL, 1542868282, NULL, 1, 'BADAN SATUAN POLISI PAMONG PRAJA DAN PEMADAM KEBAK', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 23, NULL, NULL, NULL, NULL),
(88, 'BADAN KESATUAN BANGSA DAN POLITIK', 'BADAN KESATUAN BANGSA DAN POLITIK', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnIid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$VvC4T1V4iZbnc6qPviK94OXUk9eFX9XYMWHsfEEqkQcgApC6dYs0a', 'umkKYV4x1afVmu.8', NULL, NULL, NULL, NULL, 1542868343, NULL, 1, 'BADAN KESATUAN BANGSA DAN POLITIK', '', NULL, '0', 0, 'avatar_default.png', NULL, 24, NULL, NULL, NULL, NULL),
(89, 'DINAS KETAHANAN PANGAN', 'DINAS KETAHANAN PANGAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnIyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$bSzkJcLMD8wcD9WvDwcnR.y3gtV.tmVf6QzPOld.zxDqC1NHQvNx.', 'yXGdAECGARwCxUer', NULL, NULL, NULL, NULL, 1542868359, NULL, 1, 'DINAS KETAHANAN PANGAN', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 25, NULL, NULL, NULL, NULL),
(90, 'DINAS LINGKUNGAN HIDUP', 'DINAS LINGKUNGAN HIDUP', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnICd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$zfF8fYPmWJWXOgl7o4Ng3.m3iSLK7DCHKFbCNci0kbShDMYljrQ7S', 'CQvIrGTk/.1hhglm', NULL, NULL, NULL, NULL, 1542868370, NULL, 1, 'DINAS LINGKUNGAN HIDUP', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 26, NULL, NULL, NULL, NULL),
(91, 'DINAS KOMUNIKASI DAN INFORMATIKA', 'DINAS KOMUNIKASI DAN INFORMATIKA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnISd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$wj1DM4xogVCf/mPzU5054uUxwBhjF9sByjY.gLEIhYo8RhAMEgvY2', 'oUe.j.CXcGZtxfhX', NULL, NULL, NULL, NULL, 1542868381, NULL, 1, 'DINAS KOMUNIKASI DAN INFORMATIKA', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 27, NULL, NULL, NULL, NULL),
(92, 'DINAS PEMBERDAYAAN PEREMPUAN, PERLINDUNGAN ANAK DAN SOSIAL', 'DINAS PEMBERDAYAAN PEREMPUAN, PERLINDUNGAN ANAK DA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnLid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$O.BepJnMjdf34wthDVp3X.GkVXkzyWwOt8L3ZKHuDHPqYd7jCjWkm', 'Sg0zS/LEL1CHLTzd', NULL, NULL, NULL, NULL, 1542868391, NULL, 1, 'DINAS PEMBERDAYAAN PEREMPUAN, PERLINDUNGAN ANAK DA', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 28, NULL, NULL, NULL, NULL),
(93, 'DINAS PEMBERDAYAAN MASYARAKAT DAN DESA', 'DINAS PEMBERDAYAAN MASYARAKAT DAN DESA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnnLyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$znw3goPM9pnMUmpxw/qP1OOgaKk4VC/yzFnBjYtIOY2WbNKmJud4y', '17N73VZ2I3Rn3.rd', NULL, NULL, NULL, NULL, 1542868409, NULL, 1, 'DINAS PEMBERDAYAAN MASYARAKAT DAN DESA', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 29, NULL, NULL, NULL, NULL),
(94, 'DINAS PENANAMAN MODAL, PELAYANAN TERPADU SATU PINTU DAN TENAGA KERJA', 'DINAS PENANAMAN MODAL, PELAYANAN TERPADU SATU PINT', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmJid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$OythoUmfSuJtqq4wyQX6sOhTSgnz5xmIr9MMnwTyf8lA598MF.Exy', 'Wc01LUHcCerdrPyO', NULL, NULL, NULL, NULL, 1542868416, NULL, 1, 'DINAS PENANAMAN MODAL, PELAYANAN TERPADU SATU PINT', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 30, NULL, NULL, NULL, NULL),
(95, 'DINAS KEPENDUDUKAN DAN PENCATATAN SIPIL', 'DINAS KEPENDUDUKAN DAN PENCATATAN SIPIL', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmJyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$NEM0qS9YsaVAKAkXhTQgfevwrXyNKndk08HZOOvCgd3orIaUXzNcW', 'h80dJ/KkQYQeH9CN', NULL, NULL, NULL, NULL, 1542868423, NULL, 1, 'DINAS KEPENDUDUKAN DAN PENCATATAN SIPIL', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 31, NULL, NULL, NULL, NULL),
(96, 'BAGIAN EKONOMI', 'BAGIAN EKONOMI', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmJCd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$2jWtOqgBvOkuX2/OgC9Eo..jiJIrAE9ZvNNDmDIgjgO73Up0blPYS', 'TN0NGU98MIG8wno/', NULL, NULL, NULL, NULL, 1542868432, NULL, 1, 'BAGIAN EKONOMI', '', NULL, '0', 0, 'avatar_default.png', NULL, 32, NULL, NULL, NULL, 11),
(97, 'BAGIAN HUKUM', 'BAGIAN HUKUM', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmJSd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$HJ.ljNJqV8BIxOkT3VylXO97.FOwzh6DWJ5ldDUR8ZZUX.fClZhf.', 'LCYj.c2Mya1PSnl5', NULL, NULL, NULL, NULL, 1542868440, NULL, 1, 'BAGIAN HUKUM', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 33, NULL, NULL, NULL, NULL),
(98, 'BAGIAN HUMAS DAN PROTOKOL', 'BAGIAN HUMAS DAN PROTOKOL', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmIid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$/1AvCTjQiRedBsTzc/aqBuVhIatGD2p13541Emx2CZoDXyP/r186u', 'AUWGK58J0Gjbr6KO', NULL, NULL, NULL, NULL, 1542868447, NULL, 1, 'BAGIAN HUMAS DAN PROTOKOL', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 34, NULL, NULL, NULL, NULL),
(99, 'INSPEKTORAT', 'INSPEKTORAT', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmIyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$WlqpnJ6EwAHs.PJ0q9deoOQa88T3pLVyqHoFZnoxPEYKuNEc6Vmay', 'pIYTiZ3kZYZ8h8hf', NULL, NULL, NULL, NULL, 1542868455, NULL, 1, 'INSPEKTORAT', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 35, NULL, NULL, NULL, NULL),
(100, 'SEKRETARIAT KORPRI', 'SEKRETARIAT KORPRI', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmICd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$Aotlhss7LXzzizLSL4MoPuaX5PkO7NfMb3h4fzYHAJZXcU.0BUjZS', 'swwMvJxq5GGKALBC', NULL, NULL, NULL, NULL, 1542868463, NULL, 1, 'SEKRETARIAT KORPRI', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 36, NULL, NULL, NULL, NULL),
(101, 'DINAS PERPUSTAKAAN DAN KEARSIPAN DAERAH', 'DINAS PERPUSTAKAAN DAN KEARSIPAN DAERAH', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmISd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$Jy9lXjAxawk6aUrrVtXjQelD9LHDDMCfAfK9ac5Kera2d5FK9hiLS', 'WYp8BxWd5OaKaYDy', NULL, NULL, NULL, NULL, 1542868469, 1551275562, 1, 'DINAS PERPUSTAKAAN DAN KEARSIPAN DAERAH', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 37, NULL, NULL, NULL, NULL),
(102, 'BADAN PENGELOLA KEUANGAN DAERAH', 'BADAN PENGELOLA KEUANGAN DAERAH', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnmLid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$ZS6h33lajAZAOkY.DO5.TupwYP.TzxylIA6plz1Tts5zd1aJhZ2tm', '74VeV4Lv8XixiIHJ', NULL, NULL, NULL, NULL, 1542868476, NULL, 1, 'BADAN PENGELOLA KEUANGAN DAERAH', '', NULL, '0', 0, 'avatar_default.png', NULL, 38, NULL, NULL, NULL, NULL),
(104, 'DINAS KESEHATAN, PENGENDALIAN PENDUDUK DAN KELUARGA BERENCANA', 'DINAS KESEHATAN, PENGENDALIAN PENDUDUK DAN KELUARG', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhJid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$R/H2SKoGU.RC1DI5SjDvBOH82iWrv1yhuioerd1LmX39LhCQ2XlF6', '5K3KZUZQS.ym0VPj', NULL, NULL, NULL, NULL, 1542868525, NULL, 1, 'DINAS KESEHATAN, PENGENDALIAN PENDUDUK DAN KELUARG', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 39, NULL, NULL, NULL, NULL),
(105, 'BADAN PENANGGULANGAN BENCANA DAERAH', 'BADAN PENANGGULANGAN BENCANA DAERAH', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhJyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$KtxQ9aH0ZcBayXqIuBJfxuc6cBtSmgQJx8R6vk6pdtl2Jy8n..csm', 'SXX0oB7pWW5UoneL', NULL, NULL, NULL, NULL, 1542868531, NULL, 1, 'BADAN PENANGGULANGAN BENCANA DAERAH', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 40, NULL, NULL, NULL, NULL),
(106, 'BAGIAN UMUM', 'BAGIAN UMUM', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhJCd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$IB9xLxRK8sK4woRk1EU0Y.kZLPcUPoGag40tmp3Qd8kSR4NQvLyTC', 'PVIY9d4vxslZlxfG', NULL, NULL, NULL, NULL, 1542868538, NULL, 1, 'BAGIAN UMUM', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 41, NULL, NULL, NULL, NULL),
(107, 'KECAMATAN MENTARANG', 'KECAMATAN MENTARANG', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhJSd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$iW5Ns.EpVPu2v5x5oSBi3e1s4rpwaLk1.SzrYGaqzXgl5Qu1Jdlgq', 'eWYHreUlwLuY/UQa', NULL, NULL, NULL, NULL, 1542868549, NULL, 1, 'KECAMATAN MENTARANG', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 42, NULL, NULL, NULL, NULL),
(108, 'KECAMATAN MALINAU UTARA', 'KECAMATAN MALINAU UTARA', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhIid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$AWWhTSH7ooH2Iq07QkbJg.Q5SCCrcg/XwkpE7JYG9Gd65YTrWeLkW', 'dOHgt9xCDrpnnsyR', NULL, NULL, NULL, NULL, 1542868556, NULL, 1, 'KECAMATAN MALINAU UTARA', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 43, NULL, NULL, NULL, NULL),
(109, 'KECAMATAN SUNGAI BOH', 'KECAMATAN SUNGAI BOH', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhIyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$pfZT3o.nSaQt.9QwtuG8BuivORQ1FSz9zalR9abKgAejACm0B8TgK', 'kTlvINYpqur.6i5u', NULL, NULL, NULL, NULL, 1542868565, NULL, 1, 'KECAMATAN SUNGAI BOH', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 44, NULL, NULL, NULL, NULL),
(110, 'KECAMATAN BAHAU HULU', 'KECAMATAN BAHAU HULU', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhICd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$IvXDeLYUz.LP5BB.OjmKk.IVoRZ6gD4deykrN0UoMsbPK6InGLk5C', 'sVkZXp038wloNSoU', NULL, NULL, NULL, NULL, 1542868583, NULL, 1, 'KECAMATAN BAHAU HULU', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 45, NULL, NULL, NULL, NULL),
(111, 'KECAMATAN MALINAU BARAT', 'KECAMATAN MALINAU BARAT', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhISd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$ejeDvgtEHd9qhANiyaQQjuxdeM/iWr8xlbcS.7Yy52gV4OMGb/HTW', 'cSrBKWYww3v2iKFh', NULL, NULL, NULL, NULL, 1542868591, NULL, 1, 'KECAMATAN MALINAU BARAT', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 46, NULL, NULL, NULL, NULL),
(112, 'KECAMATAN MALINAU SELATAN', 'KECAMATAN MALINAU SELATAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhLid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$B/8SFxgjdcxSuAMyFVcY5.TXW6Fo8He.ebV7UPH2pYzWRQNxo/3xq', 'Kf7Uy0PttuWeiJCt', NULL, NULL, NULL, NULL, 1542868599, NULL, 1, 'KECAMATAN MALINAU SELATAN', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 47, NULL, NULL, NULL, NULL),
(113, 'KECAMATAN MENTARANG HULU', 'KECAMATAN MENTARANG HULU', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnhLyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$RHAptJ3iHUpA2jZF42mMz.uE.8ESrJjm4U0osA90GreZCSyg//jVK', 'x9o48pPoBaYKvCfy', NULL, NULL, NULL, NULL, 1542868609, NULL, 1, 'KECAMATAN MENTARANG HULU', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 48, NULL, NULL, NULL, NULL),
(114, 'KECAMATAN PUJUNGAN', 'KECAMATAN PUJUNGAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngJid40T/JeVoa3Wkpz4Sj', ' ', '$2y$08$GZ5ZLGrz8hD14lHfI1FCZe8mjNMK62qzYxNDCbkU1b/JLk7JvSebi', 't4J7xSm.XOc3AAPZ', NULL, NULL, NULL, NULL, 1542868617, NULL, 1, 'KECAMATAN PUJUNGAN', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 49, NULL, NULL, NULL, NULL),
(115, 'KECAMATAN KAYAN HILIR', 'KECAMATAN KAYAN HILIR', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngJyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$7a5zc37Kx0NWBi2FvfFMheQ8k1tquwmgtpLe8GjLZxBJ5EeF/Krme', 'jIHOJM2UcRmSEklK', NULL, NULL, NULL, NULL, 1542868625, NULL, 1, 'KECAMATAN KAYAN HILIR', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 50, NULL, NULL, NULL, NULL),
(116, 'KECAMATAN KAYAN SELATAN', 'KECAMATAN KAYAN SELATAN', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngJCd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$yZk0.afzayg9f/p82OfdkOOV8pKXefAoQKKwstppRdLLUBg7ZK2Cm', 'A.rcO02QCognqnL3', NULL, NULL, NULL, NULL, 1542868633, NULL, 1, 'KECAMATAN KAYAN SELATAN', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 51, NULL, NULL, NULL, NULL),
(117, 'KECAMATAN SUNGAI TUBU', 'KECAMATAN SUNGAI TUBU', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngJSd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$xnnKZRlHPnMFktMj6bS1N.zMVpi.b.9CZLdjKMFxgbJVPy9xZC7na', 'GqQ/ZSi/6l3u.lJP', NULL, NULL, NULL, NULL, 1542868640, NULL, 1, 'KECAMATAN SUNGAI TUBU', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 52, NULL, NULL, NULL, NULL),
(118, 'KECAMATAN MALINAU SELATAN HILIR', 'KECAMATAN MALINAU SELATAN HILIR', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngIid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$zfxrHhr9tfi0gULYJkdrIutoMjQ0FwBtiSXA7WzrcJOd6cvadkOs2', 'MnOjvwLzGdWzh8xU', NULL, NULL, NULL, NULL, 1542868647, NULL, 1, 'KECAMATAN MALINAU SELATAN HILIR', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 53, NULL, NULL, NULL, NULL),
(119, 'PERWAKILAN KECAMATAN LONG SULE', 'PERWAKILAN KECAMATAN LONG SULE', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngIyd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$MBqguuIAnPi4o0QU.bQcruaRKwRNr7Y39P85ZeWGM6uVylz12rQTi', '.vziohki/5YWhznl', NULL, NULL, NULL, NULL, 1542868655, NULL, 1, 'PERWAKILAN KECAMATAN LONG SULE', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 54, NULL, NULL, NULL, NULL),
(120, 'KANTOR PERSIAPAN KECAMATAN MALINAU UTARA TIMUR', 'KANTOR PERSIAPAN KECAMATAN MALINAU UTARA TIMUR', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPngICd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$mnbbvXqcDt5Dd0acGTpZrOmT3r5CvVGIhNCmNTNHwVLdl4Rs4v0zW', 'QHQ4H.vyodnM/WlS', NULL, NULL, NULL, NULL, 1542868663, NULL, 1, 'KANTOR PERSIAPAN KECAMATAN MALINAU UTARA TIMUR', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 55, NULL, NULL, NULL, NULL),
(177, 'BAGIAN KESEJAHTERAAN RAKYAT', 'BAGIAN KESEJAHTERAAN RAKYAT', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkJSd40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$xkLqzB427A/DorRTNQkvMuRP9pph.RV4M9iXco4gUaRXZcRjKyTym', 'jcBmBV2Nlp0J7tSu', NULL, NULL, NULL, NULL, 1542868183, NULL, 1, 'BAGIAN KESEJAHTERAAN RAKYAT', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 13, NULL, NULL, NULL, NULL),
(178, 'RSUD', 'RSUD', 'MTIzNDU2Nzg5MDEyMzQ1Nvqvv5U+lPnkIid40T/JeVoa3Wkpz4Sj', '::1', '$2y$08$yL5qQDoWOVqva0R89cPeLeQStYmnzj7kTvtakYMmGdIWVtLdwOqZa', 'JThT5.B3NQRg7qqF', NULL, NULL, NULL, NULL, 1542868189, NULL, 1, 'RSUD', NULL, NULL, '0', 0, 'avatar_default.png', NULL, 14, NULL, NULL, NULL, NULL),
(179, 'htu', 'htu', 'MTIzNDU2Nzg5MDEyMzQ1NvO/p7wxwKS8eEl23z4=', '::1', '$2y$08$hQYzRWoWHwh2UHQK68LcHuENpf3FG2htzkGGLKnAHEtVqgpjrZpjS', 'XMlDVWwcEeqsu1Kc', NULL, NULL, NULL, NULL, 1549439229, 1549439242, 1, 'HTU', '', NULL, '1', 0, 'avatar_default.png', NULL, NULL, NULL, NULL, NULL, NULL),
(180, 'user', 'user', 'MTIzNDU2Nzg5MDEyMzQ1NvaksZcl1Im0cgp83n3DeFY=', '::1', '$2y$08$0E5bLiUXEQKs6Qygvhd.vuBPebbQ/Kw/7N8LcXxRqgNmSVjiLjWo2', 'EVgXZipBo2gr1mmO', NULL, NULL, NULL, NULL, 1565064724, 1565076816, 1, 'User', '', NULL, '1', 0, 'avatar_default.png', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `alus_ug`
--

CREATE TABLE `alus_ug` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `alus_ug`
--

INSERT INTO `alus_ug` (`id`, `user_id`, `group_id`) VALUES
(1, 64, 1);

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `nama_amenity` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `id_hotel`, `nama_amenity`, `deskripsi`, `image`) VALUES
(1, 1, 'Kolam Renang', 'Kolam renang outdoor dengan view laut.', 'pool.jpg'),
(2, 1, 'Gym Center', 'Dilengkapi alat modern dan instruktur profesional.', 'gym.jpg'),
(3, 1, 'Spa & Massage', 'Tempat relaksasi dengan aroma terapi.', 'spa.jpg'),
(4, 1, 'Ruang Meeting', 'Kapasitas hingga 100 orang.', 'meeting.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `detail_reservasi`
--

CREATE TABLE `detail_reservasi` (
  `id` int(11) NOT NULL,
  `reservasi_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `room_name` varchar(255) DEFAULT NULL,
  `guest_count` int(11) NOT NULL DEFAULT 1,
  `price_per_night` decimal(12,2) NOT NULL,
  `nights` int(11) NOT NULL DEFAULT 1,
  `subtotal` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_reservasi`
--

INSERT INTO `detail_reservasi` (`id`, `reservasi_id`, `room_id`, `room_name`, `guest_count`, `price_per_night`, `nights`, `subtotal`) VALUES
(1, 6, 1, 'Standar Room', 2, '0.00', 1, '0.00'),
(2, 7, 1, 'Standar Room', 2, '0.00', 1, '0.00'),
(3, 8, 1, 'Standar Room', 2, '165000.00', 1, '0.00'),
(4, 9, 1, 'Standar Room', 2, '165000.00', 1, '0.00'),
(5, 10, 1, 'Standar Room', 2, '165000.00', 6, '0.00'),
(6, 11, 1, 'Standar Room', 2, '165000.00', 1, '165000.00');

-- --------------------------------------------------------

--
-- Table structure for table `extra_services`
--

CREATE TABLE `extra_services` (
  `id` int(11) NOT NULL,
  `nama_layanan` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `extra_services`
--

INSERT INTO `extra_services` (`id`, `nama_layanan`, `harga`, `gambar`) VALUES
(1, 'Standard Room', 50, '1.jpg'),
(2, 'Deluxe Room', 75, '2.jpg'),
(3, 'Premium Suite', 99, '3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `extra_service_features`
--

CREATE TABLE `extra_service_features` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `fitur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `extra_service_features`
--

INSERT INTO `extra_service_features` (`id`, `service_id`, `fitur`) VALUES
(1, 1, 'Bed & Breakfast'),
(2, 1, 'Home Made Food'),
(3, 1, 'Tour Guide'),
(4, 1, 'Safety & Security'),
(5, 1, 'Local Heritage'),
(6, 2, 'Bed & Breakfast'),
(7, 2, 'Home Made Food'),
(8, 2, 'Airport Pickup'),
(9, 2, 'Free Massage'),
(10, 2, 'Private Balcony'),
(11, 3, 'King Size Bed'),
(12, 3, 'VIP Lounge Access'),
(13, 3, 'Personal Butler'),
(14, 3, 'Free Spa'),
(15, 3, 'Executive Workspace');

-- --------------------------------------------------------

--
-- Table structure for table `fitur`
--

CREATE TABLE `fitur` (
  `id` int(11) NOT NULL,
  `nama_fitur` varchar(100) NOT NULL,
  `ikon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fitur`
--

INSERT INTO `fitur` (`id`, `nama_fitur`, `ikon`) VALUES
(1, 'Free Wifi', 'ri-wifi-line'),
(2, 'Breakfast', 'ri-restaurant-2-line'),
(3, 'Swimming Pool', 'mdi mdi-pool');

-- --------------------------------------------------------

--
-- Table structure for table `fitur_kamar`
--

CREATE TABLE `fitur_kamar` (
  `id` int(11) NOT NULL,
  `id_tipe_kamar` int(11) NOT NULL,
  `id_fitur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fitur_kamar`
--

INSERT INTO `fitur_kamar` (`id`, `id_tipe_kamar`, `id_fitur`) VALUES
(3, 1, 1),
(4, 1, 2),
(5, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `galeri_kamar`
--

CREATE TABLE `galeri_kamar` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_kamar` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `is_cover` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `galeri_kamar`
--

INSERT INTO `galeri_kamar` (`id`, `id_kamar`, `file_name`, `caption`, `is_cover`, `created_at`, `updated_at`) VALUES
(1, 1, 'room-cover-standar.jpg', 'Standard Room – Tampak Depan', 1, '2025-12-03 16:53:12', '2025-12-03 17:01:51'),
(2, 1, 'room-interior-standar.jpg', 'Standard Room – Interior', 0, '2025-12-03 16:53:12', '2025-12-03 17:02:09'),
(3, 1, 'room-toilet-standar.jpg', 'Standard Room – Kamar Mandi', 0, '2025-12-03 16:53:12', '2025-12-03 17:02:22'),
(4, 2, 'room2_1.jpg', 'Deluxe Room – View Garden', 1, '2025-12-03 16:53:12', NULL),
(5, 2, 'room2_2.jpg', 'Deluxe Room – Interior', 0, '2025-12-03 16:53:12', NULL),
(6, 3, 'room3_1.jpg', 'Suite Room – Living Area', 1, '2025-12-03 16:53:12', NULL),
(7, 3, 'room3_2.jpg', 'Suite Room – Bedroom', 0, '2025-12-03 16:53:12', NULL),
(8, 3, 'room3_3.jpg', 'Suite Room – Bathroom', 0, '2025-12-03 16:53:12', NULL),
(9, 4, 'room4_1.jpg', 'Queen Room – Tampak Depan', 1, '2025-12-03 16:53:12', NULL),
(10, 4, 'room4_2.jpg', 'Queen Room – Balcony View', 0, '2025-12-03 16:53:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `tipe_kamar_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `description`, `image`, `tipe_kamar_id`, `created_at`) VALUES
(1, 'Suite Room View', 'Pemandangan kamar suite', 'gallery-1.jpg', 1, '2025-12-01 06:48:57'),
(2, 'Deluxe Room', 'Kamar deluxe dengan balkon', 'gallery-2.jpg', 1, '2025-12-01 06:48:57'),
(3, 'Standard Room', 'Kamar standard nyaman', 'gallery-3.jpg', 1, '2025-12-01 06:48:57'),
(4, 'Hotel Lobby', 'Lobi hotel modern', 'gallery-4.jpg', 1, '2025-12-01 06:48:57'),
(5, 'Swimming Pool', 'Kolam renang hotel', 'gallery-5.jpg', 1, '2025-12-01 06:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `category`, `name`, `description`, `price`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Breakfast', 'Mustrd Chicken with', 'This is the dolor sit amet consectetur adipisicing elit. Quae vel nobis tempora, nam non.', '60.00', 'mustrd_chicken.jpg', 1, '2025-11-30 00:41:28', NULL),
(2, 'Breakfast', 'Pan Con Berenjina Frita', 'Dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.', '30.00', 'pan_berenjina.jpg', 1, '2025-11-30 00:41:28', NULL),
(3, 'Breakfast', 'Salmon Tataki Capaccio', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.', '45.00', 'salmon_tataki.jpg', 1, '2025-11-30 00:41:28', NULL),
(4, 'Lunch', 'Lubina Marinada', 'Aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse.', '15.00', 'lubina_marinada.jpg', 1, '2025-11-30 00:41:28', NULL),
(5, 'Lunch', 'Nashville Hot Chicken', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.', '30.00', 'nashville_hot.jpg', 1, '2025-11-30 00:41:28', NULL),
(6, 'Lunch', 'Biscuits and Gravy', 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur.', '55.00', 'biscuits_gravy.jpg', 1, '2025-11-30 00:41:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id` int(11) NOT NULL,
  `id_tamu` int(11) NOT NULL,
  `kode_reservasi` varchar(20) NOT NULL,
  `tgl_reservasi` datetime NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `total_biaya` decimal(12,2) NOT NULL,
  `status_reservasi` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`id`, `id_tamu`, `kode_reservasi`, `tgl_reservasi`, `check_in_date`, `check_out_date`, `total_biaya`, `status_reservasi`) VALUES
(6, 3, 'RES69328E5C73AA3', '2025-12-05 08:48:44', '0000-00-00', '0000-00-00', '0.00', 'Pending'),
(7, 4, 'RES69328E9AE9350', '2025-12-05 08:49:46', '0000-00-00', '0000-00-00', '0.00', 'Pending'),
(8, 6, 'RES6932930489859', '2025-12-05 09:08:36', '0000-00-00', '0000-00-00', '165000.00', 'Pending'),
(9, 7, 'RES693295FE9467D', '2025-12-05 09:21:18', '0000-00-00', '0000-00-00', '165000.00', 'Pending'),
(10, 8, 'RES69329702291C4', '2025-12-05 09:25:38', '2025-12-25', '2025-12-31', '990000.00', 'Pending'),
(11, 9, 'RES693298AE42DD4', '2025-12-05 09:32:46', '2025-12-05', '2025-12-06', '165000.00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_menu`
--

CREATE TABLE `restaurant_menu` (
  `id` int(11) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant_menu`
--

INSERT INTO `restaurant_menu` (`id`, `nama_menu`, `harga`, `deskripsi`, `image`) VALUES
(1, 'Nasi Goreng Spesial', '45000.00', 'Nasi goreng khas hotel dengan topping ayam dan udang.', 'nasgor.jpg'),
(2, 'Beef Steak', '95000.00', 'Steak daging sapi premium dengan saus lada hitam.', 'steak.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sys_codes`
--

CREATE TABLE `sys_codes` (
  `srn_id` int(11) NOT NULL,
  `srn_code` varchar(50) DEFAULT NULL,
  `srn_value` int(11) DEFAULT 0,
  `srn_length` int(11) DEFAULT 1,
  `srn_format` varchar(50) DEFAULT NULL,
  `srn_year` int(11) DEFAULT NULL,
  `srn_month` int(11) DEFAULT NULL,
  `srn_reset_by` varchar(20) DEFAULT 'NONE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sys_codes`
--

INSERT INTO `sys_codes` (`srn_id`, `srn_code`, `srn_value`, `srn_length`, `srn_format`, `srn_year`, `srn_month`, `srn_reset_by`) VALUES
(1, 'SN-KLASIFIKASI-SURAT', 5, 5, 'SNKS-{VALUE}', 2017, 1, 'YEAR'),
(9, 'SN-KLASIFIKASI-FILE', 2, 5, 'SNKF-{MONTH}/{YEAR}-{VALUE}', NULL, NULL, 'NONE'),
(10, 'SN-SARANA-MEDIA', 5, 5, 'SSN-{MONTH}/{YEAR}-{VALUE}', NULL, NULL, 'NONE'),
(11, 'SN-TICKET', 76, 6, 'T{VALUE}', NULL, NULL, 'NONE'),
(13, '071.25', 3, 1, '{VALUE}', 2019, NULL, 'NONE'),
(14, '072', 3, 1, '{VALUE}', NULL, NULL, 'NONE'),
(15, '073.6', 0, 1, '{VALUE}', NULL, NULL, 'NONE'),
(16, '076.4', 1, 1, '{VALUE}', NULL, NULL, 'NONE'),
(17, '077.1', 1, 1, '{VALUE}', NULL, NULL, 'NONE'),
(18, '999.99', 38, 1, '{VALUE}', NULL, NULL, 'NONE'),
(19, '999.99', 38, 1, '{VALUE}', 2019, NULL, 'NONE');

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `id` int(11) NOT NULL,
  `nama_tamu` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tamu`
--

INSERT INTO `tamu` (`id`, `nama_tamu`, `email`, `no_telp`, `alamat`) VALUES
(1, 'Luqman Aly Razak', 'youngsta446@gmail.com', '085697362948', 'Villa Pabuaran Indah'),
(2, NULL, 'youngsta446@gmail.com', NULL, NULL),
(3, NULL, 'youngsta446@gmail.com', NULL, NULL),
(4, NULL, 'youngsta446@gmail.com', NULL, NULL),
(5, NULL, 'youngsta446@gmail.com', NULL, NULL),
(6, NULL, 'youngsta446@gmail.com', NULL, NULL),
(7, NULL, 'youngsta446@gmail.com', NULL, NULL),
(8, NULL, 'youngsta446@gmail.com', NULL, NULL),
(9, NULL, 'youngsta446@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `asal` varchar(100) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `pesan` text NOT NULL,
  `rating` int(11) DEFAULT 5,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `nama`, `asal`, `foto`, `pesan`, `rating`, `created_at`) VALUES
(1, 'Jenifer Brown', 'Bristol, UK', 'testi-1.jpg', '\"This is the dolor sit amet consectetur adipisicing elit...\"', 5, '2025-12-01 08:34:57'),
(2, 'Michael Nova', 'California, USA', 'testi-1.jpg', '\"Sangat puas menginap di hotel ini, pelayanannya luar biasa...\"', 5, '2025-12-01 08:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_kamar`
--

CREATE TABLE `tipe_kamar` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `capacity` int(3) NOT NULL DEFAULT 1,
  `bed` varchar(50) NOT NULL DEFAULT 'Single',
  `main_image` varchar(255) DEFAULT NULL,
  `amenities` text DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipe_kamar`
--

INSERT INTO `tipe_kamar` (`id`, `name`, `price`, `capacity`, `bed`, `main_image`, `amenities`, `deskripsi`, `is_active`) VALUES
(1, 'Standar Room', '165000.00', 1, 'Single Bed', '176474412078.jpg', 'Tempat tidur (single/double/queen), kamar mandi pribadi, AC, TV, meja & kursi, lemari, WiFi (jika tersedia), perlengkapan mandi dasar.', '“Kamar nyaman dan ekonomis yang menawarkan kenyamanan dasar untuk kebutuhan menginap Anda. Dilengkapi dengan tempat tidur berkualitas, kamar mandi pribadi, AC, televisi, dan perlengkapan dasar lainnya — ideal untuk solo traveler atau pasangan dengan anggaran terjangkau. Walaupun sederhana, kamar tetap bersih dan nyaman, siap mendukung kenyamanan tidur dan istirahat Anda.”', 1),
(2, 'Suite Room', '1350000.00', 1, 'Single', '9.jpg', 'TV,AC,WiFi,Mini Bar,Bath Tub', 'Kamar mewah dengan ruang tamu.', 1),
(3, 'Superior Room', '250000.00', 1, 'Single', '8.jpg', NULL, 'Kamar Superior', 0),
(4, 'Grand Superior Room', '300000.00', 1, 'Single', '7.jpg', NULL, 'Grand Superior Room', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alus_g`
--
ALTER TABLE `alus_g`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `alus_gd`
--
ALTER TABLE `alus_gd`
  ADD PRIMARY KEY (`agd_id`) USING BTREE;

--
-- Indexes for table `alus_la`
--
ALTER TABLE `alus_la`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `alus_mg`
--
ALTER TABLE `alus_mg`
  ADD PRIMARY KEY (`menu_id`) USING BTREE;

--
-- Indexes for table `alus_mga`
--
ALTER TABLE `alus_mga`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_groups_deleted` (`id_group`) USING BTREE,
  ADD KEY `fk_menu_deleted` (`id_menu`) USING BTREE;

--
-- Indexes for table `alus_u`
--
ALTER TABLE `alus_u`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sys_users_idx1` (`id`) USING BTREE,
  ADD KEY `sys_users_idx2` (`id`) USING BTREE;

--
-- Indexes for table `alus_ug`
--
ALTER TABLE `alus_ug`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`) USING BTREE,
  ADD KEY `fk_users_groups_users1_idx` (`user_id`) USING BTREE,
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`) USING BTREE;

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_reservasi`
--
ALTER TABLE `detail_reservasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservasi_id` (`reservasi_id`);

--
-- Indexes for table `extra_services`
--
ALTER TABLE `extra_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_service_features`
--
ALTER TABLE `extra_service_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `fitur`
--
ALTER TABLE `fitur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fitur_kamar`
--
ALTER TABLE `fitur_kamar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipe_kamar` (`id_tipe_kamar`),
  ADD KEY `id_fitur` (`id_fitur`);

--
-- Indexes for table `galeri_kamar`
--
ALTER TABLE `galeri_kamar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipe_kamar_id` (`tipe_kamar_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tamu` (`id_tamu`);

--
-- Indexes for table `restaurant_menu`
--
ALTER TABLE `restaurant_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_codes`
--
ALTER TABLE `sys_codes`
  ADD PRIMARY KEY (`srn_id`) USING BTREE;

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipe_kamar`
--
ALTER TABLE `tipe_kamar`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alus_g`
--
ALTER TABLE `alus_g`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `alus_gd`
--
ALTER TABLE `alus_gd`
  MODIFY `agd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `alus_la`
--
ALTER TABLE `alus_la`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `alus_mg`
--
ALTER TABLE `alus_mg`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `alus_mga`
--
ALTER TABLE `alus_mga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3923;

--
-- AUTO_INCREMENT for table `alus_u`
--
ALTER TABLE `alus_u`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `alus_ug`
--
ALTER TABLE `alus_ug`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detail_reservasi`
--
ALTER TABLE `detail_reservasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `extra_services`
--
ALTER TABLE `extra_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `extra_service_features`
--
ALTER TABLE `extra_service_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `fitur`
--
ALTER TABLE `fitur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fitur_kamar`
--
ALTER TABLE `fitur_kamar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `galeri_kamar`
--
ALTER TABLE `galeri_kamar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `restaurant_menu`
--
ALTER TABLE `restaurant_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sys_codes`
--
ALTER TABLE `sys_codes`
  MODIFY `srn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tamu`
--
ALTER TABLE `tamu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tipe_kamar`
--
ALTER TABLE `tipe_kamar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alus_ug`
--
ALTER TABLE `alus_ug`
  ADD CONSTRAINT `alus_ug_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `alus_g` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `alus_ug_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `alus_u` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `detail_reservasi`
--
ALTER TABLE `detail_reservasi`
  ADD CONSTRAINT `detail_reservasi_ibfk_1` FOREIGN KEY (`reservasi_id`) REFERENCES `reservasi` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `extra_service_features`
--
ALTER TABLE `extra_service_features`
  ADD CONSTRAINT `extra_service_features_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `extra_services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fitur_kamar`
--
ALTER TABLE `fitur_kamar`
  ADD CONSTRAINT `fitur_kamar_ibfk_1` FOREIGN KEY (`id_tipe_kamar`) REFERENCES `tipe_kamar` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fitur_kamar_ibfk_2` FOREIGN KEY (`id_fitur`) REFERENCES `fitur` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`tipe_kamar_id`) REFERENCES `tipe_kamar` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`id_tamu`) REFERENCES `tamu` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
