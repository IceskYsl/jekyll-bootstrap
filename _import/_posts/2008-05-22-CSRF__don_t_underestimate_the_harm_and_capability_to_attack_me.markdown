---
layout: post
title: ! 'CSRF: 不要低估了我的危害和攻击能力'
date: '2008-5-22'
comments: true
categories: Ruby&Rails
link: true
---
<div align="left">
<div align="left">
<div align="left">CSRF这种攻击方式虽然提出来很久（在2006年的时候就有了）了，但是这个沉睡的攻击巨人直到前不久才逐渐走入我们的视线，到底CSRF是啥，危害到底有多大？常见的利用方式是如何的，今天作为&ldquo;<a href="http://iceskysl.1sters.com/?action=show&amp;id=285">安全相关 | Security</a>&rdquo;分类的第一篇文章，我按照自己的理解告诉你，不要低估了CSRF危害性和攻击能力。<br />
<strong><br />
一、什么是CSRF</strong><br />
先看看CSRF的原文说明，如下：</div>
</div>
<blockquote><font><font>Cross Site Reference Forgery works by including malicious code or a link in a page that accesses a web application that the user is believed to have authenticated. If the session for that web application has not timed out, an attacker may execute unauthorized commands.<br />
</font></font></blockquote><strong>二、CSRF案例说明和分析</strong><br />
自然，这里拿Rails程序来举例子说明这些问题，大家知道Rails2之前是把session放在服务器端（文件或者DB或者缓存中），客户但在 cookie中保存sessionid；而到了Rails2后，还有一种方式是把session放在基于cookie的客户端中。当然这两样都各有道理， 各有优劣，不在我们这次说的范围之内。我们继续说，当我们向一个域名发送一个请求的时候，如果本店存在这个域名的cookie，浏览器会自动的把 cookie附带上。这样本来没有啥问题，也是我们为了解决http无状态记录的解决方案，但是有个问题出现了，如果出现一个到其他域名的请求，浏览区在 加载的时候，也把cookie给带上了，会有什么问题？我们举个简单的也很常见的例子来说明这个问题。<br />
-----------------------------案例------------------------------<br />
1、Bob在自己的电脑上刚刚查看完自己的银行A账户余额，然后比较无聊就跑到一个公开的BBS上灌水，当他看到一篇&ldquo;银行A的内部照片&rdquo;的帖子，很有兴趣的打开这个帖子想看看自己信任的银行A的内部图片是啥样子的，殊不知，这其实是一个<font><font>attacker</font></font>精心设计的骗局。<br />
2、在这个帖子中确实有几个图片，看上去真的像是银行A的照片，但是其中有个图片没显示出来，Bob以为是自己网速太慢，导致这个图片没有加载进来，也没在意。只是对这些并不是十分满意的照片摇摇头，就关了这个帖子。<br />
3、几天后，Bob猛然发现自己在银行A的账户上少了1000元，到底是怎么了？<br />
<strong><br />
分析：</strong><br />
为什么钱少了呢？我们得分析一下上面这个案例，好记得当时Bob说有个图片没显示么，是的，我们来看看这个图片的地址,惊奇的发现是：<font><font>&lt;img .src=&quot;<a href="http://bank.com/transfer?account=bob&amp;amount=1000&amp;destination=attacker">http://www.banka.com/transfer?account=myself&amp;amount=1000&amp;destination=attacker</a>&quot;&gt;，这是一个什么地址？聪明的您一定很快就能明白，这个地址是邪恶的，看上去，他的意思是打开这个地址的人，给attacker转了1000元。<br />
这怎么可能？你肯定急了，我怎么能随便给一个人转1000元呢，而且我都不知道呀！但是，注意了，这其实是完全有可能的。还记得当时Bob刚刚查看完整及的帐号信息，基于银行A的cookie并不过期，当出现如上链接出现在src的时候（</font></font><font><font>note that .src is meant to be src</font></font><font><font>），浏览器尝试着按照本地的cookie去加载上面这个URL，而银行A验证了来源请求的cookie是可以的，所以就这样事情就悄悄的发生了。<br />
</font></font>-------------------------------案例结束---------------------------<br />
<font><font><br />
</font></font>ok，看明白了么，这就是CSRF，一句话给他下个定义就是：借你的cookie在你不知道的时候悄悄的做了一些你不愿意做 的事情。恶日期这里有个更要命的是，这个包含上述URL的图片或者链接，并不需要一定是放在银行A的服务器上，相反可以在任一地方，比如blog，公开的 BBS，或者一些群发的Mail中等等，如此多的场合下，这些都有可能存在陷阱。<br />
再看一副图片吧，其说明的正是CSRF的攻击原理。<br />
<img alt="" src="http://www.rorsecurity.info/files/foiling_cross_site_attacks_3.png" /><br />
<br />
<strong> 三、CSRF的预防</strong><br />
看上去很恐怖吧，是的，确实恐怖，意识到恐怖是个好事情，这样会促使你接着往下看如何改进和防止类似的漏洞出现。<br />
总体来说，预防CSRF主要从<strong>2</strong>个方面入手，分别是：<br />
<em>1、正确使用GET,POST和Cookie；<br />
2、在non-GET请求中使用Security token；<br />
<br />
</em>一般上，大家知道的浏览器发送请求的方式有GET或者POST，但是还有一种比较常用的是Cookie，至于其他的HTTP协议请求方式，你可以google，一般按照W3C的规范：<br />
<em>1、GET常用在查看，列举，展示的时候；<br />
2、POST常用在下达订单，改变一个资源的属性或者做其他一些事情</em>；<br />
<br />
ok，我们这里拿Rails按照前面列举的2种预防手段做说明，首先，我们可以在Rails的控制权中（controller）将一些方法（action）限定（verify）为只能使用POST或者GET，例如：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
    <li class="alt"><span><span>verify&nbsp;</span><span class="symbol">:method</span><span>&nbsp;=&gt;&nbsp;</span><span class="symbol">:post</span><span>,&nbsp;</span><span class="symbol">:only</span><span>&nbsp;=&gt;&nbsp;[&nbsp;</span><span class="symbol">:transfer</span><span>&nbsp;],&nbsp;</span><span class="symbol">:redirect_to</span><span>&nbsp;=&gt;&nbsp;{&nbsp;</span><span class="symbol">:action</span><span>&nbsp;=&gt;&nbsp;</span><span class="symbol">:list</span><span>&nbsp;}&nbsp;&nbsp;&nbsp;</span></span></li>
