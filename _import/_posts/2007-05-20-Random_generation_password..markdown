---
layout: post
title: 随机产生密码.
date: '2007-5-20'
comments: true
categories: Ruby&Rails
link: true
---
在WEB应用中,可能需要随机产生密码,比如一个用户的密码丢了,填写自己的取回密码的油箱后,可以随机产生一个密码给他,实现代码很简单,如下:def new_random_password  self.password= Digest::SHA1.hexdigest(&quot;--#{Time.now.to_s}--#{login}--&quot;)[0,6]  self.password_confirmation = self.passwordend然后在需要的地方调用就OK了.
