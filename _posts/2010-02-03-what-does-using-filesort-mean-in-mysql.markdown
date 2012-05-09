--- 
layout: post
comments: true
title: What does Using filesort mean in MySQL?
date: 2010-2-3
link: false
categories: life
---
一直以来，只要我看到explain出来的结果有“Using filesort ”，我就要想方设法的优化和改善，因为我以前以为这个的意思就是使用文件系统来排序（那该多慢呀！），其实不是这样的。
在mysqlperformanceblog上看到一篇文章《<a href="http://www.mysqlperformanceblog.com/2009/03/05/what-does-using-filesort-mean-in-mysql/">What does Using filesort mean in MySQL?</a>》其中作者说自己每次面世的时候都会问“what does Using filesort mean in EXPLAIN,” 结果没有一个人回答的是对的，结果让其比较郁闷，就写了这个文章说明：
<blockquote>The usual answer is something like “rows are being placed into a temporary table which is too big to fit in memory, so it gets sorted on disk.” Unfortunately, this is not the same thing. First of all, this is Using temporary. Secondly, temporary tables may go to disk if they are too big, but EXPLAIN doesn’t show that. (If I interview you, I might ask you what “too big” means, or I might ask you the other reason temporary tables go to disk!)</blockquote>
通常的解释是：选择出来的记录太多了，需要排序时内存中放不下了，所以会存储在磁盘中，并通过操作磁盘的文件的方式来排序。但是呢，这是不对的。

<blockquote>The truth is, filesort is badly named. Anytime a sort can’t be performed from an index, it’s a filesort. It has nothing to do with files. Filesort should be called “sort.” It is quicksort at heart.</blockquote>
正解是，filesort这个名字有问题，容易给人误解，在mysql中，任何不能通过index进行的sort都称之为filesort，这里的filesort和文件没有任何关系，应该称之为“sort”而不是“filesort”，它的内部实现就是快速排序。

参考资料：
What does Using filesort mean in MySQL?
http://www.mysqlperformanceblog.com/2009/03/05/what-does-using-filesort-mean-in-mysql/

How MySQL executes ORDER BY
http://s.petrunia.net/blog/?p=24
