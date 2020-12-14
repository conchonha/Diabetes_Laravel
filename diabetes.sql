-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 14, 2020 lúc 12:45 PM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.2.33

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
-- Cấu trúc bảng cho bảng `health_information`
--

CREATE TABLE `health_information` (
  `id` int(11) NOT NULL,
  `heights` int(11) NOT NULL,
  `weights` int(11) NOT NULL,
  `bloodPressure` int(11) NOT NULL,
  `bloodSugar` int(11) NOT NULL,
  `CPR` int(11) NOT NULL,
  `HDL_C` int(11) NOT NULL,
  `LDL_C` int(11) NOT NULL,
  `time` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `health_information`
--

INSERT INTO `health_information` (`id`, `heights`, `weights`, `bloodPressure`, `bloodSugar`, `CPR`, `HDL_C`, `LDL_C`, `time`, `id_user`) VALUES
(12, 0, 0, 0, 0, 0, 0, 0, '2020-12-14', 3),
(14, 12, 21, 12, 21, 12, 21, 21, '2020-12-14', 3);

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
  `gam` int(11) NOT NULL,
  `day` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `menu`
--

INSERT INTO `menu` (`id`, `id_mold`, `id_user`, `namefood`, `image`, `gam`, `day`, `status`) VALUES
(22, 2, 13, '食事の名前', NULL, 15, '2020-11-14', NULL),
(23, 1, 13, '食事の名前', NULL, 15, '2020-11-14', NULL),
(24, 1, 13, '食事の名前', 'img/EkufjYKytpMeYIf.jpg', 15, '2020-11-14', NULL),
(25, 1, 13, '食事の名前', NULL, 15, '2020-11-14', NULL);

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
  `age` int(5) DEFAULT NULL,
  `dayofbirth` date DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `fullname`, `email`, `age`, `dayofbirth`, `sex`, `password`, `status`) VALUES
(3, 'khoa', 'quachhongkhoa.it@gmail.com', 22, '2006-08-15', 0, '25d55ad283aa400af464c76d713c07ad', 0),
(13, 'Nguyễn Trọng ViVi', 'thaibasang8@gmail.com', 21, '1999-08-08', 0, 'a2505162af430dcdf773ed6a10861833', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `health_information`
--
ALTER TABLE `health_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_user_health_information` (`id_user`);

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
-- AUTO_INCREMENT cho bảng `health_information`
--
ALTER TABLE `health_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `health_information`
--
ALTER TABLE `health_information`
  ADD CONSTRAINT `fk_id_user_health_information` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
