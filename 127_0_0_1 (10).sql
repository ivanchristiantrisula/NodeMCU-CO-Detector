-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Jun 2020 pada 18.45
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyek-embed`
--
CREATE DATABASE IF NOT EXISTS `proyek-embed` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyek-embed`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data`
--

CREATE TABLE `data` (
  `ppm` float NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data`
--

INSERT INTO `data` (`ppm`, `time`) VALUES
(24.28, '2020-06-15 16:45:02'),
(24.28, '2020-06-15 16:45:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mode`
--

CREATE TABLE `mode` (
  `state` int(1) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mode`
--

INSERT INTO `mode` (`state`, `time`) VALUES
(0, '2020-06-07 12:58:24'),
(0, '2020-06-07 12:58:57'),
(0, '2020-06-07 12:59:08'),
(1, '2020-06-07 13:02:58'),
(0, '2020-06-07 13:03:22'),
(1, '2020-06-07 13:04:10'),
(0, '2020-06-07 13:04:10'),
(1, '2020-06-07 13:04:11'),
(0, '2020-06-07 13:04:11'),
(1, '2020-06-07 13:04:11'),
(0, '2020-06-07 13:04:12'),
(1, '2020-06-07 13:04:12'),
(0, '2020-06-07 13:04:12'),
(1, '2020-06-07 13:04:36'),
(0, '2020-06-07 13:04:40'),
(1, '2020-06-07 13:05:40'),
(0, '2020-06-07 13:05:41'),
(0, '2020-06-07 13:07:12'),
(0, '2020-06-07 13:07:12'),
(0, '2020-06-07 13:07:13'),
(0, '2020-06-07 13:07:13'),
(0, '2020-06-07 13:07:14'),
(0, '2020-06-07 13:07:14'),
(0, '2020-06-07 13:07:14'),
(0, '2020-06-07 13:07:14'),
(0, '2020-06-07 13:07:15'),
(0, '2020-06-07 13:07:15'),
(0, '2020-06-07 13:07:15'),
(0, '2020-06-07 13:07:15'),
(0, '2020-06-07 13:07:17'),
(0, '2020-06-07 13:07:18'),
(0, '2020-06-07 13:07:20'),
(0, '2020-06-07 13:07:23'),
(0, '2020-06-07 13:07:24'),
(0, '2020-06-07 13:07:29'),
(0, '2020-06-07 13:08:15'),
(0, '2020-06-07 13:08:56'),
(0, '2020-06-07 13:08:58'),
(0, '2020-06-07 13:08:59'),
(0, '2020-06-07 13:08:59'),
(0, '2020-06-07 13:08:59'),
(0, '2020-06-07 13:08:59'),
(0, '2020-06-07 13:08:59'),
(0, '2020-06-07 13:09:00'),
(0, '2020-06-07 13:09:00'),
(0, '2020-06-07 13:09:15'),
(0, '2020-06-07 13:09:16'),
(0, '2020-06-07 13:09:17'),
(0, '2020-06-07 13:09:17'),
(1, '2020-06-07 13:10:01'),
(0, '2020-06-07 13:16:35'),
(1, '2020-06-07 13:16:50'),
(0, '2020-06-07 13:18:44'),
(1, '2020-06-07 13:18:57'),
(0, '2020-06-07 13:21:52'),
(1, '2020-06-07 13:21:54'),
(0, '2020-06-07 13:22:07'),
(1, '2020-06-07 13:22:25'),
(0, '2020-06-07 14:04:52'),
(1, '2020-06-07 14:40:39'),
(0, '2020-06-15 16:15:15'),
(1, '2020-06-15 16:15:26');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`time`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
