-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 23, 2025 at 08:54 PM
-- Server version: 8.4.0
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `watrbx`
--

-- --------------------------------------------------------

--
-- Table structure for table `activeplayers`
--

CREATE TABLE `activeplayers` (
  `id` int NOT NULL,
  `playerid` int NOT NULL,
  `pid` varchar(255) NOT NULL,
  `jobid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int NOT NULL,
  `prodtype` varchar(255) NOT NULL DEFAULT 'User Product',
  `prodid` int NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `assetid` int NOT NULL,
  `iconasset` int DEFAULT NULL,
  `created` bigint NOT NULL,
  `updated` bigint NOT NULL,
  `price_r` bigint NOT NULL DEFAULT '0',
  `price_t` bigint NOT NULL DEFAULT '0',
  `sales` int NOT NULL DEFAULT '0',
  `new` int NOT NULL DEFAULT '0',
  `forsale` int NOT NULL DEFAULT '0',
  `publicdomain` int NOT NULL DEFAULT '0',
  `limited` int NOT NULL DEFAULT '0',
  `limitedu` int NOT NULL DEFAULT '0',
  `remaining` int NOT NULL DEFAULT '0',
  `memshiplev` int NOT NULL DEFAULT '0',
  `rating` int NOT NULL DEFAULT '0',
  `owner` int NOT NULL,
  `assetfile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` varchar(255) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `moderatorid` int DEFAULT NULL,
  `moderator` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `chatlogs`
--

CREATE TABLE `chatlogs` (
  `id` int NOT NULL,
  `userid` int NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `filtered` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `clienttickets`
--

CREATE TABLE `clienttickets` (
  `id` int NOT NULL,
  `ticket` text NOT NULL,
  `userid` int NOT NULL,
  `created` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int NOT NULL,
  `sitebanner` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `register_enabled` int NOT NULL,
  `guestenabled` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `csrftokens`
--

CREATE TABLE `csrftokens` (
  `id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `userid` int NOT NULL,
  `form` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `datastores`
--

CREATE TABLE `datastores` (
  `id` int NOT NULL,
  `pid` int NOT NULL,
  `dkey` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `scope` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `length` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `friendrequests`
--

CREATE TABLE `friendrequests` (
  `sender` bigint NOT NULL,
  `user` bigint NOT NULL,
  `fid` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `user1` bigint NOT NULL,
  `user2` bigint NOT NULL,
  `fid` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` bigint NOT NULL,
  `place` bigint NOT NULL DEFAULT '1',
  `ip` varchar(150) NOT NULL DEFAULT '70.228.127.12',
  `port` int NOT NULL DEFAULT '53640',
  `jobId` text NOT NULL,
  `isactive` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `invitekeys`
--

CREATE TABLE `invitekeys` (
  `id` int NOT NULL,
  `invkey` varchar(255) NOT NULL,
  `owner` int NOT NULL,
  `uses` int NOT NULL DEFAULT '0',
  `usedamount` int NOT NULL,
  `date` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ipban`
--

CREATE TABLE `ipban` (
  `id` int NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int NOT NULL,
  `jobid` varchar(255) NOT NULL,
  `jobtype` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `user` int DEFAULT NULL,
  `placeid` int DEFAULT NULL,
  `assetid` int DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `joincodes`
--

CREATE TABLE `joincodes` (
  `id` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `port` bigint NOT NULL,
  `pid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `key` varchar(25) DEFAULT NULL,
  `used` bigint DEFAULT NULL,
  `id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `sender` bigint NOT NULL,
  `user` bigint NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `viewed` int NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` int NOT NULL,
  `quote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `author` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `refers`
--

CREATE TABLE `refers` (
  `id` int NOT NULL,
  `refername` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `visits` int NOT NULL,
  `signups` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serverqueue`
--

CREATE TABLE `serverqueue` (
  `id` bigint NOT NULL,
  `place` bigint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(25) NOT NULL,
  `ownid` varchar(25) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `thumbnails`
--

CREATE TABLE `thumbnails` (
  `id` int NOT NULL,
  `assetid` int NOT NULL,
  `dimensions` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int NOT NULL,
  `ownid` int NOT NULL,
  `otherid` int DEFAULT NULL,
  `gamepassid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `universes`
--

CREATE TABLE `universes` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `placeid` int NOT NULL,
  `parent` int DEFAULT NULL,
  `thumbnail` varchar(255) NOT NULL DEFAULT 'https://placehold.co/1280x720',
  `smallicon` varchar(255) NOT NULL DEFAULT 'https://placehold.co/1024x1024',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `owner` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `regtime` int NOT NULL,
  `role` int NOT NULL DEFAULT '0',
  `banned` int NOT NULL DEFAULT '0',
  `bio` varchar(200) NOT NULL DEFAULT 'This user does not have a bio',
  `signup_key` varchar(255) DEFAULT NULL,
  `robux` int NOT NULL DEFAULT '0',
  `tix` int NOT NULL DEFAULT '10',
  `placelimit` int NOT NULL DEFAULT '5',
  `builderclub` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `versionhistory`
--

CREATE TABLE `versionhistory` (
  `id` int NOT NULL,
  `placeid` int NOT NULL,
  `file_id` varchar(255) NOT NULL,
  `datemodified` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` int NOT NULL,
  `universeid` int NOT NULL,
  `userid` int NOT NULL,
  `time` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activeplayers`
--
ALTER TABLE `activeplayers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatlogs`
--
ALTER TABLE `chatlogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clienttickets`
--
ALTER TABLE `clienttickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `csrftokens`
--
ALTER TABLE `csrftokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datastores`
--
ALTER TABLE `datastores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friendrequests`
--
ALTER TABLE `friendrequests`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invitekeys`
--
ALTER TABLE `invitekeys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ipban`
--
ALTER TABLE `ipban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `joincodes`
--
ALTER TABLE `joincodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refers`
--
ALTER TABLE `refers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serverqueue`
--
ALTER TABLE `serverqueue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thumbnails`
--
ALTER TABLE `thumbnails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universes`
--
ALTER TABLE `universes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `versionhistory`
--
ALTER TABLE `versionhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activeplayers`
--
ALTER TABLE `activeplayers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chatlogs`
--
ALTER TABLE `chatlogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clienttickets`
--
ALTER TABLE `clienttickets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `csrftokens`
--
ALTER TABLE `csrftokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `datastores`
--
ALTER TABLE `datastores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friendrequests`
--
ALTER TABLE `friendrequests`
  MODIFY `fid` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `fid` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invitekeys`
--
ALTER TABLE `invitekeys`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipban`
--
ALTER TABLE `ipban`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `joincodes`
--
ALTER TABLE `joincodes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refers`
--
ALTER TABLE `refers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serverqueue`
--
ALTER TABLE `serverqueue`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thumbnails`
--
ALTER TABLE `thumbnails`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `universes`
--
ALTER TABLE `universes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `versionhistory`
--
ALTER TABLE `versionhistory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
