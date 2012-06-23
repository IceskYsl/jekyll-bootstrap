---
layout: post
title: Use_FasterCSV_to_import_data_into_csv_file_in_ruby.
date: '2009-4-23'
comments: true
categories: 技术归总
tags: csv FasterCSV ruby Ruby&amp;Rails
link: true
---
<p>some tips is here.</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.imp_init_owner_data&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;fp&nbsp;=&nbsp;<span class="string">&quot;#{RAILS_ROOT}/datas/inumbers/ini_owner.csv&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;FasterCSV.open(fp,&nbsp;<span class="string">&quot;w&quot;</span><span>)&nbsp;</span><span class="keyword">do</span><span>&nbsp;|csv|&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;InumberCate.find_all_by_typee(<span class="string">&quot;owner&quot;</span><span>).</span><span class="keyword">each</span><span>&nbsp;</span><span class="keyword">do</span><span>&nbsp;|owner|&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;csv&nbsp;&lt;&lt;&nbsp;[owner.name,owner.id]&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>install <span><span>fastercsv&nbsp; gems like this..<br />
</span></span></p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>iceskysl&nbsp;~/webroot:&nbsp;gem&nbsp;install&nbsp;fastercsv&nbsp;&nbsp;</span></span></li>
    <li class=""><span>Successfully&nbsp;installed&nbsp;fastercsv-1.4.0&nbsp;&nbsp;</span></li>
    <li class="alt"><span>1&nbsp;gem&nbsp;installed&nbsp;&nbsp;</span></li>
    <li class=""><span>Installing&nbsp;ri&nbsp;documentation&nbsp;<span class="keyword">for</span><span>&nbsp;fastercsv-1.4.0...&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>Installing&nbsp;RDoc&nbsp;documentation&nbsp;<span class="keyword">for</span><span>&nbsp;fastercsv-1.4.0...&nbsp;&nbsp;</span></span></li>
    <li class=""><span>iceskysl&nbsp;~/webroot:&nbsp;cd&nbsp;..&nbsp;&nbsp;</span></li>
</ol>
</div>
and do not forget to add &quot;require 'fastercsv'&quot; in your class file.</p>
