---
layout: post
title: Download_Ruby_Enterprise_Edition_REE_
date: '2010-3-4'
comments: true
categories: Ruby&Rails
tags: Passenger REE
link: true
---
前段时间用上了Passenger ，尔后就看到很多的人推荐使用Ruby Enterprise Edition(REE)，今天得闲，试了一把。
Step 1: Download
Source code: <a href="http://rubyforge.org/frs/download.php/68719/ruby-enterprise-1.8.7-2010.01.tar.gz" target="_blank">version 1.8.7-2010.01</a>
Step 2: Install
Extract it:
tar xzvf ruby-enterprise-X.X.X.tar.gz
Run the installer (completely safe, none of your system files will be touched!):
./ruby-enterprise-X.X.X/installer
<div id="_mcePaste">Welcome to the Ruby Enterprise Edition installer</div>
<div id="_mcePaste">This installer will help you install Ruby Enterprise Edition 1.8.7-2010.01.</div>
<div id="_mcePaste">Don't worry, none of your system files will be touched if you don't want them</div>
<div id="_mcePaste">to, so there is no risk that things will screw up.</div>
<div id="_mcePaste">You can expect this from the installation process:</div>
<div id="_mcePaste">1. Ruby Enterprise Edition will be compiled and optimized for speed for this</div>
<div id="_mcePaste">system.</div>
<div id="_mcePaste">2. Ruby on Rails will be installed for Ruby Enterprise Edition.</div>
<div id="_mcePaste">3. You will learn how to tell Phusion Passenger to use Ruby Enterprise</div>
<div id="_mcePaste">Edition instead of regular Ruby.</div>
<div id="_mcePaste">Press Enter to continue, or Ctrl-C to abort.</div>
<blockquote>Welcome to the Ruby Enterprise Edition installerThis installer will help you install Ruby Enterprise Edition 1.8.7-2010.01.Don't worry, none of your system files will be touched if you don't want themto, so there is no risk that things will screw up.
You can expect this from the installation process:
1. Ruby Enterprise Edition will be compiled and optimized for speed for this     system.

2. Ruby on Rails will be installed for Ruby Enterprise Edition.

3. You will learn how to tell Phusion Passenger to use Ruby Enterprise     Edition instead of regular Ruby.
Press Enter to continue, or Ctrl-C to abort.</blockquote>
Step 3: Make Phusion Passenger use Ruby Enterprise Edition instead of regular Ruby
Follow the instructions that the Ruby Enterprise Edition installer gave you.
