--- 
layout: post
comments: true
title: Thin version 1.0.0 is out!
date: 2008-10-7
link: false
categories: life
---
Thin version 1.0.0 (codename That's What She Said) is out!

Yes 1.0! That doesn't mean it's bug free or anything. But, it does
mean that it's been running on a number of servers and no show stopper
bugs have been found since a while.

Also see http://macournoyer.wordpress.com/2008/09/30/thin-10/

<strong>== What's new?</strong>

* Fixed vlad.rake to allow TCP or socket [hellekin]
* Updated Mack adapter to handle both &lt;0.8.0 and &gt;0.8.0 [Mark Bates]
* rails rack adapter uses File.readable_real? so it recognizes ACL
permissions [Ricardo Chimal]
* Log a warning if Rack application returns nil body [Michael S.
Klishin]
* Handle nil and Time header values correctly [#76 state:resolved]
[tmm1]
* Add Content-Length header to response automatically when possible
[#74 state:resolved] [dkubb]
* Runner now remembers -r, -D and -V parameters so that clustered
servers inherit those and
keep your parameters.
* Make Set-Cookie header, in Rails adapter, compatible with current
Rack spec [Pedro Belo]
[#73, state:resolved]
* Add --no-epoll option to disable epoll usage on Linux [#61
state:resolved]
* Add --force (-f) option to force stopping of a daemonized server
[#72 state:resolved]
* Update halycon adapter loader [mtodd]

<strong>== Get it!</strong>

Install Thin from RubyForge:

gem install thin

Or using my mirror:

gem install thin --source http://code.macournoyer.com

<strong>参考文档：</strong>
http://groups.google.com/group/thin-ruby/browse_thread/thread/402d51a6d9f2651d
