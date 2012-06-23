---
layout: post
title: Quick_add_slashes_filter_for_Rails
date: '2007-5-19'
comments: true
categories: Ruby&Rails Security
link: true
---
读后：有的时候，需要在提交的URL后面自动加上&quot;/&quot;，这个方法实现这样一个需求，你还可以扩展下去，比如在域名前加&quot;http:\\&quot;这样的字符。def add_slash  unless %r{/$}.match(@request.path)    redirect_to @request.path &lt;&lt; '/'  endendThis ensures you always have the trailing slash at the end of your URLs. Maybe it could be done better, but for now it works. Django has some stock middleware that does just this, as well as ensuring the first part of the hostname is ‘www’. The point is that your resource can be accessed with one and only one URL, rather than with potentially 4 combinations of / and www. I have no hard evidence, but this is supposedly good for teh Google, and some people find it elegant.I am thinking about maybe whipping up a module of such utilities that you could include in your ApplicationController and never think about again.
