---
layout: post
title: ! 'Request-log-analyzer: Rails Merb的日志分析'
date: '2008-10-13'
comments: true
categories: Mac&*UNIX Ruby&Rails
tags: analyzer
link: true
---
生产环境下，需要对环境持续监控以尽快的发现问题，找到耗费资源较多的地方加以改进，比较常见的做法是使用moint或者God实时监控；另外，还可以定期分析日志找到特定的请求，虽然可以是shell来做这件事，但是何必再造轮子呢，因为我们已经有了<a href="http://github.com/wvanbergen/request-log-analyzer/tree/master">Request log analyzer</a> ：
{% codeblock %}<strong>简介：</strong>This is a simple command line tool to analyze request log files of both Rails andMerb. Its purpose is to find what actions are best candidates for optimization.This tool will parse all requests in the logfile and aggregate theinformation. Once it is finished parsing the log file, it will show therequests that take op most server time. Different metrics are used (cumulativetime, average time, blockers, DB time, etc)

<strong>安装：</strong>gem sources -a <a href="http://gems.github.com/">http://gems.github.com</a>sudo gem install wvanbergen-request-log-analyzer

<strong>使用：</strong>Usage: request-log-analyzer [FILE] [OPTION]Analyze the given log FILE with the given OPTIONExample: request-log-analyzer mongrel.log

  --fast, -t:                 Only use completed requests  --guess-database-time, -g:  Guesses the database duration of requests if they are not in the log  --output, -o:               Comma-separated list of reports to show      --amount, -c:               Displays the top &lt;amount&gt; elements in the reports  --colorize, -z:             Fancy bash coloring

<strong>示例：</strong>Note that this example was shortened for your viewing pleasure.$ request-log-analyzer /var/log/my_app.log

Request log analyzer, by Willem van Bergen and  Bart ten Brinke

Processing all log lines...========================================================================Successfully analyzed 58908 requests from log file

Timestamp first request: 2008-07-13T06:25:58+00:00Timestamp last request:  2008-07-20T06:18:53+00:00Total time analyzed: 7 daysMethods: DELETE (1%), GET (50%), POST (22%), PUT (25%).

Top 10 most requested actions========================================================================/overview/:date/                                  : 19359 requests/overview/day/:date/                              : 6365 requests/overview/:date/set/                              : 5589 requests/overview/                                        : 3985 requests/clients/:id/                                     : 1976 requests........

Top 10 actions by time - cumulative========================================================================/overview/:date/                                  :   9044.582s [19359 requests]/overview/                                        :   8478.767s [3985 requests]/overview/:date/set/                              :   3309.041s [5589 requests]/clients/:id/products/:id/                        :   1479.911s [924 requests]/clients/:id/                                     :    750.080s [1976 requests]........

Top 10 actions by time - per request mean========================================================================/overview/                                        :      2.128s [3985 requests]/clients/:id/products/:id/                        :      1.602s [924 requests]/overview/:date/set/                              :      0.592s [5589 requests]/overview/:date/                                  :      0.467s [19359 requests]/clients/:id/                                     :      0.380s [1976 requests]........

Top 10 worst DB offenders - cumulative time========================================================================/overview/:date/                                  :   8773.993s [19359 requests]/overview/                                        :   8394.754s [3985 requests]/overview/:date/set/                              :   3307.928s [5589 requests]/clients/:id/products/:id/                        :   1425.220s [924 requests]/clients/:id/                                     :    535.229s [1976 requests]........

Top 10 worst DB offenders - mean time========================================================================/overview/:id/:id/:id/print/                      :      6.994s [448 requests]/overview/                                        :      2.128s [3985 requests]/clients/:id/products/:id/                        :      1.602s [924 requests]/overview/:date/set/                              :      0.592s [5589 requests]/overview/:date/                                  :      0.467s [19359 requests]........

Mongrel process blockers (&gt; 1.0 seconds)========================================================================/overview/:date/                                  :   7494.233s [3144 requests]/overview/                                        :   8320.293s [1549 requests]/overview/:date/set/                              :   1149.235s [803 requests]/overview/:id/:id/:id/print/new/                  :    613.693s [341 requests]/clients/:id/products/:id/                        :   1370.693s [313 requests]........

Requests graph - per hour========================================================================         ........         7:00 - 2731                 : XXXXXXX         8:00 - 6139                 : XXXXXXXXXXXXXXXX         9:00 - 7465                 : XXXXXXXXXXXXXXXXXXXX        10:00 - 7118                 : XXXXXXXXXXXXXXXXXXX        11:00 - 7409                 : XXXXXXXXXXXXXXXXXXX        12:00 - 6450                 : XXXXXXXXXXXXXXXXX        13:00 - 5377                 : XXXXXXXXXXXXXX        14:00 - 6058                 : XXXXXXXXXXXXXXXX        15:00 - 4156                 : XXXXXXXXXXX        16:00 - 2767                 : XXXXXXX        17:00 - 1598                 : XXXX        18:00 - 792                  : XX        ........

Errors========================================================================ArgumentError: [237 requests] -&gt; invalid dateStaleObjectError: [28 requests] -&gt; Attempted to update a stale objectRuntimeError: [3 requests] -&gt; Cannot destroy rule before it was createdStatementError: [2 requests] -&gt; Mysql::Error: Deadlock found when trying to get lock; try restarting transactionNoMethodError: [1 requests] -&gt; undefined method `code' for nil:NilClass{% endcodeblock %}
