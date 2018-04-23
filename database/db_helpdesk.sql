-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06 Feb 2017 pada 06.28
-- Versi Server: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_helpdesk`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jns_tiket`
--

CREATE TABLE IF NOT EXISTS `tbl_jns_tiket` (
`id_jns_tiket` bigint(12) NOT NULL,
  `nm_jns_tiket` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20170204003132 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_jns_tiket`
--

INSERT INTO `tbl_jns_tiket` (`id_jns_tiket`, `nm_jns_tiket`) VALUES
(5, 'Software'),
(6, 'Internet'),
(20170129133801, 'Komputer'),
(20170129133812, 'Jaringan'),
(20170204003131, 'Hardware');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_karyawan`
--

CREATE TABLE IF NOT EXISTS `tbl_karyawan` (
  `nik` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nm_karyawan` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_name_karyawan` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `almt_karyawan` text COLLATE utf8_unicode_ci NOT NULL,
  `jns_kelamin_karyawan` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `password_karyawan` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stts_karyawan` int(1) NOT NULL DEFAULT '0',
  `file_name_karyawan` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `tbl_karyawan`
--

INSERT INTO `tbl_karyawan` (`nik`, `nm_karyawan`, `user_name_karyawan`, `almt_karyawan`, `jns_kelamin_karyawan`, `password_karyawan`, `stts_karyawan`, `file_name_karyawan`) VALUES
('12343286423', 'Amieratul Husna Nurmawati', 'husna', 'Kp. Pisangan Aries Ds. Sarakan Kec. Sepatan Kab. Tangerang', 'P', '39ae638603d245e33ec73d9176ca5f3c', 1, 'Desert.jpg'),
('2313738173', 'Annie Rusmawati', 'annie', 'Malang Jawa Timur', 'P', 'a21810a01d3fe0df4291d7d3e7abbd1c', 1, 'Desert-1.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tiket`
--

CREATE TABLE IF NOT EXISTS `tbl_tiket` (
`id_tiket` bigint(12) NOT NULL,
  `id_jns_tiket` bigint(12) DEFAULT NULL,
  `id_user` bigint(12) DEFAULT NULL,
  `nik` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `judul_tiket` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tgl_buka` datetime DEFAULT NULL,
  `tgl_tutup` datetime DEFAULT NULL,
  `stts_tiket` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=20170205214428 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `tbl_tiket`
--

INSERT INTO `tbl_tiket` (`id_tiket`, `id_jns_tiket`, `id_user`, `nik`, `judul_tiket`, `tgl_buka`, `tgl_tutup`, `stts_tiket`) VALUES
(20170204022237, 6, 20170129134206, '12343286423', 'sdasd', '2017-02-04 00:00:00', '2017-02-05 02:10:29', 0),
(20170205213414, 5, 20170205213701, '12343286423', 'OS Tidak Berpungsi Normal', '2017-02-05 21:34:14', NULL, 1),
(20170205214427, 20170204003131, 20170205213701, '12343286423', 'lk', '2017-02-05 21:44:27', NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tiket_dtl`
--

CREATE TABLE IF NOT EXISTS `tbl_tiket_dtl` (
`id_tiket_dtl` bigint(12) NOT NULL,
  `id_tiket` bigint(12) DEFAULT NULL,
  `tgl_tiket` datetime DEFAULT NULL,
  `isi_tiket` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `tbl_tiket_dtl`
--

INSERT INTO `tbl_tiket_dtl` (`id_tiket_dtl`, `id_tiket`, `tgl_tiket`, `isi_tiket`) VALUES
(1, 20170204022237, '2017-02-04 00:00:00', 'vbvbnbvn'),
(2, 20170204022237, '2017-02-05 02:00:36', 'sub'),
(3, 20170204022237, '2017-02-05 02:03:20', 'teset \r\naja ah'),
(12, 20170205213414, '2017-02-05 22:18:16', 'OS dikompter saya tidak berjalan dengan normal.\r\n\r\nsaat komputer dinyalakan muncul warna biru, setelah lama baru muncul dekstop.\r\n\r\nmohon bantuannya.\r\nthank''s'),
(13, 20170205213414, '2017-02-05 22:23:36', 'te &rsquo; s');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tindakan`
--

CREATE TABLE IF NOT EXISTS `tbl_tindakan` (
`id_tindakan` bigint(12) NOT NULL,
  `id_tiket_dtl` bigint(12) DEFAULT NULL,
  `id_user` bigint(12) DEFAULT NULL,
  `tgl_tindakan` datetime DEFAULT NULL,
  `isi_tindakan` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `tbl_tindakan`
--

INSERT INTO `tbl_tindakan` (`id_tindakan`, `id_tiket_dtl`, `id_user`, `tgl_tindakan`, `isi_tindakan`) VALUES
(1, 20170204022237, 1, '2017-02-05 01:14:57', 'test'),
(2, 1, 20170129134206, '2017-02-05 01:17:53', 'ok'),
(3, 1, 20170129134206, '2017-02-05 01:18:41', 'sip'),
(4, 0, 20170205213701, '2017-02-05 21:39:28', 'sudah dilakukan perbaikan, dilakukan install ulang OS'),
(5, 13, 20170205213701, '2017-02-05 22:45:54', 'OS sudah saya install ulang, saat ini sudah berjalan dengan normal\r\n\r\nterimakasih');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
`id_user` bigint(12) NOT NULL,
  `nm_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `almt_user` text COLLATE utf8_unicode_ci NOT NULL,
  `jns_kelamin_user` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `password_user` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `level_user` int(1) NOT NULL DEFAULT '0',
  `stts_user` int(1) NOT NULL DEFAULT '0',
  `file_name_user` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=20170205213702 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `nm_user`, `user_name`, `almt_user`, `jns_kelamin_user`, `password_user`, `level_user`, `stts_user`, `file_name_user`) VALUES
(20170122153457, 'Jopar', 'admin', 'Tangerang', 'L', '21232f297a57a5a743894a0e4a801fc3', 1, 1, 'Chrysanthemum.jpg'),
(20170129134206, 'Hari Nurmawan', 'hari', 'Kp. Pisangan', 'L', 'a9bcf1e4d7b95a22e2975c812d938889', 0, 1, 'Penguins.jpg'),
(20170203223633, 'jony', 'jony', 'aslakslas', 'L', '1839c8c589c4ff428bf88c01b7a0d03a', 0, 1, 'Tulips.jpg'),
(20170205213701, 'heru', 'heru', 'Tangerang', 'L', 'a648ab9a3e32c5f3f6e9ddbd41c0530f', 0, 1, 'Koala.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_jns_tiket`
--
ALTER TABLE `tbl_jns_tiket`
 ADD PRIMARY KEY (`id_jns_tiket`);

--
-- Indexes for table `tbl_karyawan`
--
ALTER TABLE `tbl_karyawan`
 ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `tbl_tiket`
--
ALTER TABLE `tbl_tiket`
 ADD PRIMARY KEY (`id_tiket`);

--
-- Indexes for table `tbl_tiket_dtl`
--
ALTER TABLE `tbl_tiket_dtl`
 ADD PRIMARY KEY (`id_tiket_dtl`);

--
-- Indexes for table `tbl_tindakan`
--
ALTER TABLE `tbl_tindakan`
 ADD PRIMARY KEY (`id_tindakan`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
 ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_jns_tiket`
--
ALTER TABLE `tbl_jns_tiket`
MODIFY `id_jns_tiket` bigint(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20170204003132;
--
-- AUTO_INCREMENT for table `tbl_tiket`
--
ALTER TABLE `tbl_tiket`
MODIFY `id_tiket` bigint(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20170205214428;
--
-- AUTO_INCREMENT for table `tbl_tiket_dtl`
--
ALTER TABLE `tbl_tiket_dtl`
MODIFY `id_tiket_dtl` bigint(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tbl_tindakan`
--
ALTER TABLE `tbl_tindakan`
MODIFY `id_tindakan` bigint(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
MODIFY `id_user` bigint(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20170205213702;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
