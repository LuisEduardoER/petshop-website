-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `account` varchar(20) NOT NULL COMMENT '通行证账号',
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `question_id` int(11) NOT NULL COMMENT '密保问题id',
  `answer` varchar(200) NOT NULL COMMENT '密保答案',
  `name` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;