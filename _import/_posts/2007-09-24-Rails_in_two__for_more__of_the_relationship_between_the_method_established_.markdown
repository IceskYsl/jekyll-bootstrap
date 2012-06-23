---
layout: post
title: Rails中两种"多对多"关系的建立的方法 ！
date: '2007-9-24'
comments: true
categories: Ruby&Rails
link: true
---
<p>以前的时候只知道在Rails中建立多对多的关系可以把两个表的复数做表名，并去掉其主键ID，后来使用的过程中遇到不少问题，虽然当时也可以 hack过去了，但是心理一直觉得不爽，上次看《敏捷开发第二版》的时候，看到还有另外一个方法，刚好刚才在railscasts上也看到了，现在归纳记 录如下：</p>
<p>&nbsp;</p>
<div class="codeText">
<div class="codeHead">第一种方法： has_and_belongs_to_many</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#&nbsp;in&nbsp;migration</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.up&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;create_table&nbsp;<span class="string">'categories_products'</span><span>,&nbsp;</span><span class="symbol">:id</span><span>&nbsp;=&gt;&nbsp;</span><span class="keyword">false</span><span>&nbsp;</span><span class="keyword">do</span><span>&nbsp;|t|&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;t.column&nbsp;<span class="symbol">:category_id</span><span>,&nbsp;</span><span class="symbol">:integer</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;t.column&nbsp;<span class="symbol">:product_id</span><span>,&nbsp;</span><span class="symbol">:integer</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="comment">#&nbsp;models/product.rb</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>has_and_belongs_to_many&nbsp;<span class="symbol">:categories</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="comment">#&nbsp;models/category.rb</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>has_and_belongs_to_many&nbsp;<span class="symbol">:products</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<div class="codeText">
<div class="codeHead">第二种方法：has_many :through</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#&nbsp;models/categorization.rb</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>belongs_to&nbsp;<span class="symbol">:product</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>belongs_to&nbsp;<span class="symbol">:category</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="comment">#&nbsp;models/product.rb</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>has_many&nbsp;<span class="symbol">:categorizations</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>has_many&nbsp;<span class="symbol">:categories</span><span>,&nbsp;</span><span class="symbol">:through</span><span>&nbsp;=&gt;&nbsp;</span><span class="symbol">:categorizations</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="comment">#&nbsp;models/category.rb</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>has_many&nbsp;<span class="symbol">:categorizations</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>has_many&nbsp;<span class="symbol">:products</span><span>,&nbsp;</span><span class="symbol">:through</span><span>&nbsp;=&gt;&nbsp;</span><span class="symbol">:categorizations</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>很显然，使用第二种会更加明了和便捷，且那个联系表可以随意命名，更加优雅！</p>
<p>&nbsp;</p>
