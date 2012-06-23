---
layout: post
title: Google SOAP Search API不在提供服务
date: '2008-1-3'
comments: true
categories: Ruby&Rails
link: true
---
<p>其实很早前我就用过这个，貌似还是在读书的时候吧，现在技能云上我突然感觉这个相当不错的一个功能，可惜的是，在其站上发现，已经不在提供了，看到其公告如下：<br />
<font color="#ffcc00" style="background-color: rgb(255, 255, 153);">&ldquo;<br />
f December 5, 2006, we are no longer issuing new API keys for the SOAP Search API. Developers with existing SOAP Search API keys will not be affected.<br />
</font></p>
<p style="background-color: rgb(255, 255, 153);"><font color="#ffcc00">Depending on your application, the <a href="http://code.google.com/apis/ajaxsearch/">AJAX Search API</a>       may be a better choice for you instead.  It tends to be better suited for search-based       web applications and supports additional features like Video, News, Maps, and Blog        search results.</font></p>
<p style="background-color: rgb(255, 255, 153);"><font color="#ffcc00">For developers who are already using the SOAP Search API, we've kept the documentation live       on this site.</font></p>
<p><font color="#ffcc00" style="background-color: rgb(255, 255, 153);">&rdquo;</font></p>
<p>唉，按照其意思是推荐大家使用更强大的AJAX Search API，但是我不觉得其好用，也不符合我的需要，可惜了哦。<br />
还是贴一段代码吧，如下：<br />
require 'soap/wsdlDriver'<br />
$KCODE = &quot;UTF8&quot;<br />
key = 'LVJnAm5QFHblahblahblah your key here'<br />
<br />
#create driver<br />
wsdl = &quot;http://api.google.com/GoogleSearch.wsdl&quot;<br />
driver = SOAP::WSDLDriverFactory.new(wsdl).create_rpc_driver<br />
query = &quot;your query string here&quot;<br />
start = 0<br />
max = 10<br />
&nbsp; <br />
# see http://dev.ctor.org/soap4r/browser/trunk/sample/wsdl/googleSearch/wsdlDriver.rb<br />
@results = driver.doGoogleSearch( key, query, start, max, true, &quot;&quot;, true, 'lang_en', '','')<br />
snippets = @results.resultElements.collect { |r| r.snippet } # you can get all kinds'a' info here<br />
self.update_attribute(:html, snippets.join(&quot;\n&quot;)) # or whatever<br />
<br />
===================================<br />
def search<br />
&nbsp;require 'soap/wsdlDriver'<br />
&nbsp;@title = 'Search Results'<br />
&nbsp;key = 'YOUR GOOGLE API KEY HERE'<br />
&nbsp;yoursite = 'YOUR SITE ADDRESS HERE'<br />
&nbsp;driver = SOAP::WSDLDriverFactory.new(&quot;http://api.google.com/GoogleSearch.wsdl&quot;).createDriver<br />
&nbsp;@results = driver.doGoogleSearch(key, @params['term']+&quot; site:#{yoursite}&quot;, 0, 10, true, &quot; &quot;, false, &quot; &quot;, &quot; &quot;, &quot; &quot;)<br />
end<br />
<br />
<br />
&lt;% for result in @results.resultElements %&gt;<br />
&nbsp;&lt;h2&gt;&lt;%= result.title %&gt;&lt;/h2&gt;<br />
&nbsp;&lt;p&gt;&lt;%= result.snippet %&gt;&lt;/p&gt;<br />
&nbsp;&lt;p&gt;&lt;a href=&quot;&lt;%= result.URL %&gt;&quot;&gt;&lt;%= result.URL %&gt;&lt;/a&gt;&lt;/p&gt;<br />
&lt;% end %&gt;</p>
