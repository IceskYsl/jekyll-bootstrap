---
layout: post
title: Rails项目管理之SubVersion(SVN)
date: '2007-9-24'
comments: true
categories: Ruby&Rails
link: true
---
<p>多人协作的时候版本控制是很重要的，我以前公司使用的<strong>VSS</strong>或者<strong>CC&amp;CQ</strong>，这些都是比较重量级的，做大项目的控制比较合适，但是做一些 rails的比较小的项目的时候就没有这个必要，也没有这个必要；</p>
<p>相反，SVN和CVS可能更适合一点，因为CVS比较老，现在SVN比较主流，使用起来 也很方便，于是做Rails项目自然选择SVN，以前使用不多，虽然也会用，但是做了不少无用功，今天看到一篇介绍的文章，改吧改吧记录下。</p>
<p>
<div class="codeText">
<div class="codeHead">第一步，创建Rails应用并做基础设置</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>mkdir&nbsp;project&nbsp;//创建工程目录，在此目录下设置基础的导入数据&nbsp;&nbsp;</span></span></li>
    <li class=""><span>cd&nbsp;project&nbsp;&nbsp;&nbsp;&nbsp;//进入project目录&nbsp;&nbsp;</span></li>
    <li class="alt"><span>rails&nbsp;test&nbsp;&nbsp;&nbsp;&nbsp;//生成rails应用，名字为test&nbsp;&nbsp;</span></li>
    <li class=""><span>cd&nbsp;test&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//进入rails应用目录&nbsp;&nbsp;</span></li>
    <li class="alt"><span>mv&nbsp;config/database.yml&nbsp;config/database_example.yml&nbsp;//修改数据库配置文件的名字，因为这个配置文件可能每个开发人员的都不一样&nbsp;&nbsp;</span></li>
    <li class=""><span>rm&nbsp;-r&nbsp;log/*&nbsp;&nbsp;&nbsp;//删除log目录下的所有文件，这个目录下的文件不需要加入到版本控制&nbsp;&nbsp;</span></li>
    <li class="alt"><span>rm&nbsp;-r&nbsp;tmp/*&nbsp;&nbsp;&nbsp;//同上，临时目录也不要加入版本控制&nbsp;&nbsp;</span></li>
    <li class=""><span>cd&nbsp;..&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//回到project目录&nbsp;&nbsp;</span></li>
    <li class="alt"><span>mv&nbsp;test&nbsp;trunk&nbsp;//修改rails应用test目录的名字为trunk，这是svn的惯例，相当与CVS的HEAD，是开发主目录&nbsp;&nbsp;</span></li>
    <li class=""><span>mkdir&nbsp;tags&nbsp;&nbsp;&nbsp;&nbsp;//惯例，保存tag&nbsp;&nbsp;</span></li>
    <li class=""><span>mkdir&nbsp;branches//惯例，保存分支第二步，生成将项目文件导入SVN&nbsp;&nbsp;&nbsp;</span></li>
</ol>
</div>
<span>没个项目的SVN库所使用的协议可能个不相同，这里假设你已经创建好了SVN库并可以使用了 。</span></p>
<p><span>
<div class="codeText">
<div class="codeHead">第二步：导入</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>cd&nbsp;project&nbsp;在project目录下执行&nbsp;&nbsp;</span></span></li>
    <li class=""><span>svn&nbsp;import&nbsp;.&nbsp;http://your_domain/svn/test&nbsp;-m&nbsp;<span class="string">&quot;初始化导入&quot;</span><span> --username&nbsp;your_name&nbsp;&nbsp;</span></span></li>
</ol>
</div>
如果没有错误，项目就导入成功了，现在我们到自己的rails项目工作目录checkout刚刚创建的项目<br />
</span></p>
<p><span>
<div class="codeText">
<div class="codeHead"><span>第三步：签出</span></div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>cd&nbsp;/rails&nbsp;//进入你的rails工作目录&nbsp;&nbsp;</span></span></li>
    <li class=""><span>svn&nbsp;co&nbsp;http://your_domain/svn/test/trunk&nbsp;test&nbsp;//checkout代码到test&nbsp;&nbsp;</span></li>
    <li class="alt"><span>cd&nbsp;test&nbsp;&nbsp;</span></li>
    <li class=""><span>cp&nbsp;config/database_example.yml&nbsp;config/database.yml&nbsp;//创建自己的数据库配置文件&nbsp;&nbsp;</span></li>
    <li class="alt"><span>svn&nbsp;propset&nbsp;svn:ignore&nbsp;database.yml&nbsp;config/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//忽略database.yml文件，也就是不将此文件纳入版本控制&nbsp;&nbsp;</span></li>
    <li class=""><span>svn&nbsp;propset&nbsp;svn:ignore&nbsp;&quot;*&quot;&nbsp;log/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//忽略log下的所有文件&nbsp;&nbsp;</span></li>
    <li class="alt"><span>svn&nbsp;propset&nbsp;svn:ignore&nbsp;&quot;*&quot;&nbsp;tmp/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//忽略tmp目录下的所有文件&nbsp;&nbsp;</span></li>
    <li class=""><span>svn&nbsp;commit&nbsp;-m&nbsp;&quot;忽略文件&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//提交配置好了，到现在基本的项目初始化&nbsp; <br />
    </span></li>
</ol>
</div>
工作即可告一段落了，以后的工作基本就是更新，编码，提交了，属于svn基本使用问题，我们就不详述了。 <br />
</span></p>
<p><span>参考其他类似文章：</span></p>
<p><span>http://www.javaeye.com/article/107799</span></p>
<p><span>http://railscasts.com/episodes/36<br />
</span></p>
