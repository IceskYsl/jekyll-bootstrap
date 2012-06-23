---
layout: post
title: Hpricot解析XML示例～
date: '2007-11-13'
comments: true
categories: Ruby&Rails
link: true
---
<p><strong>来源：http://errtheblog.com/post/8</strong><br />
Given a piece of XML:</p>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span class="tag">&lt;</span><span class="tag-name">Export</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="tag">&lt;</span><span class="tag-name">Product</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span class="tag-name">SKU</span><span class="tag">&gt;</span><span>403276</span><span class="tag">&lt;/</span><span class="tag-name">SKU</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span class="tag-name">ItemName</span><span class="tag">&gt;</span><span>Trivet</span><span class="tag">&lt;/</span><span class="tag-name">ItemName</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span class="tag-name">CollectionNo</span><span class="tag">&gt;</span><span>0</span><span class="tag">&lt;/</span><span class="tag-name">CollectionNo</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span class="tag-name">Pages</span><span class="tag">&gt;</span><span>0</span><span class="tag">&lt;/</span><span class="tag-name">Pages</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="tag">&lt;/</span><span class="tag-name">Product</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="tag">&lt;/</span><span class="tag-name">Export</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>One might assume that REXML is the way to parse it, but we all know how slow it is.<br />
<br />
Enter _why&rsquo;s HTML parser, Hpricot. It&rsquo;s written in C and since XHTML is a subset of XML, there&rsquo;s no reason it shouldn&rsquo;t be able to parse my file.<br />
<br />
Turns out it does, it&rsquo;s really fast, and the code is dead simple.</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>FIELDS&nbsp;=&nbsp;%w[SKU&nbsp;ItemName&nbsp;CollectionNo&nbsp;Pages]&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>doc&nbsp;=&nbsp;Hpricot.parse(<span class="builtin">File</span><span>.read(</span><span class="string">&quot;my.xml&quot;</span><span>))&nbsp;&nbsp;</span></span></li>
    <li class=""><span>(doc/<span class="symbol">:product</span><span>).</span><span class="keyword">each</span><span>&nbsp;</span><span class="keyword">do</span><span>&nbsp;|xml_product|&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;product&nbsp;=&nbsp;Product.<span class="keyword">new</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">for</span><span>&nbsp;field&nbsp;</span><span class="keyword">in</span><span>&nbsp;FIELDS&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;product[field]&nbsp;=&nbsp;(xml_product/field.intern).first.innerHTML&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;product.save&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>Update: Slight refactoring of the code above. Chris figured out last night that you can use innerHTML which eliminated the only ugly part of the code.</p>
