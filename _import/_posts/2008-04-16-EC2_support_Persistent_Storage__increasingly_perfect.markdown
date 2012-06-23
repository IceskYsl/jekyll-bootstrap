---
layout: post
title: EC2支持Persistent Storage，日渐完善
date: '2008-4-16'
comments: true
categories: Ruby&Rails
link: true
---
<p>&quot;Last night Amazon announced <a href="http://aws.typepad.com/aws/2008/04/block-to-the-fu.html">persistent storage on EC2</a>. Now you can create disks in S3 and attach them to EC2 instances. You want a terabyte of storage for your machine, just create it in S3 and mount it.&quot;</p>
<p>很多人应该记得，<a href="http://iceskysl.1sters.com/?action=show&amp;id=241">EC2才宣布支持静态IP</a>没几天，今天就看到消息称EC2支持<strong>Persistent Storage</strong>了，大家应该还记得，EC2发布以来，虽然带给大家无数的方便和快捷，但是其中两个诟病一直被人提及，那就是&ldquo;不支持固定IP地址&rdquo;和&ldquo;没有&rdquo;Persistent Storage&ldquo;，这两个诟病使得：</p>
<p>1、一旦你重启了EC2，你的IP地址就会变化，这就意味着你花了几个小时才解析生效的DNS又无法解析。</p>
<p>2、一旦你的EC2重启，你必须及时的备份数据库和数据文件到S3上，以防止重启或者down机丢失数据。</p>
<p>而这两个问题，到现在为止，已经全部完善了，EC2基本上很成熟了，剩下一个让国内开发者认为不爽的是，在国内，访问的速度实在不咋地。希望亚马逊有改善的计划，到时，就不用自己买服务器，托管啥的啦，甚至VPS都得靠边站，呵呵，就像我以前说的《<a href="../../../?action=show&amp;id=188">RubyOnRails + S3 + EC2 = ?</a> 》，依然好戏。</p>
<p>或许是受到Google发布的Google App Engine的刺激，亚马逊才会在最近做这么大的动作，因为Google App Engine号称是亚马逊的EC2,S3,SQS以及SimpleDB的整体方案。对亚马逊有直接的竞争关系。</p>
<p>前面一篇文章《<a href="http://iceskysl.1sters.com/?action=show&amp;id=253">Google App Engine,前途无量,充满乐趣</a> 》就说了，这样的竞争，会带来更多的好处，好戏还会有，下一个改进会是什么呢？</p>
<p>PS：这次公告中还提及一个新功能：<br />
Another feature rolled out last night is snapshots. Need backup or the ability to rollback? Snapshot the instance and it&rsquo;s on S3, ready to use. You can create new volumes from any particular snapshot.<br />
<br />
These two features make Amazon&rsquo;s grid computing platform a very nice place for startups to experiment, develop, and build out. All with little or no capital cost.</p>
