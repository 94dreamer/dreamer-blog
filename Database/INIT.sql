-- 表的结构：blog_article --
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `pic` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;-- <xjx> --

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
('1','负值之美：负margin在页面布局中的应用','<p></p><p></p><p></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">本文转载自:<span style=\"color:#333333\"><a href=\"http://www.topcss.org/?p=94\" target=\"_self\">http://www.topcss.org/?p=94</a></span>，有修改。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">负数给人总是一种消极、否定、拒绝之感，不过有时利用负margin可以达到奇妙的效果，今天就表一表负值在页面布局中的应用。这里说的负值主要指的是负margin。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">关于负margin的原理建议大家看看这篇文章：<span style=\"color:#333333\"><a href=\"http://www.cnblogs.com/2050/archive/2012/08/13/2636467.html#2457812\" target=\"_blank\">http://www.cnblogs.com/2050/archive/2012/08/13/2636467.html#2457812</a></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">本文不讲原理，主要展示几个应用。</p><h1 style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\">一、左右列固定，中间列自适应布局</h1><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">此例适用于左右栏宽度固定，中间栏宽度自适应的布局。由于网页的主体部分一般在中间，很多网页都需要中间列优先加载，而这种布局刚好满足此需求。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">HTML：</p><div class=\"cnblogs_code\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\"><pre style=\"margin-bottom: 0px; padding: 0px;\">    &lt;div class=&quot;main&quot;&gt;\r\n        &lt;div class=&quot;main_body&quot;&gt;Main&lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;left&quot;&gt;Left&lt;/div&gt;\r\n    &lt;div class=&quot;right&quot;&gt;Right&lt;/div&gt;</pre></div><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">CSS：</p><div class=\"cnblogs_code\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\"><pre style=\"margin-bottom: 0px; padding: 0px;\">    body{\r\n        margin:0;\r\n        padding:0;\r\n        min-width:600px;\r\n    }\r\n    .main{\r\n        float:left;\r\n        width:100%;\r\n    }\r\n    .main_body{\r\n        margin:0 210px;\r\n        background:#888;\r\n        height:200px;\r\n    }\r\n    .left,.right{\r\n        float:left;\r\n        width:200px;\r\n        height:200px;\r\n        background:#F60;\r\n    }\r\n    .left{\r\n        margin-left:-100%;\r\n    }\r\n    .right{\r\n        margin-left:-200px;\r\n    }</pre></div><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">效果：</p><p><span id=\"_baidu_bookmark_start_0\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_start_2\" style=\"display: none; line-height: 0px;\">‍</span><img src=\"http://pic002.cnblogs.com/images/2012/389001/2012082812531391.png\" alt=\"\" style=\"margin: 0px 0px 15px; padding: 8px; \"/><span id=\"_baidu_bookmark_end_3\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_end_1\" style=\"display: none; line-height: 0px;\">‍</span></p><h1 style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\">二、去除列表右边框</h1><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">项目中经常会使用浮动列表展示信息，为了美观通常为每个列表之间设置一定的间距（margin-right）,当父元素的宽度固定式，每一行的最右端的li元素的右边距就多余了，去除的方法通常是为最右端的li添加class，设置<em style=\"margin: 0px; padding: 0px;\">margin-right:0;&nbsp;</em>这种方法需要动态判断为哪些li元素添加class，麻烦！！！利用负margin就可以实现下面这种效果：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">HTML：</p><div class=\"cnblogs_code\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\"><pre style=\"margin-bottom: 0px; padding: 0px;\">    &lt;div id=&quot;test&quot;&gt;\r\n        &lt;ul&gt;\r\n            &lt;li&gt;子元素1&lt;/li&gt;\r\n            &lt;li&gt;子元素2&lt;/li&gt;\r\n            &lt;li&gt;子元素3&lt;/li&gt;\r\n            &lt;li&gt;子元素4&lt;/li&gt;\r\n            &lt;li&gt;子元素5&lt;/li&gt;\r\n            &lt;li&gt;子元素6&lt;/li&gt;\r\n        &lt;/ul&gt;\r\n    &lt;/div&gt;</pre></div><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">CSS：</p><div class=\"cnblogs_code\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\"><pre style=\"margin-bottom: 0px; padding: 0px;\">    body,ul,li{ padding:0; margin:0;}\r\n    ul,li{ list-style:none;}\r\n    #test{\r\n        width:320px;\r\n        height:210px;\r\n        background:#CCC;\r\n    }\r\n    #test ul{\r\n        margin-right:-10px;\r\n        zoom:1;\r\n    }\r\n    #test ul li{\r\n        width:100px;\r\n        height:100px;\r\n        background:#F60;\r\n        margin-right:10px;\r\n        margin-bottom:10px;\r\n        float:left;\r\n    }</pre></div><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">效果：</p><p><span id=\"_baidu_bookmark_start_4\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_start_6\" style=\"display: none; line-height: 0px;\">‍</span><img src=\"http://pic002.cnblogs.com/images/2012/389001/2012082812544719.png\" alt=\"\" style=\"margin: 0px 0px 15px; padding: 8px; \"/><span id=\"_baidu_bookmark_end_7\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_end_5\" style=\"display: none; line-height: 0px;\">‍</span></p><h1 style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\">三、负边距+定位：水平垂直居中</h1><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">使用绝对定位将div定位到body的中心，然后使用负margin（content宽高的一半），将div的中心拉回到body的中心，已到达水平垂直居中的效果。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">HTML：</p><div class=\"cnblogs_code\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\"><pre style=\"margin-bottom: 0px; padding: 0px;\">&lt;div id=&quot;test&quot;&gt;&lt;/div&gt;</pre></div><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">CSS：</p><div class=\"cnblogs_code\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\"><pre style=\"margin-bottom: 0px; padding: 0px;\">    body{margin:0;padding:0;}\r\n    #test{\r\n        width:200px;\r\n        height:200px;\r\n        background:#F60;\r\n        position:absolute;\r\n        left:50%;\r\n        top:50%;\r\n        margin-left:-100px;\r\n        margin-top:-100px;\r\n    }</pre></div><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">效果：</p><p><span id=\"_baidu_bookmark_start_8\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_start_10\" style=\"display: none; line-height: 0px;\">‍</span><img src=\"http://pic002.cnblogs.com/images/2012/389001/2012082812561561.png\" alt=\"\" style=\"margin: 0px 0px 15px; padding: 8px;\"/><span id=\"_baidu_bookmark_end_11\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_end_9\" style=\"display: none; line-height: 0px;\">‍</span></p><h1 style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\">四、去除列表最后一个li元素的border-bottom</h1><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">列表中我们经常会添加border-bottom值，最后一个li的border-bottom往往会与外边框重合，视觉上不雅观，往往要移除。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">HTML：</p><div class=\"cnblogs_code\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\"><pre style=\"margin-bottom: 0px; padding: 0px;\">    &lt;ul id=&quot;test&quot;&gt;\r\n        &lt;li&gt;Test&lt;/li&gt;\r\n        &lt;li&gt;Test&lt;/li&gt;\r\n        &lt;li&gt;Test&lt;/li&gt;\r\n        &lt;li&gt;Test&lt;/li&gt;\r\n        &lt;li&gt;Test&lt;/li&gt;\r\n    &lt;/ul&gt;</pre></div><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">CSS：</p><div class=\"cnblogs_code\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\"><pre style=\"margin-bottom: 0px; padding: 0px;\">    body,ul,li{margin:0;padding:0;}\r\n    ul,li{list-style:none;}\r\n    #test{\r\n        margin:20px;\r\n        width:390px;\r\n        background:#F4F8FC;\r\n        border-radius:3px;\r\n        border:2px solid #D7E2EC;\r\n    }\r\n    #test li{\r\n        height:25px;\r\n        line-height:25px;\r\n        padding:5px;\r\n        border-bottom:1px dotted #D5D5D5;\r\n        margin-bottom:-1px;\r\n    }</pre></div><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">效果：</p><p><span id=\"_baidu_bookmark_start_12\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_start_14\" style=\"display: none; line-height: 0px;\">‍</span><img src=\"http://pic002.cnblogs.com/images/2012/389001/2012082812574768.png\" alt=\"\" style=\"margin: 0px 0px 15px; padding: 8px;\"/><span id=\"_baidu_bookmark_end_15\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_end_13\" style=\"display: none; line-height: 0px;\">‍</span></p><h1 style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\">五、多列等高</h1><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">此例关键是给每个框设置大的底部内边距，然后用数值相似的负外边距消除这个高度。这会导致每一列溢出容器元素，如果把外包容器的overflow属性设为hidden，列就在最高点被裁切。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">HTML：</p><div class=\"cnblogs_code\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\"><pre style=\"margin-bottom: 0px; padding: 0px;\">    &lt;div id=&quot;wrap&quot;&gt;\r\n        &lt;div id=&quot;left&quot;&gt;\r\n            &lt;p style=&quot;height:50px&quot;&gt;style=&quot;height:50px&quot;&lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div id=&quot;center&quot;&gt;\r\n            &lt;p style=&quot;height:100px&quot;&gt;style=&quot;height:100px&quot;&lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div id=&quot;right&quot;&gt;\r\n            &lt;p style=&quot;height:200px&quot;&gt;style=&quot;height:200px&quot;&lt;/p&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;</pre></div><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">CSS：</p><div class=\"cnblogs_code\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\"><pre style=\"margin-bottom: 0px; padding: 0px;\">    body,p{\r\n        margin:0;\r\n        padding:0;\r\n    }\r\n    #wrap{\r\n        overflow:hidden;\r\n        width:580px;\r\n        margin:0 auto;\r\n    }\r\n    #left,#center,#right{\r\n        margin-bottom:-200px;\r\n        padding-bottom:200px;\r\n    }\r\n    #left {\r\n        float:left;\r\n        width:140px;\r\n        background:#777;\r\n    }\r\n    #center {\r\n        float:left;\r\n        width:300px;\r\n        background:#888;\r\n    }\r\n    #right {\r\n        float:right;\r\n        width:140px;\r\n        background:#999;\r\n    }\r\n    p {color:#FFF;text-align:center}</pre></div><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">效果：</p><p><span id=\"_baidu_bookmark_start_16\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_start_18\" style=\"display: none; line-height: 0px;\">‍</span><img src=\"http://pic002.cnblogs.com/images/2012/389001/2012082813072672.png\" alt=\"\" style=\"margin: 0px 0px 15px; padding: 8px;\"/><span id=\"_baidu_bookmark_end_19\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_end_17\" style=\"display: none; line-height: 0px;\">‍</span></p><h1 style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; line-height: 20px; white-space: normal; background-color: rgb(219, 217, 210);\">其他资源</h1><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">1、<a href=\"http://coding.smashingmagazine.com/2009/07/27/the-definitive-guide-to-using-negative-margins/\" style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51);\">The Definitive Guide to Using Negative Margins</a></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; overflow: hidden; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(219, 217, 210);\">如果大家有好的资源欢迎补充</p><p><br/></p><p></p><p></p><p></p>','2016-03-22/56f1066802f2a.jpg','1','8','1458636392','1458700624','16','0','0','0','','','','0');-- <xjx> --

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