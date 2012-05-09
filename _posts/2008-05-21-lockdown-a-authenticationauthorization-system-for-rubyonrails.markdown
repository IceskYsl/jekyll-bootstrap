--- 
layout: post
comments: true
title: "Lockdown: A authentication/authorization system for RubyOnRails"
date: 2008-5-21
link: false
categories: life
---
<p><strong>RubyOnRails</strong>让我们无限惊喜，插件，gem，部署方式，协助方式等等层出不穷，让我们足够的惊喜，今天介绍的是一款用户权限控制系统Lockdown。</p>
<p><a href="http://lockdown.rubyforge.org/">Lockdown</a>的使用也是足够的简单（包括安装和使用），但是也有些不足和缺陷，后面会说到，但是有些东西还是可以借鉴的。</p>
<p><strong>安装方便：</strong></p>
<p>$ sudo gem install lockdown<br />
$ cd &lt;your_project_directory&gt;<br />
$ lockdown .</p>
<p><strong>使用前需要配置：</strong></p>
<p>需要人工在<strong>init.rb </strong>中配置角色和权限，不能通过界面维护，这点不是方便。</p>
<p><strong>定制不算复杂：</strong></p>
<p>定制角色和权限，以及权限的分配不是很复杂，但是显得比较呆板。</p>
<p><strong>其他不足：</strong></p>
<p>由于其兼顾了<strong>merb</strong>，导致很多代码混在一起，比较不轻便。</p>
<p>详细的使用方法和特点请参考其主页上的说明，不再赘述。</p>
<p><strong>其他实现方案：</strong></p>
<p>我还是认为我自己写的一款角色控制、分配系统比较好用，只是没有插件化，不方便移植，实现的方式是初始化的时候将资源（action）入库，可以随时建立角色和用户组，每个用户组可以拥有多个角色，每个角色可以拥有多个资源权限，做了一些缓存以提高性能，另外，每次action前作适当的鉴权。</p>
<p>有时间可以改成插件或者gem。。</p>
