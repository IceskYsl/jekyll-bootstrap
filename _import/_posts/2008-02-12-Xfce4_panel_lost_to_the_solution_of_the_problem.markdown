---
layout: post
title: xfce4面板丢失问题的解决
date: '2008-2-12'
comments: true
categories: Ruby&Rails
link: true
---
<p>本本上的Ubuntu一直都是使用的xfce桌面系统，突然发现面板不见了，赶紧找时间找找原因，找到相关的文章，其解决的方法是：</p>
<p>
<div class="codeText">
<div class="codeHead">引用</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>由于Xfce是模块化的，所以所有的元素都有独立的进程。你只需重启那些进程即可。如果你想确认他们会在下次登录是自行启动的话，检查注销对话框中的&rdquo;为下次登录保存会话&rdquo;选项有无选中。&nbsp;&nbsp;</span></span></li>
    <li class=""><span>Panel&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;xfce4-panel&nbsp;&nbsp;</span></li>
    <li class="alt"><span>Taskbar&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;xftaskbar4&nbsp;(Xfce&nbsp;4.2&nbsp;only)&nbsp;&nbsp;</span></li>
    <li class=""><span>Window&nbsp;Manager&mdash;&mdash;&mdash;xfwm4&nbsp;&nbsp;</span></li>
    <li class="alt"><span>Desktop&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;xfdesktop&nbsp;(can&nbsp;depend&nbsp;on&nbsp;the&nbsp;dbus&nbsp;service,&nbsp;Xfce&nbsp;4.4&nbsp;only)&nbsp;&nbsp;</span></li>
    <li class=""><span>Desktop&nbsp;menus&mdash;&mdash;&mdash;&mdash;xfdesktop&nbsp;&nbsp;</span></li>
</ol>
</div>
<font color="#ff0000"><strong>xfce4-panel&amp;</strong></font></p>
<p>1、http://www.linuxfans.org/bbs/viewthread.php?tid=93633</p>
<p>2、http://forum.ubuntu.org.cn/viewtopic.php?t=57203&amp;sid=e4c2459767a54961ee8c7e142e043da7</p>
