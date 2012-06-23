---
layout: post
title: 删除所有.svn目录
date: '2007-11-27'
comments: true
categories: Ruby&Rails
link: true
---
<p>当使用了svn版本控制系统后每个目录下都会有一个.svn目录存在，开发完当交付产品或者上传到服务器时一般要把这些目录删除，这里总结了一下在linux和win下的办法。</p>
<p><strong>一、在linux下</strong></p>
<p>删除这些目录是很简单的，命令如下<br />
<br />
find . -type d -name &quot;.svn&quot;|xargs rm -rf</p>
<p>或者</p>
<p>find&nbsp;.&nbsp;-type&nbsp;d&nbsp;-iname&nbsp;&quot;.svn&quot;&nbsp;-exec&nbsp;rm&nbsp;-rf&nbsp;{}&nbsp;\;&nbsp;&nbsp;</p>
<p>全部搞定。(http://tech.techweb.com.cn/redirect.php?fid=26&amp;tid=205673&amp;goto=nextnewset)</p>
<p>&nbsp;</p>
<p><strong>二、在windows下用以下法子：</strong></p>
<div>1、在项目平级的目录，执行dos命令： <br />
xcopy project_dir project_dir_1 /s /i</div>
<p>&nbsp;</p>
<div>2、或者在项目根目录执行以下dos命令 <br />
for /r . %%a in (.) do @if exist &quot;%%a\.svn&quot; rd /s /q &quot;%%a\.svn&quot;</div>
<p>其实第二种方法可以用来干很多事的，比如把代码中的.svn替换为任意其他文件名并在硬盘根目录下执行，就可以从硬盘上删除所有的这个文件啦。</p>
<p>3、加注册表</p>
<p><a href="http://weblogs.asp.net/jgalloway/default.aspx">Jon Galloway</a>提供了一段注册表代码，可以将&rdquo;Delete SVN Folders&rdquo;命名增加到资源管理器的右键上，这样，鼠标点两下就能把选中目录下的所有.svn目录干掉了。Works just great!</p>
<p>代码为：</p>
{% codeblock %}Windows Registry Editor Version 5.00<br /><br />[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shell\DeleteSVN]@=&rdquo;<span style="color: rgb(139, 0, 0);">Delete SVN Folders</span>&ldquo;<br /><br />[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shell\DeleteSVN\command]@=&rdquo;<span style="color: rgb(139, 0, 0);">cmd.exe /c \&rdquo;TITLE Removing SVN Folders in %1 &amp;&amp; COLOR 9A &amp;&amp; FOR /r \&rdquo;%1\&rdquo; %%f IN (.svn) DO RD /s /q \&rdquo;%%f\&rdquo; \&rdquo;</span>&ldquo;{% endcodeblock %}
<p>将这段代码保存为一个.reg文件，双击确认导入注册表即可。</p>
