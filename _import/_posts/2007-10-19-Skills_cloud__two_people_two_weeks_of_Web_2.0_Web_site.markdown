---
layout: post
title: 技能云：两人两周的Web 2.0网站
date: '2007-10-19'
comments: true
categories: Ruby&Rails
link: true
---
<p class="info">本文是infoQ中文站的采访帖，版权归infoQ所有，如需要查看原文，请到<a href="http://www.infoq.com/cn/articles/itechtag-team-interview">这里</a>：</p>
<p class="info">作者 			<strong>霍泰稳</strong> 			发布于 			2007年10月17日 上午3时7分</p>
<dl class="tags2"><dt class="community">社区<a onclick="try {CategoryPopup.showPopup(this);} catch(e) {}; return false;" id="1,390" name="architecture" href="http://www.infoq.com/cn/architecture">Architecture</a>,<a onclick="try {CategoryPopup.showPopup(this);} catch(e) {}; return false;" id="741" name="ruby" href="http://www.infoq.com/cn/ruby">Ruby</a></dt><dt class="topics">主题<a onclick="try {CategoryPopup.showPopup(this);} catch(e) {}; return false;" id="767" name="web2_0" href="http://www.infoq.com/cn/web2_0">Web 2.0</a>,<a onclick="try {CategoryPopup.showPopup(this);} catch(e) {}; return false;" id="755" name="rubyonrails" href="http://www.infoq.com/cn/rubyonrails">Ruby on Rails</a></dt></dl>
<p><strong>编者按：</strong>因 为Ruby on Rails的出现，借用互联网创业的人越来越多，虽然不能说全是RoR的功劳，但至少说明技术门槛的降低加速了互联网的发展。从前从一个点子的产生到实现 可能要耗费少则几个月，多则几年的时间，而现在，只要你的点子够新，有实践的可能，几天几周就可以看到原型。而后面的维护也比较方便，几乎可以说是实时进 行。本文通过采访<a href="http://www.itechtag.com/">技能云网站</a>的策划人熊节和主设计师Iceskysl就是想证明前文所述，据两人介绍，这两个到现在还没有见过面的年轻人通过网络，在不到两周的时间里，将一个创意点子变成了现实。</p>
<p><strong>InfoQ中文站：这个项目发布后，你被人问到的最多的三个问题是什么？</strong></p>
<p><strong>InfoQ中文站：介绍一下你自己和你的团队？ </strong></p>
<p><strong>IceskYsl：</strong>我是IceskYsl，目前还是靠Java吃饭，ROR是暂时还是业余活动，很享受这种方 式；1sters!暂时还是个虚拟的、我自己心中理想中的团队模式，也正一步步的走向成熟。我接触RoR有一段时间了，期间被它的灵活吸引，有事没事的就 会写写代码，时间不多，写了好几个像模像样的系统如：</p>
<ol>
    <li><a href="http://www.byeloo.cn/">byeloo.cn</a>（毕业咯）：一个开源的多班级同学录系统，趴在床上用笔画出大概的模块以及基本的数据结构后；利用一个通宵写完了整个框架，而后就上线使用，根据同学们的要求，主键完善。目前功能都很实用；</li>
    <li>然后是1stlog，一个针对国内用户的基于ROR的blog程序，功能强大可定制，方便扩展，已经发布两个版本，马上即将发布第三个版本；</li>
    <li><a href="http://www.1sters.com/">1sters.com</a>：一个集新闻，产品展示，官方blog，已经产品缺陷跟踪管理于一体的CMS系统；</li>
    <li>1stimes：第一次是一个分享你我第一次经历的Web 2.0的系统；</li>
    <li><a href="http://www.itechtag.com/">itechtag</a>：技能云。</li>
</ol>
<p><span style="font-weight: bold;">熊节：</span>我是熊节，网名叫&quot;透明&quot;的。先后干过媒体、程序员、咨询师三种职业，所以有一堆Web 2.0的点子。可惜每天忙忙叨叨的，这些点子落地的很少。</p>
<p><strong>InfoQ中文站：技能云的创意是从何而来？</strong></p>
<p><strong>IceskYsl：</strong>项目的创意随着时间逐步演化，起初只是为程序员及其相关的人提供一个展现自我的平台，为国内的程序员赢得更多的他曾被无形剥夺的东西；进而发展为项目展示、交流、经验分享及其人脉的一个平台。</p>
<p><strong>熊节：</strong>这个东西的想法很简单：<a href="http://gigix.thoughtworkers.org/assets/2007/9/1/techtag.png">我要有一个widget</a>挂 在我的blog上，告诉别人我有些什么技能，譬如说我Ruby很不错、Java很不错、JavaScript也有经验，等等。为什么我想给别人show这 些呢？因为我觉得骄傲，为自己骄傲。我在过去的8年里一直在编程，我掌握了那么多的技能，我觉得很骄傲。说白了就是，我要向别人炫耀自己的技能。</p>
<p>东西很简单，但背后可以有引申。这个炫耀的widget一展开，就引出了别的东西，那就是从哪里得到这些技能的信息。当然了，只有从项目经验里来。 只有真正在项目里做过，用过一种技术，你才能说你掌握了这种技能。而且一般来说，技能掌握的熟练程度还是和使用的时间成正比的。所以iTechTag是以 项目为基础的。你不能说自己&quot;精通&quot;、&quot;熟练掌握&quot;什么技能，你必须证明，证据就是真实的项目经验。</p>
<p>那么有了一个炫耀的widget，有了一堆项目经验，就可以很方便的导出简历了。（这是我们下一步的重点功能。）技能－经验－简历，这个三位一体就 构成了一个程序员的声望（reputation）。谁对这些声望感兴趣呢？当然是正在招人的潜在雇主。换句话说iTechTag的注册用户在炫耀的同时顺 手得到了直接面对潜在雇主的机会。这就是我一开始说的，&ldquo;释放程序员声望的价值&rdquo;。如果说开源软件是把源代码的价值还给程序员（和用户），那么 iTechTag这个模式就像是人才招聘领域的开源，把程序员的价值还给程序员（和潜在雇主）。</p>
<p><strong>InfoQ中文站：为什么会采用 RoR实现，用RoR开发你们体味到什么特殊之处？</strong><br />
<span style="font-weight: bold;">InfoQ中文站：这个项目的开发过程是怎么样子的，比如时间、人力等？</span><br />
<strong>InfoQ中文站：敏捷开发方法在你们的开发过程中有没有得到什么实践？<br />
InfoQ中文站：类似于用RoR开发技能云这样的项目，有什么经验和教训和大家分享？</strong></p>
<p><strong>IceskYsl：</strong>Idea一定要足够的好，且你自己对这个Idea有充分的兴趣，自己必须是这个Idea的超级拥护者和使用者。必须脱离传统的类似外包项目的模式，否则其中的乐趣你肯定体会不到。</p>
