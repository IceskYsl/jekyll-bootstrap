--- 
layout: post
comments: true
title: Gem::Exception,update to rails 3.0 bate
date: 2010-3-6
link: false
categories: life
---
上次装完后发现rails命令没法使用，一直不晓得原因，就卸载了，今天又装了一次，然后运行下rails，看到
<blockquote>eoe:~ IceskYsl$ rails -v
/Library/Ruby/Site/1.8/rubygems.rb:334:in `bin_path': can't find executable rails for rails-3.0.0.beta (Gem::Exception)
	from /usr/bin/rails:19</blockquote>

看来还是有问题，看看都装了啥gems，如下
eoe:~ IceskYsl$ gem list

*** LOCAL GEMS ***

abstract (1.0.0)
actionmailer (3.0.0.beta, 2.3.5, 2.3.4, 2.2.2, 1.3.6)
actionpack (3.0.0.beta, 2.3.5, 2.3.4, 2.2.2, 1.13.6)
actionwebservice (1.2.6)
activemodel (3.0.0.beta)
activerecord (3.0.0.beta, 2.3.5, 2.3.4, 2.2.2, 1.15.6)
activeresource (3.0.0.beta, 2.3.5, 2.3.4, 2.2.2)
activesupport (3.0.0.beta, 2.3.5, 2.3.4, 2.2.2, 1.4.4)
奇怪，没看到railties，看来这个没装上，我再装一次。
eoe:~ IceskYsl$ sudo gem install railties --pre
Successfully installed railties-3.0.0.beta
1 gem installed
Installing ri documentation for railties-3.0.0.beta...
Installing RDoc documentation for railties-3.0.0.beta...
eoe:~ IceskYsl$ rails -v
Rails 3.0.0.beta

ok，可以了!

参考资料：
http://oscardelben.com/articles/2009/12/06/how-to-test-rails-3.html
http://adamfortuna.com/2010/02/06/getting-rails-3-beta-setup/
http://d.hatena.ne.jp/h-nakao/20100210/1265775935
