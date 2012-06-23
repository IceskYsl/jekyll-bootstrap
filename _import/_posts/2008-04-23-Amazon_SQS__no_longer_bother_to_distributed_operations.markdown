---
layout: post
title: Amazon SQS,分布式作业不再费心
date: '2008-4-23'
comments: true
categories: Ruby&Rails
link: true
---
<p>开始写这个之前，我不得不佩服下Amazon，不用说别的，就其SimpleDB，S3,EC2这几个就足以让业界大为惊叹，这些都比较熟悉了，今天说的是另外一个类似的东西，<a href="http://www.amazon.com/Simple-Queue-Service-home-page/b/ref=sc_fe_l_2/102-6256901-8077705?ie=UTF8&amp;node=13584001&amp;no=3435361&amp;me=A36L942TSJ2AJA">Amazon Simple Queue Service</a>（SQS）。</p>
<p>看名字，大概就可以猜出大概的意思了，对，就是队列服务，<strong>SQS</strong>就是一个简单的<strong>队列服务</strong>，你可以创建一个队列，然后从不同的地方往里面<strong>放</strong>东西，然后又可以在不同的地方不停的往外<strong>取</strong>东西，想想看，这不就是分布式协作么。</p>
<p>但是需要注意的是，往里面放的时候，消息必须是txet，也就是是说不能放Hash或者数组啥的，如果您有类似需求，请接着往后看，我将提供一个变通的方法。</p>
<p>一、简介SQS</p>
<p>Amazon Simple Queue Service (Amazon SQS) offers a reliable, highly scalable, hosted queue for storing messages as they travel between computers. By using Amazon SQS, developers can simply move data between distributed components of their applications that perform different tasks, without losing messages or requiring each component to be always available.</p>
<p>二、如何使用</p>
<p>Ruby的社区足够活跃，每个应用都能找到对应的Gem或者插件，这给了我们足够的方便，针对SQS，我推荐的两个gem，分别是：</p>
<p><strong>1、SQS Gem<br />
</strong></p>
<p>这个插件是Amazon SQS官方站点写的教程《<a href="http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1182">Using Amazon S3, EC2, SQS, Lucene, and Ruby for Web Spidering</a>》上使用的，足够的简单，但是其<a href="http://rubyforge.org/projects/sqs/">主页</a>貌似访问不了了，只能通过<a href="http://203.208.35.101/search?q=cache:4BF5qfnmG-oJ:sqs.rubyforge.org/+sqs+ruby&amp;hl=zh-CN&amp;ct=clnk&amp;cd=1&amp;gl=cn&amp;st_usg=ALhdy28JOtHb5qDHNlfaKBIxo1tvsqKpDA">Google Cach</a>看看。</p>
<p>使用非常方便，流程如下</p>
<p>1）安装：gem install SQS</p>
<p>2）测试：ruby test/all_tests.rb</p>
<p>3）使用示例
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>require&nbsp;</span><span class="string">'rubygems'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>require&nbsp;<span class="string">'sqs'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>SQS.access_key_id&nbsp;=&nbsp;<span class="string">'YOURACCESSKEYID'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>SQS.secret_access_key&nbsp;=&nbsp;<span class="string">'YOURSECRETACCESSKEY'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>q&nbsp;=&nbsp;SQS.create_queue&nbsp;<span class="string">'myFantasticQ'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>puts&nbsp;q.url&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>SQS.each_queue&nbsp;<span class="keyword">do</span><span>&nbsp;|q|&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;puts&nbsp;q.name&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>q&nbsp;=&nbsp;SQS.get_queue&nbsp;<span class="string">'myFantasticQ'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>q.send_message&nbsp;<span class="string">'This&nbsp;is&nbsp;a&nbsp;message!'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>m&nbsp;=&nbsp;q.receive_message&nbsp;&nbsp;</span></li>
    <li class="alt"><span>puts&nbsp;m.body&nbsp;&nbsp;</span></li>
    <li class=""><span>m.delete&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>q.each_message&nbsp;<span class="keyword">do</span><span>&nbsp;|m|&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="comment">#&nbsp;note&nbsp;that&nbsp;#each_message&nbsp;is&nbsp;an&nbsp;infinite&nbsp;loop!</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="comment">#&nbsp;you&nbsp;must&nbsp;either&nbsp;break&nbsp;out&nbsp;of&nbsp;it,&nbsp;or&nbsp;delete&nbsp;each&nbsp;message&nbsp;you&nbsp;receive</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;m.delete&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>q.approximate_number_of_messages&nbsp;&nbsp;</span></li>
    <li class="alt"><span>q.visibility_timeout&nbsp;&nbsp;</span></li>
    <li class=""><span>q.visibiltit_timeout&nbsp;=&nbsp;3&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>q.delete&nbsp;&nbsp;</span></li>
