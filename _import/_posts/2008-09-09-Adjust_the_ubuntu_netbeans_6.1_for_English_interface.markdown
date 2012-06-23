---
layout: post
title: 调整ubuntu下的netbeans 6.1为英文界面
date: '2008-9-9'
comments: true
categories: Ruby&Rails Tips
link: true
---
在Ubuntu下使用netbeans还是挺不错的，但是最近升级后发现界面变成中文的了，还有些小方块的乱码。乱码很早前遇到过，忘记以前是咋处理了，临时找了下，如下处理可以：

把/usr/share/fonts/truetype/arphic/下的文件copy一份到$JAVE_HOME/jre/lib/fonts/fallback/下即可。

但是显示的中文真的不好看，也没有找到调的地方，加上其翻译的实在别扭，害得我老找不到菜单，于是找了个办法把界面又换成英文的，win下貌似可以直接修改<strong>etc/netbeans.conf</strong>中netbeans_default_options，在其后面添加 <strong>--locale en_US</strong>即可，但是ubuntu下配置文件不一样，在etc下配置看不明白，于是在的<span style="text-decoration: underline;">快捷启动方</span>式后面加上 --locale en_US就好了。

看着英文界面，真亲切呀。

<strong>其他类似的解决：</strong>

http://www.javaeye.com/post/518296

http://rednaxelafx.javaeye.com/blog/202287
