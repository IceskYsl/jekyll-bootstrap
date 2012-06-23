---
layout: post
title: 查看MYSQL表占用空间状态
date: '2008-8-19'
comments: true
categories: Database
link: true
---
比如需要查询库占用的空间和索引占用的空间：

<strong>查整个库的状态：</strong>
select concat(truncate(sum(data_length)/1024/1024,2),'MB') as data_size,
concat(truncate(sum(max_data_length)/1024/1024,2),'MB') as max_data_size,
concat(truncate(sum(data_free)/1024/1024,2),'MB') as data_free,
concat(truncate(sum(index_length)/1024/1024,2),'MB') as index_size
from information_schema.tables where TABLE_SCHEMA = 'databasename';

<strong>查单表：</strong>
select concat(truncate(sum(data_length)/1024/1024,2),'MB') as data_size,
concat(truncate(sum(max_data_length)/1024/1024,2),'MB') as max_data_size,
concat(truncate(sum(data_free)/1024/1024,2),'MB') as data_free,
concat(truncate(sum(index_length)/1024/1024,2),'MB') as index_size
from information_schema.tables where TABLE_NAME = 'tablename';
