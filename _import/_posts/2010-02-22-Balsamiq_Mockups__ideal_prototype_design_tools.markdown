---
layout: post
title: Balsamiq Mockups，理想的原型设计工具
date: '2010-2-22'
comments: true
categories: 产品设计
tags: Axure Balsamiq Mockups 原型设计
link: true
---
由于经常要讨论产品，包括web和手机(Aandroid，Iphone）的产品原型设计，尝试过很多的原型设计工具，例如Axure等，后来换了mac book，就一直找不到合适的原型设计工具，就一直在Google Doc中直接draw，其做了很多无用功。
比较偶然的机会看到Balsamiq Mockups这个软件，和Pixelmator一样，是个人开发者（意大利人Peldi）开发的产品，其地址为http://www.balsamiq.com/ ，在其提供的demo页面上试了下http://www.balsamiq.com/demos/mockups/Mockups.html，效果很好，符合我的预期。
虽然是由个人设计的，但功能却一点不弱于其他大牌的原型设计工具：
操作方面，拖拽，控件分组，甚至元素之间的对齐都做得很贴心；
预制了很多界面元素，从简单的输入框，下拉框，浏览器主要元素，到经常用得到的导航条，日历，表格，到复杂的Tag Cloud，Cover Flow, 地图，WYSWYG的格式工具栏等，有了这些不用从头画起，往往比用白板都快；
界面元素的修改很简单，比如导航条的几个标签页的label，就是用逗号分隔的文字，下拉框的选项就是分行的文字；
使用xml语言来记录和保存界面元素和布局，
这使得每个设计都能被很好得放进SVN，Git，和CVS等工具中进行管理和跟踪；
可以设计复杂的界面元素，保存后，以后可以重复使用（包括修改）；
可以将设计导出成PNG格式的图片；
可以用命令行进行导出操作，这样就能让我写个脚本，从svn里checkout某个目录下的所有设计文件后，导出图片，打包后用邮件发到项目经理，工程师甚至客户那；
跨平台，Balsamiq Mokups是用Flex和Air实现的，所以在Mac OS, Linux和Windows下都能使用；
不仅仅有桌面版本，还有能集成在Confluence，JIRA，和XWiki中的版本，使得异地在线协作更方便有效。

以下是关于Balsamiq Mockups的一些特点：
易操作：从 Balsamiq Mockups 自带的元素里可以很方便地拖拽，效果图轻易形成；元素对齐很贴心；
可偷懒：根据 Balsamiq Mockups 提供的 Wiki 风格的代码规则，画图时可以「偷懒」，输入文本符号则能生成图标。因此相比其它繁琐的软件操作，Balsamiq Mockups 也能更快地完成画图任务。
控件足：Balsamiq Mockups 软件包括 50 多个控件， 70 多个图标。基本自带了所有常用的小控件，并在导航处进行分类；图标设计赏心悦目。要是 Balsamiq Mockups 允许用户导入自定义的控件就更好了，当然现有的也足够了 -
新风格：让人眼前一亮的涂鸦风格，很能还原手绘效果；
可中文：在菜单栏 View 里将 Use System Fonts 勾上，就能完美支持中文输入（注：非 Balsamiq Mockups 中文版）；
其它点：Balsamiq Mockups 使用 xml 记录，方便移植、二次利用；可导出为 png 格式图片。

另外还有跨平台与多版本两个优点：
跨平台：Balsamiq Mockups 基于 Air ，因此能同时在 Windows、Mac OS 及 Linux 下使用；
多版本：包括桌面版本，以及集成于 Confluence、JIRA、XWiki、FogBugz 中的版本

软件可以从其网站上下载，其中桌面版本售价是$79。但作者非常厚道，提供了几种免费使用的方式：http://www.balsamiq.com/products/mockups/desktop

You can download Mockups for Desktop for free. Some of the features of the app, like saving and loading multiple mockups or linking mockups together can only get unlocked using a license key.
<img src="http://lh3.ggpht.com/_GiZR7A3zZ6s/S4Hu-KohUhI/AAAAAAAAGpM/mibP8JtGvi0/s400/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202010-02-22%20am10.40.13.png" alt="demo" />
