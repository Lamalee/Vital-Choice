-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 19, 2026 lúc 11:48 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Đang đổ dữ liệu cho bảng `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Đang đổ dữ liệu cho bảng `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"vital_choice\",\"table\":\"players\"},{\"db\":\"vital_choice\",\"table\":\"answers\"},{\"db\":\"vital_choice\",\"table\":\"exam_questions\"},{\"db\":\"vital_choice\",\"table\":\"events\"},{\"db\":\"vital_choice\",\"table\":\"session_items\"},{\"db\":\"vital_choice\",\"table\":\"items\"},{\"db\":\"vital_choice\",\"table\":\"summary_status\"}]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Đang đổ dữ liệu cho bảng `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-04-19 09:42:56', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"vi\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Chỉ mục cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Chỉ mục cho bảng `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Chỉ mục cho bảng `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Chỉ mục cho bảng `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Chỉ mục cho bảng `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Chỉ mục cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Chỉ mục cho bảng `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Chỉ mục cho bảng `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Chỉ mục cho bảng `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Chỉ mục cho bảng `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Cơ sở dữ liệu: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Cơ sở dữ liệu: `vital_choice`
--
CREATE DATABASE IF NOT EXISTS `vital_choice` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vital_choice`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `answers`
--

CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `choice` varchar(5) NOT NULL,
  `content` text DEFAULT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `explanation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `answers`
--

INSERT INTO `answers` (`answer_id`, `question_id`, `choice`, `content`, `is_correct`, `explanation`) VALUES
(1, 1, 'A', '3', 0, 'Sai'),
(2, 1, 'B', '4', 1, 'Đúng'),
(3, 1, 'C', '5', 0, 'Sai'),
(4, 1, 'D', '6', 0, 'Sai'),
(5, 2, 'A', '8', 1, 'Đúng'),
(6, 2, 'B', '7', 0, 'Sai'),
(7, 2, 'C', '6', 0, 'Sai'),
(8, 2, 'D', '9', 0, 'Sai'),
(9, 3, 'A', '10', 1, 'Đúng'),
(10, 3, 'B', '8', 0, 'Sai'),
(11, 3, 'C', '12', 0, 'Sai'),
(12, 3, 'D', '15', 0, 'Sai'),
(13, 4, 'A', '5', 1, 'Đúng'),
(14, 4, 'B', '4', 0, 'Sai'),
(15, 4, 'C', '6', 0, 'Sai'),
(16, 4, 'D', '3', 0, 'Sai'),
(17, 5, 'T', 'True', 1, 'Đúng'),
(18, 5, 'F', 'False', 0, 'Sai'),
(19, 6, 'T', 'True', 1, 'Đúng'),
(20, 6, 'F', 'False', 0, 'Sai'),
(21, 7, 'T', 'True', 0, 'Sai'),
(22, 7, 'F', 'False', 1, 'Đúng'),
(23, 8, 'A', '5', 1, 'Đúng'),
(24, 8, 'B', '6', 0, 'Sai'),
(25, 8, 'C', '4', 0, 'Sai'),
(26, 8, 'D', '3', 0, 'Sai'),
(27, 9, 'A', '18', 1, 'Đúng'),
(28, 9, 'B', '12', 0, 'Sai'),
(29, 9, 'C', '20', 0, 'Sai'),
(30, 9, 'D', '15', 0, 'Sai'),
(31, 10, 'A', '3', 1, 'Đúng'),
(32, 10, 'B', '2', 0, 'Sai'),
(33, 10, 'C', '4', 0, 'Sai'),
(34, 10, 'D', '1', 0, 'Sai');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `events`
--

