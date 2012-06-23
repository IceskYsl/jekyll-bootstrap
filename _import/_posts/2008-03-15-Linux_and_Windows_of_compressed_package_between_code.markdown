---
layout: post
title: linux和windows之间的压缩包乱码
date: '2008-3-15'
comments: true
categories: Ruby&Rails
link: true
---
<p>这个问题搞了我一晚上，到现在也没找到合适的方法，真是郁闷呀，记录下找到的东西，如下：</p>
<p><strong>问题：</strong><br />
我在rails中使用fasterCSV导出DB里面的东西，编码为UTF-8,在linux上查看一切正常，但是我先后采用了zip，gzip，tar，7zip，rar，以及biz等压缩后传送给windows，打开发现是乱码。</p>
<p>具体表现为：</p>
<p>1、zip，tar，gzip，biz等压缩出来的，中文文件名和数据文件均乱码;</p>
<p>2、用7zip和rar打包出来的，在windows下打开，中文名正常，但是内部的数据文件还是乱码。</p>
<p>&nbsp;</p>
<p>在linux与windows平台间交换压缩包文件，如果文件名中含有中文，有时候就会遇到乱码问题，给平台间的文件交换带来麻烦。今天仔细研究了一下，总结下面一些经验，供大家分享</p>
<p>1. 7zip和rar（我用的是3.50，好像rar的旧版本不行）会对文件名编码进行转换，内部文件名编码使用</p>
<p>unicode，所以使用这两种格式在linux和windows平台间交换不会有乱码问题，其他格式（比如tar.gz, tar.bz2)似乎不进行转换，所以不适合平台间交换。但鉴于linux的自由精神，不推荐使用商业软件rar，而推荐自由的7zip。但是，我发现用 <a title="Ubuntu" href="http://www.linuxidc.com/topicnews.aspx?tid=2">Ubuntu</a>中（我的是Edge）file-roller处理7zip文件还是会存在问题，而用命令行就没有问题，所以推荐大家用命令行的7zip。</p>
<p><br />
按照找到的资料，应该只有文件名会出现乱码，正文内容不会乱码的呀，真是奇怪。<br />
<br />
我本地测试用7zip或者rar压缩以后，中文的文件名正常了，但是内部的数据文件中的中文还是乱码，奇怪呀。。。</p>
<p>有高手指点一下，多谢了哦。</p>
<p><br />
相关资料：<br />
http://linux.chinaitlab.com/administer/735727.html<br />
http://www.zdnet.com.cn/server/2008/0228/744257.shtml<br />
http://www.linuxidc.com/Linux/2007-12/9951.htm</p>
