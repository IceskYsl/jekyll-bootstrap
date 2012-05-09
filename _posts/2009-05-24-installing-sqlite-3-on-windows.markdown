--- 
layout: post
comments: true
title: Installing SQLite 3 on Windows
date: 2009-5-24
link: false
categories: life
---
<p><span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Simsun; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="color: rgb(102, 0, 0); font-family: Georgia; font-size: 15px; letter-spacing: 1px; line-height: 24px;" class="Apple-style-span">Install SQLite3 for Windows by downloading the following 2 zip files and unzipping them into /WINDOWS/system32<br />
<a style="border-bottom: 1px dotted rgb(170, 34, 68); text-decoration: none; font-weight: bold; color: rgb(136, 51, 34);" href="http://www.sqlite.org/sqlite-3_2_7.zip">http://www.sqlite.org/sqlite-3_6_14_1.zip</a><br />
<a style="border-bottom: 1px dotted rgb(170, 34, 68); text-decoration: none; font-weight: bold; color: rgb(136, 51, 34);" href="http://www.sqlite.org/sqlitedll-3_2_7.zip">http://www.sqlite.org/sqlitedll-3_6_14_1.zip</a><br />
<a style="border-bottom: 1px dotted rgb(170, 34, 68); text-decoration: none; font-weight: bold; color: rgb(136, 51, 34);" href="http://www.sqlite.org/download.html">If those don't work try the official download site here</a></span></span></p>
<p><span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Simsun; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="color: rgb(102, 0, 0); font-family: Georgia; font-size: 15px; letter-spacing: 1px; line-height: 24px;" class="Apple-style-span">and now,you can open a cmd shell,and input </span></span><span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Simsun; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="color: rgb(102, 0, 0); font-family: Georgia; font-size: 15px; letter-spacing: 1px; line-height: 24px;" class="Apple-style-span">sqlite3 like this:<br />
</span></span></p>
<p><span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Simsun; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="color: rgb(102, 0, 0); font-family: Georgia; font-size: 15px; letter-spacing: 1px; line-height: 24px;" class="Apple-style-span">C:\Documents and Settings\Administrator&gt;sqlite3<br />
SQLite version 3.5.9<br />
Enter &quot;.help&quot; for instructions</span></span></p>
<p><span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Simsun; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="color: rgb(102, 0, 0); font-family: Georgia; font-size: 15px; letter-spacing: 1px; line-height: 24px;" class="Apple-style-span">and some help infos is here:</span></span></p>
<p><span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Simsun; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="color: rgb(102, 0, 0); font-family: Georgia; font-size: 15px; letter-spacing: 1px; line-height: 24px;" class="Apple-style-span">sqlite&gt; .help<br />
.bail ON|OFF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stop after hitting an error.&nbsp; Default OFF<br />
.databases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List names and files of attached databases<br />
.dump ?TABLE? ...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dump the database in an SQL text format<br />
.echo ON|OFF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Turn command echo on or off<br />
.exit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Exit this program<br />
.explain ON|OFF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Turn output mode suitable for EXPLAIN on or off.<br />
.header(s) ON|OFF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Turn display of headers on or off<br />
.help&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Show this message<br />
.import FILE TABLE&nbsp;&nbsp;&nbsp;&nbsp; Import data from FILE into TABLE<br />
.indices TABLE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Show names of all indices on TABLE<br />
.load FILE ?ENTRY?&nbsp;&nbsp;&nbsp;&nbsp; Load an extension library<br />
.mode MODE ?TABLE?&nbsp;&nbsp;&nbsp;&nbsp; Set output mode where MODE is one of:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; csv&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma-separated values<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; column&nbsp;&nbsp; Left-aligned columns.&nbsp; (See .width)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; html&nbsp;&nbsp;&nbsp;&nbsp; HTML &lt;table&gt; code<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; insert&nbsp;&nbsp; SQL insert statements for TABLE<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; line&nbsp;&nbsp;&nbsp;&nbsp; One value per line<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list&nbsp;&nbsp;&nbsp;&nbsp; Values delimited by .separator string<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tabs&nbsp;&nbsp;&nbsp;&nbsp; Tab-separated values<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TCL list elements<br />
.nullvalue STRING&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Print STRING in place of NULL values<br />
.output FILENAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Send output to FILENAME<br />
.output stdout&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Send output to the screen<br />
.prompt MAIN CONTINUE&nbsp; Replace the standard prompts<br />
.quit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Exit this program<br />
.read FILENAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Execute SQL in FILENAME<br />
.schema ?TABLE?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Show the CREATE statements<br />
.separator STRING&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Change separator used by output mode and .import<br />
.show&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Show the current values for various settings<br />
.tables ?PATTERN?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List names of tables matching a LIKE pattern<br />
.timeout MS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Try opening locked tables for MS milliseconds<br />
.width NUM NUM ...&nbsp;&nbsp;&nbsp;&nbsp; Set column widths for &quot;column&quot; mode</span></span></p>
