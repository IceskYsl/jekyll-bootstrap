---
layout: post
title: Android的Orientation Sensor三个坐标的含义
date: '2009-1-18'
comments: true
categories: Android&Java
link: true
---
<p>以前在黑莓手机里面有个GPS跟踪软件非常有趣，可以显示目前的方向，在Android中使用其提供的Sensor非常方便，如下是强制Landscape时候的情况：<br />
<br />
values[0]：方位角（水平旋转角），简单的说就是手机的头现在朝向哪个方位，0＝北、90＝东、180＝南、270＝西（可是好像不太准）<br />
values[1]：纵向旋转角，0＝面朝上平置、-90＝垂直向上、-180/180＝面朝下平置、90＝垂直向下<br />
values[2]：橫向旋转角，0＝朝前、90＝往右倒、-90＝往左倒</p>
