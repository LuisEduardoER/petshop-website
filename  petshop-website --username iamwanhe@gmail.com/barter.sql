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
-- Table structure for barter
-- ----------------------------
DROP TABLE IF EXISTS `barter`;
CREATE TABLE `barter` (
  `id` int(11) NOT NULL auto_increment,
  `title_ch` varchar(250) NOT NULL,
  `title_en` varchar(250) NOT NULL,
  `content_ch` text NOT NULL,
  `content_en` text NOT NULL,
  `picture_ch_path` varchar(250) NOT NULL,
  `picture_en_path` varchar(250) NOT NULL,
  `link_ch` varchar(250) NOT NULL,
  `link_en` varchar(250) NOT NULL,
  `sort_num` int(3) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;