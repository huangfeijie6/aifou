-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-10-22 13:12:20
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `af`
--
CREATE DATABASE IF NOT EXISTS `af` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `af`;

-- --------------------------------------------------------

--
-- 表的结构 `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `img` varchar(64) DEFAULT NULL,
  `version` varchar(32) DEFAULT NULL,
  `color` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `cart`
--

TRUNCATE TABLE `cart`;
--
-- 转存表中的数据 `cart`
--

INSERT INTO `cart` (`id`, `pid`, `uid`, `count`, `lname`, `price`, `img`, `version`, `color`) VALUES
(16, 1, 1, 1, 'iPhone X 64G|联通4G/移动4G/电信4G', '5499.00', 'img/product/1.png', '联通4G/移动4G/电信4G', '银色');

-- --------------------------------------------------------

--
-- 表的结构 `pdetail_img`
--

DROP TABLE IF EXISTS `pdetail_img`;
CREATE TABLE IF NOT EXISTS `pdetail_img` (
  `pid` int(11) NOT NULL,
  `rimg` varchar(128) DEFAULT NULL,
  `dimg` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `pdetail_img`
--

TRUNCATE TABLE `pdetail_img`;
--
-- 转存表中的数据 `pdetail_img`
--

INSERT INTO `pdetail_img` (`pid`, `rimg`, `dimg`) VALUES
(1, 'img/product/1r.png', 'img/product/1d.png'),
(2, 'img/product/2r.png', 'img/product/2d.png'),
(3, 'img/product/3r.png', 'img/product/3d.png'),
(4, 'img/product/4r.png', 'img/product/4d.png'),
(5, 'img/product/5r.png', 'img/product/5d.png'),
(6, 'img/product/6r.png', 'img/product/6d.png'),
(7, 'img/product/7r.png', 'img/product/7d.png'),
(8, 'img/product/8r.png', 'img/product/8d.png'),
(9, 'img/product/9r.png', 'img/product/9d.png'),
(10, 'img/product/10r.png', 'img/product/10d.png'),
(11, 'img/product/11r.png', 'img/product/11d.png'),
(12, 'img/product/12r.png', 'img/product/12d.png'),
(13, 'img/product/13r.png', 'img/product/13d.png'),
(14, 'img/product/14r.png', 'img/product/14d.png'),
(15, 'img/product/15r.png', 'img/product/15d.png'),
(16, 'img/product/16r.png', 'img/product/16d.png'),
(17, 'img/product/17r.png', 'img/product/17d.png'),
(18, 'img/product/18r.png', 'img/product/18d.png'),
(19, 'img/product/19r.png', 'img/product/19d.png'),
(20, 'img/product/20r.png', 'img/product/20d.png'),
(21, 'img/product/21r.png', 'img/product/21d.png'),
(22, 'img/product/22r.png', 'img/product/22d.png'),
(23, 'img/product/23r.png', 'img/product/23d.png'),
(24, '', 'img/product/24d.png'),
(25, '', 'img/product/25d.png'),
(26, '', 'img/product/26d.png'),
(27, '', 'img/product/27d.png'),
(28, '', 'img/product/28d.png'),
(29, '', 'img/product/29d.png'),
(30, '', 'img/product/30d.png'),
(31, 'img/product/31r.png', 'img/product/31d.png');

-- --------------------------------------------------------

--
-- 表的结构 `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  `ptype` int(11) DEFAULT NULL,
  `brand` varchar(16) DEFAULT NULL,
  `productID` varchar(32) DEFAULT NULL,
  `model` varchar(32) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `color` varchar(16) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `old_price` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `products`
--

TRUNCATE TABLE `products`;
--
-- 转存表中的数据 `products`
--

