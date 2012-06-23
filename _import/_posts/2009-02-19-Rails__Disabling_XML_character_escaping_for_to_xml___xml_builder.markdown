---
layout: post
title: Rails__Disabling_XML_character_escaping_for_to_xml___xml_builder
date: '2009-2-19'
comments: true
categories: 技术归总 Ruby&Rails
tags: Ruby&amp;Rails to_xml
link: true
---
<p>In my case, I had to genarate the xml view&nbsp; for api render,but in rails, i got a &amp;XXX format string for non englisg, it also appears to_xml will automatically escape any entities into their corresponding &amp;XXX representation.&nbsp; There's a piece in the documentation that says &quot;If $KCODE is set to u and encoding set to UTF8, then escaping will NOT be performed.&quot;<br />
<br />
Unfortunately, this doesn't appear to be the case.&nbsp; Even after following the docs and ensuring that default_charset is indeed UTF-8 (actually the default for Rails nowadays), we still get encoded characters in to_xml output.<br />
<br />
Since our client is UTF-8 aware, we need to pass thru the UTF-8 data intact. The only way we've found to do this is thru the following horrible monkey-patch:</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
    <li class="alt"><span><span class="keyword">module</span><span>&nbsp;Builder&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">class</span><span>&nbsp;XmlBase&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;_escape(text)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p><br />
What's the proper way to do this?<br />
<br />
PS:<br />
somebody say that to &quot;set $KCODE='UTF8' in config/environment.rb can solve this issue.&quot; but it's not for me.<br />
<br />
more infos:<br />
http://groups.google.com/group/rubyonrails-talk/browse_thread/thread/2c13ad7c0f8c0781</p>
<p>&nbsp;</p>
