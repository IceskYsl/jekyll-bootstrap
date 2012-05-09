--- 
layout: post
comments: true
title: !binary |
  5ZyoUk9S5Lit5a6e546w6Ziy5Z6D5Zy+55qEVHJhY2tiYWNr5oCd6Lev

date: 2007-5-21
link: false
categories: life
---
Trackback可谓是WEB2.0的一个特征吧，Trackback的特征和好处我就不多说了，Trackback大部分人刚接触到肯定会觉得很迷惑，不知道怎么用。其实它也没有那么神秘，以下介绍一下我对Trackback的理解。 简单说trackback是一个点对点通信和网站间互相通告的框架。这句话也讲不明白. 那就拿实例来说: &lt;blockquote&gt;A在他的博客A.com上写了一篇文章 支持Trackback 引用地址为:http://a.com/trackback.php?id=1 B想写一篇文章回复A,惯用方法是我在A文章的下面写评论,但是Trackback带来了新的革命:B可以把文章写在自己的blog上,而同时又能在A的文章下面显示B这篇文章的部分内容。这就是利用了Trackback,那么A想要看别人评论的全文就要到B的网站上去，这样就带来了网站之间的互通,这才是Blog的精髓。虽然在国内大部分还习惯用comment的方式。 Trackback与comment不同的地方在于,你可以更好的控制自己的文章,按规定当你在你网站修改文章的时候,A网站上的你的内容同步改动.甚至删除 &lt;/blockquote&gt;实现Trackback的原理也很简单，但是正是因为这种简单的机理，使得很多垃圾，造成“垃圾泛滥”，我想按照下面说得方法应该可以防范：1.加验证码2.编码－解码或者把这两个结合起来，在RUBY中可以使用base64编码，如下：decode64(str)    对经过Base64编码的str字符串进行解码。encode64(str)    对str字符串进行Base64编码。这样在生成Trackback地址的时候，可以把指定如下几个参数：1.私有的Key,在APP的配置文件（可以使用YML或者数据库）中指定一个私人的Key,然后生成Trackback地址时用这个key＋文章创建时间，按照一定的规则截取，然后加上文章的ID以及编码规则（UTF-8、GBK等）组合一个字符串，再BASE64编码下，赋给一个指定的变量(比如code），/trackback/code=MjcyCXV0Zi04CTExNzkzNTkzNjQJMA%3D%3D，接收的时候先encode64解码，再验证Key等是不是正确的，如果正确的，就入库，否则抛弃。PS:还可以进一步，对这个地址先不显示，如果读者需要这个，就按照页面上的点一个“点击显示引用URL”，然后用个AJAX实现，就不怕网络爬虫了～以上是我的思路，页是参考别人的一些思路综合起来的，希望对大家有用，如果你有更好的想法，反应和我交流～
