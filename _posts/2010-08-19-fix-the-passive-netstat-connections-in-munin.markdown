--- 
layout: post
comments: true
title: Fix the passive netstat connections in Munin
date: 2010-8-19
link: false
categories: life
---
<strong> </strong>

<strong><img title="Munin Logo" src="http://www.silverark.co.uk/files/munin.png" alt="Munin Logo" width="100" height="26" />If your running Munin in WHM they you may have noticed the passive netstat connections have been rising steadily over the last couple of weeks. This isn't a problem with your server, its a Munin bug that can be easily fixed.</strong>

<strong> </strong>

<img title="Passive netstat connection - Munin" src="http://www.silverark.co.uk/files/netstat.png" alt="Passive netstat  connection - Munin" width="250" height="134" />

Apparently the problem stemms from Munin counting the passive connections rejected. You can fix this problem quite easily by following the instructions below

Edit the following file:
/usr/share/munin/plugins/netstat

and change the line
<div id="_mcePaste"><em>netstat -s | awk '/active connections/ { print "active.value " $1 } /passive connection/ { print "passive.value " $1 } /failed connection/ { print "failed.value " $1 } /connection resets/ { print "resets.value " $1 } /connections established/ { print "established.value " $1 }'</em></div>
<div>to</div>
<div id="_mcePaste"><em>netstat -s | awk '/active connections/ { print "active.value " $1 } /passive connection openings/ { print "passive.value " $1 } /failed connection/ { print "failed.value " $1 } /connection resets/ { print "resets.value " $1 } /connections established/ { print "established.value " $1 }'</em></div>
<strong> ref:</strong>
http://markmaunder.com/2008/how-to-fix-munins-netstat-passive-connections-increasing-constantly/
http://www.silverark.co.uk/knowledge/hosting/fix-the-passive-netstat-connections-in-munin
