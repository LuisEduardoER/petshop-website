-- ----------------------------
-- Table structure for foot
-- ----------------------------
DROP TABLE IF EXISTS `foot`;
CREATE TABLE `foot` (
  `id` int(11) NOT NULL auto_increment,
  `code` varchar(10) collate utf8_bin default NULL,
  `name_ch` varchar(50) collate utf8_bin NOT NULL,
  `name_en` varchar(50) collate utf8_bin NOT NULL,
  `first_char` varchar(1) collate utf8_bin NOT NULL,
  `comment_ch` text collate utf8_bin,
  `modify_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `status` tinyint(4) default NULL,
  `isrecommend` int(1) default '0',
  `isnew` int(1) default '0',
  `comment_en` text collate utf8_bin,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for foot_collection
-- ----------------------------
DROP TABLE IF EXISTS `foot_collection`;
CREATE TABLE `foot_collection` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `foot_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;