INSERT INTO `products` (`pid`, `img`, `ptype`, `brand`, `productID`, `model`, `level`, `area`, `version`, `color`, `price`, `old_price`, `title`) VALUES
(1, 'img/product/1.png', 1, 'Apple', 'RE201808012005391', 'iPhone X', 3, 1, '联通4G/移动4G/电信4G', '银色', 5499, 5599, 'iPhone X 64G|联通4G/移动4G/电信4G'),
(2, 'img/product/2.png', 1, 'Apple', 'RE201808012005391', 'iPhone Xs Max', 1, 1, '联通4G/移动4G/电信4G', '金色', 9199, 9499, 'iPhone Xs Max 256G|联通4G/移动4G/电信4G'),
(3, 'img/product/3.png', 1, 'Apple', 'RE201808012005391', 'iPhone Xs Max', 1, 3, '联通4G/移动4G/电信4G', '深空灰', 9599, 0, 'iPhone Xs Max 256G|联通4G/移动4G/电信4G'),
(4, 'img/product/4.png', 1, 'Apple', 'RE201808012005391', 'iPhone 6s', 1, 2, '联通4G/移动4G/电信4G', '银色', 1799, 0, 'iPhone 6s 64G|联通4G/移动4G/电信4G'),
(5, 'img/product/5.png', 1, 'Apple', 'RE201808012005391', 'iPhone 8 Plus', 2, 1, '联通4G/移动4G/电信4G', '红色', 4499, 0, 'iPhone 8 Plus 64G|联通4G/移动4G/电信4G'),
(6, 'img/product/6.png', 1, 'Apple', 'RE201808012005391', 'iPhone 5c', 1, 5, '联通4G/移动4G', '绿色', 699, 0, 'iPhone 5c 16G|联通4G/移动4G'),
(7, 'img/product/7.png', 1, '三星', 'RE201808012005391', 'Galaxy S8', 3, 1, '联通4G/移动4G/电信4G', '谜夜黑', 2199, 2299, 'Galaxy S8 64G|联通4G/移动4G/电信4G'),
(8, 'img/product/8.png', 1, '三星', 'RE201808012005391', 'Galaxy Note 9', 1, 1, '联通4G/移动4G/电信4G', '寒霜蓝', 5999, 0, 'Galaxy Note 9 128G|联通4G/移动4G/电信4G'),
(9, 'img/product/9.png', 1, '华为', 'RE201808012005391', 'P20 Pro', 2, 1, '联通4G/移动4G/电信4G', '极光色', 3799, 0, 'P20 Pro 64G|联通4G/移动4G/电信4G'),
(10, 'img/product/10.png', 1, '小米', 'RE201808012005391', '小米8', 2, 1, '联通4G/移动4G/电信4G', '蓝色', 2699, 0, '小米8 256G|联通4G/移动4G/电信4G'),
(11, 'img/product/11.png', 1, 'VIVO', 'RE201808012005391', 'NEX', 2, 1, '联通4G/移动4G/电信4G', '星砖黑', 2799, 2999, 'NEX 128G|联通4G/移动4G/电信4G'),
(12, 'img/product/12.png', 1, '小米', 'RE201808012005391', 'MIX 2', 1, 1, '联通4G/移动4G/电信4G', '黑色', 1899, 0, 'MIX 2 64G|联通4G/移动4G/电信4G'),
(13, 'img/product/13.png', 1, 'OPPO', 'RE201808012005391', 'Find X', 3, 1, '联通4G/移动4G/电信4G', '冰珀蓝', 3499, 3599, 'Find X 128G|联通4G/移动4G/电信4G'),
(14, 'img/product/14.png', 1, '一加', 'RE201808012005391', '一加6', 1, 1, '联通4G/移动4G/电信4G', '琥珀红', 2699, 0, '一加6 128G|联通4G/移动4G/电信4G'),
(15, 'img/product/15.png', 2, 'Apple', 'RE201808012005391', 'iPad Air 2', 3, 2, 'WLAN版', '银色', 2699, 0, 'iPad Air 2 64G|WLAN版'),
(16, 'img/product/16.png', 2, 'Apple', 'RE201808012005391', 'iPad Pro 10.5英寸(2017)', 2, 3, 'WLAN版', '金色', 3499, 0, 'iPad Pro 10.5英寸(2017) 64G|WLAN版'),
(17, 'img/product/17.png', 2, 'Apple', 'RE201808012005391', 'iPad mini 2', 2, 3, 'Cellular版', '银色', 1649, 0, 'iPad mini 2 128G|Cellular版'),
(18, 'img/product/18.png', 2, 'Apple', 'RE201808012005391', 'iPad 2018', 2, 6, 'Cellular版', '金色', 2499, 2599, 'iPad 2018 32G|Cellular版'),
(19, 'img/product/19.png', 3, 'Apple', 'RE201808012005391', 'MacBook Pro (13\",2015)', 2, 1, 'WIFI版', '银色', 6799, 6999, 'MacBook Pro (13\",2015) 硬盘_512G/CPU_2.9 GHz Intel Core i5/内存_8G|WIFI版'),
(20, 'img/product/20.png', 3, 'Apple', 'RE201808012005391', 'MacBook Pro (13\",2017)', 1, 1, 'WIFI版', '深空灰色', 7999, 0, 'MacBook Pro (13\",2017) 硬盘_128G/内存_8G/CPU_2.3 GHz Intel Core i5/显卡_Intel Iris Plus Graphics 640|WIFI版'),
(21, 'img/product/21.png', 3, 'Apple', 'RE201808012005391', 'MacBook Pro (13\",2017)', 1, 1, 'WIFI版', '深空灰色', 8999, 0, 'MacBook Pro (13\",2017) 硬盘_256G/内存_8G/CPU_2.3 GHz Intel Core i5/显卡_Intel Iris Plus Graphics 640|WIFI版'),
(22, 'img/product/22.png', 3, 'Apple', 'RE201808012005391', 'MacBook Pro (13\",Late 2013)', 3, 1, 'WIFI版', '银色', 4599, 0, 'MacBook Pro (13\",Late 2013) 硬盘_256G/CPU_2.4 GHz Intel Core i5/内存_8G|WIFI版'),
(23, 'img/product/23.png', 3, 'Apple', 'RE201808012005391', 'MacBook Pro (13\",2015)', 2, 1, 'WIFI版', '银色', 6999, 0, 'MacBook Pro (13\",2015) 硬盘_512G/CPU_2.9 GHz Intel Core i5/内存_8G|WIFI版'),
(24, 'img/product/24.png', 4, '爱否开物', '', '立式无线充电器 S1', 0, 0, '', '', 269, 0, '立式无线充电器 S1'),
(25, 'img/product/25.png', 4, '爱否开物', '', '风冷无线充 W1', 0, 0, '', '', 79, 0, '风冷无线充 W1'),
(26, 'img/product/26.png', 4, 'Apple', '', 'AirPods', 0, 0, '', '', 899, 0, 'AirPods'),
(27, 'img/product/27.png', 4, 'Apple', '', 'Solo2 Wireless', 0, 0, '', '', 599, 0, 'Solo2 Wireless（二手）'),
(28, 'img/product/28.png', 4, 'Apple', '', 'Solo3 Wireless', 0, 0, '', '', 899, 0, 'Solo3 Wireless（二手）'),
(29, 'img/product/29.png', 4, 'Apple', '', 'Solo3 Wireless', 0, 0, '', '', 1469, 0, 'Solo3 Wireless'),
(30, 'img/product/30.png', 4, 'Apple', '', 'Wireless Keyboard', 0, 0, '', '', 259, 0, 'Wireless Keyboard'),
(31, 'img/product/31.png', 1, '三星', 'RE201808012005391', 'Galaxy S8+', 1, 1, '联通4G/移动4G/电信4G', '谜夜黑', 3199, 3299, 'Galaxy S8+ 128G|联通4G/移动4G/电信4G');

