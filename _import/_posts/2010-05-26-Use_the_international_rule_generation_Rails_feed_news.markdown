---
layout: post
title: 利用Rails中的国际化规则生成feed消息
date: '2010-5-26'
comments: true
categories: Ruby&Rails
tags: feed I18n
link: true
---
近日需要实现feed（动态）消息，同时需要支持多语言，本来没什么难的，做一个多态表，然后存储消息的目标对象，再规定好一些动作，入库或者出库的时候拼装下就好了。这里有个比较有趣的是如何最大限度的重用代码或者规则，最后实现中借鉴了Rails国际化的规则。
1. 首先定义针对目标可以做的操作，用常量定义好（考虑到数量不会很多，且不会经常变化，就不存数据库），例如：
class FeedAction

  #APP:1 - 99
  APP_DOWNLOAD = 1 #Download
  APP_FAV = 2 #Favorites
  APP_PAY = 3
  APP_INSTALL = 4

2. 对定义好的操作名为key，撰写其对应语言的动作描述，写zh.yml或者en.yml文件，例如：
zh:
  FEED_ACTION:
      APP_DOWNLOAD: "下载了"
      APP_FAV: "收藏了"
      APP_PAY: "购买了"
      APP_RATE: "打了{{rate}}星"

3.生成消息输出的时候，直接
>> I18n.locale = 'zh'
>> I18n.t 'FEED_ACTION.APP_PAY'
=> "购买了"
>> I18n.t 'FEED_ACTION.APP_RATE',:rate=>2
=> "打了2星"
