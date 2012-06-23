---
layout: post
title: Layout in Rails（三种方法）
date: '2007-6-8'
comments: true
categories: Ruby&Rails
link: true
---
Rails里面的layout的主要思想是template的merge机制 — 即在布局中留下若干占位符。当HTTP请求过来，响应页面将具体内容插入到对应的占位符合并而成完成的内容,站在具体响应页面的角度看，当然“推”的处理方法项目可维护性更好。下面我们主要说说在Rails的controller中对layout的控制范围。*1. method级别的控制*。在某些特定的请求(对应rails controller里面一个method)需要特定的layout, 这时候可以&lt;code&gt;    class ExampleController &lt; AppplicationController       def index            render :layout =&gt; ‘my_layout’       end       def list       end    end&lt;/code&gt;*2. controller级别的控制*。很多情况下，需要对同一个controller中的所有或者大多数method应用一个layout。那么我们可以在controller级别上来定义layout&lt;code&gt;    class ExampleController &lt; AppplicationController       layout 'my_layout', :except =&gt; rss       # layout :my_def_layout       # layout proc{|c| …}        def index       end       def list       end    end&lt;/code&gt;我们可以使用layout函数的三种方式来处理对应的情况。*3. application级别的控制*。因为所有的controller都是继承于ApplicationController, 所以要在application的级别控制layout, 我们只要把2中的layout定义上升到ApplicationController class。比如对于应用程序而言，XMLHttpRequest不需要layout, 那么&lt;code&gt;    class ApplicationController &lt; ActionController::Base      layout proc{ |c| c.request.xhr? ? false : &quot;application&quot; }    end&lt;/code&gt;在以后我们将说说在layout中怎么插入多部分内容。