-- --------------------------------------------------------

--
-- 表的结构 `pshow_img`
--

DROP TABLE IF EXISTS `pshow_img`;
CREATE TABLE IF NOT EXISTS `pshow_img` (
  `pid` int(11) NOT NULL,
  `img1` varchar(128) DEFAULT NULL,
  `img2` varchar(128) DEFAULT NULL,
  `img3` varchar(128) DEFAULT NULL,
  `img4` varchar(128) DEFAULT NULL,
  `img5` varchar(128) DEFAULT NULL,
  `img6` varchar(128) DEFAULT NULL,
  `img7` varchar(128) DEFAULT NULL,
  `img8` varchar(128) DEFAULT NULL,
  `img9` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `pshow_img`
--

TRUNCATE TABLE `pshow_img`;
--
-- 转存表中的数据 `pshow_img`
--

INSERT INTO `pshow_img` (`pid`, `img1`, `img2`, `img3`, `img4`, `img5`, `img6`, `img7`, `img8`, `img9`) VALUES
(1, 'img/product/1 (1).jpg', 'img/product/1 (2).jpg', 'img/product/1 (3).jpg', 'img/product/1 (4).jpg', 'img/product/1 (5).jpg', 'img/product/1 (6).jpg', 'img/product/1 (7).jpg', 'img/product/1 (8).jpg', 'img/product/1 (9).jpg'),
(2, 'img/product/2 (1).jpg', 'img/product/2 (2).jpg', 'img/product/2 (3).jpg', 'img/product/2 (4).jpg', 'img/product/2 (5).jpg', 'img/product/2 (6).jpg', 'img/product/2 (7).jpg', 'img/product/2 (8).jpg', ''),
(3, 'img/product/3 (1).jpg', 'img/product/3 (2).jpg', 'img/product/3 (3).jpg', 'img/product/3 (4).jpg', 'img/product/3 (5).jpg', 'img/product/3 (6).jpg', 'img/product/3 (7).jpg', '', ''),
(4, 'img/product/4 (1).jpg', 'img/product/4 (2).jpg', 'img/product/4 (3).jpg', 'img/product/4 (4).jpg', 'img/product/4 (5).jpg', 'img/product/4 (6).jpg', 'img/product/4 (7).jpg', 'img/product/4 (8).jpg', 'img/product/4 (9).jpg'),
(5, 'img/product/5 (1).jpg', 'img/product/5 (2).jpg', 'img/product/5 (3).jpg', 'img/product/5 (4).jpg', 'img/product/5 (5).jpg', 'img/product/5 (6).jpg', 'img/product/5 (7).jpg', 'img/product/5 (8).jpg', ''),
(6, 'img/product/6 (1).jpg', 'img/product/6 (2).jpg', 'img/product/6 (3).jpg', 'img/product/6 (4).jpg', 'img/product/6 (5).jpg', 'img/product/6 (6).jpg', 'img/product/6 (7).jpg', 'img/product/6 (8).jpg', ''),
(7, 'img/product/7 (1).jpg', 'img/product/7 (2).jpg', 'img/product/7 (3).jpg', 'img/product/7 (4).jpg', 'img/product/7 (5).jpg', 'img/product/7 (6).jpg', 'img/product/7 (7).jpg', 'img/product/7 (8).jpg', 'img/product/7 (9).jpg'),
(8, 'img/product/8 (1).jpg', 'img/product/8 (2).jpg', 'img/product/8 (3).jpg', 'img/product/8 (4).jpg', 'img/product/8 (5).jpg', 'img/product/8 (6).jpg', 'img/product/8 (7).jpg', 'img/product/8 (8).jpg', ''),
(9, 'img/product/9 (1).jpg', 'img/product/9 (2).jpg', 'img/product/9 (3).jpg', 'img/product/9 (4).jpg', 'img/product/9 (5).jpg', 'img/product/9 (6).jpg', 'img/product/9 (7).jpg', 'img/product/9 (8).jpg', ''),
(10, 'img/product/10 (1).jpg', 'img/product/10 (2).jpg', 'img/product/10 (3).jpg', 'img/product/10 (4).jpg', 'img/product/10 (5).jpg', 'img/product/10 (6).jpg', 'img/product/10 (7).jpg', 'img/product/10 (8).jpg', ''),
(11, 'img/product/11 (1).jpg', 'img/product/11 (2).jpg', 'img/product/11 (3).jpg', 'img/product/11 (4).jpg', 'img/product/11 (5).jpg', 'img/product/11 (6).jpg', 'img/product/11 (7).jpg', 'img/product/11 (8).jpg', 'img/product/11 (9).jpg'),
(12, 'img/product/12 (1).jpg', 'img/product/12 (2).jpg', 'img/product/12 (3).jpg', 'img/product/12 (4).jpg', 'img/product/12 (5).jpg', 'img/product/12 (6).jpg', 'img/product/12 (7).jpg', 'img/product/12 (8).jpg', 'img/product/12 (9).jpg'),
(13, 'img/product/13 (1).jpg', 'img/product/13 (2).jpg', 'img/product/13 (3).jpg', 'img/product/13 (4).jpg', 'img/product/13 (5).jpg', 'img/product/13 (6).jpg', 'img/product/13 (7).jpg', 'img/product/13 (8).jpg', 'img/product/13 (9).jpg'),
(14, 'img/product/14 (1).jpg', 'img/product/14 (2).jpg', 'img/product/14 (3).jpg', 'img/product/14 (4).jpg', 'img/product/14 (5).jpg', 'img/product/14 (6).jpg', 'img/product/14 (7).jpg', 'img/product/14 (8).jpg', 'img/product/14 (9).jpg'),
(15, 'img/product/15 (1).jpg', 'img/product/15 (2).jpg', 'img/product/15 (3).jpg', 'img/product/15 (4).jpg', 'img/product/15 (5).jpg', 'img/product/15 (6).jpg', 'img/product/15 (7).jpg', 'img/product/15 (8).jpg', 'img/product/15 (9).jpg'),
(16, 'img/product/16 (1).jpg', 'img/product/16 (2).jpg', 'img/product/16 (3).jpg', 'img/product/16 (4).jpg', 'img/product/16 (5).jpg', 'img/product/16 (6).jpg', 'img/product/16 (7).jpg', 'img/product/16 (8).jpg', ''),
(17, 'img/product/17 (1).jpg', 'img/product/17 (2).jpg', 'img/product/17 (3).jpg', 'img/product/17 (4).jpg', 'img/product/17 (5).jpg', 'img/product/17 (6).jpg', 'img/product/17 (7).jpg', 'img/product/17 (8).jpg', 'img/product/17 (9).jpg'),
(18, 'img/product/18 (1).jpg', 'img/product/18 (2).jpg', 'img/product/18 (3).jpg', 'img/product/18 (4).jpg', 'img/product/18 (5).jpg', 'img/product/18 (6).jpg', '', '', ''),
(19, 'img/product/19 (1).jpg', 'img/product/19 (2).jpg', 'img/product/19 (3).jpg', 'img/product/19 (4).jpg', 'img/product/19 (5).jpg', 'img/product/19 (6).jpg', 'img/product/19 (7).jpg', 'img/product/19 (8).jpg', 'img/product/19 (9).jpg'),
(20, 'img/product/20 (1).jpg', 'img/product/20 (2).jpg', 'img/product/20 (3).jpg', 'img/product/20 (4).jpg', 'img/product/20 (5).jpg', 'img/product/20 (6).jpg', '', '', ''),
(21, 'img/product/21 (1).jpg', 'img/product/21 (2).jpg', 'img/product/21 (3).jpg', 'img/product/21 (4).jpg', 'img/product/21 (5).jpg', '', '', '', ''),
(22, 'img/product/22 (1).jpg', 'img/product/22 (2).jpg', 'img/product/22 (3).jpg', 'img/product/22 (4).jpg', 'img/product/22 (5).jpg', 'img/product/22 (6).jpg', '', '', ''),
(23, 'img/product/23 (1).jpg', 'img/product/23 (2).jpg', 'img/product/23 (3).jpg', 'img/product/23 (4).jpg', 'img/product/23 (5).jpg', 'img/product/23 (6).jpg', 'img/product/23 (7).jpg', 'img/product/23 (8).jpg', 'img/product/23 (9).jpg'),
(24, 'img/product/24 (1).jpg', 'img/product/24 (2).jpg', 'img/product/24 (3).jpg', 'img/product/24 (4).jpg', 'img/product/24 (5).jpg', '', '', '', ''),
(25, 'img/product/25 (1).jpg', 'img/product/25 (2).jpg', 'img/product/25 (3).jpg', 'img/product/25 (4).jpg', 'img/product/25 (5).jpg', '', '', '', ''),
(26, 'img/product/26 (1).jpg', 'img/product/26 (2).jpg', 'img/product/26 (3).jpg', 'img/product/26 (4).jpg', '', '', '', '', ''),
(27, 'img/product/27 (1).jpg', 'img/product/27 (2).jpg', 'img/product/27 (3).jpg', 'img/product/27 (4).jpg', '', '', '', '', ''),
(28, 'img/product/28 (1).jpg', 'img/product/28 (2).jpg', 'img/product/28 (3).jpg', 'img/product/28 (4).jpg', '', '', '', '', ''),
(29, 'img/product/29 (1).jpg', 'img/product/29 (2).jpg', 'img/product/29 (3).jpg', 'img/product/29 (4).jpg', '', '', '', '', ''),
(30, 'img/product/30 (1).jpg', 'img/product/30 (2).jpg', 'img/product/30 (3).jpg', 'img/product/30 (4).jpg', '', '', '', '', ''),
(31, 'img/product/31 (1).jpg', 'img/product/31 (2).jpg', 'img/product/31 (3).jpg', 'img/product/31 (4).jpg', 'img/product/31 (5).jpg', 'img/product/31 (6).jpg', 'img/product/31 (7).jpg', 'img/product/31 (8).jpg', 'img/product/31 (9).jpg');

-- --------------------------------------------------------

--
-- 表的结构 `pspec`
--

DROP TABLE IF EXISTS `pspec`;
CREATE TABLE IF NOT EXISTS `pspec` (
  `pid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `spec` varchar(16) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `pspec`
--

TRUNCATE TABLE `pspec`;
--
-- 转存表中的数据 `pspec`
--

INSERT INTO `pspec` (`pid`, `sid`, `spec`, `price`) VALUES
(1, 0, '64G', 5499),
(2, 0, '256G', 9199),
(3, 0, '256G', 9599),
(4, 0, '64G', 1799),
(5, 0, '64G', 4499),
(6, 0, '16G', 699),
(7, 0, '64G', 2299),
(8, 0, '128G', 5999),
(9, 0, '64G', 3799),
(10, 0, '256G', 2699),
(11, 0, '128G', 2799),
(12, 0, '64G', 1899),
(13, 0, '128G', 3499),
(14, 0, '128G', 2699),
(15, 0, '64G', 1899),
(16, 0, '64G', 3499),
(17, 0, '128G', 1649),
(18, 0, '32G', 2499),
(19, 0, '硬盘_512G/CPU_2.9 ', 6799),
(20, 0, '硬盘_128G/内存_8G/CP', 7999),
(21, 0, '硬盘_256G/内存_8G/CP', 8999),
(22, 0, '硬盘_256G/CPU_2.4 ', 4599),
(23, 0, '硬盘_512G/CPU_2.9 ', 6999),
(24, 0, '深空灰', 269),
(25, 0, '黑色', 79),
(26, 0, '白色-官换', 899),
(26, 1, '白色-原封', 1099),
(27, 0, '白色', 599),
(27, 1, '黑色', 599),
(27, 2, '金色', 599),
(27, 3, '蓝色', 599),
(27, 4, '粉色', 599),
(28, 0, '白色', 899),
(28, 1, '黑色', 899),
(28, 2, '金色', 899),
(28, 3, '蓝色', 899),
(28, 4, '粉色', 899),
(29, 0, '白色', 1469),
(29, 1, '黑色', 1469),
(29, 2, '金色', 1469),
(29, 3, '蓝色', 1469),
(29, 4, '粉色', 1469),
(30, 0, '白色', 259),
(31, 0, '128G', 3199);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) DEFAULT NULL,
  `upwd` varchar(32) DEFAULT NULL,
  `uphone` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `user`
--

TRUNCATE TABLE `user`;
--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `uname`, `upwd`, `uphone`) VALUES
(1, '黄先生', 'huangfeijie', '13060800262'),
(2, NULL, NULL, NULL),
(3, NULL, NULL, NULL),
(4, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user_address`
--

DROP TABLE IF EXISTS `user_address`;
CREATE TABLE IF NOT EXISTS `user_address` (
  `uid` int(11) DEFAULT NULL,
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(16) DEFAULT NULL,
  `city` varchar(16) DEFAULT NULL,
  `area` varchar(16) DEFAULT NULL,
  `street` varchar(128) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `isdefault` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `user_address`
--

TRUNCATE TABLE `user_address`;
--
-- 转存表中的数据 `user_address`
--

INSERT INTO `user_address` (`uid`, `aid`, `province`, `city`, `area`, `street`, `phone`, `name`, `isdefault`) VALUES
(1, 1, '广东省', '广州市', '荔湾区', '魔法学院7栋2505', '15622054242', '朱先生', 0),
(1, 2, '西藏自治区', '拉萨市', '中心区', '五角大楼4栋202', '13302517177', '蜘蛛侠', 1);

-- --------------------------------------------------------

--
-- 表的结构 `user_order`
--

DROP TABLE IF EXISTS `user_order`;
CREATE TABLE IF NOT EXISTS `user_order` (
  `uid` int(11) DEFAULT NULL,
  `oid` varchar(32) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `selected` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `user_order`
--

TRUNCATE TABLE `user_order`;
--
-- 转存表中的数据 `user_order`
--

INSERT INTO `user_order` (`uid`, `oid`, `pid`, `sid`, `state`, `aid`, `selected`, `count`) VALUES
(1, '201811151602005783', 1, 0, 0, 1, 1, 2),
(1, '201811151602005783', 14, 0, 0, 1, 1, 4),
(1, '201811151602997799', 10, 0, 3, 1, 1, 1),
(1, '201811151602997799', 28, 0, 3, 1, 1, 1),
(1, '201811151602997898', 11, 0, 4, 2, 1, 1),
(1, '201811151602997898', 18, 0, 4, 2, 1, 1),
(1, '201811151602987898', 31, 0, 4, 1, 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
