--- 
layout: post
comments: true
title: !binary |
  5bqP5YiX5YyW5pWw5o2u55qE6YCf5bqm5a+55q+UOiBNYXJzaGFsIHZzLiBK
  U09OIHZzLiAgRXZhbCB2cy4gWUFNTCAuWkFNTA==

date: 2008-10-5
link: false
categories: life
---
有的时候，需要序列化一些数据，这个时候，我们可以选择的很多，比如Ruby常用的YAML，以及一些不常用的EVAL等，有人针对其<a href="http://www.pauldix.net/2008/08/serializing-dat.html">Serializing的速度做了对比测试</a>，结果显示如下：
<div class="codeText">
<div class="codeHead">对比结果</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>user system total real  </span></span></li>
	<li><span>array marshal 0.210000 0.010000 0.220000 ( 0.220701)  </span></li>
	<li class="alt"><span>array json 2.180000 0.050000 2.230000 ( 2.288489)  </span></li>
	<li><span>array eval 2.090000 0.060000 2.150000 ( 2.240443)  </span></li>
	<li class="alt"><span>array yaml 26.650000 0.350000 27.000000 ( 27.810609)  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>hash marshal 2.000000 0.050000 2.050000 ( 2.114950)  </span></li>
	<li><span>hash json 3.700000 0.060000 3.760000 ( 3.881716)  </span></li>
	<li class="alt"><span>hash eval 5.370000 0.140000 5.510000 ( 6.117947)  </span></li>
	<li><span>hash yaml 68.220000 0.870000 69.090000 ( 72.370784)  </span></li>
</ol>
</div>
毫无疑问，Marshal 是最快的，YAML不是一般的慢。

但是看到有人写了<a href="http://github.com/hallettj/zaml/tree/master/zaml.rb">zaml</a>，其描述为”<span id="repository_description">Fast yaml serialization for Ruby</span>“，号称可以”<a href="http://gnomecoder.wordpress.com/2008/09/27/yaml-dump-1600-percent-faster/">YAML.dump, 1600% faster</a>“，感兴趣的可以看看。

<strong>参考文档：</strong>
http://github.com/hallettj/zaml/tree/master
http://chinaonrails.com/topic/view/2091.html
http://gnomecoder.wordpress.com/2008/09/27/yaml-dump-1600-percent-faster/
http://www.pauldix.net/2008/08/serializing-dat.html
