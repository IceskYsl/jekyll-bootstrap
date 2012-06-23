---
layout: post
title: ! 'Music Fingerprint: 音乐指纹认知篇'
date: '2008-12-21'
comments: true
categories: Security
link: true
---
<p>音乐指纹，是采用特定的算法对音乐文件的<strong>声波</strong>进行分析得到的唯一码，主要用于自动分类和标识音乐文件。<br />
当前国外拥有此项技术专利的公司有<strong>Gracenote</strong>和<strong>MusicIP</strong>等，其基本原理是通过对音乐文件的全部或部分声波（通常是音乐文件的前几分钟）进行分析产生音乐指纹数据，这部分技术难度并不太大，关键的问题是对音乐指纹进行比对，当前Gracenote已经支持对一首音乐文件的任意部分(至少需要10秒的数据)进行指纹识别。<br />
由MusicIP开发的一个叫<a href="http://code.google.com/p/musicip-libofa/"><strong>libofa</strong></a>的开源音乐指纹生成软件可以从MusicDNS得到，它是通过对音乐文件的前135秒进行分析产生音乐指纹，为了提高匹配的准确性，通常在提交音乐指纹的同时也提取音乐文件的其他信息如MP3文件的ID3信息等。</p>
<p>PS：部分播放器号称利用音乐指纹技术来做的歌词同步实际上是通过音乐文件的相关信息(如MP3的ID3信息)来确定该文件，并非真正意义上的音乐指纹技术。</p>
<p>这项技术在国内尚未有实际的使用，国内对音频文件分析的时候，一般是采用ID3信息，而对音乐指纹的使用目前还是空白的。不过这个空白很快就被填补了。</p>
<p>参考资料：</p>
<p><a href="http://code.google.com/p/musicip-libofa/">http://code.google.com/p/musicip-libofa/</a></p>
<p><a href="http://blog.jooit.com/?p=1352">http://blog.jooit.com/?p=1352</a></p>
