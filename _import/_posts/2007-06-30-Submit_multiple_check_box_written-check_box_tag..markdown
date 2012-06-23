---
layout: post
title: 提交多个check_box的写法-check_box_tag.
date: '2007-6-30'
comments: true
categories: Ruby&Rails
link: true
---
有的时候可能需要有这样的需求，发一篇文章的时候，需要选择多个tag，我们把Tag取出来后就可以循环显示，但是注意应该是使用check_box_tag，如下是几个例子：&lt;code&gt;&lt;% Business.find(@know.business_id).know_tags.each do |t| %&gt;&lt;%= check_box_tag('know[know_tags_ids][]',t.know_tag_id,@know.know_tags.include?(t))%&gt;&amp;nbsp;&lt;%= t.name %&gt;&lt;%end %&gt;--------------&lt;% @know_tags.each do |t| %&gt;&lt;%= check_box_tag('know[know_tags_ids][]',t.know_tag_id,@know.know_tags.include?(t))%&gt;&amp;nbsp;&lt;%= t.name %&gt;&lt;%end %&gt;---------------&lt;% @tags.each do |tag|%&gt;&lt;%= check_box_tag (&quot;topic[tags_ids][]&quot;,tag.id)%&gt;&lt;%= tag.name %&gt;&lt;% end %&gt;&lt;/code&gt;我想上面几个例子，大家应该明白了吧？
