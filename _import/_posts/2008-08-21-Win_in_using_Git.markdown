---
layout: post
title: 在win下使用Git
date: '2008-8-21'
comments: true
categories: Mac&*UNIX
tags: git
link: true
---
以前说过“与时俱进,使用Git”，在自己的本本上，已经Ubuntu好久了，Git也是有的非常好，但是有的时候在其他机器上，是个weindows，需要使用Git的时候，就只能找找有没有wein版本的git客户端了。
找到一个<a href="http://code.google.com/p/msysgit/">msysgit</a> ，按照里面的说明下载安装就OK了，下面看看如何使用：
-----------------使用---------------
<span class="tpc_content">好,下面来个简单教程.标准的 git 教程是行不通的(要加些东西),因为这是windows.主要是没有用户信息.好我的git安装在 c:\git 以下为命令行.
<strong>
1.创建git的数据库</strong>
C:\Git\bin&gt;git init-db</span>

<strong>2.生成一个文件xxx并加入到git中</strong>
C:\Git\bin&gt;echo hello &gt; xxx
C:\Git\bin&gt;git add xxx

<strong>3.提交[以上两步与标准教程还是一样的,关键是这一步]</strong>
C:\Git\bin&gt;set home=c:\
C:\Git\bin&gt;git config --global user.name "clq"
C:\Git\bin&gt;git commit -m "test"

一共三个命令,其中第1个是设置用户路径,第2个是设置用户名.而且是每次打开dos命令行后都要有这两个命令,当然你可以写成 bat 文件.第3个才是提交,不能直接写 git commit 因为这个版本好象一定要有注释,那个 "test" 就是我加的注释了.

<strong>4.改一下xxx文件</strong>
echo world &gt;&gt; xxx

<strong>5.查看一下它和我们原来对比的有什么不同</strong>
C:\Git\bin&gt;git diff

结果如下
diff --git a/xxx b/xxx
index 907cd4b..360c7f4 100644
--- a/xxx
+++ b/xxx
@@ -1 +1,2 @@
hello
+world
(END)

用过cvs的都明白了吧.另外这个显示的还得退出,退出命令和vi一样
提交可以用一个命令来完成
git commit -m "" -a xxx

省去git add

C:\Git\bin&gt;git show xxx
查看最近一次提交的信息.

C:\Git\bin&gt;git commit -a -m"aa"

提交全部更改过的文件.
