-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `account` varchar(20) NOT NULL COMMENT 'ͨ��֤�˺�',
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `question_id` int(11) NOT NULL COMMENT '�ܱ�����id',
  `answer` varchar(200) NOT NULL COMMENT '�ܱ���',
  `name` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;