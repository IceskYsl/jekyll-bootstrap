--- 
layout: post
comments: true
title: "mysql sort \xE6\x80\xA7\xE8\x83\xBD\xE4\xBC\x98\xE5\x8C\x96\xEF\xBC\x9Amax_length_for_sort_data"
date: 2010-2-3
link: false
categories: life
---
发现VARIABLES里有个max_length_for_sort_data，其值是1024，感觉很小，如下
<blockquote>mysql> SHOW VARIABLES like "%sort%";
+---------------------------+------------+
| Variable_name             | Value      |
+---------------------------+------------+
| max_length_for_sort_data  | 1024       |
| max_sort_length           | 1024       |
| myisam_max_sort_file_size | 2146435072 |
| myisam_sort_buffer_size   | 67108864   |
| sort_buffer_size          | 8388608    |
+---------------------------+------------+
5 rows in set (0.00 sec)</blockquote>

不晓得是做啥用的，查了下资料：
<blockquote>http://forge.mysql.com/wiki/MySQL_Internals_Algorithms

Using the modified filesort algorithm, the tuples are longer than the pairs used in the original method, and fewer of them fit in the sort buffer (the size of which is given by sort_buffer_size). As a result, it is possible for the extra I/O to make the modified approach slower, not faster. To avoid a slowdown, the optimization is used only if the total size of the extra columns in the sort tuple does not exceed the value of the max_length_for_sort_data system variable. (A symptom of setting the value of this variable too high is that you should see high disk activity and low CPU activity.)</blockquote>

mysql的filesort有两个方法,MySQL 4.1之前是使用方法A, 之后版本会使用改进的算法B, 但使用方法B的前提是列长度的值小于max_length_for_sort_data, 但我们系统中的列的长度的值会大于1024. 因此也就是说在sort的时候, 是在使用方法A, 而方法A的性能比较差
