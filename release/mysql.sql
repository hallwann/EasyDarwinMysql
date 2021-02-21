-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-02-21 02:39:00
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `howwant`
--

-- --------------------------------------------------------

--
-- 表的结构 `hw_live_lists`
--

CREATE TABLE `hw_live_lists` (
  `id` int(11) NOT NULL,
  `mid` varchar(255) NOT NULL DEFAULT 'md5(id)',
  `title` varchar(255) NOT NULL,
  `live_type` tinyint(4) NOT NULL DEFAULT '0',
  `access_mode` tinyint(4) NOT NULL DEFAULT '0',
  `server_node` varchar(255) NOT NULL,
  `view_permission` tinyint(4) NOT NULL DEFAULT '0',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cover` varchar(255) DEFAULT NULL,
  `uid` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hw_live_lists`
--

INSERT INTO `hw_live_lists` (`id`, `mid`, `title`, `live_type`, `access_mode`, `server_node`, `view_permission`, `start_time`, `end_time`, `cover`, `uid`) VALUES
(14, '5f9ae659d355707f78f1e97d910e371c', 'test', 1, 1, 'cn', 1, '2021-01-15 17:49:00', '2021-09-16 17:49:00', 'https://storage.upare.com/uploads/live/covers/3/a00523b1d191a7072c91184806ff16eb7c369408/cover_5f9ae659d355707f78f1e97d910e371c.jpg?bucket=storage', 3);

-- --------------------------------------------------------

--
-- 表的结构 `hw_live_sessions`
--

CREATE TABLE `hw_live_sessions` (
  `id` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expired_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hw_live_streams`
--

CREATE TABLE `hw_live_streams` (
  `url` varchar(255) NOT NULL,
  `custom_path` varchar(255) NOT NULL,
  `idle_timeout` int(11) NOT NULL,
  `heartbeat_interval` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hw_live_users`
--

CREATE TABLE `hw_live_users` (
  `id` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hw_live_users`
--

INSERT INTO `hw_live_users` (`id`, `username`, `password`) VALUES
('3', 'test', '123'),
('Cq3drL-GR', 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- 转储表的索引
--

--
-- 表的索引 `hw_live_lists`
--
ALTER TABLE `hw_live_lists`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `hw_live_sessions`
--
ALTER TABLE `hw_live_sessions`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `hw_live_users`
--
ALTER TABLE `hw_live_users`
  ADD UNIQUE KEY `id` (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `hw_live_lists`
--
ALTER TABLE `hw_live_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