</ol>
</div>
恩，很好，这样做下限制以后，前面案例中的方法就失效了，因为这里我们限定了<span><span class="symbol"><strong>transfer</strong>必须使用<strong>POST</strong>来提交请求，当<strong>GET</strong>请求来的时候并不会被响应。<br />
万事大吉了？NO！因为POST的请求也是可以被构造出来后自动发送的，如何实现，看下面吧，你肯定会吃惊的。<br />
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol class="dp-xml" start="1">
    <li class="alt"><span><span class="tag">&lt;</span><span class="tag-name">a</span><span>&nbsp;</span><span class="attribute">.href</span><span>=</span><span class="attribute-value">&quot;http://www.1sters.com/&quot;</span><span>&nbsp;</span><span class="attribute">onclick</span><span>=</span><span class="attribute-value">&quot;var&nbsp;f&nbsp;=&nbsp;document.createElement('form');&nbsp;f.style.display&nbsp;=&nbsp;'none';&nbsp;this.parentNode.appendChild(f);&nbsp;f.method&nbsp;=&nbsp;'POST';&nbsp;f.action&nbsp;=&nbsp;'http://www.example.com/account/destroy';&nbsp;f.submit();return&nbsp;false;&quot;</span><span class="tag">&gt;</span><span>点我试试</span><span class="tag">&lt;/</span><span class="tag-name">a</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
是的，这就是一个活生生的例子(.<strong>href</strong> is meant to be href)，使用link的href或者img的<strong>src</strong>都可以的，再想想一个Attacher放了一个图片，然后写了一个</span></span><span><span class="symbol"><span><span class="attribute"><strong>onmouseover</strong>方法，执行上述的那段JS，如下，或者使用AJAX。</span></span></span></span><span><span class="symbol">
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol class="dp-xml" start="1">
    <li class="alt"><span><span class="tag">&lt;</span><span class="tag-name">img</span><span>&nbsp;</span><span class="attribute">.src</span><span>=</span><span class="attribute-value">&quot;http://www.harmless.com/img&quot;</span><span>&nbsp;</span><span class="attribute">width</span><span>=</span><span class="attribute-value">&quot;400&quot;</span><span>&nbsp;</span><span class="attribute">height</span><span>=</span><span class="attribute-value">&quot;400&quot;</span><span>&nbsp;</span><span class="attribute">onmouseover</span><span>=</span><span class="attribute-value">&quot;&hellip;&quot;</span><span>&nbsp;</span><span class="tag">/&gt;</span><span>&nbsp; <br />
    </span></span></li>
</ol>
</div>
所以，限定为POST后还不是非常的保险，怎么办？不急，我们还有第二步，给non-GET的请求设置 <strong>security token</strong>，如何实现，在Rails2以后非常简单（也是默认的），我们只需要在environment.rb中添加如下代码：<br />
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
    <li class="alt"><span><span>config.action_controller.session&nbsp;=&nbsp;{&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="symbol">:session_key</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'_csrf_session'</span><span>,&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="symbol">:secret</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&gt;&nbsp;</span><span class="string">'ae4b43dda38ff78bb50898b2935da76d1e224061ab72a9399d34cea4c6178eee6dae815fff920a20642f27abda83b793da4e9b6cf20c4838805e80abf53e318a'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>}&nbsp;&nbsp;</span></li>
</ol>
</div>
然后</span></span><span><span class="symbol">在</span></span><span><span class="symbol">application controller中包含如下</span></span><span><span class="symbol">security token</span></span><span><span class="symbol">设置：<br />
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
    <li class="alt"><span><span>protect_from_forgery&nbsp;&nbsp;</span><span class="symbol">:secret</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'053cef294a333f72c3584311799c69d2'</span><span>&nbsp; </span></span></li>
</ol>
</div>
ok，基本上安全了，如果这时POST请求过去，但是</span></span><span><span class="symbol">security token</span></span><span><span class="symbol">和session计算出来的</span></span><span><span class="symbol"><span><span class="symbol">secret</span></span></span></span><span><span class="symbol">和服务端的</span></span><span><span class="symbol"><span><span class="symbol">secret匹配不上的话，就会返回一个</span></span></span></span><font><font><a href="http://iceskysl.1sters.com/?action=show&amp;id=284">ActionController::InvalidAuthenticityToken错误</a>，防止该类缺陷的出现。<br />
安全了，也许你要说，那我如果能破解出</font></font><span><span class="symbol"><span><span>protect_from_forgery，不进OK了么，按照理论上是，但是实际是破解是基本上不可能的，因为有人曾计算过，暴力破解该串大概需要2的11次方时间，后续我将再写一篇文章详细的介绍，这里不再赘述。</span></span></span></span><br />
<span><span class="symbol"><br />
</span></span><strong>四、总结</strong><br />
总的来说，CSRF的兴起刚刚开始，网络上肯定会有一股热潮，Railser们一定要注意自己的程序的安全性，CSRF比你我能想到的更有威胁，千万别小瞧了它。</div>
