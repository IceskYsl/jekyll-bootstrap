--- 
layout: post
comments: true
title: TEXT fields in MySQL
date: 2010-6-28
link: false
categories: life
---
MySQL TEXT fields have a limit of 65,000 bytes. If you insert anything larger than that in to a normal TEXT field mySQL will silently truncate your data without telling you (meaning software checks are probably a good idea). MEDIUMTEXT will store 16 million characters and LONGTEXT can handle over 4 trillion, but this information does not appear to be readily available in the online mySQL manual (although it is hinted at in this table). Something to bare in mind when designing database applications.

MyISAM tables in MySQL have a maximum size of a row of 65,535 bytes, so all the data in a row must fit within that limit. However, the TEXT types are stored outside the table itself and only contribute 9 to 12 bytes towards that limit. (For more information about this refer to the MySQL Manual - Data Storage Requirements chapter).

ref::http://www.electrictoolbox.com/maximum-length-mysql-text-field-types/
TEXT data types are also able to store much more data than VARCHAR and CHAR text types so TEXT types are what you need to use when storing web page or similar content in a database.

The maximum amount of data that can be stored in each data type is as follows:

TINYTEXT	256 bytes
TEXT	65,535 bytes	~64kb
MEDIUMTEXT	 16,777,215 bytes	~16MB
BIGTEXT	4,294,967,295 bytes	~4GB
In most circumstances the TEXT type is probably sufficient, but if you are coding a content management system it's probably best to use the MEDIUMTEXT type for longer pages to ensure there are no issues with data size limits.
