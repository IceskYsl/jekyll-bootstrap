---
layout: post
title: 用Magick操作数据库blog字段的图像！
date: '2007-7-31'
comments: true
categories: Ruby&Rails
link: true
---
一直不是很喜欢用一些插件，一来觉得没有必要使用那么复杂的，一些特色功能我们完全可以写代码完成，比如用Magick操作图片等等，就很方便和简单；以前说过如何处理磁盘上的图片，今天看看如何用Magick操作数据库中blob字段的图片，看代码就明白咯，如果对你有用，记得谢谢我哈:)Ruby代码   1. #这个是用来生成用户图像的     2. def picture     3.   @user = User.find(params[:id])     4.    image = Magick::Image::from_blob(@user.data).first     5. #   clown = Magick::Image.read(.read).first     6.    image.crop_resized!(60, 60, Magick::NorthGravity)     7.   send_data(image.to_blob,     8.             :filename =&gt; @user.nickname,     9.             :type =&gt; @user.content_type,    10.             :disposition =&gt; &quot;inline&quot;)    11. end  有不明白的就留言问哈。同时发表于：http://weblog.1ster.cn/?action=show&amp;id=145
