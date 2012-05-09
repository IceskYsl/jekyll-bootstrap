--- 
layout: post
comments: true
title: install mercurial and Go Programming Language
date: "2009-11-13"
link: false
categories: life
---
Having installed mercurial via easy_install,
<blockquote>eoe:~ IceskYsl$ sudo easy_install mercurial
Password:
Searching for mercurial
Reading http://pypi.python.org/simple/mercurial/
Reading http://www.selenic.com/mercurial
Best match: mercurial 1.3.1</blockquote>
any hg command fails with:
ValueError: unknown locale: UTF-8

This is mercurial 1.3.1and Python 2.6.1, but its seem that its caused by Leopard’s Term.app not setting the local encoding correctly. To resolve this, add the following to .profile:
<blockquote>export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8</blockquote>
then i clone the code for   Go Programming Language
<blockquote>eoe:system IceskYsl$ printenv LANG
eoe:system IceskYsl$ export LC_ALL=en_US.UTF-8
eoe:system IceskYsl$   export LANG=en_US.UTF-8
eoe:system IceskYsl$ hg clone -r release https://go.googlecode.com/hg/  go
requesting all changes
adding changesets
adding manifests
adding file changes
added 3976 changesets with 16799 changes to 2931 files
updating working directory
1640 files updated, 0 files merged, 0 files removed, 0 files unresolved</blockquote>
<a href="http://www.ibm.com/developerworks/cn/opensource/os-cn-mercurial/" target="_blank">http://www.ibm.com/developerworks/cn/opensource/os-cn-mercurial/</a>
