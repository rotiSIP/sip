-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2018 at 05:43 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rotisip`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabel_detail_transaksi`
--

CREATE TABLE `tabel_detail_transaksi` (
  `id_detail` varchar(10) NOT NULL,
  `no_transaksi` int(20) NOT NULL,
  `id_roti` varchar(10) NOT NULL,
  `nama_roti` varchar(30) NOT NULL,
  `harga` int(6) NOT NULL,
  `jumlah_roti` int(4) NOT NULL,
  `harga_jual` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pegawai`
--

CREATE TABLE `tabel_pegawai` (
  `id_pegawai` varchar(10) NOT NULL,
  `nama_pegawai` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_roti`
--

CREATE TABLE `tabel_roti` (
  `id_roti` varchar(10) NOT NULL,
  `nama_roti` varchar(30) NOT NULL,
  `harga` int(6) NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_sales`
--

CREATE TABLE `tabel_sales` (
  `id_sales` varchar(5) NOT NULL,
  `nama_sales` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_setoran`
--

CREATE TABLE `tabel_setoran` (
  `id_setoran` varchar(10) NOT NULL,
  `id_sales` varchar(10) NOT NULL,
  `tgl_setoran` datetime NOT NULL,
  `total_jual` int(6) NOT NULL,
  `potongan` int(6) NOT NULL,
  `total_setoran` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_stok_pusat`
--

CREATE TABLE `tabel_stok_pusat` (
  `id_stok_pusat` varchar(10) NOT NULL,
  `id_roti` varchar(10) NOT NULL,
  `nama_roti` varchar(30) NOT NULL,
  `jumlah_stok_pusat` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_stok_sales`
--

CREATE TABLE `tabel_stok_sales` (
  `id_stok_sales` varchar(10) NOT NULL,
  `id_roti` varchar(10) NOT NULL,
  `id_sales` varchar(10) NOT NULL,
  `nama_roti` varchar(30) NOT NULL,
  `jumlah_stok_sales` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_transaksi`
--

CREATE TABLE `tabel_transaksi` (
  `no_transaksi` int(20) NOT NULL,
  `id_sales` varchar(10) NOT NULL,
  `id_setoran` varchar(10) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `total_jual` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_detail_transaksi`
--
ALTER TABLE `tabel_detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `no_transaksi` (`no_transaksi`),
  ADD KEY `id_roti` (`id_roti`);

--
-- Indexes for table `tabel_pegawai`
--
ALTER TABLE `tabel_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `tabel_roti`
--
ALTER TABLE `tabel_roti`
  ADD PRIMARY KEY (`id_roti`);

--
-- Indexes for table `tabel_sales`
--
ALTER TABLE `tabel_sales`
  ADD PRIMARY KEY (`id_sales`);

--
-- Indexes for table `tabel_setoran`
--
ALTER TABLE `tabel_setoran`
  ADD PRIMARY KEY (`id_setoran`),
  ADD KEY `id_sales` (`id_sales`);

--
-- Indexes for table `tabel_stok_pusat`
--
ALTER TABLE `tabel_stok_pusat`
  ADD PRIMARY KEY (`id_stok_pusat`),
  ADD KEY `id_roti` (`id_roti`);

--
-- Indexes for table `tabel_stok_sales`
--
ALTER TABLE `tabel_stok_sales`
  ADD PRIMARY KEY (`id_stok_sales`),
  ADD KEY `id_roti` (`id_roti`),
  ADD KEY `id_sales` (`id_sales`);

--
-- Indexes for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_sales` (`id_sales`),
  ADD KEY `id_setoran` (`id_setoran`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tabel_detail_transaksi`
--
ALTER TABLE `tabel_detail_transaksi`
  ADD CONSTRAINT `tabel_detail_transaksi_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`),
  ADD CONSTRAINT `tabel_detail_transaksi_ibfk_2` FOREIGN KEY (`no_transaksi`) REFERENCES `tabel_transaksi` (`no_transaksi`);

--
-- Constraints for table `tabel_setoran`
--
ALTER TABLE `tabel_setoran`
  ADD CONSTRAINT `tabel_setoran_ibfk_1` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`);

--
-- Constraints for table `tabel_stok_pusat`
--
ALTER TABLE `tabel_stok_pusat`
  ADD CONSTRAINT `tabel_stok_pusat_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`);

--
-- Constraints for table `tabel_stok_sales`
--
ALTER TABLE `tabel_stok_sales`
  ADD CONSTRAINT `tabel_stok_sales_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`);

--
-- Constraints for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  ADD CONSTRAINT `tabel_transaksi_ibfk_1` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`),
  ADD CONSTRAINT `tabel_transaksi_ibfk_2` FOREIGN KEY (`id_setoran`) REFERENCES `tabel_setoran` (`id_setoran`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
