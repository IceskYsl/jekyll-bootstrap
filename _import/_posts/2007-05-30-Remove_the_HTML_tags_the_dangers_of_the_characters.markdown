---
layout: post
title: 清除HTML标签中的危险字符
date: '2007-5-30'
comments: true
categories: Ruby&Rails Security
link: true
---
很多时候，我们需要处理用户输入，为了适合WEB2的特性，做为开发者我们也会设计很对个途径让用户参与进去，但是“盖茨”大叔说得很对：*凡是用户的输入都是有害的！*一点不假，有时候用户可能是无意的或者一些不怀好意的用户会输入一些我们并不想让他们输入的东西，以防止破坏页面结构或者造成其他的危害（比如SQL注射和XSS攻击），所以我们需要对用户的输入认真的检验和过滤。在页面上显示的时候，我们可以选择+h()+或者+sanitize+或者+strip_tags+等等rails提供的方法进行过滤，但是这些危险的字符还适度会存在数据库，或许有一天就会引爆了呢，所以呢，最好的办法是在存入数据库的时候就做一些过滤或转换，一下一点点代码段只是一个小例子，真实世界中需要过滤和清除的危险字符是很多的，大家注意主机收集和完善，也希望大家一起来实现这个功能，做一个通用的 helper方法。&lt;code&gt;    def stripped_html(html)      # this is a copynpaste of the routine in article.rb      # so the one in article.rb can change w/o breaking this.      self.html.gsub(/&lt;[^&gt;]*&gt;/,'').to_url    end&lt;/code&gt;对于HTML标签的过滤和清除，你有什么好的方法么？欢迎分享！
