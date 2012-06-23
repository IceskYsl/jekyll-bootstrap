---
layout: post
title: 使用Migration把 MySQL的表引擎修改为InnoDB
date: '2007-10-2'
comments: true
categories: Ruby&Rails
link: true
---
<p>尽管现在还没有这个需求，但是还是有必要了解一下，也是对Migration掌握的必须掌握的东西，代码不是我写的，来自与http://snippets.dzone.com/posts/show/4601，我怕时间按久了在那里找不到，所以干脆贴过来。</p>
<div class="codeText">
<div class="codeHead">Migration的Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">class</span><span>&nbsp;ChangeTableTypes&nbsp;&lt;&nbsp;ActiveRecord::Migration&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.up&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;ActiveRecord::Migration:<span class="symbol">:say</span><span>&nbsp;</span><span class="string">'Setting&nbsp;all&nbsp;tables&nbsp;to&nbsp;InnoDB&nbsp;engine&nbsp;(excluding&nbsp;schema_info&nbsp;table)...'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;result&nbsp;=&nbsp;ActiveRecord::Migration:<span class="symbol">:execute</span><span>&nbsp;</span><span class="string">'show&nbsp;tables'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">while</span><span>&nbsp;table&nbsp;=&nbsp;result.fetch_row&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;execute(<span class="string">&quot;ALTER&nbsp;TABLE&nbsp;#{table.to_s}&nbsp;TYPE&nbsp;=&nbsp;InnoDB&quot;</span><span>)&nbsp;</span><span class="keyword">unless</span><span>&nbsp;table.to_s&nbsp;==&nbsp;</span><span class="string">'schema_info'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.down&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">raise</span><span>&nbsp;ActiveRecord::IrreversibleMigration&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
