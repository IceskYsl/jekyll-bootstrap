--- 
layout: post
comments: true
title: Make a short link with Bit.ly
date: 2010-1-25
link: false
categories: life
---
link = 'http://www.wired.com'
short_link = open('http://bit.ly/api?url=' + link, "UserAgent" => "Ruby-ShortLinkCreator").read
# => "http://bit.ly/AvxfY"
参考资料：
http://code.google.com/p/bitly-api/wiki/ApiDocumentation
http://j.mp/
http://code.google.com/p/bitlyj/
http://github.com/philnash/bitly
