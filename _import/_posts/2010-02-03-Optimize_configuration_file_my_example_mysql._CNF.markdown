---
layout: post
title: 实例优化mysql配置文件my.cnf
date: '2010-2-3'
comments: true
categories: 技术归总 Database
tags: centOS Database my.cnf
link: true
---
这些天给我们的一个产品的服务器端加上了memcached，发现性能相当好，在newrelic上监控到每个请求差不多能稳定在100ms以下，开上10个ruby实例，每分钟处理几千个请求不是问题，但是耶发现munin的监控，MYSQL在过期缓冲的时候还是又慢查询，因为我有个表应该又100W的数据了。

晓得MYSQL默认的一些配置不合适，只是一直没来得及调整，今天查了下资料，讲相关的配置调整了下，调整后的如下，如果你是又这方面的经验，发现不合理的还请指出，谢谢。
机器配置：
CentOS release 5.3，CPU（Intel(R) Xeon(R) CPU           L5420  @ 2.50GHz） RAM 3G，disk 200G

my.cnf配置
<blockquote>
# Example MySQL config file for large systems.
#
# This is for a large system with memory = 512M where the system runs mainly
# MySQL.
#
# You can copy this file to
# /etc/my.cnf to set global options,
# mysql-data-dir/my.cnf to set server-specific options (in this
# installation this directory is /var/lib/mysql) or
# ~/.my.cnf to set user-specific options.
#
# In this file, you can use all long options that a program supports.
# If you want to know which options a program supports, run the program
# with the "--help" option.

# The following options will be passed to all MySQL clients
[client]
port            = 3306
socket          = /var/lib/mysql/mysql.sock

# Here follows entries for some specific programs

# The MySQL server
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
skip-locking

# By default, the wait_timeout value is 28800. Unless you want MySQL to keep waiting for 28800 seconds (480 minutes or 8 hours),
# please decrease its value according to your application needs.
wait_timeout=60
# Increase connect_timeout from 5 to 10
connect_timeout=10
# Decrease interactive_timeout from 28800 to 100
interactive_timeout=120
# Increase join_buffer_size from 131072 to 1M
join_buffer_size=1M
# Increase query_cache_size from 0 to 128M
query_cache_size=32M
# Increase query cache limit from 1048576 to 2M
query_cache_limit=2M
# Increase max allowed packet size from 1M to 16M
max_allowed_packet=2M
# Increase table cache cache from 256 to 1024
table_cache=1024
# Increase sort buffer size from 1M
sort_buffer_size=2M
# Increase read buffer size from 1M
read_buffer_size=2M
# Increase read_rnd_buffer_size to 4M
read_rnd_buffer_size=4M

#Other settings
sort_buffer_size=8M
key_buffer = 256M
key_buffer_size=64M
myisam_sort_buffer_size = 64M
thread_cache_size = 8
# Try number of CPU's*2 for thread_concurrency
thread_concurrency = 2


# Don't listen on a TCP/IP port at all. This can be a security enhancement,
# if all processes that need to connect to mysqld run on the same host.
# All interaction with mysqld must be made via Unix sockets or named pipes.
# Note that using this option without enabling named pipes on Windows
# (via the "enable-named-pipe" option) will render mysqld useless!
#
#skip-networking

# Disable Federated by default
skip-federated

old_passwords=1

#for slow queries
log-slow-queries = /var/log/mysql-slow.log
long_query_time = 3

[mysqldump]
quick
max_allowed_packet = 16M

[mysql]
no-auto-rehash
# Remove the next comment character if you are not familiar with SQL
#safe-updates

[isamchk]
key_buffer = 128M
sort_buffer_size = 128M
read_buffer = 2M
write_buffer = 2M

[myisamchk]
key_buffer = 128M
sort_buffer_size = 128M
read_buffer = 2M
write_buffer = 2M

[mysqlhotcopy]
interactive-timeout

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
</blockquote>
