---
layout: post
title: 随笔有用的Ruby的函数～
date: '2007-10-14'
comments: true
categories: Ruby&Rails
link: true
---
<p>&nbsp;</p>
<p>经常查一些比较有用的Ruby函数，时间久了就忘记了，随手记录下，以备忘，如果你有不错的函数，欢迎分享，如果顺便附带上一些实例代码就更好了。</p>
<p>
<div class="codeText">
<div class="codeHead">ActiveSupport::CoreExtensions::String::StartsEndsWith</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>starts_with?&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>Description&nbsp;&nbsp;</span></li>
    <li class=""><span>starts_with?(prefix)&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>Does&nbsp;the&nbsp;string&nbsp;start&nbsp;with&nbsp;the&nbsp;specified&nbsp;prefix?&nbsp;&nbsp;&nbsp;</span></li>
</ol>
</div>
例如如下代码检测上传的文件是否是图片：</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>(&nbsp;params[</span><span class="symbol">:asset</span><span>][</span><span class="symbol">:uploaded_data</span><span>].content_type.to_s.starts_with?&nbsp;&nbsp;</span><span class="string">&quot;image&quot;</span><span>&nbsp;)&nbsp;&nbsp;</span></span></li>
</ol>
</div>
</p>
