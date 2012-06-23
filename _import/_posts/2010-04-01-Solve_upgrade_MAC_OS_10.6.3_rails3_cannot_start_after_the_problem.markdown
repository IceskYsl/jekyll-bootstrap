---
layout: post
title: 解决升级mac OS 10.6.3后rails3无法启动的问题
date: '2010-4-1'
comments: true
categories: Mac&*UNIX Ruby&Rails
tags: 10.6.3 rails3 railties
link: true
---
昨晚看hero的时候顺带update到mac OS 10.6.3，早上重启机器安装成功，发现rails3无法启动，报：
/Library/Ruby/Site/1.8/rubygems.rb:334:in `bin_path': can't find executable rails for rails-3.0.0.beta (Gem::Exception)
from /usr/bin/rails:19

这个错误我之前安装rails3的时候遇到过，解决如下：
1.先尝试下重新安装rails
IceskYsl@eoe /svnroot/eoe/dev/rails/eoelogs $ sudo gem install rails --pre
Password:
Successfully installed treetop-1.4.5
1 gem installed
Installing ri documentation for treetop-1.4.5...
Installing RDoc documentation for treetop-1.4.5..
发现多了个treetop的gem，查查是啥：
<blockquote>Treetop is a language for describing languages. Combining the elegance of Ruby with cutting-edge parsing expression grammars, it helps you analyze syntax with revolutionarily ease.</blockquote>

再次执行rails，发现
/Library/Ruby/Site/1.8/rubygems.rb:334:in `bin_path': can't find executable rails for rails-3.0.0.beta (Gem::Exception)
        from /usr/bin/rails:19

还是不行，那就是railties的问题了，重新装下
IceskYsl@eoe /svnroot/eoe/dev/rails/eoelogs $ sudo gem  install railties --pre
Successfully installed railties-3.0.0.beta
1 gem installed
Installing ri documentation for railties-3.0.0.beta...
Installing RDoc documentation for railties-3.0.0.beta...
IceskYsl@eoe /svnroot/eoe/dev/rails/eoelogs $ rails -v
Rails 3.0.0.beta

OK，可以了～
