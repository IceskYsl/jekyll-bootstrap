---
layout: post
title: 喔唷,崩溃啦! Chrome启动异常解决方法
date: '2008-9-4'
comments: true
categories: Tips
link: true
---
前面说到了，<a href="../../../?action=show&amp;id=378">Google的浏览器</a>Chrome在我工作环境下启动不成功，一启动就报告说XXX初始化失败，然后就显示“喔唷,崩溃啦!”，导致不可用。
查了下原因，有如下几个可能：
1、我是内网 ；
2、我使用了一个安全软件SPA；
3、我是windows xp sp3
分析了下原因，很多人的XP SP3可以跑，说明3不是问题，有人是内网可以使用，说明1一哦不是问题，那么就剩下2这个原因了。
经过多方查找，找到原因：
<em>由于采用了sandbox技术，被spa无情的干掉了，即使在SPA被干掉的情况下，chrome也无法正常启动。 </em>

<strong>解决方法：</strong>
手工在command界面里面执行 <strong>chrome.exe -no-sandbox </strong>
或者在你的快捷方式-右键-属性，在“目标”里面最后加上-no-sandbox 类似这样
"C:\Documents and Settings\iceskysl\Local Settings\Application Data\Google\Chrome\Application\chrome.exe" -no-sandbox
