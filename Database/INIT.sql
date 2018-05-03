-- 表的结构：blog_article --
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `pic` varchar(50) NOT NULL,
  -- `uid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `edittime` int(11) NOT NULL,
  `view` int(11) NOT NULL,
  `Comment` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `mp3` varchar(200) NOT NULL,
  `pic2` varchar(50) NOT NULL,
  `biaoqian` varchar(20) NOT NULL,
  `pingfen` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;-- <xjx> --

-- 表的结构：blog_comment --
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `content` varchar(200) NOT NULL,
  `uid` int(11) NOT NULL,
  `replay` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;-- <xjx> --

-- 表的结构：blog_email_set --
CREATE TABLE `blog_email_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smtpserver` varchar(200) NOT NULL COMMENT 'SMTP服务器',
  `smtpserverport` int(11) NOT NULL COMMENT 'SMTP服务器端口',
  `smtpusermail` varchar(200) NOT NULL COMMENT 'SMTP服务器的用户邮箱',
  `smtpuser` varchar(200) NOT NULL COMMENT 'SMTP服务器的用户帐号',
  `smtppass` varchar(200) NOT NULL COMMENT 'SMTP服务器的用户密码',
  `reg_set_admin` int(11) NOT NULL COMMENT '用户注册 管理员是否收到邮件 0是 1不是',
  `reg_set_user` int(11) NOT NULL COMMENT '用户注册 用户是否收到邮件 0是 1不是',
  `send_article_set` int(11) NOT NULL COMMENT '用户发表文章  管理员是否收到邮件 0是 1 不是',
  `comment_set` int(11) NOT NULL COMMENT '用户回复 管理员是否收到邮件 0是 1不是',
  `message_set` int(11) NOT NULL COMMENT '收到留言是否发邮件 0是 1不是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;-- <xjx> --

-- 表的结构：blog_email_type --
CREATE TABLE `blog_email_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_user_title` varchar(200) NOT NULL COMMENT '用户注册用户收到邮件的标题',
  `reg_user_content` text NOT NULL COMMENT '用户注册用户收到邮件的内容',
  `reg_admin_title` varchar(200) NOT NULL COMMENT '用户注册管理员收到邮件的标题',
  `reg_admin_content` text NOT NULL COMMENT '用户注册管理员收到邮件的内容',
  `send_article_title` varchar(200) NOT NULL COMMENT '用户发文章管理员收到邮件的标题',
  `send_article_content` text NOT NULL COMMENT '用户发文章管理员收到邮件的内容',
  `send_comment_title` varchar(200) NOT NULL COMMENT '用户评论管理员收到邮件的标题',
  `send_comment_content` text NOT NULL COMMENT '用户评论管理员收到邮件的内容',
  `send_message_title` varchar(200) NOT NULL COMMENT '用户收到留言用户邮件的标题',
  `send_message_content` text NOT NULL COMMENT '用户收到留言用户邮件内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;-- <xjx> --

-- 表的结构：blog_fenlei --
CREATE TABLE `blog_fenlei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `fid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;-- <xjx> --

-- 表的结构：blog_friendlink --
CREATE TABLE `blog_friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(30) NOT NULL COMMENT '标题',
  `content` varchar(200) NOT NULL COMMENT '描述',
  `ctime` int(11) NOT NULL COMMENT '时间',
  `url` varchar(100) NOT NULL COMMENT '链接',
  `type` varchar(20) NOT NULL COMMENT '样式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;-- <xjx> --

-- 表的结构：blog_gonggao --
CREATE TABLE `blog_gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` varchar(220) NOT NULL,
  `ctime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;-- <xjx> --

-- 表的结构：blog_admin --
CREATE TABLE `blog_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `kouling` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;-- <xjx> --

