--- 
layout: post
comments: true
title: !binary |
  5Zyod2luZG93c+S4iuWuieijhVJNYWdpY2s=

date: 2007-6-5
link: false
categories: life
---
看到网上很多人说再WIN下安装RMagick的方法都是这样的，gem install ImageMagick-6.3.0-7-Q8-windows-dll.exe，这样我感觉谁有问题的，至少我这样安装的时候是有错误的，如：D:\gem\RMagick-1.14.1_IM-6.3.0-7-Q8&gt;gem install ImageMagick-6.3.0-7-Q8-windows-dll.exeERROR:  Error installing gem ImageMagick-6.3.0-7-Q8-windows-dll.exe[.gem]: string contains null byte所以正确的应该是用gem包来安装，如下:D:\gem\RMagick-1.14.1_IM-6.3.0-7-Q8&gt;gem install rmagick-1.14.1-win32.gemSuccessfully installed rmagick, version 1.14.1看看是不是安装上了：D:\gem\RMagick-1.14.1_IM-6.3.0-7-Q8&gt;gem listrmagick (1.14.1)    RMagick is an interface between the Ruby programming language and    the ImageMagick and GraphicsMagick image processing libraries.
