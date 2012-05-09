--- 
layout: post
comments: true
title: !binary |
  Q29mZmVlU2NyaXB06Kej5YazSmF2YVNjcmlwdOS4jee+jixOb2RlLmpz5r2c
  5Yqb5beo5aSn

date: 2012-1-28
link: false
categories: life
---
如果你对JavaScript感兴趣，但是不喜欢写一大堆一大堆的JavaScript代码，那真的不是你的错，因为很多人都说JavaScript不美，究其原因，可以归纳为：<strong><em>JavaScript的诞生是个悲剧. 它是函数式+动态语言的优秀内核, 却硬被绑上了C/Java的语法。</em></strong>

如果你真的喜欢JavaScript，那么你可以尝试了解更多～比如CoffeeScript，再比如Node.js，再比如Connect,再比如Express，再再比如jade，再再再比如npm等等，于是我们从安装npm（a package manager for node）开始～

<strong>#装npm</strong>
ice@mac:~ > curl http://npmjs.org/install.sh | sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  7881  100  7881    0     0   3664      0  0:00:02  0:00:02 --:--:--  8584
tar=/usr/bin/tar
version:
bsdtar 2.8.3 - libarchive 2.8.3
install npm@1.1
fetching: http://registry.npmjs.org/npm/-/npm-1.1.0-3.tgz
0.6.2
1.1.0-3
cleanup prefix=/usr/local

All clean!
/usr/local/bin/npm -> /usr/local/lib/node_modules/npm/bin/npm-cli.js
npm@1.1.0-3 /usr/local/lib/node_modules/npm
It worked
<!--more-->
#看看怎么用
ice@mac:~ > npm help

Usage: npm <command>

where <command> is one of:
    adduser, apihelp, author, bin, bugs, c, cache, completion,
    config, deprecate, docs, edit, explore, faq, find, get,
    help, help-search, home, i, info, init, install, la, link,
    list, ll, ln, login, ls, outdated, owner, pack, prefix,
    prune, publish, r, rb, rebuild, remove, restart, rm, root,
    run-script, s, se, search, set, show, star, start, stop,
    submodule, tag, test, un, uninstall, unlink, unpublish,
    unstar, up, update, version, view, whoami

npm <cmd> -h     quick help on <cmd>
npm -l           display full usage info
npm faq          commonly asked questions
npm help <term>  search for help on <term>
npm help npm     involved overview

Specify configs in the ini-formatted file:
    /Users/ice/.npmrc
or on the command line via: npm <command> --key value
Config info can be viewed via: npm help config

npm@1.1.0-3 /usr/local/lib/node_modules/npm

<strong>#用npm装connect</strong>
ice@mac:~ > npm install connect
npm http GET https://registry.npmjs.org/connect
npm http 200 https://registry.npmjs.org/connect
npm http GET https://registry.npmjs.org/connect/-/connect-1.8.5.tgz
npm http 200 https://registry.npmjs.org/connect/-/connect-1.8.5.tgz
npm http GET https://registry.npmjs.org/qs
npm http GET https://registry.npmjs.org/mime
npm http GET https://registry.npmjs.org/formidable
npm http 200 https://registry.npmjs.org/formidable
npm http 200 https://registry.npmjs.org/mime
npm http 200 https://registry.npmjs.org/qs
npm http GET https://registry.npmjs.org/formidable/-/formidable-1.0.8.tgz
npm http GET https://registry.npmjs.org/mime/-/mime-1.2.4.tgz
npm http GET https://registry.npmjs.org/qs/-/qs-0.4.1.tgz
npm http 200 https://registry.npmjs.org/mime/-/mime-1.2.4.tgz
npm http 200 https://registry.npmjs.org/formidable/-/formidable-1.0.8.tgz
npm http 200 https://registry.npmjs.org/qs/-/qs-0.4.1.tgz
connect@1.8.5 ./node_modules/connect 
├── mime@1.2.4
├── qs@0.4.1
└── formidable@1.0.8

<strong>#用npm装express</strong>
ice@mac:~ >  npm install express
npm http GET https://registry.npmjs.org/express
npm http 200 https://registry.npmjs.org/express
npm http GET https://registry.npmjs.org/express/-/express-2.5.6.tgz
npm http 200 https://registry.npmjs.org/express/-/express-2.5.6.tgz
npm http GET https://registry.npmjs.org/mime
npm http GET https://registry.npmjs.org/qs
npm http GET https://registry.npmjs.org/mkdirp/0.0.7
npm http 304 https://registry.npmjs.org/qs
npm http 304 https://registry.npmjs.org/mime
npm http 200 https://registry.npmjs.org/mkdirp/0.0.7
npm http GET https://registry.npmjs.org/mkdirp/-/mkdirp-0.0.7.tgz
npm http 200 https://registry.npmjs.org/mkdirp/-/mkdirp-0.0.7.tgz
express@2.5.6 ./node_modules/express 
├── mkdirp@0.0.7
├── mime@1.2.4
└── qs@0.4.1

<strong>#用npm装jade</strong>
ice@mac:~ > npm install jade
npm http GET https://registry.npmjs.org/jade
npm http 200 https://registry.npmjs.org/jade
npm http GET https://registry.npmjs.org/jade/-/jade-0.20.0.tgz
npm http 200 https://registry.npmjs.org/jade/-/jade-0.20.0.tgz
npm http GET https://registry.npmjs.org/commander
npm http GET https://registry.npmjs.org/mkdirp
npm http 200 https://registry.npmjs.org/mkdirp
npm http GET https://registry.npmjs.org/mkdirp/-/mkdirp-0.3.0.tgz
npm http 200 https://registry.npmjs.org/commander
npm http GET https://registry.npmjs.org/commander/-/commander-0.2.1.tgz
npm http 200 https://registry.npmjs.org/mkdirp/-/mkdirp-0.3.0.tgz
npm http 200 https://registry.npmjs.org/commander/-/commander-0.2.1.tgz
jade@0.20.0 ./node_modules/jade 
├── commander@0.2.1
└── mkdirp@0.3.0

好了，你入门了，更多资料，请自行查看如下链接的资料吧～

<strong>相关资料</strong>

CoffeeScript: CoffeeScript is a little language that compiles into JavaScript
http://coffeescript.org/

为什么CoffeeScript这么美?
http://cnodejs.org/blog/?p=1584

CoffeeScript: The beautiful way to write JavaScript
http://amix.dk/blog/post/19612

10个让朋友对你刮目相看的CoffeeScript单行代码绝技
http://heikezhi.com/2011/06/08/10-coffeescript-one-liners-to-impress-your-friends/

npm: a package manager for node
https://github.com/isaacs/npm

Express：http://expressjs.com/
High performance, high class web development for Node.js

Connect: Connect is a middleware layer for Node.js
http://www.senchalabs.org/connect/

jade: http://jade-lang.com/
Node Template Engine

coffee-box: Blog engine for fashionable developers. Built upon Node.js, Express, MongoDB and CoffeeScript.
https://github.com/qiao/coffee-box
