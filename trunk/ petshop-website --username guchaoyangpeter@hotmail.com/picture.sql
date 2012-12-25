/*
MySQL Data Transfer
Source Host: localhost
Source Database: pet
Target Host: localhost
Target Database: pet
Date: 2012/12/7 19:15:55
*/
set names utf8;
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL auto_increment,
  `game_id` int(11) default NULL,
  `type` tinyint(4) default NULL,
  `name_ch` varchar(50) collate utf8_bin default NULL,
  `name_en` varchar(50) collate utf8_bin default NULL,
  `path` varchar(255) collate utf8_bin default NULL,
  `foot_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Reference_6` (`game_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`game_id`) REFERENCES `foot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;