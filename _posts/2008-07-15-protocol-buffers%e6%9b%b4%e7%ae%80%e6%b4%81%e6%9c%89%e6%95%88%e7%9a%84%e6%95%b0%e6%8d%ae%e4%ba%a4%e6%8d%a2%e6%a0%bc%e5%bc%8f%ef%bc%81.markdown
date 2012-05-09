--- 
layout: post
comments: true
title: !binary |
  UHJvdG9jb2wgQnVmZmVyczrmm7TnroDmtIHmnInmlYjnmoTmlbDmja7kuqTm
  jaLmoLzlvI/vvIE=

date: 2008-7-15
link: false
categories: life
---
“<a id="What_is_it?">Protocol Buffers are a way of encoding structured data in an efficient yet extensible format. Google uses Protocol Buffers for almost all of its internal RPC protocols and file formats.”</a>

Google公司与本月初宣布其内部数据交换格式Protocol Buffers正式开源，基于Apache软件证书2.0发布，相关文档、实例和代码已经可以从<a id="stwl" title="Google Code" href="http://code.google.com/p/protobuf/">Google Code</a>上 访问到。

<strong>Protocol Buffers</strong>被定义为一种数据描述语言（Data Description Language，DDL），广泛的应用于Google内部，用于结构化数据的描述、传输和存储。尽管其功能和用途与XML基本相似，但是 Protocol Buffers更为轻便。Google宣称其效率对于XML有很大提升，文本比XML要小3-10倍，而解析效率却提升至20-100倍。

这真是和好消息，XML慢的诟病相比大家都非常清楚，JSON格式的又无法取代XML的强大地位，虽然Ruby中有Hpricot这样的XML解析利器，但是在大批量的解析中还是会有瓶颈出现，而Google此次放出的Protocol Buffers比XML小，且解析速度很快，足够引起广泛的关注了。

InfoQ上有篇报道“<a href="http://www.infoq.com/cn/news/2008/07/google-protobuf">Google开源数据交换格式Protocol Buffers</a>”比较详细，你也可以在"<a href="http://code.google.com/p/protobuf/">Protocol Buffers</a>"上查看。

目前已经看到C++，Java，Python格式的API，但是没看到基于Ruby的API，何时会出现 ，应该很快就有了。
