---
layout: post
title: 提升MYSQL性能可用思路和方案的技术分析
date: '2008-6-6'
comments: true
categories: Ruby&Rails
link: true
---
<p>当<strong>MYSQL</strong>成为越来越多的web2站点的选择的DB的时候，当站点越来越大，流量越来越多，用户越来越多的时候，数据库往往第一个成为系统的瓶颈，如何提升DB的性能成为系统成败的关键点，本文只是从自己的认识上说说可以从几个方面提升MYSQL的性能，以及可以采取的扩展方式。但是不会详细的阐述，详细的说明和操作，分析方法以后有时间再仔细分享。</p>
<p><strong>一、选择合适的数据库存贮引擎</strong></p>
<p>MYSQL支持的引擎很多，例如<strong>MyISAM</strong>，<strong>MEMORY</strong>，<strong>InnoDB</strong>等等类型，每个类型试用的场景是不一样的，恰当的选择存储引擎可以节省你不少时间，详细的介绍你可以参考&rdquo;<a href="http://dev.mysql.com/doc/refman/5.1/zh/storage-engines.html">第15章：存储引擎和表类型</a>&ldquo;。</p>
<p><strong>二、优化SQL语句</strong></p>
<p>不要以为<strong>SQL</strong>语句关系不大，按照以往的经验，往往几个畸形的SQL就可以拖垮一个DB，决定不是危言耸听，在从系统优化和DB优化及其扩展之前，请仔细检查系统中用到的SQL，先解决SQL可能带来的问题，而经验是，做好这步，就可以解决很多初期的性能问题。</p>
<p><strong>三、建立索引</strong></p>
<p>这和前面的<strong>SQL优化</strong>有一定的联系，仔细查看你的SQL语言，尽可能的优化他，然后建立必须的索引，千万不要忽视了索引的威力，我们曾经有过测试，2W条的基本数据，生成页面，没有索引前，推算其全部生成需要的时间是<strong>81</strong>个小时，而加上索引后，只需要<strong>12</strong>分钟，多大的性能提升，各位可以自己那计算器粗略的算算。</p>
<p><strong>四、建立分区&amp;表空间</strong></p>
<p>很多人以为只有<strong>Oracle</strong>才有表空间，分区这些东西，不想到MYSQL中也有类似的东西吧，尽管这个东西是mysql5才引入的，尽管其还不是很成熟，但是毫无疑问，这是一个好的信号，在我们使用MYSQL的时候就有了更多的方案来提升性能了。</p>
<p>分区一般分为水平分区和垂直分区，MYSQL目前只支持水平分区，有RANGE,LIST,HASH,KEY等等分区方式，详细说明以后再说，你可以参考&rdquo;<a href="http://dev.mysql.com/doc/refman/5.1/zh/partitioning.html">第18章：分区</a>&ldquo;，&quot;<a href="http://fanqiang.chinaunix.net/db/mysql/2006-05-08/4135.shtml">通过分区（Partition）提升MySQL性能</a>&quot;等文章。</p>
<p>表空间的相关话题，可以参考&rdquo;<a href="http://dev.mysql.com/doc/refman/5.1/zh/ndbcluster.html">第17章：MySQL簇</a>&ldquo;，不在赘述。</p>
<p><strong>五、调整MYSQL和系统参数</strong></p>
<p>这个方案是伴随着整个性能提升过程的，你的不时的调整参数以得到更好的性能，这个比较复杂，没有啥成文的规定，都是靠经验或者实践得到的。</p>
<p><strong>六、集群或者proxy</strong></p>
<p>到这里为止，单机的MYSQL基本上可以优化调整的都涉及到了，如果这个时候还是顶不住压力，该考虑<strong><u>水平扩展</u></strong>或者<strong><u>垂直扩展</u></strong>了，垂直扩展比较容易，只要针对单机的性能得到瓶颈的所在，增加CPU或者内存或者换比较强劲的设备就可以很快得到立竿见影的效果。</p>
<p>但是垂直扩展能力有限，不可能得到无限级的扩展，风险也比较大，除了垂直扩展，大家选择较多的是<strong>水平扩展</strong>，也就是通过增加服务器，无限的得到性能的扩展，当然这个里面内容是很多的，如何做到数据库的<strong>备份</strong>，<strong>同步</strong>等都是需要考虑和解决的问题，而且还要考虑这么多机器间的数据重复成都等问题；除此之外，还有可能将数据库缓存到<strong>memcached</strong>或者使用<strong>mysql proxy</strong>等实现<em>连接池</em>之类的方案，都是需要考虑和抉择的。</p>
<p>以上每个分类都是个大的话题，这么一篇文章只是说明了优化的<u>思路</u>和<u>基本流程</u>，其中涉及到很多东西，例如<strong>诊断</strong>和<strong>分析</strong>等都是很有技术含量的，我们下次会一个专题一个专题的仔细分析，力求将MYSQL的性能达到尽可能的榜。</p>
<p>本人也只是站在自己使用的角度以及一些前人的经验上分析和分享，如果你有类似经验，还望分享，如果文章中有错误的或者不到位的地方，还望指出，谢谢。</p>
