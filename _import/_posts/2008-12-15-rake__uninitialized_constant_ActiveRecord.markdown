---
layout: post
title: rake__uninitialized_constant_ActiveRecord
date: '2008-12-15'
comments: true
categories: Ruby&Rails
link: true
---
<p>写了一个task，执行的时候一直报：</p>
{% codeblock %}rake aborted!<br />uninitialized constant ActiveRecord<br />迷糊了半天，发现task中忘记加&ldquo;=&gt; :environment&rdquo;了。<br />参考：http://www.ruby-forum.com/topic/143124{% endcodeblock %}
