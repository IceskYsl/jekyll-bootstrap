---
layout: post
title: 在Startups时就考虑Scalability
date: '2008-10-7'
comments: true
categories: Architecture Tips
link: true
---
一般说来，项目初期的时候考虑更多的是功能的实现和可用性，而对Scalability考虑的并不是很多，从很多人的Scalability经验分享来看，大家比较认同的一条Scalability路线是基本上类似于：<span style="text-decoration: underline;">先DB和web server在一台机器上，再分割DB和web server，再集群，再cache，再系统分割，再水平、垂直扩展这样的路线</span>。

我一直不是很同意这个模式，因为当你有志把系统做大道一定规模的时候，为什么不先做一些Scalability的基础呢，比如功能的切割、子系统的划分等等，为什么非要等到系统压力上来了，再手忙脚乱的去重新规划呢。

之所以这么说，是因为我做的项目预先会考虑好系统划分，做好接口定义，把不同的功能分割在封装成不同的子系统，子系统和子系统之间通过<strong>接口</strong>传递消息，而后期的Scalability则可以针对不同的子系统需要灵活选择，比如有的子系统需要较多的内存，而有的子系统CPU吃紧等等。

今天看到<em>Frank Mashraqi（</em><em>Director of Business Operations &amp; Technical <a class="glossary-term" href="http://highscalability.com/tags/strategy"><acronym title="Strategy: A strategy is something you can do, that is often quite simple, to help improve your website.">Strategy</acronym></a> for a top 50 website that delivers billions of page views per month.</em><em>）写了一篇文章“<a href="http://highscalability.com/scalability-startups-how-grow-without-blowing">Scalability for Startups: How to Grow Up without Blowing Up</a>”，其“<a href="http://mashraqi.com/2008/09/startonomics-startup-scalability.html">12 Tips for Building a Scalable Startup</a>”列举了一些在</em><em>Startups时就应该考虑的</em>Scalability因素，值得阅读。其还有一个<a href="http://www.docstoc.com/docs/1739741/Frank-Mashraqi-Scalability-for-Startups-How-to-Grow-Up-without-Blowing-Up">Doc版本</a>，更加生动的说明了一些东西。

如果你有类似的经验，欢迎和我讨论和分享。
