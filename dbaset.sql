-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2022 at 11:18 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbaset`
--

-- --------------------------------------------------------

--
-- Table structure for table `mst_barang`
--

CREATE TABLE `mst_barang` (
  `kd_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `kategori_barang` varchar(20) NOT NULL,
  `merek` varchar(50) DEFAULT NULL,
  `ukuran` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_barang`
--

INSERT INTO `mst_barang` (`kd_barang`, `nama_barang`, `kategori_barang`, `merek`, `ukuran`) VALUES
('1041', 'Lemari', 'Barang Furniture', '2x1 m', 'West'),
('1401', 'PC All in One', 'Barang Electronik', '15x14 cm', 'Acer');

-- --------------------------------------------------------

--
-- Table structure for table `mst_lokasi`
--

CREATE TABLE `mst_lokasi` (
  `kd_lokasi` varchar(10) NOT NULL,
  `nama_lokasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_lokasi`
--

INSERT INTO `mst_lokasi` (`kd_lokasi`, `nama_lokasi`) VALUES
('01', 'Ruang Pelayanan Satu Pintu'),
('02', 'Ruang Bidang Aset');

-- --------------------------------------------------------

--
-- Table structure for table `mst_user`
--

CREATE TABLE `mst_user` (
  `id_user` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama` varchar(35) DEFAULT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_user`
--

INSERT INTO `mst_user` (`id_user`, `username`, `password`, `nama`, `jenis_kelamin`, `alamat`) VALUES
('1401', 'sandy', 'sandy', 'SANDY THREE MUAZ PUTRA', 'Laki - laki', 'jl.Panglima Batur');

-- --------------------------------------------------------

--
-- Table structure for table `trx_inventaris_keluar`
--

CREATE TABLE `trx_inventaris_keluar` (
  `kd_inventaris_keluar` char(15) NOT NULL,
  `kd_inventaris_masuk` char(15) NOT NULL,
  `jumlah` double NOT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `keterangan` varchar(20) NOT NULL,
  `id_user` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trx_inventaris_keluar`
--

INSERT INTO `trx_inventaris_keluar` (`kd_inventaris_keluar`, `kd_inventaris_masuk`, `jumlah`, `tanggal_keluar`, `keterangan`, `id_user`) VALUES
('OUT0001', 'IN0002', 1, '2022-01-03', 'Rusak', '1401');

-- --------------------------------------------------------

--
-- Table structure for table `trx_inventaris_masuk`
--

CREATE TABLE `trx_inventaris_masuk` (
  `kd_inventaris_masuk` char(15) NOT NULL,
  `kd_barang` varchar(10) NOT NULL,
  `jumlah` float NOT NULL,
  `nilai_barang` float NOT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `id_user` varchar(10) NOT NULL,
  `kd_lokasi` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trx_inventaris_masuk`
--

INSERT INTO `trx_inventaris_masuk` (`kd_inventaris_masuk`, `kd_barang`, `jumlah`, `nilai_barang`, `tanggal_masuk`, `id_user`, `kd_lokasi`) VALUES
('IN0001', '1401', 2, 6000000, '2022-01-03', '1401', '01'),
('IN0002', '1401', 1, 3000000, '2022-01-03', '1401', '02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mst_barang`
--
ALTER TABLE `mst_barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `mst_lokasi`
--
ALTER TABLE `mst_lokasi`
  ADD PRIMARY KEY (`kd_lokasi`);

--
-- Indexes for table `mst_user`
--
ALTER TABLE `mst_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `trx_inventaris_keluar`
--
ALTER TABLE `trx_inventaris_keluar`
  ADD PRIMARY KEY (`kd_inventaris_keluar`);

--
-- Indexes for table `trx_inventaris_masuk`
--
ALTER TABLE `trx_inventaris_masuk`
  ADD PRIMARY KEY (`kd_inventaris_masuk`,`kd_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
