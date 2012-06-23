---
layout: post
title: The_Git_TextMate_Bundle
date: '2010-2-5'
comments: true
categories: 技术归总 Tips
tags: Bundle git Textmate
link: true
---
TextMate中已经集成了SVN的Bundle，使用起来非常方便，要用Git的话也可以装Bundle，方法如下：

<strong>Installation</strong>
<blockquote>mkdir -p ~/Library/Application\ Support/TextMate/Bundles
  cd ~/Library/Application\ Support/TextMate/Bundles
  git clone git://github.com/jcf/git-tmbundle Git.tmbundle</blockquote>

restart teatmate and it's done!

In the TextMate preferences, advanced tab, shell variables, set the TM_GIT variable to point to your installation of git (ie /usr/local/bin/git)
Many shortcuts are available from the Git-shortcut (Ctrl-Shift-G). Subversion commands are Command-Option-g. Less frequent commands are accessed via the menu.
Update your bundle by running the “Update Git Bundle” command.
