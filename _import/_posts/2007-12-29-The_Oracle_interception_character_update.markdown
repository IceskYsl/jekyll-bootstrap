---
layout: post
title: Oracle中的截取字符更新
date: '2007-12-29'
comments: true
categories: Ruby&Rails
link: true
---
<p>update bizobj_extend_value t <br />
set t.extend_value = substr(t.extend_value,1,10) <br />
where extend_key = 'BOSSID'&nbsp; and&nbsp; lengthb(trim(t.extend_value) )&gt; 20&nbsp;&nbsp;</p>
