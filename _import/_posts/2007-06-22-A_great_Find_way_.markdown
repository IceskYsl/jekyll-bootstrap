---
layout: post
title: 一个很棒的Find方法！
date: '2007-6-22'
comments: true
categories: Ruby&Rails
link: true
---
今天CFC问我有没有用过find(:all, :select =&gt; )这个用法，别说，还真没有用过，直接告诉我应该是可以取指定的字段。果不其然，比如我要取Contact表的id和name两个字段，可以有兩種寫法，一個是find，一個是find_by_sql，如下：&lt;code&gt;Contact.find(:all, :select =&gt; &quot;id, name&quot;)Contact.find_by_sql(&quot;SELECT id, name FROM `contacts`&quot;)&lt;/code&gt;这两种写法效果是一样的，怎么样，是不是比较棒呀？可能你还要问这个写法有什么好处呀？写过rails的朋友应该对它的Find方法很熟悉，但是Find是一次吧所有字段都取出来，如果字段内容比较多，会耗费很多的内存的哦，这样的话，我们只取需要的字段就OK了。你还有什么想法，欢迎留言讨论～
