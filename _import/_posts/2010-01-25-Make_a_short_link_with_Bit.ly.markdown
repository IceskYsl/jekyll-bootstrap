---
layout: post
title: Make_a_short_link_with_Bit.ly
date: '2010-1-25'
comments: true
categories: Ruby&Rails
link: true
---
link = 'http://www.wired.com'
short_link = open('http://bit.ly/api?url=' + link, "UserAgent" => "Ruby-ShortLinkCreator").read
# => "http://bit.ly/AvxfY"
参考资料：
http://code.google.com/p/bitly-api/wiki/ApiDocumentation
http://j.mp/
http://code.google.com/p/bitlyj/
http://github.com/philnash/bitly