INSERT INTO `events` (`event_id`, `description`, `question_id`) VALUES
(1, 'Event 1', 1),
(2, 'Event 2', 2),
(3, 'Event 3', 3),
(4, 'Event 4', 4),
(5, 'Event 5', 5),
(6, 'Event 6', 6),
(7, 'Event 7', 7),
(8, 'Event 8', 8),
(9, 'Event 9', 9),
(10, 'Event 10', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exams`
--

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `exam_code` varchar(50) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `exams`
--

INSERT INTO `exams` (`exam_id`, `exam_code`, `teacher_id`, `created_at`) VALUES
(1, 'EX001', 6, '2026-04-17 16:28:16'),
(2, 'EX002', 7, '2026-04-17 16:28:16'),
(3, 'EX003', 6, '2026-04-17 16:28:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exam_questions`
--

CREATE TABLE `exam_questions` (
  `exam_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `exam_questions`
--

INSERT INTO `exam_questions` (`exam_id`, `question_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `game_sessions`
--

CREATE TABLE `game_sessions` (
  `session_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `current_day` int(11) DEFAULT 1,
  `health` int(11) DEFAULT 20,
  `status` tinyint(4) DEFAULT 0,
  `score` int(11) DEFAULT 0,
  `mode` tinyint(4) DEFAULT 0,
  `exam_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `game_sessions`
--

INSERT INTO `game_sessions` (`session_id`, `player_id`, `current_day`, `health`, `status`, `score`, `mode`, `exam_id`) VALUES
(1, 1, 2, 18, 1, 40, 0, NULL),
(2, 1, 4, 12, 1, 110, 1, 1),
(3, 2, 3, 15, 0, 60, 0, NULL),
(4, 3, 5, 10, 2, 70, 1, 2),
(5, 4, 1, 20, 0, 10, 0, NULL),
(6, 5, 6, 8, 1, 130, 1, 1),
(7, 2, 2, 17, 0, 30, 0, NULL),
(8, 3, 3, 16, 0, 50, 0, NULL),
(9, 4, 4, 14, 2, 40, 1, 2),
(10, 5, 2, 19, 0, 20, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history_answers`
--

CREATE TABLE `history_answers` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `day` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `history_answers`
--

INSERT INTO `history_answers` (`id`, `session_id`, `question_id`, `answer_id`, `is_correct`, `day`, `exam_id`) VALUES
(1, 1, 1, 2, 1, 1, NULL),
(2, 1, 2, 3, 1, 2, NULL),
(3, 2, 3, 5, 1, 1, 1),
(4, 2, 4, 7, 1, 2, 1),
(5, 3, 5, 9, 1, 1, NULL),
(6, 4, 6, 11, 1, 1, 2),
(7, 5, 7, 14, 1, 2, NULL),
(8, 6, 8, 15, 1, 3, 1),
(9, 7, 9, 17, 1, 1, NULL),
(10, 8, 10, 19, 1, 2, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `rate` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `items`
--

INSERT INTO `items` (`item_id`, `name`, `description`, `rate`) VALUES
(1, 'Food', 'Luôn có sẵn mỗi ngày.\nTrả lời đúng câu hỏi dễ để được ăn.\nNếu trả lời sai: +1 đói (nếu đang 0 thì +2).', 0),
(2, 'Water', 'Luôn có sẵn mỗi ngày.\r\nTrả lời đúng câu hỏi dễ để được uống.\r\nNếu trả lời sai: +1 khát (nếu đang 0 thì +2).', 0),
(3, 'Medicine', 'Giảm trạng thái bệnh.\r\nTỷ lệ xuất hiện ban đầu: 0%.\r\nMỗi câu trả lời đúng: +10% (tối đa 90%).\r\nÁp dụng câu hỏi trung bình.', 0),
(4, 'Chess Board', 'Giảm ảo giác (-2).\r\nTỷ lệ xuất hiện ban đầu: 0%.\r\nMỗi câu trả lời đúng: +10% (tối đa 90%).\r\nÁp dụng câu hỏi trung bình.', 0),
(5, 'Fire', 'Giảm rét (-2).\r\nTỷ lệ xuất hiện ban đầu: 10%.\r\nMỗi câu trả lời đúng: +20% (tối đa 100%).\r\nÁp dụng câu hỏi trung bình.', 0),
(6, 'Radio', 'Vật phẩm đặc biệt để được giải cứu.\nCần gọi 3 lần (dễ) hoặc 4 lần (khó) để thắng.\nTỷ lệ xuất hiện ban đầu: 0%.\nMỗi ngày trôi qua: +10% (tối đa 100%).\nSau khi dùng, các vật phẩm khác (trừ Food và Water) sẽ reset tỷ lệ vào ngày hôm sau.\nDùng câu hỏi khó.', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `players`
--

INSERT INTO `players` (`id`, `username`, `password`, `role`) VALUES
(1, 'student1', '123', 0),
(2, 'student2', '123', 0),
(3, 'student3', '123', 0),
(4, 'student4', '123', 0),
(5, 'student5', '123', 0),
(6, 'teacher1', '123', 1),
(7, 'teacher2', '123', 1),
(8, 'admin1', '123', 2),
(9, 'admin2', '123', 2),
(10, 'admin3', '123', 2),
(23, 'vokhaine', '$2y$10$lPQDRwY0cF1LsccRv0f9tO8baSuGx9b3zCUH.J45JlPCj50zTATVi', 0),
(24, 'khaine', '$2y$10$ejoVlrL1dKPdDjstI2dGlupVmwBJd89Uq.vk.CROONolNnjOzVtrG', 0),
(25, 'hellobro', '$2y$10$xZZQ2o27d7uenGGUUaIo3.MGmHWQeEAtGX2dYz5Bd.9Aec9Ed7dnu', 1),
(26, 'Lamle', '$2y$10$TIALqfzdn.1d/mTGAwsp.em5LSKkA5CdfGMKsJUQlaVcPGNpgZXJu', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `player_status`
--

CREATE TABLE `player_status` (
  `session_id` int(11) NOT NULL,
  `hunger` int(11) DEFAULT 15,
  `thirst` int(11) DEFAULT 5,
  `sickness` int(11) DEFAULT 15,
  `cold` int(11) DEFAULT 20,
  `hallucination` int(11) DEFAULT 20,
  `radio_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `player_status`
--

INSERT INTO `player_status` (`session_id`, `hunger`, `thirst`, `sickness`, `cold`, `hallucination`, `radio_count`) VALUES
(1, 8, 9, 10, 10, 10, 1),
(2, 5, 6, 8, 9, 10, 2),
(3, 9, 9, 10, 10, 10, 0),
(4, 7, 8, 9, 9, 9, 1),
(5, 6, 7, 8, 8, 8, 0),
(6, 5, 5, 7, 7, 7, 2),
(7, 9, 10, 10, 10, 10, 0),
(8, 8, 8, 9, 9, 9, 1),
(9, 6, 6, 7, 7, 7, 0),
(10, 10, 10, 10, 10, 10, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `type` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `questions`
--

INSERT INTO `questions` (`question_id`, `content`, `type`, `created_by`) VALUES
(1, '2+2=?', 0, 6),
(2, '3+5=?', 0, 6),
(3, '5*2=?', 0, 7),
(4, '10/2=?', 0, 6),
(5, 'Trái đất tròn?', 1, 6),
(6, 'Mặt trời nóng?', 1, 7),
(7, '1+1=3?', 1, 6),
(8, '7-2=?', 0, 7),
(9, '6*3=?', 0, 6),
(10, '9/3=?', 0, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `session_items`
--

CREATE TABLE `session_items` (
  `session_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `spawn_rate` int(11) DEFAULT 0,
  `is_available` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `session_items`
--

INSERT INTO `session_items` (`session_id`, `item_id`, `spawn_rate`, `is_available`) VALUES
(1, 1, 50, 0),
(1, 2, 50, 0),
(1, 3, 20, 0),
(1, 4, 20, 0),
(1, 5, 30, 0),
(1, 6, 10, 0),
(2, 1, 60, 0),
(2, 2, 60, 0),
(2, 3, 30, 0),
(2, 4, 25, 0),
(2, 5, 40, 0),
(2, 6, 10, 0),
(3, 1, 40, 0),
(3, 2, 40, 0),
(3, 3, 25, 0),
(3, 4, 20, 0),
(3, 5, 35, 0),
(3, 6, 15, 0),
(4, 1, 70, 0),
(4, 2, 70, 0),
(4, 3, 40, 0),
(4, 4, 35, 0),
(4, 5, 50, 0),
(4, 6, 20, 0),
(5, 1, 30, 0),
(5, 2, 30, 0),
(5, 3, 15, 0),
(5, 4, 15, 0),
(5, 5, 25, 0),
(5, 6, 10, 0),
(6, 1, 55, 0),
(6, 2, 55, 0),
(6, 3, 30, 0),
(6, 4, 30, 0),
(6, 5, 45, 0),
(6, 6, 15, 0),
(7, 1, 45, 0),
(7, 2, 45, 0),
(7, 3, 20, 0),
(7, 4, 25, 0),
(7, 5, 35, 0),
(7, 6, 10, 0),
(8, 1, 80, 0),
(8, 2, 80, 0),
(8, 3, 50, 0),
(8, 4, 45, 0),
(8, 5, 60, 0),
(8, 6, 30, 0),
(9, 1, 35, 0),
(9, 2, 35, 0),
(9, 3, 20, 0),
(9, 4, 20, 0),
(9, 5, 30, 0),
(9, 6, 10, 0),
(10, 1, 75, 0),
(10, 2, 75, 0),
(10, 3, 40, 0),
(10, 4, 40, 0),
(10, 5, 55, 0),
(10, 6, 25, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `summary_status`
--

CREATE TABLE `summary_status` (
  `player_id` int(11) NOT NULL,
  `total_games` int(11) DEFAULT 0,
  `best_score` int(11) DEFAULT 0,
  `longest_survival` int(11) DEFAULT 0,
  `wrong_answers` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `summary_status`
--

INSERT INTO `summary_status` (`player_id`, `total_games`, `best_score`, `longest_survival`, `wrong_answers`) VALUES
(1, 11, 100, 10, 2),
(2, 3, 80, 8, 4),
(3, 7, 120, 12, 1),
(4, 2, 60, 5, 6),
(5, 4, 90, 9, 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `fk_answers_question` (`question_id`);

--
-- Chỉ mục cho bảng `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `fk_event_question` (`question_id`);

--
-- Chỉ mục cho bảng `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`),
  ADD UNIQUE KEY `exam_code` (`exam_code`),
  ADD KEY `fk_exam_teacher` (`teacher_id`);

--
-- Chỉ mục cho bảng `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`exam_id`,`question_id`),
  ADD KEY `fk_eq_question` (`question_id`);

--
-- Chỉ mục cho bảng `game_sessions`
--
ALTER TABLE `game_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `fk_sessions_player` (`player_id`);

--
-- Chỉ mục cho bảng `history_answers`
--
ALTER TABLE `history_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_history_question` (`question_id`),
  ADD KEY `fk_history_answer` (`answer_id`),
  ADD KEY `fk_history_session` (`session_id`);

--
-- Chỉ mục cho bảng `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- Chỉ mục cho bảng `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `player_status`
--
ALTER TABLE `player_status`
  ADD PRIMARY KEY (`session_id`);

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `fk_questions_creator` (`created_by`);

--
-- Chỉ mục cho bảng `session_items`
--
ALTER TABLE `session_items`
  ADD PRIMARY KEY (`session_id`,`item_id`),
  ADD KEY `fk_si_item` (`item_id`);

--
-- Chỉ mục cho bảng `summary_status`
--
ALTER TABLE `summary_status`
  ADD PRIMARY KEY (`player_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `answers`
--
ALTER TABLE `answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `exams`
--
ALTER TABLE `exams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `game_sessions`
--
ALTER TABLE `game_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `history_answers`
--
ALTER TABLE `history_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `fk_answers_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`);

--
-- Các ràng buộc cho bảng `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_event_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`);

--
-- Các ràng buộc cho bảng `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `fk_exam_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `players` (`id`);

--
-- Các ràng buộc cho bảng `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD CONSTRAINT `fk_eq_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_eq_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`);

--
-- Các ràng buộc cho bảng `game_sessions`
--
ALTER TABLE `game_sessions`
  ADD CONSTRAINT `fk_sessions_player` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `history_answers`
--
ALTER TABLE `history_answers`
  ADD CONSTRAINT `fk_history_answer` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`),
  ADD CONSTRAINT `fk_history_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `fk_history_session` FOREIGN KEY (`session_id`) REFERENCES `game_sessions` (`session_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `player_status`
--
ALTER TABLE `player_status`
  ADD CONSTRAINT `fk_status_session` FOREIGN KEY (`session_id`) REFERENCES `game_sessions` (`session_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `fk_questions_creator` FOREIGN KEY (`created_by`) REFERENCES `players` (`id`);

--
-- Các ràng buộc cho bảng `session_items`
--
ALTER TABLE `session_items`
  ADD CONSTRAINT `fk_si_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  ADD CONSTRAINT `fk_si_session` FOREIGN KEY (`session_id`) REFERENCES `game_sessions` (`session_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `summary_status`
--
ALTER TABLE `summary_status`
  ADD CONSTRAINT `fk_summary_player` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
