---
layout: post
title: 软件架构的十大错误
date: '2007-10-19'
comments: true
categories: Ruby&Rails
link: true
---
<p>在infoQ上看到一篇关于软件构架的文章，说了一个软件构架中可能存在的一些错误，有些错误在现有的软件，项目构架中是普遍存在的问题，转载记录一二。</p>
<p>虽然我不是构架师，但是在做RoR项目的时候，这些角色都是混杂起来的，必须是全部了解，因为没有那么多的空闲资源，所以了解还是很有必要的。</p>
<p>原文开始：</p>
<p><a href="http://www.iasahome.org/web/home/membership/fellows">IASA成员</a><a href="http://www.eoinwoods.info/">Eoin Woods</a>发表了一篇文章讲述他所认为的<a href="http://www.itarchitect.co.uk/articles/display.asp?id=377">十大软件架构错误</a>&mdash;&mdash;常常要碰得头破血流才会得到的一些教训。这十大错误简要总结如下：</p>
<ol>
    <li><strong>不能界定项目范围。</strong>&ldquo;在这种情况发生时，一个简单的出差登记系统结果变成内建了完整的花费报销管理系统，项目费用、时间跨度和质量都留下不可避免的烂摊子&hellip;&hellip;除了简单的登录真的不需要安全措施了？用户登录系统后真的不能够执行任何系统操作吗？&rdquo;</li>
    <li><strong>网撒得不够宽。</strong>&ldquo;我们都曾经犯过的一个错误是，只关注系统所有利益相关者中的一两方&mdash;&mdash;通常受让人（为系统出钱的人）和最终用户得到了全部的关注。&rdquo;</li>
    <li><strong>只关注功能。</strong>&ldquo;&hellip;&hellip;除非系统表现出了全面的高质量（诸如性能、安全、可维护性等等），否则不太可能成功。&rdquo;</li>
    <li><strong>用方框和线条来描述。</strong>&ldquo;[一个无所不包的]巨大的Visio图无法成为有效的架构描述，有两个原因：第一，它试图在单一表示中呈现太多信息；第二，没人真正清楚地知道你画的各种符号到底表示什么意思。&rdquo;</li>
    <li><strong>忘了需要培养的过程。</strong>&ldquo;在建造系统的时候常常需要小心的事物包括：开发者和测试者没法真正理解设计，他们不热衷或者没时间学习技术，以及还没有很好的工具支持的新技术，或者新技术会强迫人们以新的不熟悉的方式工作。&rdquo;</li>
    <li><strong>平台定义不精确。</strong>&ldquo;光用&lsquo;需要Unix和Oracle&rsquo;来描述你的平台是不足够的。你需要精确地说明每一部分具体的版本和配置，才能保证得到你所需的平台。不然如果有人好心为平台的某一部分升级了一个库，就可能导致某些东西停止运作。精确定义平台你才能在部署中避免这样的情形。&rdquo;</li>
    <li><strong>对性能和伸缩能力想当然。</strong>&ldquo;及早开始考虑性能和伸缩性，构建性能模型尝试预测关键的性能指标并定位瓶颈，在设计逐渐成型的同时投入到一些实际的验证性工作中去。这会帮助你提高对设计中不存在严重性能和伸缩性缺陷的信心。&rdquo;</li>
    <li><strong>自己发明安全技术。</strong>&ldquo;多 年来许多系统所犯的一个错误是试图加入自己发明的安全技术来提高系统安全性。比如定制的加密算法，开发者自己编写的审核系统，甚至完全DIY的访问控制系 统。自家开发的安全方案基本上都是不明智的。虽然很多人都以为自己可以马上搞出一些聪明的安全技术，但通常都只是自作聪明。&rdquo;</li>
    <li><strong>没有灾难恢复。</strong>&ldquo;要想得到资源来实现系统的灾难恢复机制，其关键在于在若干真实的场景中，具体衡量系统不可用所导致的损失。如果你还能估算这些场景发生的概率，你就可以用这两组数据去说服人们灾难恢复的重要性，并获得合理的预算去实现它。&rdquo;</li>
    <li><strong>没有撤退计划。</strong>&ldquo;确保无论在系统部署或升级的过程中发生任何事，你都有一份书面的、经过审查的、一致同意的撤退计划，允许你将整个环境恢复到部署之前的状态。&rdquo;</li>
</ol>
<p>Eoin Woods是UBS Investment Bank的软件及企业架构师。</p>
<p><strong>查看英文原文：</strong><a href="http://www.infoq.com/news/2007/10/top-ten-architecture-mistakes">Top Ten Software Architecture Mistakes</a></p>
