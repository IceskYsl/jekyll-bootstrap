---
layout: post
title: 测试ruby中的gsub和scan等找到需要的字符串
date: '2008-1-7'
comments: true
categories: Ruby&Rails
link: true
---
<p>测试一些ruby中的字符匹配方法，如下是源代码。</p>
<p>&lt;code class=java&gt;</p>
<p>&nbsp;</p>
<p>puts &quot;----1、 使用gsub找到需要的字符串 存在$1中-----------------------&quot;<br />
puts %Q{puts&nbsp; '&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.gsub(/\bencoding=&quot;(.*)&quot;/,&quot;---&quot;)}<br />
<br />
puts&nbsp; '&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.gsub(/\bencoding=&quot;(.*)&quot;/,&quot;---&quot;)<br />
puts $1<br />
<br />
puts &quot;---------------------------&quot;<br />
<br />
puts &quot;----2、在gsub里面可以使用区块？-----------------------&quot;<br />
puts %Q{puts&nbsp; '&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.gsub(/\b(encoding=&quot;(.*)&quot;)/){|c| c.upcase}}<br />
<br />
puts&nbsp; '&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.gsub(/\b(encoding=&quot;(.*)&quot;)/){|c| c.upcase}<br />
puts $1<br />
puts $2<br />
<br />
puts &quot;---------------------------&quot;<br />
<br />
puts &quot;----3、看看匹配到的是什么？-----------------------&quot;<br />
puts %Q{puts&nbsp; '&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.sub(/\b(encoding=&quot;(.*)&quot;)/,'\2')}<br />
<br />
puts&nbsp; '&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.sub(/\b(encoding=&quot;(.*)&quot;)/,'\2')<br />
puts $1<br />
puts $2<br />
<br />
puts &quot;---------------------------&quot;<br />
puts &quot;----4、使用scan来扫描符合正则的字符串-----------------------&quot;<br />
puts %Q{puts&nbsp; '&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.scan(/\bencoding=&quot;(.*)&quot;/).first.first}<br />
<br />
puts&nbsp; '&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.scan(/\bencoding=&quot;(.*)&quot;/).first.first<br />
puts $1<br />
&lt;/code&gt;</p>
<p><br />
输出结果：<br />
E:\Ysl\Test&gt;ruby encoding.rb<br />
&lt;?xml version=&quot;1.0&quot; --- fff?&gt;<br />
gbk<br />
---------------------------<br />
----2、在gsub里面可以使用区块？-----------------------<br />
'&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.gsub((encoding=&quot;(.*)&quot;)/){|c| c.upcase}<br />
&lt;?xml version=&quot;1.0&quot; ENCODING=&quot;GBK&quot; fff?&gt;<br />
encoding=&quot;gbk&quot;<br />
gbk<br />
----3、看看匹配到的是什么？-----------------------<br />
'&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.sub((encoding=&quot;(.*)&quot;)/,'')<br />
&lt;?xml version=&quot;1.0&quot; gbk fff?&gt;<br />
encoding=&quot;gbk&quot;<br />
gbk<br />
----4、使用scan来扫描符合正则的字符串-----------------------<br />
'&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.scan(encoding=&quot;(.*)&quot;/).first.first<br />
gbk<br />
gbk<br />
<br />
E:\Ysl\Test&gt;ruby encoding.rb<br />
----1、 使用gsub找到需要的字符串 存在$1中-----------------------<br />
puts&nbsp; '&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.gsub(encoding=&quot;(.*)&quot;/,&quot;---&quot;)<br />
&lt;?xml version=&quot;1.0&quot; --- fff?&gt;<br />
gbk<br />
---------------------------<br />
----2、在gsub里面可以使用区块？-----------------------<br />
puts&nbsp; '&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.gsub((encoding=&quot;(.*)&quot;)/){|c| c.upcase}<br />
&lt;?xml version=&quot;1.0&quot; ENCODING=&quot;GBK&quot; fff?&gt;<br />
encoding=&quot;gbk&quot;<br />
gbk<br />
---------------------------<br />
----3、看看匹配到的是什么？-----------------------<br />
puts&nbsp; '&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.sub((encoding=&quot;(.*)&quot;)/,'')<br />
&lt;?xml version=&quot;1.0&quot; gbk fff?&gt;<br />
encoding=&quot;gbk&quot;<br />
gbk<br />
---------------------------<br />
----4、使用scan来扫描符合正则的字符串-----------------------<br />
puts&nbsp; '&lt;?xml version=&quot;1.0&quot; encoding=&quot;gbk&quot; fff?&gt; '.scan(encoding=&quot;(.*)&quot;/).first.first<br />
gbk<br />
gbk</p>
