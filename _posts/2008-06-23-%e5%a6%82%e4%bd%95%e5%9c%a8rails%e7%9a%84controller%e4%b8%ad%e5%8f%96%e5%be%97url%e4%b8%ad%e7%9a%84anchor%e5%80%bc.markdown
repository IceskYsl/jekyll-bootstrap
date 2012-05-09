--- 
layout: post
comments: true
title: !binary |
  5aaC5L2V5ZyoUmFpbHPnmoRjb250cm9sbGVy5Lit5Y+W5b6XVVJM5Lit55qE
  YW5jaG9y5YC8

date: 2008-6-23
link: false
categories: life
---
<p>有人问，如何在Rails的控制器中取得URL中的锚点的值，这个需求比较奇特，以前没搞过，于是google了一把，在&ldquo;<a href="http://www.railsforum.com/viewtopic.php?pid=64483">Getting the # value</a>&rdquo;这个帖子看到有人有类似的问题，他说出了在controller中直接取不到的原因是&ldquo;For normal links/urls the #anchor is a client side feature and is often not even sent to the server as part of a request.&rdquo;，恩，确实直接取不到，只能使用类似JS的方法来取了，因为其没有将URL全部提交到服务端，所以是无法取值的。</p>
<p>另外，看了下Rails中生成anchor的方法比较简单，如下：</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>&lt;%=&nbsp;url_for(</span><span class="symbol">:action</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'play'</span><span>,&nbsp;</span><span class="symbol">:anchor</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'player'</span><span>)&nbsp;%&gt;&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="comment">#&nbsp;=&gt;&nbsp;/messages/play/#player</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&lt;%=&nbsp;url_for(<span class="symbol">:action</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'checkout'</span><span>,&nbsp;</span><span class="symbol">:anchor</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'tax&amp;ship'</span><span>)&nbsp;%&gt;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="comment">#&nbsp;=&gt;&nbsp;/testing/jump/#tax&amp;ship</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&lt;%=&nbsp;url_for(<span class="symbol">:action</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'checkout'</span><span>,&nbsp;</span><span class="symbol">:anchor</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'tax&amp;ship'</span><span>,&nbsp;</span><span class="symbol">:escape</span><span>&nbsp;=&gt;&nbsp;</span><span class="keyword">false</span><span>)&nbsp;%&gt;&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="comment">#&nbsp;=&gt;&nbsp;/testing/jump/#tax&amp;ship</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
详细的请参考API：<a href="http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html">ActionView::Helpers::UrlHelper</a></p>
