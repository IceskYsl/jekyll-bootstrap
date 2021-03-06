---
layout: post
title: 在Ruby中使用RMagick动态生成图片
date: '2008-4-24'
comments: true
categories: Ruby&Rails
link: true
---
<p>很早前就有类似的需求了，但是当时恐惧<strong>RMagick</strong>的庞大身躯，加上其对中文的支持布什很完善，就没怎么去在意他，最近一个项目中需要生成一些动态的图片，本来使用了Google的那个chart功能，后来觉得有点牵强附会，于是乎，静下心来，仔细看看RMagick咋生成图片。</p>
<p>我的需求很简单，就是动态生成一个指定大小的图片，然后再图片上写几个汉字或者数字，英文等，所以大概的步骤就是这样的，直接看代码吧：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>require&nbsp;</span><span class="string">'RMagick'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">class</span><span>&nbsp;DrawPrice&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.draw(name,nickname,email,blog=</span><span class="string">'http://iceskysl.1sters.com/'</span><span>,columns=240,rows=80,bg_color=</span><span class="string">'white'</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;img&nbsp;=&nbsp;Magick::Image.<span class="keyword">new</span><span>(columns,rows,Magick::HatchFill.</span><span class="keyword">new</span><span>(bg_color,</span><span class="string">'lightcyan2'</span><span>))&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gc&nbsp;=&nbsp;Magick::Draw.<span class="keyword">new</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gc.stroke(<span class="string">'transparent'</span><span>)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gc.pointsize(16)&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gc.font(<span class="string">&quot;fonts/simhei.ttf&quot;</span><span>)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gc.text(10,30,&nbsp;<span class="string">&quot;姓名:#{nickname}&quot;</span><span>)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gc.text(10,50,&nbsp;<span class="string">&quot;Email:#{email}.&quot;</span><span>)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gc.pointsize(13)&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gc.text(10,70,&nbsp;blog)&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gc.draw(img)&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;img.write(<span class="string">&quot;files/#{name}.jpg&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;DrawPrice.draw(<span class="string">&quot;Ysl&quot;</span><span>,</span><span class="string">&quot;IceskYsl&quot;</span><span>,</span><span class="string">&quot;iceskysl@gmail.com&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
</ol>
</div>
再看个效果图：</p>
<p>虽然很多函数，但是我们用到的就那么几个，Good～不是吗？</p>
<p>参考文档：</p>
<p>http://www.javaeye.com/post/262865</p>
<p>http://www.javaeye.com/topic/174048</p>
<p>http://www.javaeye.com/post/380907</p>
<p>http://www.simplesystems.org/RMagick/doc/image1.html#new</p>
<p>http://rmagick.rubyforge.org/portfolio3.html</p>
<p>&nbsp;</p>
