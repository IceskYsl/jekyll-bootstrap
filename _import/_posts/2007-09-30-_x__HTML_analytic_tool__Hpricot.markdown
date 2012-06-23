---
layout: post
title: (x)HTML解析利器:Hpricot
date: '2007-9-30'
comments: true
categories: Ruby&Rails
link: true
---
<p>由于需要在技能云(iTechTag) 上智能抓取展示&ldquo;技能云&rdquo;的页面的URL对于的RSS进行解析，所以需要写取RSS已经解析的代码，先贴一个一般的例子，如下：</p>
<p>&nbsp;</p>
<div class="codeText">
<div class="codeHead">首先给一段XML代码（<span><span class="string">my.xml）</span></span></div>
<ol class="dp-xml" start="1">
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
<p>紧接着，我们用来解析并入库：</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
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
<p><strong> 遗留问题：</strong></p>
<p>&nbsp;</p>
<p>1、对于中文，可能会出现乱码</p>
<p>2、另外，有人说不是线程安全的，多线程的话可能有问题。</p>
<p><strong>再附录</strong>一段我写的：</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>require&nbsp;</span><span class="string">&quot;open-uri&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>require&nbsp;<span class="string">&quot;hpricot&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>doc&nbsp;=&nbsp;open(<span class="string">&quot;http://blog.1sters.com&quot;</span><span>)&nbsp;{&nbsp;|f|&nbsp;Hpricot(f)&nbsp;}&nbsp;&nbsp;</span></span></li>
    <li class=""><span>rel&nbsp;=&nbsp;doc.search(<span class="string">&quot;//link[@rel='alternate']&quot;</span><span>).first[</span><span class="symbol">:href</span><span>]&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>print&nbsp;rel.to_s&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="comment">#xmldoc&nbsp;=&nbsp;Hpricot.XML(open(&quot;http://blog.1sters.com/&quot;+rel))</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>xmldoc&nbsp;=&nbsp;open(<span class="string">&quot;http://blog.1sters.com/&quot;</span><span>+rel)&nbsp;</span><span class="keyword">do</span><span>&nbsp;|fi|&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;Hpricot.XML(fi)&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;(xmldoc/<span class="symbol">:item</span><span>).</span><span class="keyword">each</span><span>&nbsp;</span><span class="keyword">do</span><span>&nbsp;|item|&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;title&nbsp;=&nbsp;(item/<span class="symbol">:title</span><span>).inner_html&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;link&nbsp;=&nbsp;(item/<span class="symbol">:link</span><span>).inner_html&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;date&nbsp;=&nbsp;(item/<span class="string">'dc:date'</span><span>).inner_html&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;puts&nbsp;<span class="string">&quot;#{title}:&nbsp;#{link}&quot;</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="comment">#print&nbsp;xmldoc.to_s</span><span>&nbsp; <br />
    </span></span></li>
</ol>
</div>
</p>
<p><strong>参考：</strong></p>
<p>1、http://www.ave7.net/forum/showthread.php?t=5919<br />
2、http://club.phpe.net/index.php?act=ST&amp;f=19&amp;t=15267&amp;s=04a67d90deb7607c0907d28dafba10f5</p>
