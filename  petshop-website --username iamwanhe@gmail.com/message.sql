-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `publish_user_id` int(11) NOT NULL COMMENT '������',
  `receive_user_id` int(11) NOT NULL COMMENT '������',
  `message_content` text NOT NULL,
  `publish_status` int(1) NOT NULL COMMENT '��������Ϣ״̬���Ƿ��Ѷ� 0:δ��;1:�Ѷ�',
  `receiver_status` int(1) default NULL COMMENT '������״̬:�Ƿ��Ѷ�:0:δ��;1:�Ѷ�',
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
  `reply_user_id` int(11) default NULL COMMENT '�ظ���id',
  `reply_content` text NOT NULL,
  `reply_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
