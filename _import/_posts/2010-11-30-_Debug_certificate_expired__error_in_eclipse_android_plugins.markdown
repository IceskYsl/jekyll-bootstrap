---
layout: post
title: _Debug_certificate_expired__error_in_eclipse_android_plugins
date: '2010-11-30'
comments: true
categories: Android&Java
tags: certificate
link: true
---
I am using eclipse android plugins to build a project, But i am getting this error in the console window:

[2010-02-03 10:31:14 - androidVNC]Error generating final archive:
Debug certificate expired on 1/30/10 2:35 PM!

IceskYsl@eoe ~/.android $ pwd
/Users/IceskYsl/.android
IceskYsl@eoe ~/.android $ ll
total 48
drwxr-xr-x   9 IceskYsl  staff   306 Nov 17  2009 .
drwxr-xr-x+ 62 IceskYsl  staff  2108 Nov 30 13:51 ..
-rw-r--r--   1 IceskYsl  staff   123 Sep 30 15:42 adb_usb.ini
-rw-r--r--   1 IceskYsl  staff   204 Dec  1 00:52 androidtool.cfg
drwxr-xr-x   6 IceskYsl  staff   204 Oct 16 16:17 avd
-rw-r--r--   1 IceskYsl  staff  1393 Dec  1 00:37 ddms.cfg
-rw-r--r--   1 IceskYsl  staff  1267 Nov 17  2009 debug.keystore
-rw-r--r--   1 IceskYsl  staff   759 Nov 17  2009 default.keyset
-rw-r--r--   1 IceskYsl  staff    78 Dec  1 00:52 repositories.cfg

Delete your debug certificate under ~/.android/debug.keystore (on Linux and Mac OS X); the directory is something like %USERHOME%/.androidon Windows.

The Eclipse plugin should then generate a new certificate when you next try to build a debug package.
