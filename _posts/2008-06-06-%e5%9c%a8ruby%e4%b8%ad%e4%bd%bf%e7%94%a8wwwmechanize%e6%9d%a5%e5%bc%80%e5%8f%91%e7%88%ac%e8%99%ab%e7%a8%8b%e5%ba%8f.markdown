--- 
layout: post
comments: true
title: !binary |
  5ZyoUnVieeS4reS9v+eUqFdXVzo6TWVjaGFuaXpl5p2l5byA5Y+R54is6Jmr
  56iL5bqPLg==

date: 2008-6-6
link: false
categories: life
---
<p>有的时候需要去一个URL上取一些文字或者简介啥的下来，或者取一些自己需要的内容下来，这个时候虽然可以直接使用<strong>http-net</strong>连到URL上，取回内容，然后自己解析等，但是这在一定程度上算是网络爬虫的范畴。</p>
<p><em><a href="http://  http://mechanize.rubyforge.org/">WWW::Mechanize</a>：The Mechanize library is used for automating interaction with websites. Mechanize automatically stores and sends cookies, follows redirects, can follow links, and submit forms. Form fields can be populated and submitted. Mechanize also keeps track of the sites that you have visited as a history.&nbsp;</em></p>
<p>啊哈，貌似不错，在这个上面构建自己的爬虫应该简单的多了，可以使用它模拟浏览器的行为，但是需要注意的一点是，他模拟浏览器的时候会按照浏览器一样记住&ldquo;历史&rdquo;，如果你不设定历史条数，wowo，请留意你的内存吧,详细的请查看&ldquo;ashchan&rdquo;的文章&rdquo;<a href="http://blog.ashchan.com/archive/2008/06/05/mechanize-memory-issue/">Mechanize的内存问题</a>&ldquo;。</p>
<p>再看段例子吧，真的很简单，他里面使用的是hpricot，大家都比较熟悉了，呵呵，看段代码，如下：</p>
<p>
<div class="codeText">
<div class="codeHead">Google</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>require&nbsp;</span><span class="string">'rubygems'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>require&nbsp;<span class="string">'mechanize'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>agent&nbsp;=&nbsp;WWW::Mechanize.<span class="keyword">new</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>agent.user_agent_alias&nbsp;=&nbsp;<span class="string">'Mac&nbsp;Safari'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>page&nbsp;=&nbsp;agent.get(<span class="string">&quot;http://www.google.com/&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>search_form&nbsp;=&nbsp;page.forms.with.name(<span class="string">&quot;f&quot;</span><span>).first&nbsp;&nbsp;</span></span></li>
    <li class=""><span>search_form.q&nbsp;=&nbsp;<span class="string">&quot;Hello&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>search_results&nbsp;=&nbsp;agent.submit(search_form)&nbsp;&nbsp;</span></li>
    <li class=""><span>puts&nbsp;search_results.body&nbsp;&nbsp;</span></li>
</ol>
</div>
简单吧，其他的请参考他的&ldquo;<a href="http://mechanize.rubyforge.org/mechanize/files/EXAMPLES_txt.html">EXAMPLES.txt</a>&rdquo;，其他信息请到其&ldquo;<a href="http://mechanize.rubyforge.org/mechanize/">Documentation</a>&rdquo;页面上查看吧。</p>
