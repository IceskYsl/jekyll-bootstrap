---
layout: post
title: 理解.bash_profile和.bashrc
date: '2007-11-22'
comments: true
categories: Ruby&Rails
link: true
---
<p><strong>.bash_profile和.bashrc的什么区别</strong><br />
<strong>&nbsp;/etc/profile:</strong>此文件为系统的每个用户设置环境信息,当用户第一次登录时,该文件被执行.<br />
并从/etc/profile.d目录的配置文件中搜集shell的设置.<br />
<strong>/etc/bashrc:</strong>为每一个运行bash shell的用户执行此文件.当bash shell被打开时,该文件被读取.<br />
<strong>~/.bash_profile:</strong>每个用户都可使用该文件输入专用于自己使用的shell信息,当用户登录时,该文件仅仅执行一次!默认情况下,他设置一些环境变量,执行用户的.bashrc文件.<br />
~/.bashrc:该文件包含专用于你的bash shell的bash信息,当登录时以及每次打开新的shell时,该<br />
该文件被读取.<br />
<strong>~/.bash_logout:</strong>当每次退出系统(退出bash shell)时,执行该文件. <br />
另外,/etc/profile中设定的变量(全局)的可以作用于任何用户,而~/.bashrc等中设定的变量(局部)只能继承/etc/profile中的变量,他们是&quot;父子&quot;关系.<br />
~/.bash_profile 是交互式、login 方式进入 bash 运行的<br />
~/.bashrc 是交互式 non-login 方式进入 bash 运行的<br />
通常二者设置大致相同，所以通常前者会调用后者。</p>
<p><strong>编辑.bash_profile</strong><br />
编辑你主目录下的.bash_profile文件@&quot;<br />
加上:<br />
alias ls='ls -laF'<br />
保存退出<br />
最后source .bash_profile 使变动生效</p>
