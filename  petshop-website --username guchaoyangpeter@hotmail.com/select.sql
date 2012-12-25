-- ----------------------------
-- Table structure for select_foot_relation
-- ----------------------------
DROP TABLE IF EXISTS `select_foot_relation`;
CREATE TABLE `select_foot_relation` (
  `foot_id` int(11) NOT NULL,
  `select_type_id` int(11) NOT NULL,
  `select_info_id` int(11) NOT NULL,
  PRIMARY KEY  (`foot_id`,`select_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for select_info
-- ----------------------------
DROP TABLE IF EXISTS `select_info`;
CREATE TABLE `select_info` (
  `id` int(11) NOT NULL auto_increment,
  `select_type_id` int(11) default NULL,
  `select_info_ch` varchar(50) collate utf8_bin default NULL,
  `select_info_en` varchar(50) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Reference_1` (`select_type_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`select_type_id`) REFERENCES `select_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for select_type
-- ----------------------------
DROP TABLE IF EXISTS `select_type`;
CREATE TABLE `select_type` (
  `id` int(11) NOT NULL auto_increment,
  `name_ch` varchar(50) collate utf8_bin NOT NULL,
  `name_en` varchar(50) collate utf8_bin NOT NULL,
  `sort_num` int(11) NOT NULL COMMENT 'µ¹Ðð',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;