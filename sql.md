## 数据库设计

### 数据表一览 

```
blog_article	文章 1
blog_comment	评论 2
blog_email_set	后台邮箱设置 3
blog_email_type	邮件格式 4
blog_fenlei	博客分类 5
blog_friendlink	友情链接 6
blog_gonggao	公告 7
blog_admin	后台账户 8
blog_liuyan	留言 9
blog_site	网站 10
blog_slides	幻灯片 11
blog_user	用户 12
```

### 数据库实现

1. 根据前面的数据库设计，利用MySQL数据库系统来实现其逻辑结构。实现过程如下：
    1. 先创建一个数据库blog，然后在数据库中创建新表按照下述的数据库表的规划设计分别输入创建表代码，随后插入数据。
    2. 将内容写于DB.sql文件，并逐条执行，可以便于系统的移植，复制该博客系统时，只要执行系统生成的DB.sql文件，就可以一键完成数据库数据安装。

2. 数据库的配置：
    1. 系统采用对数据库配置进行单独管理的方法，config.json中配置文档中统一存放系统程序中用到的所有连接字符串信息，因此在程序中仅需调用该json文档的配置即可，博客系统的移植时对该统一配置进行修改即可，示例：
    
    ```
    {   //'配置项'=>'配置值'
        'DB_TYPE' : 'mysqli', // 数据库类型      
        'DB_HOST' : '127.0.0.1', // 服务器地址        
        'DB_NAME' : 'blog', // 数据库名       
        'DB_USER' : 'root', // 用户名
        'DB_PWD' : '',  // 密码      
        'DB_PORT' : '3306', // 端口 
        'DB_PREFIX' : 'blog_', // 数据库表前缀      
        'SHOW_PAGE_TRACE' : false,  //        
        'SHOW_ERROR_MSG' : false,        
        'ERROR_MESSAGE' : '发生错误！' // 
        'ERROR_PAGE' : 'http://www.94dreamer.com'
    }
    ```


### 表字段详情

#### 1. blog_article 博客文章

```
列名	数据类型	大小	说明
id	int	11	编号，作为主键
title	varchar	40	标题
content	text		内容
pic	varchar	50	图片1
uid	int	11	用户
fid	int	11	块
ctime	int	11	创建时间
edittime	int	11	编辑时间
view	int	11	
comment	int	11	评论
type	int	11	类型
status	int	11	状态
mp3	varchar	200	音乐
pic2	varchar	50	图片2
biaoqian	varchar	20	标签
pingfen	int	11	评分
``` 

#### 2. blog_comment 评论

```
列名	数据类型	大小	说明
id	int	11	编号，作为主键
name	varchar	20	名字
email	varchar	30	邮箱
content	varchar	200	内容
uid	int	11	用户id
replay	int	11	回复楼层
ctime	int	11	时间
aid	int	11	博客文章编号
```

#### 3. blog_email_set 后台邮箱设置

```
列名	数据类型	大小	说明
id	int	11	编号，作为主键
smtpsever	varchar	200	SMTP服务器
smtserverport	int	11	SMTP服务器端口
smtpusermail	varchar	200	SMTP服务器的用户邮箱
smtpuser	varchar	200	SMTP服务器的用户帐号
smtpass	varchar	200	SMTP服务器的用户密码
reg_set_admin	int	11	用户注册管理员是否收邮件
reg_set_user	int	11	用户注册用户是否收邮件
send_article_set	int	11	用户发表管理员是否收邮件
comment_set	int	11	用户回复管理员是否收邮件
message_set	int	11	收到留言是否发邮件
```

#### 4. blog_email_type	邮件格式

```
列名	数据类型	大小	说明
id	int	11	编号，作为主键
reg_user_title	varchar	200	用户注册用户收邮件标题
reg_user_content	text		用户注册用户收邮件内容
reg_admin_title	varchar	200	用户注册管理员收邮件标题
reg_admin_content	text		用户注册管理员收邮件内容
send_article_title	varchar	200	用户发文管理员收邮件标题
send_article_content	text		用户发文管理员收邮件内容
send_comment_title	varchar	200	用户评论管理员收邮件标题
send_comment_content	text		用户评论管理员收邮件内容
send_message_title	varchar	200	用户收到留言用户邮件标题
send_message_content	text		用户收到留言用户邮件内容
```

#### 5. blog_fenlei	博客分类

```
列名	数据类型	大小	说明
id	int	11	编号，作为主键
name	varchar	30	名字
fid	int	11	块
type	int	11	类型
```

#### 6. blog_friendlink	友情链接

```
列名	数据类型	大小	说明
id	int	11	编号，作为主键
title	varchar	30	标题
content	varchar	200	描述
ctime	int	11	时间
url	varchar	100	链接
type	varchar	20	样式
```

#### 7. blog_gonggao 公告

```
列名	数据类型	大小	说明
id	int	11	编号，作为主键
title	varchar	30	标题
content	varchar	220	描述
ctime	int	11	时间
```

#### 8. blog_admin 后台账户

```
列名	数据类型	大小	说明
id	int	11	编号，作为主键
status	varchar	10	标题
username	varchar	30	用户名
password	varchar	32	密码
kouling	varchar	11	口令
```

#### 9. blog_liuyan	留言

```
列名	数据类型	大小	说明
id	int	11	编号，作为主键
color	varchar	10	颜色
ip	varchar	30	ip
title	varchar	30	标题
content	varchar	100	内容
ctime	int	11	时间
name	varchar	20	名字
```

#### 10. blog_site 网站

```
列名	数据类型	大小	说明
id	int	11	编号，作为主键
title	varchar	200	标题
keywords	text		关键字
description	text		描述
logo	varchar	200	logo
articleSatus	int	11	文章是否需要审核
userStatus	int	11	注册是否需要邀请码
admin_email	varchar	100	管理员邮箱
set_content	varchar	50	logo下方描述
name	varchar	50	名字
statistics	text		统计代码
```

#### 11. blog_slides 幻灯片

```
列名	数据类型	大小	说明
id	int	11	编号，作为主键
title	varchar	200	标题
pic	varchar	200	图片
url	varchar	100	链接
ctime	int	11	时间
```

#### 12. blog_user	用户

```
列名	数据类型	大小	说明
id	int	11	编号，作为主键
email	varchar	40	邮箱
password	varchar	32	密码
ctime	int	11	时间
lasttime	int	11	最后登录时间
ip	varchar	50	ip
status	int	11	状态
truename	varchar	30	真实名字
gonggao	int	11	公告
```



