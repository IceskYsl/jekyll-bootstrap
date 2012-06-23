---
layout: post
title: 清理svn的垃圾文件.svn文件夹
date: '2009-11-17'
comments: true
categories: 技术归总 Mac&*UNIX
tags: cvs Mac svn
link: true
---
有时候把svn的代码传到服务器，会不小心传上svn的系统文件，这些文件都是用于版本控制的，在生产环境，总有点不爽。在linux下可以用一个命令删除，命令如下：
<blockquote>find . -name .svn | xargs rm -rf</blockquote>
上述命令要在代码所在目录运行。

cvs的版本控制，也会有类似问题，方法类似，换一下名字，如下：
<blockquote>find . -name .cvs | xargs rm -rf</blockquote>
