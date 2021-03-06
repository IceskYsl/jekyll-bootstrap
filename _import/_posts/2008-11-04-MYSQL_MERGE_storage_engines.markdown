---
layout: post
title: MYSQL的MERGE存储引擎
date: '2008-11-4'
comments: true
categories: Database
link: true
---
<p>MYSQL的引擎不是一般的多，这次说到的是MERGE，这个引擎有很多特殊的地方：</p>
<p>MERGE引擎类型允许你把许多结构相同的表合并为一个表。然后，你可以执行查询，从多个表返回的结果就像从一个表返回的结果一样。每一个合并的表必须有同样的表定义。<br />
<br />
MERGE存储引擎在下面这种使用场合会最为有用，如果需要把日志纪录不停的录入MySQL数据库，并且每天、每周或者每个月都创建一个单一的表，而且要制作来自多个表的合计查询，MERGE表这时会非常有效。然而，这项功能有局限性。你只能合并MyISAM表而且必须严格遵守相同的表定义的限制。虽然这看起来好像是一个大问题，但是，如果你使用另外一种表类型(例如InnoDB)，这种合并可能就不需要了。</p>
<p>其创建方法如下：</p>
<p>他将多个表在逻辑上当作一个表来查询。他建立后有两个文件， <br />
.frm 表结构定义 <br />
.mrg union表的名字清单 <br />
<br />
两个基本表:  <br />
CREATE TABLE TEST_MERGE_1( <br />
ID INT(5) NOT NULL, <br />
VALUE VARCHAR(100)  NOT NULL, <br />
PRIMARY KEY(ID) <br />
) ENGINE=MyISAM DEFAULT CHARSET=utf8 <br />
CREATE TABLE TEST_MERGE_2( <br />
ID INT(5)  NOT NULL, <br />
VALUE VARCHAR(100) NOT NULL, <br />
PRIMARY KEY(ID) <br />
)  ENGINE=MyISAM DEFAULT CHARSET=utf8 <br />
<br />
MERGE表的建立： <br />
CREATE TABLE TEST_MERGE( <br />
ID INT(5) NOT NULL,  <br />
VALUE VARCHAR(100) NOT NULL, <br />
PRIMARY KEY(ID) <br />
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(TEST_MERGE_1,TEST_MERGE_2) ;</p>
<p><br />
1.  此表类似于SQL中的union机制。 <br />
2. 此表结构必须与基本表完全一致，包括列名、顺序。UNION表必须同属一个DATABASE。 <br />
3.  基本表类型必须是MyISAM。 <br />
4. 可以通过修改.mrg文件来修改MERGE表，每个基本表的名字占一行。注意：修改后要通过FLUSH  TABLES刷新表缓存。 <br />
5. 对基本表的更改可以直接反映在此表上。 <br />
6. INSERT_METHOD的取值可以是： 0 不允许插入 FIRST  插入到UNION中的第一个表 LAST 插入到UNION中的最后一个表。(4.0之后可用) <br />
7.  定义在它上面的约束没有任何作用，约束是由基本表控制的，例如两个基本表中存在着同样的一个Key值，那么在MERGE表中会有两个一样的Key值。</p>
<p>&nbsp;</p>
<p>参考资料：</p>
<p>http://biz.chinabyte.com/220/2230720.shtml</p>
<p>http://info.codepub.com/2008/09/info-21832.html</p>
