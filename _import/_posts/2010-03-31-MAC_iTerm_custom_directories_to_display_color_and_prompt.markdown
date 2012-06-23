---
layout: post
title: MAC+iTerm定制目录显示颜色和提示符
date: '2010-3-31'
comments: true
categories: Mac&*UNIX
tags: iTerm LSCOLORS Mac
link: true
---
很简单,就是在.bash_profile下加了三行.
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

另外加了一行个性化提示符.
export PS1="\[\e[32;1;40m\]\u@\H \w \$ \[\e[0m\]"

相关的文章参见:
http://mac.linsheng.me/archives/530.html
http://www.ibm.com/developerworks/cn/linux/l-tip-prompt/tip01/
http://hi.baidu.com/rainfish_tju/blog/item/0f54458f849141f0513d9284.html

<strong>配置</strong>

那么应该怎样来配置成我喜欢的颜色呢？下面我们就来详细说一些这些配置。

~/.bash_profile是bash shell中当前登录用户的配置文件。bash是“终端”中默认的shell。

alias ls=”ls -G”是给”ls -G”起了一个别名，当执行ls时，就相当于执行了ls -G。

CLICOLOR是用来设置是否进行颜色的显示。CLI是Command Line Interface的缩写。
LSCOLORS是用来设置当CLICOLOR被启用后，各种文件类型的颜色。LSCOLORS的值中每两个字母为一组，分别设置某个文件类型的文字颜色和背景颜色。LSCOLORS中一共11组颜色设置，按照先后顺序，分别对以下的文件类型进行设置：

directory
symbolic link
socket
pipe
executable
block special
character special
executable with setuid bit set
executable with setgid bit set
directory writable to others, with sticky bit
directory writable to others, without sticky bit
LSCOLORS中，字母代表的颜色如下：

a 黑色
b 红色
c 绿色
d 棕色
e 蓝色
f 洋红色
g 青色
h 浅灰色
A 黑色粗体
B 红色粗体
C 绿色粗体
D 棕色粗体
E 蓝色粗体
F 洋红色粗体
G 青色粗体
H 浅灰色粗体
x 系统默认颜色
所以，如果我们想把目录显示成红色，就可以把LSCOLORS设置为bxfxaxdxcxegedabagacad就可以了
