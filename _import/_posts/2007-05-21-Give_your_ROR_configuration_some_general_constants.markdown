---
layout: post
title: 给你的ROR配置一些通用的常量
date: '2007-5-21'
comments: true
categories: Ruby&Rails
link: true
---
这个需求应该是来自于对一些常量的配置和修改上，比如网站的title等等，如果你想做出一个比较通用的WEB系统，那么这个常量的可修改性就是个不可少的需求！我们的做法是可以放在数据库里面，然后去读取，这个方法显然是可行的，但是我们还可以这么来作，放在一个YAML文件里，把你需要的变量写在这个文件里面，需要注意格式的正确性，然后就可以在程序中引用了，步骤如下：1.在你的/config/environment.rb的上方写上：require 'yaml'2.在你的/config/environment.rb的下发写上：  YOUR_APP_CONFIG = YAML::load(File.open(&quot;#{RAILS_ROOT}/config/appconfig.yml&quot;))3.然后你就可以在程序里面进行变量的引用了，如下：  YOUR_APP_CONFIG&quot;variable&quot;]如果想改变，只要修改这个文件就OK；如果想增加，则只需要在这个文件里面再增加一个变量就好了。。是不是很方便呀～～