-- 表的结构：blog_liuyan --
CREATE TABLE `blog_liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(10) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `content` varchar(100) NOT NULL,
  `ctime` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;-- <xjx> --

-- 表的结构：blog_site --
CREATE TABLE `blog_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `keywords` text NOT NULL,
  `description` text NOT NULL,
  `logo` varchar(200) NOT NULL,
  `articleSatus` int(11) NOT NULL COMMENT '0 无需审核 1 需要审核',
  `userStatus` int(11) NOT NULL COMMENT '0无需注册码 1需要注册码',
  `admin_email` varchar(100) NOT NULL,
  `set_content` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `statistics` text NOT NULL COMMENT '网站统计代码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;-- <xjx> --

-- 表的结构：blog_slides --
CREATE TABLE `blog_slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `url` varchar(100) NOT NULL,
  `ctime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;-- <xjx> --


-- 表的数据：blog_article --
INSERT INTO `blog_article` VALUES
('1','负值之美：负margin在页面布局中的应用','<p>负值之美：负margin在页面布局中的应用</p>','2016-03-22/56f1066802f2a.jpg','8','1458636392','1458700624','16','0','0','0','','','','0');-- <xjx> --

-- 表的数据：blog_comment --
INSERT INTO `blog_comment` VALUES
('1','测试回复2222222222222222','503633021@qq.com','评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论','1','0','1439308818','8');-- <xjx> --

-- 表的数据：blog_email_set --
INSERT INTO `blog_email_set` VALUES
('1','smtp.qq.com','25','503633021@qq.com','503633021@qq.com','zaq1994530','0','0','0','0','0');-- <xjx> --

-- 表的数据：blog_email_type --
INSERT INTO `blog_email_type` VALUES
('1','亲爱的管理员 有人评论文章了呦','<p>亲爱的管理员 有人评论文章了呦</p>','亲爱的管理员有用户留言了啊！','<p>阿萨德那就是的很快就阿萨德阿萨德阿萨</p>');-- <xjx> --

-- 表的数据：blog_fenlei --
INSERT INTO `blog_fenlei` VALUES
('1','技术','0','1'),
('2','PHP','1','1'),
('3','音乐','0','2'),
('4','电影','0','3'),
('5','心情','0','4'),
('8','Css','1','1'),
('22','电影分享','4','3'),
('23','音乐欣赏','3','2'),
('21','HTML','1','1'),
('20','JavaScript','1','1'),
('24','闲言碎语','5','4');-- <xjx> --

-- 表的数据：blog_friendlink --
INSERT INTO `blog_friendlink` VALUES
('1','百度搜索','百度搜索','1454596882','http://www.baidu.com/','info'),
('2','百度搜索','这是百度的搜索','1454597675','http://www.baidu.com/','danger');-- <xjx> --

-- 表的数据：blog_gonggao --
INSERT INTO `blog_gonggao` VALUES
('1','说明','可以修改','0'),
('2','提示','梦想家开源博客','0');-- <xjx> --

-- 表的数据：blog_admin --
INSERT INTO `blog_admin` VALUES
('1','0','Admin','e10adc3949ba59abbe56e057f20f883e','123456');-- <xjx> --

-- 表的数据：blog_liuyan --
INSERT INTO `blog_liuyan` VALUES
('1','#1A7BB9','127.0.0.1','这里是一个留言','这里是一个留言这里是一个留言这里是一个留言','1438797368','乱世小梦');-- <xjx> --

-- 表的数据：blog_site --
INSERT INTO `blog_site` VALUES
('1','94dreamer博客系统','94dreamer,梦想家,周振,个人博客,个人网站,前端','这是94梦想家的个人博客网站','2016-03-22/56f102ed670f7.jpg','0','0','503633021@qq.com','像夜莺在夏天门前彻夜清啭','就是梦想家','<script src=\"http://s4.cnzz.com/z_stat.php?id=1258125443&web_id=1258125443\" language=\"JavaScript\"></script>');-- <xjx> --

-- 表的数据：blog_slides --
INSERT INTO `blog_slides` VALUES
('4','梦想家','2016-03-22/56f0ff3516229.jpg','94dreamer.com','1458634549'),
('5','94dreamer','2016-03-22/56f0ff4ac8a94.jpg','94dreamer.com','1458634570'),
('3','个人','2016-03-24/56f34679128e3.jpg','94dreamer.com','1458022735');-- <xjx> --