---
layout: post
title: 在ROR中实现验证码需要注意的地方
date: '2007-6-9'
comments: true
categories: Ruby&Rails Security
link: true
---
开始以为没有什么难得，参考了http://www.blogjava.net/killme2008/archive/2007/04/09/109456.html和JAVAEYE上的一些文章，其实大家说的都差不多的，都是说win下注意的事情，我在lunix上怎么就是跑不起来，一直报告Missing model noisy_image.rb这个错误，后来看到http://wiki.rubyonrails.com/rails/pages/HowtoSecureFormsWithNoisyImages这个文章，恍然大悟。&lt;code&gt;class NoisyImagerequire 'RMagick'include Magick&lt;/code&gt;注意这个*require 'RMagick'*是放在class里面的，如果放在外面，就会报我上面说的那个错误。PS：刚刚给1stlog加上了验证码，也是最后一个功能点了。明天找时间整理下文档就可以开源了。真开心～
