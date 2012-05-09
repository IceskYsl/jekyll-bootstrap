--- 
layout: post
comments: true
title: mini_magick 1.2.2 Released
date: 2007-6-3
link: false
categories: life
---
*mini_magick* version 1.2.2 has been released!RMagick是大家用的最多的图片处理类库，但是它台复杂了，消耗太多的内存，比如下面这段最简单的代码都会吃掉100M的内存：&lt;code&gt;Magick::read(&quot;image.jpg&quot;) do |f|f.write(&quot;manipulated.jpg&quot;)end&lt;/code&gt;*mini_magick*是把ImageMagick进行的一次封装，使得可以很方便的使用MiniMagick的commandline，可以在http://www.imagemagick.org/script/mogrify.php 查看可耕多的ImageMagick has 信息。*mini_magick*1.2.2包含如下更新：# 1.) all image commands return the image object (The output of the last command is saved in @output)# 2.) identify doesn't trip over strangley named files# 3.) TempFile uses file extention now (Thanks http://marsorange.com/archives/of-mogrify-ruby-tempfile-dynamic-class-definitions)# 4.) identify commands escape output path correctly
