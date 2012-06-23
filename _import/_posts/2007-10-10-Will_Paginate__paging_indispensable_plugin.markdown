---
layout: post
title: Will Paginate :分页不可或缺的插件
date: '2007-10-10'
comments: true
categories: Ruby&Rails
link: true
---
<p>Rails以前的版本中包含了一个分页的方法，我使用的使用做了一些扩充，一直用到现在，看到很多人介绍Will Paginate，偶也不感兴趣，后来发现一个消息说Rails2.0将祛除内置的Paginate，于是就看看这个Will Paginate。</p>
<p>参考资料：</p>
<ul>
    <li><a href="http://dev.rubyonrails.org/changeset/6993">http://dev.rubyonrails.org/changeset/6993</a></li>
    <li><a href="http://errtheblog.com/post/4791">http://errtheblog.com/post/4791</a></li>
    <li><a href="http://agilewebdevelopment.com/plugins/will_paginate">http://agilewebdevelopment.com/plugins/will_paginate</a></li>
    <li><a href="http://mattrobinson.net/2007/6/26/rails-plugins-scope_out-and-will_paginate">http://mattrobinson.net/2007/6/26/rails-plugins-scope_out-and-will_paginate</a></li>
    <li><a href="http://www.dcmanges.com/blog/21">http://www.dcmanges.com/blog/21</a></li>
    <li>http://www.lycom.de/past/2007/7/12/rails_will_paginate20070712_200741/</li>
    <li>http://www.javaeye.com/topic/108118</li>
    <li><font color="#ff0000">http://railscasts.com/episodes/51</font></li>
</ul>
<p><strong>附录：基本步骤和过程</strong></p>
<p>
<div class="codeText">
<div class="codeHead"><strong>安装will_paginate </strong></div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>ruby&nbsp;script/plugin&nbsp;install&nbsp;svn://errtheblog.com/svn/plugins/will_paginate&nbsp;&nbsp; <br />
    </span></span></li>
</ol>
</div>
</p>
<script type="text/javascript">render_code();</script>
<div class="code_title">
<div class="codeText">
<div class="codeHead"><strong>在Model中使用will_paginate </strong></div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#&nbsp;models/product.rb&nbsp;&nbsp;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.search(search,&nbsp;page)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;paginate&nbsp;<span class="symbol">:per_page</span><span>&nbsp;=&gt;&nbsp;5,&nbsp;</span><span class="symbol">:page</span><span>&nbsp;=&gt;&nbsp;page,&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="symbol">:conditions</span><span>&nbsp;=&gt;&nbsp;[</span><span class="string">'name&nbsp;like&nbsp;?'</span><span>,&nbsp;</span><span class="string">&quot;%#{search}%&quot;</span><span>],&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;order&nbsp;=&gt;&nbsp;<span class="string">'name'</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>nd&nbsp;&nbsp;&nbsp; <br />
    </span></li>
</ol>
</div>
</div>
<script type="text/javascript">render_code();</script>
<div class="code_title">
<div class="codeText">
<div class="codeHead"><strong>在controller中使用search </strong></div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#&nbsp;products_controller.rb&nbsp;&nbsp;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">def</span><span>&nbsp;index&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="variable">@products</span><span>&nbsp;=&nbsp;Product.search(params[</span><span class="symbol">:search</span><span>],&nbsp;params[</span><span class="symbol">:page</span><span>])&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp; <br />
    </span></span></li>
</ol>
</div>
<div class="codeText">
<div class="codeHead"><strong>在页面中使用will_paginate </strong></div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>#&nbsp;</span><span class="comments">&lt;!--&nbsp;products/index.rhtml&nbsp;--&gt;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;<span class="tag">&lt;</span><span>%=&nbsp;will_paginate&nbsp;@products&nbsp;%</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
</ol>
</div>
</div>
<script type="text/javascript">render_code();</script>
