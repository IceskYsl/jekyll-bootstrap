---
layout: post
title: 在Rails中使用缓存(码表)的方式
date: '2008-3-30'
comments: true
categories: Ruby&Rails
link: true
---
<p>搞过Java的应该都晓得,经常会定义一些字典,然后将这些字典缓存带内存中以提高查询的效率和速度,也就是常说的缓存,有人叫码表.</p>
<p>今天看看如何在Rails中实现类似的功能,思路是一样的,可以缓存在数组或者Hash里面,这里为了查找方便,我们选择使用Hash.</p>
<p>也就是:如何创建一个变量从rails开始运行时初始化，一直维持到rails终止，而且对于每一个request都能共享的变量？</p>
<p><strong>1,</strong>首先在<strong>environment.rb</strong>里面(如果您使用的Rails2以上版本,建议放在<strong>initializers</strong>目录里面,自己创建一个文件即可)定义一个ruby中的全局变量即可，例如<em><strong>$actions_in_mem</strong></em>在ruby里面，以<strong>$</strong>开头的变量即自动申明为全局变量）。在rails启动的时候，执行在environment.rb和initializers里面的文件，初始化<em><strong>$actions_in_mem</strong></em>,这样<em><strong>$actions_in_mem</strong></em>即可持续使用了,如:</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
    <li class="alt"><span><span class="variable">$actions_in_mem</span><span>&nbsp;=&nbsp;</span><span class="builtin">Hash</span><span>.</span><span class="keyword">new</span><span>&nbsp; <br />
    </span></span></li>
</ol>
</div>
<p>&nbsp;</p>
<p><strong>2,</strong>然后在controller或者model或者view里面都是可用的了,比如在model里面实现刷新:</p>
<p>&nbsp;</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
    <li class="alt"><span><span class="comment">#刷新缓存</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">def</span><span>&nbsp;Action.refresh&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;Action.get_actions(1).<span class="keyword">each</span><span>&nbsp;</span><span class="keyword">do</span><span>&nbsp;|ac|&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;put_into_hash(ac.controller+<span class="string">&quot;_&quot;</span><span>+ac.action,ac.id)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="keyword">def</span><span>&nbsp;Action.put_into_hash(key,value)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="variable">$actions_in_mem</span><span>.store(key,&nbsp;value)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;logger.info(<span class="string">&quot;@@actions_in_mem.size=#{$actions_in_mem.size}---#{key}=&gt;#{value}&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp; <br />
    </span></span></li>
</ol>
</div>
<p><strong>3,</strong>当然,你可以在controller中定义一个方法手工刷新这个全局变量,或者定时刷新即可,如下代码实现手工刷新.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
    <li class="alt"><span><span class="comment">#刷新缓存数据</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">def</span><span>&nbsp;refresh_actions&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;Action.refresh&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp; <br />
    </span></span></li>
</ol>
</div>
<p>&nbsp;</p>
<p><strong>4,</strong>最后是在view里面显示或者维护,如下代码段:</p>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol class="dp-xml" start="1">
    <li class="alt"><span><span class="tag">&lt;</span><span class="tag-name">ul</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="tag">&lt;</span><span>%&nbsp;$actions_in_mem.each&nbsp;do&nbsp;|key,value|%</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span class="tag-name">li</span><span class="tag">&gt;</span><span class="tag">&lt;</span><span>%=key%</span><span class="tag">&gt;</span><span>=</span><span class="tag">&gt;</span><span class="tag">&lt;</span><span>%=value%</span><span class="tag">&gt;</span><span class="tag">&lt;/</span><span class="tag-name">li</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="tag">&lt;</span><span>%end%</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="tag">&lt;/</span><span class="tag-name">ul</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>如上,就可以理解的差不多啦..</p>
<p>&nbsp;</p>
<p>关于如何查找,等下再写一篇说说.</p>
<p><strong>&nbsp;其他参考文档:</strong></p>
<p>1.http://blog.waynedeng.com/article.asp?id=628</p>
<p>2.http://www.cnblogs.com/hardrock/archive/2006/09/07/497554.html</p>
<p>&nbsp;</p>
