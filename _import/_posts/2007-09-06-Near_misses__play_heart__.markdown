---
layout: post
title: 有惊无险，玩心跳～
date: '2007-9-6'
comments: true
categories: Ruby&Rails
link: true
---
<p>昨天夜里通宵，今天回家睡觉，中午醒来的时候打开电脑突然发现&ldquo;技能云&rdquo;和&ldquo;第一次&rdquo;均无法打开，寒呀，急呀，怎么回事，一切来的都太突然了。</p>
<p>我记得早上睡觉的时候还是好好的呢，抓紧解决中。。</p>
<p>google一批资料均没有什么大的作用，应该不会是我配置的问题吧，先前可以跑的嘛，google到的资料一般说的就下面：</p>
<p>修改plublic目录下的dispatch.*的三个文件中的头为服务器上ruby的路径，如bluehost是&rdquo;/usr/bin/ruby&rdquo;</p>
<p>还是不行，真是见鬼了，后来直接rails mygod生成一个，把上面几个文件连同.htaccess搞下来看看，有点不一样，急忙替换上去后，重启后，技能云终于可以访问，比较下异同，最大的区别就是这句：</p>
<p>RewriteRule ^(.*)$ dispatch.cgi [QSA,L]</p>
<p>原来使用的是dispatch.fcgi的，难道这个也。。奇怪中。。</p>
<p>还发SMS给偶兄弟彭了呢，把他从半路上搞了回来，真囧～</p>
