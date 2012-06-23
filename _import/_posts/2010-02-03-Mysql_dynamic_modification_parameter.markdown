---
layout: post
title: Mysql动态修改参数
date: '2010-2-3'
comments: true
categories: 技术归总 Database
tags: Database variables
link: true
---
mysql数据库也像ORACLE数据库一样，可以动态的修改参数，可以修改会话级变量只对当前会话产生影响；也可以修改全局变量，对所有新连接的会话都产生影响。

修改会话级变量
用show variables 命令查看当前参数的值,like 'pattern'用于模式匹配，查找指定的参数

mysql> show variables like '%sort_buffer_size%';
+---------------------------+------------+
| Variable_name             | Value      |
+---------------------------+------------+
| sort_buffer_size          | 6291448    |
+---------------------------+------------+
1 rows in set (0.00 sec)

用set SESSION命令设置会话级变量的新值

mysql> set SESSION sort_buffer_size=7000000;
Query OK, 0 rows affected (0.00 sec)

--修改会话级变量对当前会话来说立刻生效
mysql> show variables like '%sort_buffer_size%';
+---------------------------+------------+
| Variable_name             | Value      |
+---------------------------+------------+
| sort_buffer_size          | 7000000    |
+---------------------------+------------+
1 rows in set (0.00 sec)

mysql> exit
Bye
退出重新连接后，此参数恢复原值
[root@devdbc_stb root]# mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 40 to server version: 5.0.37-log

Type 'help;' or '\h' for help. Type '\c' to clear the buffer.

mysql> show variables like '%sort_buffer_size%';
+---------------------------+------------+
| Variable_name             | Value      |
+---------------------------+------------+
| sort_buffer_size          | 6291448    |
+---------------------------+------------+
1 rows in set (0.00 sec)

修改全局变量
[root@devdbc_stb root]# mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 40 to server version: 5.0.37-log

Type 'help;' or '\h' for help. Type '\c' to clear the buffer.

mysql> show variables like '%sort_buffer_size%';
+---------------------------+------------+
| Variable_name             | Value      |
+---------------------------+------------+
| sort_buffer_size          | 6291448    |
+---------------------------+------------+
1 rows in set (0.00 sec)

用set GLOBAL 命令设置全局变量

mysql> set GLOBAL sort_buffer_size = 7000000;
Query OK, 0 rows affected (0.00 sec)

mysql> show variables like '%sort_buffer_size%';
+---------------------------+------------+
| Variable_name             | Value      |
+---------------------------+------------+
| sort_buffer_size          | 6291448    |
+---------------------------+------------+
1 rows in set (0.00 sec)
当前此参数的值并不发生变化，先退出，然后重新连进去
mysql> exit
Bye
[root@devdbc_stb root]# mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 41 to server version: 5.0.37-log

Type 'help;' or '\h' for help. Type '\c' to clear the buffer.

mysql> show variables like '%sort_buffer_size%';
+---------------------------+------------+
| Variable_name             | Value      |
+---------------------------+------------+
| sort_buffer_size          | 7000000    |
+---------------------------+------------+
1 rows in set (0.00 sec)
新的参数值生效