</ol>
</div>
其他文章，可以自己Google。</p>
<p><strong>2、RightScale gems</strong></p>
<p><a href="http://rightaws.rubyforge.org/">RightScale gems</a>是<a href="http://www.rightscale.com/">RightScale</a> 从其产品里面提取出来的，这个现象很常见，就像Shopify 中提取的<a href="http://iceskysl.1sters.com/?action=show&amp;id=226">Active Merchant</a>一样，从一个成熟的产品中提取出来一个gem，其可用性是相当高的。</p>
<p>使用方法大同小异，不再赘述，如果感兴趣，请到上面的地址上自行查看。</p>
<p><strong>三、如何扩展</strong></p>
<p>前面我们说了，SQS中容纳的消息是text的，但是看其文档表述，是这样写的：</p>
<blockquote>
<p>New messages can be added to a queue at any time. The message body can contain up to 8 KB of text in any format.</p>
</blockquote>
<p>any time？啥意思？奇怪。</p>
<p>我认为一种可行的办法是，把Hash转成ymal格式的（<strong>.to_yaml</strong>），然后放进去后；取出的时候，直接<strong>YAML.load(message.body)</strong>，然后再还原即可了。</p>
<p>看段代码，如下：</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>require&nbsp;</span><span class="string">'SQS'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">class</span><span>&nbsp;Tsqs&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>SQS.conf_file&nbsp;=&nbsp;<span class="string">'sqs_conf.yml'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>s&nbsp;=&nbsp;SQS.<span class="keyword">new</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>puts&nbsp;s.api_version&nbsp;&nbsp;</span></li>
    <li class=""><span>puts&nbsp;s.conf_file&nbsp;&nbsp;</span></li>
    <li class="alt"><span>puts&nbsp;s.url_for_query&nbsp;&nbsp;</span></li>
    <li class=""><span>iceskysl&nbsp;=&nbsp;s.get_queue(<span class="string">'iceskysl_message'</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>books_to_update&nbsp;=&nbsp;{&nbsp;<span class="string">'bookid'</span><span>=&gt;</span><span class="string">&quot;1&quot;</span><span>,</span><span class="string">'url'</span><span>=&gt;</span><span class="string">&quot;url1&quot;</span><span>,</span><span class="string">'queue'</span><span>=&gt;</span><span class="string">&quot;queue1&quot;</span><span>}&nbsp;&nbsp;</span></span></li>
    <li class=""><span>iceskysl.send_message(books_to_update.to_yaml)&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>iceskysl_messages&nbsp;=&nbsp;iceskysl.receive_messages&nbsp;&nbsp;</span></li>
    <li class="alt"><span>puts&nbsp;iceskysl_messages.size&nbsp;&nbsp;</span></li>
    <li class=""><span>iceskysl_messages.<span class="keyword">each</span><span>&nbsp;</span><span class="keyword">do</span><span>&nbsp;|message|&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;params&nbsp;=&nbsp;YAML.load(message.body)&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;puts&nbsp;<span class="string">&quot;bookid=&quot;</span><span>&nbsp;+&nbsp;params[</span><span class="symbol">:bookid</span><span>]&nbsp;+&nbsp;</span><span class="string">&quot;,url=&quot;</span><span>&nbsp;+&nbsp;params[</span><span class="symbol">:url</span><span>]&nbsp;+&nbsp;&nbsp;</span><span class="string">&quot;,queue=&quot;</span><span>&nbsp;+&nbsp;params[</span><span class="symbol">:queue</span><span>]&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;message.delete&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
看明白了么，没问题吧，呵呵。另外，这里还有<a href="http://blog.teksol.info/2008/1/18/using-sqs-and-s3-to-decouple-image-resizing-from-uploading">一篇文章</a>使用的是RightScale gems。</p>
<p>OK，差不多介绍完了，有疑问或者有其他好的gem请告诉我，谢谢。</p>
<p><strong>参考文档：</strong></p>
<ol>
    <li>SQS API：http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1148&amp;categoryID=102</li>
    <li>SQS主页：http://www.amazon.com/Simple-Queue-Service-home-page/b/ref=sc_fe_l_2/102-6256901-8077705?ie=UTF8&amp;node=13584001&amp;no=3435361&amp;me=A36L942TSJ2AJA</li>
</ol>
<p>&nbsp;</p>
