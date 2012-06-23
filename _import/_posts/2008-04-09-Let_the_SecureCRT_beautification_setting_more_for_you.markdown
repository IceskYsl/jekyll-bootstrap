---
layout: post
title: 设置/美化SecureCRT让其更加适合自己
date: '2008-4-9'
comments: true
categories: Ruby&Rails
link: true
---
<p>时常还是要在另外一台电脑上使用windows，也只能使用putty或者SecureCRT,连接到服务器上，但是一直以来，都存在一些小问题，这里以SecureCRT为例把解决方法汇总下。</p>
<p><strong>1、中文显示乱码的问题</strong></p>
<p>该问题的现象是用SecureCRT连接到服务器上，比如tail应用日志的时候，其日志中的中文不能很好的显示（也就是乱码）。这个问题的根本原因是双方的编码方式不一致，因为一般的来说，服务器上的编码是UTF-8（我的服务器是这样的，或者被我设定为这样的）你可以在服务器上使用locale 查看，而SecureCRT的默认设置的字符编码是保持系统一致的，在中文windows上就是GBK或者其他编码；</p>
<p>知道原因修改起来就比较简单了，分为两个部分：</p>
<p>1）修改远程linux机器的配置<br />
vim /etc/sysconfig/i18n<br />
把LANG改成支持UTF-8的字符集<br />
如：<br />
LANG=&rdquo;zh_CN.UTF-8&Prime;<br />
或者是<br />
LANG=&rdquo;en_US.UTF-8&Prime;</p>
<p>或者是修改指定用户的locale，编辑.bashrc文件，导入以上的编码即可。</p>
<p>2）然后再改Secure CRT的设置<br />
Options -&gt; Session Options -&gt;&nbsp; Apperance -&gt; Fonts -&gt; Character（选项-&gt;会话选项-&gt;外观-&gt;字符编码-&gt;uft-8）<br />
<br />
退出，再重新登录。发现utf8的文件都能正确读了，utf8的文件名也能正确显示了。</p>
<p><strong>2、显示颜色</strong></p>
<p>显示颜色是个好习惯，一来直观明了，二来增加美感，对视力也有好处，在Secure CRT中设置显示颜色也比较简单，如下：<br />
Options -&gt; Session Options -&gt;Terminal -&gt;Emulation -&gt;ANSI Color 选中就可以了。</p>
<p><strong>3、字体选择</strong></p>
<p>选择不同的字体，可以显示不同的效果，按照个人喜好，比如我自己就喜欢细一点的，清晰一点的字体，而这个字体在Secure CRT是可以设置的，其默认的是vt100，我个人比较喜欢&ldquo;新宋体&rdquo;的显示效果。（PS.很多人喜欢fixedsys 字体）。设置方法也很简单，如下：Options -&gt; Session Options -&gt;&nbsp; Apperance -&gt; Fonts 选择你需要的字体即可。</p>
