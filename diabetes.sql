-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 09, 2020 lúc 04:28 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `diabetes`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `id` int(20) NOT NULL,
  `id_mold` int(20) DEFAULT NULL,
  `id_user` int(20) DEFAULT NULL,
  `namefood` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `menu`
--

INSERT INTO `menu` (`id`, `id_mold`, `id_user`, `namefood`, `image`, `day`, `status`) VALUES
(3, 2, 2, 'com chua ca loc', 'img/k33GQrSxct1LCG5.jpg', '2020-07-09', NULL),
(4, 1, 2, 'com ca ro phi chien xu', NULL, '2020-07-09', NULL),
(5, 1, 2, 'com chua', 'img/NSOeQxBZ3X7Sobf.jpg', '2020-07-09', NULL),
(6, 1, 2, 'cafe', 'img/TZvjgyed01Gqtt9.jpg', '2020-07-09', NULL),
(8, 1, 9, 'mon ăn mới', NULL, '2020-07-10', NULL),
(10, 1, 9, 'món ăn bổ ích', 'img/hTm2g8IGBebsasR.jpg', '2020-07-09', NULL),
(12, 1, 9, 'lon nuoc', 'img/UsSXLqM7wWn6nFt.jpg', '2020-07-10', NULL),
(13, 1, 9, 'cafe', 'img/2Il3ERsFx6WbuHE.jpg', '2020-07-10', NULL),
(14, 2, 9, 'cafe', 'img/1ymibiq5TgxubNI.jpg', '2020-07-10', NULL),
(15, 3, 9, 'buoi tối ăn gì đây', 'img/iCXleT50kDa8XM2.jpg', '2020-07-10', NULL),
(16, 2, 11, 'buoi trua', NULL, '2020-07-10', NULL),
(17, 2, 12, 'buoi trua', NULL, '2020-07-10', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mold`
--

CREATE TABLE `mold` (
  `id` int(20) NOT NULL,
  `mold` varchar(255) DEFAULT NULL,
  `status` tinyint(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `mold`
--

INSERT INTO `mold` (`id`, `mold`, `status`) VALUES
(1, 'have breakfast', NULL),
(2, 'lunch', NULL),
(3, 'dinner', NULL),
(4, 'Other\r\n', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `number_of_steps`
--

CREATE TABLE `number_of_steps` (
  `id` int(20) NOT NULL,
  `number_of_steps` int(10) DEFAULT NULL,
  `id_user` int(20) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `heights` double(5,2) DEFAULT NULL,
  `weights` double(5,2) DEFAULT NULL,
  `age` int(5) DEFAULT NULL,
  `dayofbirth` date DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `fullname`, `email`, `heights`, `weights`, `age`, `dayofbirth`, `sex`, `password`, `status`) VALUES
(2, 'thai ba sang', 'hbhnb', 16.00, 50.00, 21, '1999-08-08', 1, '3e758be1e926d731aa912498c3883886', 0),
(3, 'khoa', 'quachhongkhoa.it@gmail.com', 177.00, 88.00, 22, '2006-08-15', 0, '25d55ad283aa400af464c76d713c07ad', 0),
(6, 'thaibasang', 'kzumi2110@gmail.com', 40.00, 25.00, 90, '2019-08-08', 0, 'bbdac1061f8d4f9daf46bbf664e63923', 0),
(7, 'Quỷ Lệ', 'ysusu@gmail.com', 25.00, 25.00, 57, '2019-08-08', 0, '2f6524480fff4078a677bfc73c28eb3e', 0),
(8, 'thaibasang', 'kzumi2110@gmail.com', 30.00, 30.00, 30, '2019-08-08', 1, '202cb962ac59075b964b07152d234b70', 0),
(9, 'minh nguyen', 'minhnguyen@gmail.com', 25.00, 25.00, 21, '2019-08-08', 0, 'c7e21648cd47a15aada9818af9fca059', 0),
(10, 'test', 'tesst@gmail.com', 25.00, 25.00, 18, '2019-08-09', 0, 'bbdac1061f8d4f9daf46bbf664e63923', 0),
(11, 'thaibasang', 'kmk', 25.00, 25.00, 20, '2018-08-09', 0, 'bbdac1061f8d4f9daf46bbf664e63923', 0),
(12, 'thai ba sang', 'thaibasang8@gmail.com', 21.00, 22.00, 21, '2018-08-09', 0, 'bbdac1061f8d4f9daf46bbf664e63923', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_mold` (`id_mold`);

--
-- Chỉ mục cho bảng `mold`
--
ALTER TABLE `mold`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `number_of_steps`
--
ALTER TABLE `number_of_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `mold`
--
ALTER TABLE `mold`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `number_of_steps`
--
ALTER TABLE `number_of_steps`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`id_mold`) REFERENCES `mold` (`id`);

--
-- Các ràng buộc cho bảng `number_of_steps`
--
ALTER TABLE `number_of_steps`
  ADD CONSTRAINT `number_of_steps_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
