--- 
layout: post
comments: true
title: "\xE9\x81\xAD\xE9\x81\x87Magick::ImageMagickError"
date: 2008-5-11
link: false
categories: life
---
<p>一段调用RMagic的Ruby脚本,在本地跑的好好的代码,放到服务器上出现这个错误:<br />
&nbsp;Non-conforming drawing primitive definition&nbsp; (Magick::ImageMagickError)</p>
<p>查了下服务器和本地,貌似只有Rmagic的版本不一样,如下:</p>
<p>[iceskysl]$&nbsp; gem list | grep rmagick<br />
rmagick (1.15.12, 1.15.10)<br />
[iceskysl]$ dpkg -l | grep magick<br />
ii&nbsp; imagemagick&nbsp;&nbsp;&nbsp; 6.2.4.5.dfsg1- Image manipulation programs<br />
ii&nbsp; libmagick6&nbsp;&nbsp;&nbsp;&nbsp; 6.0.6.2-2.9&nbsp;&nbsp;&nbsp; Image manipulation library<br />
ii&nbsp; libmagick9&nbsp;&nbsp;&nbsp;&nbsp; 6.2.4.5.dfsg1- Image manipulation library<br />
ii&nbsp; librmagick-rub 1.6.0-1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ImageMagick API for Ruby<br />
ii&nbsp; librmagick-rub 1.6.0-1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ImageMagick API for Ruby<br />
ii&nbsp; librmagick-rub 1.15.12-1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;insert up to 60 chars description&gt;<br />
ii&nbsp; perlmagick&nbsp;&nbsp;&nbsp;&nbsp; 6.0.6.2-2.9&nbsp;&nbsp;&nbsp; A perl interface to the libMagick graphics r<br />
<br />
and in my locolhost.it's:<br />
iceskysl@IceskYsl:/opt/devroot/Taojer/lib$ gem list | grep rmagick<br />
rmagick (2.3.0, 1.15.10)</p>
<p>iceskysl@IceskYsl:/opt/devroot/Taojer/lib$ dpkg -l | grep magick<br />
ii&nbsp; imagemagick&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7:6.3.7.9.dfsg1-2ubuntu1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; image manipulation programs<br />
ii&nbsp; libmagick10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7:6.3.7.9.dfsg1-2ubuntu1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; image manipulation library<br />
ii&nbsp; libmagick9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7:6.2.4.5.dfsg1-2ubuntu1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Image manipulation library<br />
ii&nbsp; libmagick9-dev&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7:6.3.7.9.dfsg1-2ubuntu1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; image manipulation library - development files<br />
不晓得是不是这个问题,查遍了Google也没找到合适的答案,记录在案,有遇到类似错误的还望指教,谢谢.</p>
<p>
<div class="codeText">
<div class="codeHead">附录:相关代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#!/usr/bin/ruby</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>require&nbsp;<span class="string">'rubygems'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>require&nbsp;<span class="string">'RMagick'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="comment">#require&nbsp;'RMagick'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">class</span><span>&nbsp;DrawPrice&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="comment">#根据给出的文件名,路径等信息生成价图片</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.drawpic(dir,name,nickname,adrress,blog=</span><span class="string">'http://iceskysl.1sters.com/'</span><span>,columns=200,rows=80,bg_color=</span><span class="string">'white'</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;img&nbsp;=&nbsp;Magick::Image.<span class="keyword">new</span><span>(columns,rows,Magick::HatchFill.</span><span class="keyword">new</span><span>(bg_color,</span><span class="string">'lightcyan2'</span><span>))&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;puts&nbsp;<span class="string">&quot;img=#{img}&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;gc&nbsp;=&nbsp;Magick::Draw.<span class="keyword">new</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;puts&nbsp;<span class="string">&quot;gc=#{gc}&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;gc.stroke(<span class="string">'transparent'</span><span>)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;gc.pointsize(16)&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;gc.font(<span class="string">&quot;fonts/simhei.ttf&quot;</span><span>)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;gc.text(40,30,&nbsp;<span class="string">&quot;姓名:#{nickname}&quot;</span><span>)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;gc.text(40,50,&nbsp;<span class="string">&quot;地址:#{adrress}.&quot;</span><span>)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;gc.pointsize(13)&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;gc.text(10,70,&nbsp;blog)&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;gc.draw(img)&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;img.write(<span class="string">&quot;#{dir}/#{name}.jpg&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>DrawPrice.drawpic(<span class="string">&quot;files&quot;</span><span>,</span><span class="string">&quot;vip_price&quot;</span><span>,</span><span class="string">&quot;IceskYsl&quot;</span><span>,</span><span class="string">&quot;深圳&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
</ol>
</div>
</p>
<p>&nbsp;</p>
