--- 
layout: post
comments: true
title: !binary |
  5Yip55SoQW1hem9uIFdlYiBTZXJ2aWNlcyhBV1Mp5p6E5bu65Y+v5omp5bGV
  55qEV2ViQXBw5bqU55So

date: 2008-4-28
link: false
categories: life
---
<p>在上次（2008.01.10）简单了写了一篇《<a href="../../../?action=show&amp;id=188">RubyOnRails + S3 + EC2 = ?</a> 》至今已经有段时间了，经过一段时间的发展，Amazon Web Services到今天已经相当成熟了，一整套的解决方案可以给Web App带来很多的便利，再一系列的改进措施后，AWS基本上是成熟了。</p>
<p><img src="http://lh3.ggpht.com/iceskysl/SBV1lquzeiI/AAAAAAAACDI/o50yR_nOby4/s400/all.png" alt="" /></p>
<p>上面这个图片来源于slideshare上的一个PPT&ldquo;<a href="http://www.slideshare.net/martin.rehfeld/amazon-simple-db-07-feb-2008-rug-b/">Using Amazon SimpleDB with Ruby on Rails</a>&rdquo;，正如我上面截取的这个图片说的：</p>
<ul>
    <li>静态文件存储在S3上；</li>
    <li>App server使用课余无限扩展的EC2；</li>
    <li>结构化数据存储在SimpleDB上；</li>
    <li>客户端/服务端的交互使用SQS；</li>
</ul>
<p>看看AWS的几个应用，正好覆盖了WebApp的整个过程，以下逐一介绍下这几个服务：</p>
<p>1、<strong>S3</strong>看上去就是一个大的硬盘，你可以把App中的所有数据都放上去，取回来，展示等等，是个比较安全的存储服务，省略了自己买磁盘阵列，维护等等费用，且号称是安全的。</p>
<p>2、<strong>EC2</strong>的最大卖点就是其可以无限伸缩的，号称可以扩展到&ldquo;云&rdquo;上去，不用因为您的服务器压力过重而购买一批一批的机器，免得找机房，等等，可谓相当方便，在其推出<a href="http://iceskysl.1sters.com/?action=show&amp;id=241">固定IP</a>和<a href="http://iceskysl.1sters.com/?action=show&amp;id=255">固态存储</a>之后，使得EC2相当成熟；</p>
<p>3、<strong>SimpleDB</strong>推出的最早，但是一直没仔细看，以为其和S3差不多，今天仔细看了下，其实不然，看其名字是SimpleDB，是用来替代DB的，但是比普通的DB更加Simple，其实也就是一个结构化的存储，你可以把DB的东西（表，行）组合一下放进去，然后根据其有的API查询和存贮，省了维护数据库的人力物力，但是速度不晓得如何。</p>
<p>4、<strong>SQS</strong>是前段时间了解的，不晓得这个服务当初推出的典型应用场景是什么样的，就我的理解，其就是一个队列，相当于一个缓冲队列，用在分布式处理或者作用同步上相当不错，有兴趣的可以看我以前的文章&ldquo;Amazon SQS,分布式作业不再费心&rdquo;。</p>
<p>总的来说，AWS的几个服务都是将WebApp开发中涉及到的几个方面分拆出来做成服务，以来提供便捷，二来自己赚了一大笔，真是聪明，不过这些应用的维护不晓得Amazon 是怎么处理的，肯定不会是我们常见的人工维护，估计和Google存储差不多的自维护系统。</p>
<p>如果您对AWS感兴趣，如果您和笔者一样使用的是RubyOnRails，你可以使用RightAws插件，其包含了以上4个应用的实现，相当不错。</p>
<p>但是其不足之处依然存在，例如多国内用户，速度不敢恭维；也有人列举了&ldquo;<a href="http://www.ryanpark.org/2008/04/top-10-avoid-the-simpledb-hype.html">Top 10 Reasons to Avoid the SimpleDB Hype</a>&rdquo;,当然也有人针锋相对的回应了这10个问题&ldquo; <a href="http://rashkovskii.com/articles/2008/4/26/top-10-reasons-to-avoid-document-databases-fud">Top 10 Reasons to Avoid Document Databases FUD&nbsp; 4 </a>&rdquo;；另外还有其价格是否真的划算（现在支付美刀比较划算），以及其曾经出现过的问题，所以您在决定使用之前还请仔细考量，这几个应用我都有过尝试，虽然没有大规模的使用，但是基本上比较了解了，如果您有问题，或者其他的经验，欢迎和我交流。</p>
