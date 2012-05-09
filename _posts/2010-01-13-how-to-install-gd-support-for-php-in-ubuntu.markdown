--- 
layout: post
comments: true
title: Install GD Support for PHP in Ubuntu
date: 2010-1-13
link: false
categories: life
---
I am in the process of building my blog  using wordpress ,then i install SI CAPTCHA Anti-Spam ,but it's say i  didn’t have GD support for PHP5 installed on my server. so i  need to do:

Open terminal and type in the following command:
<blockquote>$ sudo apt-get install php5-gd</blockquote>

Now restart Apache
<blockquote># sudo /etc/init.d/apache2 restart</blockquote>

or restart  spawn-fcgi
<blockquote>/usr/bin/spawn-fcgi -a 127.0.0.1 -p 9100 -u www-data -g www-data -f /usr/bin/php-cgi -C 10</blockquote>

There you go, you now have GD Support for PHP5 in Ubuntu. Get your Drupal on!
