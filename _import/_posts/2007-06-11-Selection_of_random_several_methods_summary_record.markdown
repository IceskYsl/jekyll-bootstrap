---
layout: post
title: 选取随机的记录的几个方法汇总
date: '2007-6-11'
comments: true
categories: Database Ruby&Rails
link: true
---
有的时候，我们可能想吧满足某个条件的记录随机的选几条出来，比如用户查看一篇文章的时候，我们想再旁边随机的列出与这个文章相关的几篇文章，我们就有如下几个方法：

<strong>1.在Ruby中一次实现</strong>

<em>things = Thing.find(:all)
random_things = []
3.times do
random_things &lt;&lt; things[rand(things.size)]
end</em>

上面这个方法是可以的，但是有个缺点，它把整个表都查询出来,再随机的取三个，缺点很明显，如果数据库表太大，效率很差（内存等消耗很大）；且可能取出两条相同的记录（尽管概率不大），第二个问题比较好修复，如下代码即可解决：

<em>things = Thing.find(:all)
random_things = []
while random_things.size &lt; 3
random_things |= things[rand(things.size)]
end</em>

<strong>2.Ruby查询两次</strong>

<em>thing_ids = Thing.find(:all, :select =&gt; 'id').map(&amp;:id)
random_ids = []
while random_ids.size &lt; 3  random_things |= things[rand(things.size)] end random_things = Thing.find(:all, :conditions =&gt; ['id IN (?)', random_ids])</em>

这个方法只是先随机取出ids较，然后再取ids对应的记录，比前面说的那个有个好处就是不会消耗太多的系统资源，比起第一种方法会快很多。

<strong>3.在数据库层面上做</strong>

&lt;code&gt;random_things = Thing.find(:all, :limit =&gt; 3, :order =&gt; 'random()')&lt;/code&gt;

是不是神奇呢，我们直接把:random(如果是MySQL则需要使用 rand()) 传给Find方法就可以了，这个方法看似比较好，其实不然，其构造出来的SQL比较变形，且对于不同的数据库不能通用。且类似与order by rand() limit 1这样的语句是很畸形的。并且这个sql效率奇低！！

*4.使用offset进一步改进*

&lt;code&gt;Thing.find :first, :offset =&gt; rand(Thing.count)&lt;/code&gt;

上面这个方法好多了，但是只能取一条，你可以按照第一种办法构造一个取多条的，页很简单，不是么？以上四个方法，请按照自己的实际情况使用，对于不同的需求，效率是不一样的，如果你有更好的方法，欢迎留言讨论。
