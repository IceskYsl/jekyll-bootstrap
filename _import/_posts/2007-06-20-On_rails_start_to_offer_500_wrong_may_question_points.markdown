---
layout: post
title: 关于rails启动报500错误的可能问题点
date: '2007-6-20'
comments: true
categories: Ruby&Rails
link: true
---
当你启动rails的时候可能会遇到500错误“500- Premature end of script.”或者类似的错误，使得程序跑不起来～问题可能出在两个地方：    1、 The file permissions are not set to allow the dispatch.cgi to execute properly.      Chmod the dispatch.cgi to +0755+.    2、The path to Ruby is is incorrect in the dispatch.cgi file.      The first line of the file is called the shebang-- it sets the location of the intrepretor (in this case ruby).      Change the shebang to the correct path to Ruby (/usr/bin/ruby).      The first line of the dispatch.cgi file should look like this:      #!/usr/bin/ruby
