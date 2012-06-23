---
layout: post
title: 如何让 Safari 默认使用新标签打开链接
date: '2009-11-8'
comments: true
categories: 无心呢喃
link: true
---
xi喜欢chorme而不喜欢safari的原因之一就是safari每次打开链接都是新窗口，除非你按着Command，很不习惯，然后我找了半天也没再其设置中找到可以设置的地方，搞得我桌面上经常一大堆的safari窗口。

于是开始寻找如何修改可以似的safari默认打开的链接是在信标签中的，于是找到如下方法：

方法：

1、打开 Terminal，Finder -&gt; Applications -&gt; Utilitys -&gt; Terminal。。

2、粘贴下面这段代码到 Terminal 中并回车，进行执行，即完成了激活。

<strong>defaults write com.apple.Safari TargetedClicksCreateTabs -bool true</strong>

3、要撤销这个设置，你只需在 Terminal 中执行下面这条命令就行。

<strong>defaults delete com.apple.Safari TargetedClicksCreateTabs</strong>

注意，在执行这两个命令后，重启 Safari 浏览器就ok了。
