---
layout: post
title: 在bluehost上部署ROR应用1stlog.
date: '2007-6-16'
comments: true
categories: Mac&*UNIX Ruby&Rails
link: true
---
前段时间搞了个bluehost，看他支持ror，一直不敢用，今天部署了套1stlog，还真不简单，总结下下遇到的困难和应对的措施。*1.绑定域名*我把1stlog.1sters.com这个二级域名绑定到bluehost上，很快就生效了。*2.添加域名绑定*把前面我指向的1stlog.1sters.com绑定进去。*3.建立数据库和用户*在bluehost的控制面板上创建MYSQL数据库和用户，注意要给该用户赋权。OK，准备好了，我们开始安装吧。*4.dispatcher配置*首先遇到的就是dispatcher路径（/public/dispatch.rb）Set dispatcher path in &quot;typo/public/dispatch.rb&quot; 把#require &quot;dispatcher&quot; 修改为：#require  &quot;/usr/local/lib/ruby/gems/1.8/gems/rails-1.1.4/lib/dispatcher&quot;*5.遇到的是数据库编码*由于必须使用UTF-8，而在它的控制面板里面创建的数据库默认是latin1_swedish_ci的，找了一会，发现可以在phpMyadmin里面进行修改（幸好还有phpmyadmin）。点上面的“操作”标签，然后选择最下面的“整理”，选择utf8_unicode_ci就可以了。*6.配置FastCGI*紧接着来的是FastCGI的配置（在public/.htaccess），需要修改如下几个地方：AddHandler fastcgi-script .fcgi RewriteRule ^(.*)$ dispatch.fcgi  [QSA,L]添加一行：SetEnv RAILS_ENV production *7.dispatch.fcgi修改*确认#!/usr/bin/env ruby*8.然后给dispatch.fcgi执行权限*。这个很容易遗忘。。*9.初始化数据库*rake db:migrate VERSION=0*10.安装RedCloth*这个竟然默认是没有安装的，只能自己来装了，先下载（wget或者你用FTP传上去）gzip -d RedCloth-3.0.4.tar.gz  --解压tar xvf RedCloth-3.0.4.tar  --解tarmv RedCloth-3.0.4 redcloth --改个名字（可以不做）然后需要自己加载：在environment.rb里面加入：  config.load_paths += %W(    vendor/redcloth/lib  ).map {|dir| &quot;#{RAILS_ROOT}/#{dir}&quot;}.select { |dir| File.directory?(dir) }require 'redcloth'*11.把log和tmp目录及其子目录属性修改为777*恩，差不多了吧，应该没有忘记什么吧:)
