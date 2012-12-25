-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `publish_user_id` int(11) NOT NULL COMMENT '发信人',
  `receive_user_id` int(11) NOT NULL COMMENT '收信人',
  `message_content` text NOT NULL,
  `publish_status` int(1) NOT NULL COMMENT '发送者消息状态：是否已读 0:未读;1:已读',
  `receiver_status` int(1) default NULL COMMENT '接受者状态:是否已读:0:未读;1:已读',
  `create_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message_reply
-- ----------------------------
DROP TABLE IF EXISTS `message_reply`;
CREATE TABLE `message_reply` (
  `id` int(11) NOT NULL auto_increment,
  `message_id` int(11) NOT NULL,
  `reply_user_id` int(11) default NULL COMMENT '回复人id',
  `reply_content` text NOT NULL,
  `reply_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
