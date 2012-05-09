--- 
layout: post
comments: true
title: "[Rails2.2] Josh Peek,thread safety?"
date: 2008-8-31
link: false
categories: life
---
<a href="http://weblog.rubyonrails.org/">Rails</a>上说有个叫做<a href="http://weblog.rubyonrails.org/2008/8/16/josh-peek-officially-joins-the-rails-core">Josh Peek</a>的家伙加入core，将带来thread safety，这无疑是个重磅炸弹，因为才Rails0.6到现在的Rails2.1都是非线程安全的，以至于其一些无法解决的问题，性能也一直被人诟病，其实也不能怪Rails，Ruby本身这个方面做的也不是很好。

随着<strong>Ruby1.9</strong>的逐步推广，Rails2.2应该会对Ruby1.9广泛支持了吧，这个时候将会有很多新的东西加进来的吧，除了这里说的“<a href="http://iceskysl.1sters.com/?action=show&amp;id=371">线程安全</a>”，还有前面说到的“<a href="http://iceskysl.1sters.com/?action=show&amp;id=370">国际化</a>”，以及<a href="http://iceskysl.1sters.com/?action=show&amp;id=369">NeverBlock</a>实现的一组同步组件包，其性能将会得到大幅的提高。

另外，还有值得期待的就是Ruby的<strong>VM</strong>是否有改善？目前的<strong>GC</strong>还是问题大大的有，内存泄露也并不稀罕，希望有新的VM出来；另外，其Ruby的一些app服务器最近好像停止不前了，自从Zed A. Shaw闹脾气后，<a href="http://mongrel.rubyforge.org/">mongrel</a>就很少有啥更新了，其maillist也冷冷清清的。<a href="http://code.macournoyer.com/thin/">thin</a>还好，有些小的更新，这些server要针对Rails2.2和Ruby1.9做些大动作了。

Ruby的世界，前途无量。
