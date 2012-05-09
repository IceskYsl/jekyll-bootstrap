--- 
layout: post
comments: true
title: !binary |
  TU/vvIxNVO+8jExpbmtpZOeahOWFs+ezuw==

date: 2010-7-14
link: false
categories: life
---
做移动互联网的过程中，有这样一些词是必须知道的，如MO,MT,GSM,LINKID
上行（MO）上行的意思就是短信发送到服务器端  MO又称 Mobile Original
下行（MT）下行的意思就是短信从服务器端发回到手机上，MT又称Mobile Terminated
简单的说，从手机发起一个的过程叫上行(MO)，到手机结束的过程叫下行(MT)，比如，平时给你的朋友发送一条短信，对你来说就是上行(MO)，而对你的朋友来说，就是下行(MT)。在企业、行业应用中，从系统给手机发送信息的过程叫下行(MT)，而手机发送信息给系统的过程叫上行(MO)。

所有用户点播的业务，用户MO（上行）消息通过网关送到MISC鉴权批价后，MISC会自动生成一个随机数linkid随后通过网关传给SP，当SP收到MO（上行）消息后下发MT（下行）消息给用户时必须在Submit包的linkid字段填上MO（上行）消息包里面带的linkid信息（Reserve值：设定的回复内容）。
