---
layout: post
title: 统计本星期～
date: '2007-11-14'
comments: true
categories: Ruby&Rails
link: true
---
<p>raecoo问有没有办法统计一个星期中最受欢迎的文章，我问是&rsquo;标准星期？还是最近7天&lsquo;，他说要的是标准星期，于是感觉这么杨貌似可以，</p>
<p>where scores.updated_at beteen Time.now.moday ... Time.now.sunday order by score</p>
<p>上面只是一个思路示意，开始翻API找相应的函数，无奈的是翻遍API也没找到合适的函数，最后raecoo从MYSQL的函数库中找到几个，给了我一段代码：<br />
where TO_DAYS(NOW()) - TO_DAYS(updated_at) &lt;= 7</p>
<p><em><font face="宋体">MYSQL的TO_DAYS(DATE)函数是这样说明的： 传回DATE到公元0年的总日数</font></em></p>
<p><font face="宋体">貌似不满足需要嘛～这个取出来的还是最近几天的呀，再想想～</font><em><font face="宋体"><br />
</font></em></p>
