--- 
layout: post
comments: true
title: !binary |
  5ZyoUmFpbHPkuK3kvb/nlKh3aWxsX1BhZ2luYXRl55qE5YiG6aG15oqA5ben

date: 2008-6-11
link: false
categories: life
---
<p>WillPaginate这个插件很棒，以至于其取代了Rails中原有的Paginate方法，虽然看上其很简单，其实还是有不少技巧的，本篇用来记录我遇到的或者使用到的一些tips。<br />
<br />
<strong>1.直接使用paginate</strong><br />
这个比较简单，也是使用的最多的，如下：</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.get_all_items_in_catelog(&nbsp;catelog_id,page,per_page=</span><span class="string">&quot;10&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;paginate&nbsp;<span class="symbol">:per_page</span><span>&nbsp;=&gt;&nbsp;per_page,&nbsp;</span><span class="symbol">:page</span><span>&nbsp;=&gt;&nbsp;page,&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="symbol">:conditions</span><span>&nbsp;=&gt;[</span><span class="string">&quot;catelog_id&nbsp;=&nbsp;?&nbsp;and&nbsp;caiji&nbsp;&gt;&nbsp;0&quot;</span><span>,catelog_id],&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="symbol">:order</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'created_at&nbsp;DESC&nbsp;,updated_at&nbsp;&nbsp;DESC'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp; <br />
    </span></span></li>
</ol>
</div>
<p><strong>&nbsp;2.使用Model.paginate_by_sql</strong><br />
有的时候，你需要的SQL用Rails拼的时候有些不方便，这个时候可以考虑使用paginate_by_sql来实现，这个没啥好说的，你需要什么样的SQL直接写就可以了，例如：<br />
&nbsp; #排行榜列表</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.get_all_items_in_rank(rank_id,&nbsp;page,per_page=</span><span class="string">&quot;10&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;Book.paginate_by_sql&nbsp;[<span class="string">&quot;SELECT&nbsp;DISTINCT&nbsp;`books`.*&nbsp;FROM&nbsp;`books`&nbsp;LEFT&nbsp;OUTER&nbsp;JOIN&nbsp;`ranksorts` <br />
    </span></span></li>
    <li class=""><span><span class="string">ON&nbsp;(`books`.`prodid`&nbsp;=&nbsp;`ranksorts`.`prodid`)&nbsp;LEFT&nbsp;OUTER&nbsp;JOIN&nbsp;`ranks`&nbsp; <br />
    </span></span></li>
    <li class=""><span><span class="string">ON&nbsp;(`ranks`.`id`&nbsp;=&nbsp;`ranksorts`.`rank_id`)&nbsp;WHERE&nbsp;(ranks.id&nbsp;=&nbsp;?) <br />
    </span></span></li>
    <li class=""><span><span class="string">ORDER&nbsp;BY&nbsp;books.updated_at&nbsp;DESC,books.created_at&nbsp;DESC&quot;</span><span>,&nbsp;rank_id],&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="symbol">:page</span><span>&nbsp;=&gt;&nbsp;page,&nbsp;</span><span class="symbol">:per_page</span><span>&nbsp;=&gt;&nbsp;per_page&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>还有其他的一些小技巧，慢慢添加，你如果有类似的技巧，期待您的分享。。<br />
<br />
参考文档：<br />
1、<a href="http://errtheblog.com/posts/56-im-paginating-again">I'm Paginating Again</a></p>
