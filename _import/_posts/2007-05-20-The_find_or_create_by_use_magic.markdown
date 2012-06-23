---
layout: post
title: 神奇好用的find_or_create_by
date: '2007-5-20'
comments: true
categories: Ruby&Rails
link: true
---
简单来说，find_or_create_by 就是先去找说数据库里面有没有这个数据，如果没有他就顺手帮你建立一个。很简单的概念，但是却又非常频繁用到。使用方式如下今天有一个 User Model 有两个 attribute ，其中一个是 name ，另外一个是 email。 如果我们想要找出一个名叫做 'abc' 的使用者，如果没这个人，就创造一个，然后将他指定到 a 这个 Object 。使用方是就是a = User.find_or_create_by_name('abc')仔细去翻 SQL Code，我们可以发现SELECT * FROM users WHERE (userss.`name` = `abc` ) LIMIT 1BEGININSERT INTO users (`name`, `email`) VALUES('abc', '')COMMIT如果想要更进一步，我们想找出名叫做 'abc' ，并且 email 是 abc@example.com 的使用者，并且将他指定到 Object a。使用方是就是a = User.find_or_create_by_name_and_email('abc' , 'abc@example.com')SQL code 就是SELECT * FROM users WHERE (users.`name` = `abc` and users.`name` = `abc@example.com`) LIMIT 1BEGININSERT INTO users (`name`, `email`) VALUES('abc', 'abc@example.com')COMMIT我果然应该多花点时间再重新阅读 Ruby on Rails 的书好了，那么方便的东西居然都不知道。
