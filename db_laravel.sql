-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 21 Feb 2019 pada 05.49
-- Versi Server: 10.1.22-MariaDB
-- PHP Version: 7.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laravel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id`, `nama`, `telpon`, `alamat`, `created_at`, `update_at`) VALUES
(1, 'sarjono', '08676557', 'Bogor', '2019-02-10 10:17:23', '0000-00-00 00:00:00'),
(2, 'Dwi Cahyono', '0876576878', 'Jakarta', '2019-02-10 10:17:23', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel`
--

CREATE TABLE `mapel` (
  `id` int(11) NOT NULL,
  `kode` varchar(191) NOT NULL,
  `nama` varchar(191) NOT NULL,
  `semester` varchar(45) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mapel`
--

INSERT INTO `mapel` (`id`, `kode`, `nama`, `semester`, `guru_id`, `created_at`, `updated_at`) VALUES
(1, 'B001', 'Matematika Dasar', 'ganjil', 1, '2019-02-09 10:14:29', '0000-00-00 00:00:00'),
(2, 'B002', 'Bahasa Indonesia', 'ganjil', 2, '2019-02-09 10:14:29', '0000-00-00 00:00:00'),
(3, 'B003', 'Pendidikan Agama Islam', 'ganjil', 2, '2019-02-10 03:20:07', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel_siswa`
--

CREATE TABLE `mapel_siswa` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mapel_siswa`
--

INSERT INTO `mapel_siswa` (`id`, `siswa_id`, `mapel_id`, `nilai`, `created_at`, `updated_at`) VALUES
(1, 14, 1, 80, '2019-02-09 10:16:23', '0000-00-00 00:00:00'),
(2, 14, 2, 85, '2019-02-09 10:16:23', '0000-00-00 00:00:00'),
(3, 7, 1, 75, '2019-02-09 10:27:09', '2019-02-10 06:30:16'),
(4, 7, 2, 89, '2019-02-09 09:38:00', '2019-02-09 16:38:00'),
(5, 20, 1, 89, '2019-02-09 09:39:08', '2019-02-09 16:39:08'),
(6, 9, 1, 75, '2019-02-09 19:39:11', '2019-02-10 02:39:11'),
(7, 7, 3, 75, '2019-02-10 03:27:15', '0000-00-00 00:00:00'),
(8, 11, 1, 65, '2019-02-09 20:33:49', '2019-02-10 03:33:49'),
(9, 11, 3, 75, '2019-02-09 20:34:27', '2019-02-10 03:34:27'),
(10, 10, 3, 88, '2019-02-09 22:41:18', '2019-02-10 05:41:18'),
(11, 8, 1, 80, '2019-02-09 23:36:27', '2019-02-10 06:36:27'),
(13, 8, 2, 84, '2019-02-09 23:37:12', '2019-02-10 06:37:12'),
(14, 8, 3, 90, '2019-02-10 03:23:22', '2019-02-10 10:23:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_02_07_033428_create_siswa_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nama_depan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_belakang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `user_id`, `nama_depan`, `nama_belakang`, `jenis_kelamin`, `agama`, `alamat`, `avatar`, `created_at`, `updated_at`) VALUES
(8, NULL, 'Mohammad', 'Idam', 'L', 'Islam', 'Cicurug', 'bebe.jpg', '2019-02-07 05:00:27', '2019-02-09 23:36:10'),
(9, NULL, 'Novi', 'Widia', 'P', 'Islam', 'Unitex', 'bebe.jpg', '2019-02-07 18:26:26', '2019-02-09 19:39:30'),
(10, NULL, 'Maulana', 'Yusuf', 'L', 'Islam', 'Seseupan', NULL, '2019-02-07 20:17:10', '2019-02-07 20:17:10'),
(11, NULL, 'Nana', 'Rukmana', 'L', 'Islam', 'Bendungan', NULL, '2019-02-09 00:52:48', '2019-02-09 00:52:48'),
(14, NULL, 'Rahman', 'Taufik', 'L', 'Islam', 'Sodong', NULL, '2019-02-09 01:16:49', '2019-02-09 01:16:49'),
(15, NULL, 'Agnes', 'Angela', 'P', 'Kristem', 'Sukasari', NULL, '2019-02-09 04:09:09', '2019-02-09 04:09:09'),
(16, NULL, 'Dede', 'Marpudin', 'L', 'Islam', 'Tasik', NULL, '2019-02-09 04:09:59', '2019-02-09 04:09:59'),
(17, NULL, 'Taufik', 'Rahman', 'L', 'Islam', 'serang', NULL, '2019-02-09 04:11:48', '2019-02-09 04:11:48'),
(18, NULL, 'Muhamad', 'arfan', 'L', 'Islam', 'kaduperang', NULL, '2019-02-09 08:20:14', '2019-02-09 08:20:14'),
(20, NULL, 'IrmaF', 'Fitriani', 'P', 'Islam', 'Bandung', 'download.png', '2019-02-09 08:40:14', '2019-02-09 08:40:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Taufik', 'Taufik@gmail.com', '$2y$10$pRU/UN/PBobrh/J2Ba9npOUGUyJ.KFnXd7OtOp6/GXjETmdOXWg76', 'kjrM5Vx3NbU1sl4SdmEJRnGmQJC7PCjJwWQ4K3mITN9PkxQwi7QXvPb0nwz0', '2019-02-07 23:14:07', '2019-02-07 23:14:07'),
(5, 'siswa', 'Rahman', 'Rahman.Ta@gmail.com', '$2y$10$KW57lV1zhWb7/Rac01K.9e0JUrOrXonMUp/tCCJ34DInY8pC0prhG', 'T4QdSkUA1CxyrSNhNGLMn7V75u1qHM49nfyKyWD5ngsSiYwLyO0Wrc7YebOH', '2019-02-09 01:16:48', '2019-02-09 01:16:48'),
(6, 'siswa', 'Agnes', 'Agnes@gmail.com', '$2y$10$fBnE1i41zE64FG5h2I7Ub.YONQ4oRHb.3vonyD9jIRAsGASrwgReO', 'U5UiWBLog2KjLvDrsVgFjFg8bZsmCkZLFfyDak59OtOvCJjHtHM7Dw983tXt', '2019-02-09 04:09:09', '2019-02-09 04:09:09'),
(7, 'siswa', 'Dede', 'Dede@gmail.com', '$2y$10$wCDQyC7ZYFa7HzvvwIYCfO0AzgwU5VWMDcui23rCZ3NNnvDqOv7T2', 'xz8uTHxPc2xPJK7LLqYNOcjBRRLXPJomUye8Um94tZwU8aKEarTQRahaJAOO', '2019-02-09 04:09:59', '2019-02-09 04:09:59'),
(8, 'siswa', 'Taufik', 'taufik.R@gmail.com', '$2y$10$Qd/VkeR7gJZpwTmruBklgugpds3Ksdu1Si1gxKQCBtJRFk.AdMk.a', 'D5uC0ECOvW0bCItOLgi3bjz0aDXys3S9fGb1YwUjLMYOi1XzkIWqBLuS4Lhy', '2019-02-09 04:11:48', '2019-02-09 04:11:48'),
(9, 'siswa', 'Muhamad', 'arfan@gmail.com', '$2y$10$G7vLK8aVqZwLyFkNpZYQTO4S67Bl3gA9C2KOyM4oH.ZJB14X7DSmO', 'esU0mPDehrHZ3WR8Xg5xdWrNXku9NlbriAasH01eWvpgjCZmOre78UkkqS4T', '2019-02-09 08:17:44', '2019-02-09 08:17:44'),
(10, 'siswa', 'Muhamad', 'arfanu@gmail.com', '$2y$10$pDA34scUDQS0bMbgzvKsbeOyw8SIZuKDlisQImYLIycsTg3tXTXBm', 'VzkD6lDs6sC8gnLJPL5aQIIfIdKhxaRKYeENmsY5r4PSeRLaaBRUCBmmTiYB', '2019-02-09 08:20:14', '2019-02-09 08:20:14'),
(12, 'siswa', 'IrmaF', 'Irma@gmail.com', '$2y$10$8/xMWuUH3dbNimu3O9pmtOyzvNa2EBFHEsszIB2M1xBJi36DDxGuC', 'wjwgOYa5FWBMjuyXJsMWOOM6mrBHw8BY5Qv8FeMrXlYvENCPHT4LR2v6TmBg', '2019-02-09 08:40:14', '2019-02-09 08:40:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel_siswa`
--
ALTER TABLE `mapel_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
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
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mapel_siswa`
--
ALTER TABLE `mapel_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
