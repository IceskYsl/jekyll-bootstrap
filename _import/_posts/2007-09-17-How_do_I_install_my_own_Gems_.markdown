---
layout: post
title: How_do_I_install_my_own_Gems_
date: '2007-9-17'
comments: true
categories: Ruby&Rails
link: true
---
<p>BH 上缺少了一些我需要的gem，于是需要自己安装，BH允许把Gems安装到自己的目录下，于是找了些资料，操作步骤如下：</p>
<p>The easiest and fastest way to install Ruby gems is to install them in your local directory, you will need shell access. To install your own gems use the following steps:<br />
<br />
1) Using File Manager in your cPanel make a copy of the .bashrc file in your root directory, name it .bashrc.bak.<br />
2) Now edit the .bashrc file and add the following to the end of the file:</p>
<div class="codeText">
<div class="codeHead">lunix代码</div>
<ol class="dp-rb" start="1">
    <li class="alt"><span><span>export&nbsp;PATH=</span><span class="string">&quot;$PATH:$HOME/packages/bin:$HOME/.gems/bin&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>export&nbsp;GEM_HOME=<span class="string">&quot;$HOME/.gems&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>export&nbsp;GEM_PATH=<span class="string">&quot;$GEM_HOME:/usr/lib/ruby/gems/1.8&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>export&nbsp;GEM_CACHE=&rdquo;<span class="variable">$GEM_HOME</span><span>/cache&rdquo;&nbsp; <br />
    </span></span></li>
</ol>
</div>
<p>3) Using your favorite SSH client connect to your site.<br />
<br />
4) at the prompt type:<br />
<br />
cp /usr/lib/ruby/gems/1.8/cache/sources-0.0.1.gem ./<br />
gem install sources-0.0.1.gem<br />
gem update -y<br />
<br />
This will update rails to the latest version and install it to your local gem directory.<br />
<br />
5) When using a rails application, make sure you add the following to your ./config/environment.rb:<br />
<br />
ENV['GEM_PATH'] = '/path/to/your/home/.gems:/usr/lib/ruby/gems/1.8'<br />
<br />
这里还有一个帖子，可以参考下：<br />
http://www.bluehostforum.com/showthread.php?t=1064</p>
<p>&nbsp;</p>
<p><strong>另外：</strong>还可以把在本地安装好gem后把其copy到Vendor目录下，但是这个方法我不喜欢，不晓得能不能直接把gem包copy到Vendor目录下？试过的告诉下下，多谢！</p>
