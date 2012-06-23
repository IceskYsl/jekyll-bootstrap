---
layout: post
title: ROR与MySQL的中文显示
date: '2007-5-20'
comments: true
categories: Ruby&Rails Tips
link: true
---
一、安装数据库：1、安装5.0版本。2、在安装时选择&quot;utf-8&quot;编码。3、如果安装时未选&quot;utf-8&quot;，可用 MySQL Administrator 的 “Startup Variables”/”Advanced” 更改 Def. Char Set 为 “utf-8” 。或者编辑MySQL目录下的my.ini文件：[mysql]default-character-set=utf8SET NAMES 'utf8'[mysqld]default-character-set=utf84、安裝 MySQL Tools ：MySQL Administrator ，MySQL Query Browser5、在MySQL Query Browser中执行：SHOW VARIABLES LIKE 'character_set_%'; 查询系统的字符串均为utf8。6、建立数据库。选择MyISAM，InnoDB都可以，不过后者支持事务处理，这是它的诱人之处。7、建立表。在用MySQL Query Browser创建表时，可再次指定字符集。并可以对数据库的存储引擎进行修改。二、开发工具：使用“RedRails”。并在其“属性”选项中选择编码为&quot;utf-8&quot;格式。这样，你的所有文件就都是utf8格式了。三、修改文件：A、将public/dispatch.cgi文件的#!/path/to/ruby后面加上-Ku -rjcodeB、修改app/controller/application.rb文件。class ApplicationController &lt; ActionController::Basebefore_filter :set_charsetdef set_charset@headers[&quot;Content-Type&quot;] = &quot;text/html; charset=utf-8&quot;endend四、问题：浏览器，与代码内的中文的显示都可以了。但数据库中的表为什么还是乱码呢？此问题按james的意见，对database.yml文件进行了修改，数据库显示中文正常。你的数据库连接串也需要加上utf-8的设置，如：在database.yml中需要加上development:adapter: mysqldatabase: databaseusername: rootpassword:host: localhostencoding: utf8五、问题二：如果一个表选择MyISAM引擎时，可为一个表建立两个外键约束，但若是InnDB引擎时，建立一个外键约束还可以，但建立两个外键约束时，会提示error:150错误，创建失败。总结一下：一、在MySql这边： 将Charecter设置成为utf8二、application.rbbefore_filter :configure_charsetsdef configure_charsets@response.headers[&quot;Content-Type&quot;] = &quot;text/html; charset=utf-8&quot;# Set connection charset. MySQL 4.0 doesn’t support this so it# will throw an error, MySQL 4.1 needs thissuppress(ActiveRecord::StatementInvalid) doActiveRecord::Base.connection.execute 'SET NAMES UTF8'endend三、environment.rb$KCODE = 'u'require 'jcode'
