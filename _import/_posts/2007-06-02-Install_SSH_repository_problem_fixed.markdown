---
layout: post
title: 安装SSH库的时候出现问题的修复
date: '2007-6-2'
comments: true
categories: Mac&*UNIX Ruby&Rails
link: true
---
在使用SSH的时候，需要另外安装SSH的库，但是我按照官方上的方法无论是远程安装还是本地安装都出现错误，如下：D:\&gt;gem install net-ssh --include-dependenciesERROR:  While executing gem ... (Zlib::BufError)    buffer error查了下资料，貌似问题是出在Windows版本上的RUBY有点问题，可以按照下面的进行修复：1.修改ruby的安装目录下（c:\ruby\lib\ruby\site_ruby\1.8\rubygems\package.rb）的package.rb文件，在 618 行，把1.2.1修改为 1.2.3。2) removed the linessh 22/tcp #SSHfrom file %systemroot%\system32\drivers\etc\services
