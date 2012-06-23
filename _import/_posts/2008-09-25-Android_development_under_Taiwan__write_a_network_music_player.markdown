---
layout: post
title: android下开发初探，写个网络音乐播放器
date: '2008-9-25'
comments: true
categories: Android&Java
link: true
---
很早前就对<a href="http://code.google.com/android/index.html">Android</a>感兴趣了，那时看了点API，觉得比较麻烦，就没深入下去，直到昨天发布G1，才突然觉得这个Android还真强大，翻了下他的API，真牛，今天花了一天时间，把其code上的API和文档大概都过了一遍，虽然还有些具体的不会做，但是整个架构流程和布局模式都很清楚了。

<img src="http://code.google.com/android/images/system-architecture.jpg" alt="" width="619" height="444" />

采用Eclipse导入几个demo看了下，结合文档，非常直观（google的文档和help写的非常到位），晚上就试着自己写个小东西，因为最近对网络音乐比较感兴趣，于是就试着写了一个网络音乐播放器。

UI就不看了，看段代码

&nbsp;
<div class="codeText">
<div class="codeHead">Java/Android代码</div>
<ol class="dp-j" start="1">
	<li class="alt"><span><span class="keyword">private</span><span> MediaPlayer mMediaPlayer;  </span></span></li>
	<li><span>Uri uri = Uri.parse(<span class="string">"http://www.jjyyjy.com/wj/he.mp3"</span><span>);  </span></span></li>
	<li class="alt"><span>mMediaPlayer = MediaPlayer.create(<span class="keyword">this</span><span>, uri);  </span></span></li>
	<li><span>mMediaPlayer.start();  </span></li>
</ol>
</div>
然后导入模拟器，可以很顺利的听到歌曲，还很简陋，有时间的话，我会继续开发这个应用。

&nbsp;
