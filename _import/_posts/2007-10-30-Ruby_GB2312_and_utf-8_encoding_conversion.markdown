---
layout: post
title: ruby GB2312和UTF-8编码转换
date: '2007-10-30'
comments: true
categories: Ruby&Rails
link: true
---
<p>今天CFC测试技能云的时候，在导出简历的时候，报错，跟了下log发现，错误如下：</p>
<p>Iconv::IllegalSequence (&quot;閫欐槸涓&euro;鍊嬪皣\345&quot;...):</p>
<p>就是代码转换老是报错，原来CFC的输入的是繁体中文的，原来如此，一定要加上IGNORE参数，就好了。记录一下。
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>Iconv.iconv(</span><span class="string">&quot;UTF-8//IGNORE&quot;</span><span>,</span><span class="string">&quot;GB2312//IGNORE&quot;</span><span>,text)&nbsp;&nbsp;</span></span></li>
</ol>
</div>
</p>
<p>最后感谢写CFC同学～</p>
