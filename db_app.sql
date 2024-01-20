-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jan 2024 pada 14.54
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_app`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` varchar(25) NOT NULL,
  `id_invoice` varchar(30) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`) VALUES
(29, '12', 'INV-33505013', 6, 'Semen Holcim', 1, 110000),
(30, '12', 'INV-68067093', 6, 'Semen Holcim', 1, 110000),
(31, '12', 'INV-68067093', 11, 'Keramik Ikad', 1, 99000);

--
-- Trigger `cart`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `cart` FOR EACH ROW BEGIN
	UPDATE product SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(6, 'Semen Holcim', 'Ini Semen', 'Semen', 110000, 9, 'semen_holcim.jpg'),
(7, 'Semen Padang', 'Ini Semen', 'Semen', 120000, 12, 'semen_padang.jpg'),
(9, 'Semen Gersik', 'Ini Semen', 'Semen', 130000, 13, 'semen_gresik.jpg'),
(10, 'Semen Merah Putih', 'Ini Semen', 'Semen', 100000, 14, 'semen_merah_putih.png'),
(11, 'Keramik Ikad', 'Ini Keramik', 'Keramik', 99000, 14, 'keramik_ikad.jpg'),
(12, 'Keramik Platinum', 'Ini Keramik', 'Keramik', 100000, 16, 'Keramik_Platinum.jpg'),
(13, 'Keramik Mulia', 'Ini Keramik', 'Keramik', 130000, 17, 'keramik_mulia.jpg'),
(14, 'Keramik Indogress', 'Ini Keramik', 'Keramik', 150000, 18, 'keramik_indogress.jpg'),
(18, 'Seng Plat Aluminium', 'Ini Seng', 'Seng', 120000, 20, 'seng_plat.jpg'),
(20, 'Cat Nodrop', 'Ini Cat', 'Cat', 250000, 110, 'cat_nodrop.png'),
(21, 'Cat Aquaproof', 'Ini Cat', 'Cat', 190000, 11, 'cat_aquaproof.jpg'),
(27, 'Sekop', 'Ini Sekop', 'Lain', 148000, 11, 'cekop.jpg'),
(28, 'Kuas Cat', 'Ini Kuas', 'Lain', 30000, 11, 'cuas.jpg'),
(29, 'Meteran', 'Ini Meteran', 'Lain', 28000, 19, 'meter.jpg'),
(30, 'Sendok Semen ', 'Ini Sendok Semen', 'Lain', 25000, 12, 'cendok_cemen.jpg'),
(31, 'Waterpass', 'Ini Waterpass', 'Lain', 90000, 13, 'waterpass.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `order_id` char(30) NOT NULL,
  `id_user` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `mobile_phone` varchar(15) NOT NULL,
  `city` varchar(255) NOT NULL,
  `kode_pos` varchar(100) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `ekspedisi` varchar(100) NOT NULL,
  `tracking_id` varchar(30) NOT NULL,
  `transaction_time` datetime DEFAULT NULL,
  `payment_limit` datetime DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  `gambar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`order_id`, `id_user`, `name`, `email`, `alamat`, `mobile_phone`, `city`, `kode_pos`, `payment_method`, `ekspedisi`, `tracking_id`, `transaction_time`, `payment_limit`, `status`, `gambar`) VALUES
('INV-33505013', '12', 'arya', 'arya@gmail.com', 'Balkar', '081521714776', 'Sanggau', '2345554', 'Direct Bank Transfer', 'JNE', '1088358523081', '2024-01-15 17:14:11', '2024-01-16 17:14:11', '1', 'RED-GRADIENTS-COLOR-SCHEME.jpg'),
('INV-68067093', '12', 'arya', 'arya@gmail.com', 'balkar', '081521714776', 'Sanggau', '3232466', 'Direct Bank Transfer', 'J&T Express', '931084882902', '2024-01-15 17:43:06', '2024-01-16 17:43:06', '0', 'RED-GRADIENTS-COLOR-SCHEME1.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email`, `password`, `level`, `avatar`) VALUES
(6, 'Admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '1', 'user.png'),
(12, 'arya', 'arya@gmail.com', '5882985c8b1e2dce2763072d56a1d6e5', '2', 'user.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`order_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
