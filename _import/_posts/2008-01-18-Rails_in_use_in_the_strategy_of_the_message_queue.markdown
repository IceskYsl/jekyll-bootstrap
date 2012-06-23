---
layout: post
title: 在Rails中使用消息队列的策略
date: '2008-1-18'
comments: true
categories: Ruby&Rails
link: true
---
<p>开始的时候，有人说Rails没有队列机制，无法达到企业级的需求，时间没多久，现在再来看看Rails有没有队列机制吧。</p>
<p><img alt="" src="http://nubyonrails.com/system/uploads/2007/q-summary.png" /></p>
<p>别看一组可行的列表，如下：</p>
<p><a href="http://xph.us/software/beanstalkd/"><strong>beanstalkd</strong></a></p>
<p>Fast, simple, designed to mirror the style of memcached. Rails plugin available, or usable with a simple Ruby-based <span class="caps">API</span>. Server written in C, but is very easy to install. Memory only&hellip;jobs are not persistent. New, so the internal protocol may change. Workers may be difficult to manage.</p>
<p><a href="http://rubyforge.org/forum/forum.php?forum_id=19781"><strong>bj</strong></a></p>
<p>Rails plugin. Self-spawning. Can only send shell commands. Jobs start a full copy of your Rails app on every execution.</p>
<p><a href="http://backgroundrb.rubyforge.org/"><strong>BackgroundRB</strong></a></p>
<p>Ruby-based. Can be polled for incremental feedback on the progress of a job. Recently rewritten.</p>
<p><a href="http://www.amazon.com/Simple-Queue-Service-home-page/b?ie=UTF8&amp;node=13584001"><strong>Amazon <span class="caps">SQS</span></strong></a></p>
<p>Runs on Amazon&rsquo;s cluster, so it can handle a ton of traffic.  Operated by Amazon, so it doesn&rsquo;t run locally. Not open source.</p>
<p><a href="http://activemq.apache.org/"><strong>Apache ActiveMQ</strong></a></p>
<p>Well-known. Persistent. Requires several installation steps and database tables.</p>
<p><a href="http://code.google.com/p/activemessaging*/wiki/ActiveMessaging"><strong>ActiveMessaging</strong></a></p>
<p>Rails plugin. Works with ActiveMQ and others. Requires external job server.</p>
<p><a href="http://pastie.textmate.org/private/vxqxcvv40omkrhvnzp6a"><strong><span class="caps">BBQ</span></strong></a></p>
<p>Nothing to install&hellip;involves only a single line of code! Doesn&rsquo;t work on Windows <span class="caps">NT4</span>.</p>
<p>如下是几篇介绍的文章：</p>
<p><a href="http://www.thewebfellas.com/blog/2008/1/17/queues">http://www.thewebfellas.com/blog/2008/1/17/queues</a></p>
<p><a href="http://nubyonrails.com/articles/about-this-blog-beanstalk-messaging-queue">http://nubyonrails.com/articles/about-this-blog-beanstalk-messaging-queue</a></p>
