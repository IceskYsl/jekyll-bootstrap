---
layout: post
title: Uninstall___Delete___Remove_Package
date: '2009-11-23'
comments: true
categories: Mac&*UNIX
tags: package ubuntu uninstall
link: true
---
<span style="background-color: #ffffff;">Just use the following syntax:</span>

sudo apt-get remove {package-name}

For example remove package called mplayer, enter:
$ sudo apt-get remove mplayer

Remove package called lighttpd along with all configuration files, enter:
$ sudo apt-get --purge remove lighttpd

To list all installed package, enter:\
dpkg --list
dpkg --list | less
dpkg --list | grep -i 'http'
