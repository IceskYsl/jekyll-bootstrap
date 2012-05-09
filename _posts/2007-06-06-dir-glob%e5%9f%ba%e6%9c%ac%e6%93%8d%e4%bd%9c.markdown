--- 
layout: post
comments: true
title: !binary |
  RGlyLmdsb2Lln7rmnKzmk43kvZw=

date: 2007-6-6
link: false
categories: life
---
使用*Dir.glob*可以方便的进行目录遍历，如下的例子是查找D:/gem的子目录中所有包含readme.txt文件的子目录。&lt;code&gt; themes_root = &quot;D:/gem&quot; glob = &quot;#{themes_root}/[a-zA-Z0-9]*&quot; @theme_cache = Dir.glob(glob).select do |file|    File.readable?(&quot;#{file}/readme.txt&quot;) end.compact p @theme_cache&lt;/code&gt;还有一系列的延伸，请参考ruby手册。
