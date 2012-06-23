---
layout: post
title: 1stlog插件开发指南
date: '2007-6-17'
comments: true
categories: Ruby&Rails
link: true
---
一、什么是1stlog 1stlog是由1sters.com开发的一款基于RubyOnRails的博客系统，主要针对中国用户，符合中国用户的使用习惯，功能强大，结构合理，易于扩展和定制，是一款很有前景的博客系统。二、为什么要开发插件插件是对原有功能的扩充，以集成实现更多的更有特色的功能，主版本保证可扩展性，提供扩展的方法，制定开发规范和流程，方便不同需求的人可以快速的开发自己需要的插件；也可以把自己的插件分享给别人使用，甚至被1stlog开发官方收录，进入正式版本，为开源的RoR做出自己的贡献。三、怎样开发插件 1stlog是基于RubyOnRals开发，严格遵循MVC构架思想，本着数据层和表现出分离的原则，使用RoR的组件原理，可以很方便的开发插件，且整合使用简单，下面将就一个具体的例子说明如何进行插件开发。四、插件开发实例解析 目标：下面将实例说明如何进行插件的开发，我们的目标是使用Youtube提供的API，结合一组Youtube的Ruby代码lib，在1stlog上扩充一个展示您在Youtube上视频的小插件，该插件可以根据提供的USERNAME取其在Youtube上收藏的影片。详细指南请参考附件，或者到如下两个URL查看：http://code.google.com/p/1stlog/wiki/CreatePluginFor1stlogGuidehttp://docs.google.com/View?docid=dhf86kr9_28g7jthk
