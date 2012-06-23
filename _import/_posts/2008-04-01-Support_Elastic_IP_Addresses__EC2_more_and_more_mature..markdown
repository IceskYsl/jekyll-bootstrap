---
layout: post
title: 支持Elastic IP Addresses,EC2越来越成熟了.
date: '2008-4-1'
comments: true
categories: Ruby&Rails
link: true
---
<p>晚上写完手上的代码,正准备睡觉的时候,收到<strong>Amazon</strong>的一封mail,以为是<strong>S3</strong>或<strong>EC2</strong>的账单呢,打开一看,原来是<strong>EC2</strong>的好消息.</p>
<p><font size="2" face="verdana" color="#0000ff">Greetings AWS Developers, </font>  <font size="2" face="verdana">
<p><font color="#0000ff"> Last week brought some exciting, highly requested new Amazon EC2 features to the community - Elastic IP Addresses, Availability Zones, and User Selectable Kernels.</font></p>
<p><font size="3">wowo,真是个好东西,<strong>EC2</strong>一直以来都被人诟病之一的就是其IP地址的动态的,也就是当你重启您&quot;镜像&quot;后,你的IP地址会变化,也就是说,你的域名需要才信修改IP指向,或者采用一个老外写的一个插件(忘记脚啥名字了)来动态解析,比较不爽的很.现在EC2终于推出了&quot;静态IP&quot;功能,我粗略的看了下,其和账户是绑定的,也就是你重启自己的&quot;镜像&quot;后,并不失效.</font></p>
<p><font size="3">好东西,EC2会越来越好的...<br />
</font></p>
<p><font size="3">还是直接看英语的吧,呵呵:</font></p>
<p>Elastic IP addresses are static IP addresses designed for dynamic cloud computing.    An Elastic IP address is associated with your account, not a particular instance,    and you control that address until you choose to explicitly release it. Unlike    traditional static IP addresses, however, Elastic IP addresses allow you to    mask instance or availability zone failures by programmatically remapping your    public IP addresses to any instance associated with your account. Rather than    waiting on a data technician to reconfigure or replace your host, or waiting    for DNS to propagate to all of your customers, Amazon EC2 enables you to engineer    around problems with your instance or software by programmatically remapping    your Elastic IP address to a replacement instance.</p>
<p>详细情况请参考:http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1346</p>
</font></p>
