---
layout: post
title: Fixing_Ruby_no_such_file_to_load_readline_error_in_centOS
date: '2010-1-20'
comments: true
categories: Mac&*UNIX Ruby&Rails
link: true
---
Does this error message look familar when you script/console?
{% codeblock %}[iceskysl@li1248 current]$ ./script/console production
Loading production environment (Rails 2.3.5)
/usr/local/lib/ruby/1.8/irb/completion.rb:10:in `require': no such file to load -- readline (LoadError)
        from /usr/local/lib/ruby/1.8/irb/completion.rb:10
        from /usr/local/lib/ruby/1.8/irb/init.rb:252:in `require'
        from /usr/local/lib/ruby/1.8/irb/init.rb:252:in `load_modules'
        from /usr/local/lib/ruby/1.8/irb/init.rb:250:in `each'
        from /usr/local/lib/ruby/1.8/irb/init.rb:250:in `load_modules'
        from /usr/local/lib/ruby/1.8/irb/init.rb:21:in `setup'
        from /usr/local/lib/ruby/1.8/irb.rb:54:in `start'
        from /usr/local/bin/irb:13{% endcodeblock %}
this happens when readline is somehow different than your current version of ruby or corrupted. The quick fix is to recompile readline. To do it in CentOS with yum:
{% codeblock %}$> yum install readline-devel -y
$> cd /root/src/ruby-1.8.6-p114/ext/readline/
$> ruby extconf.rb
$> make
$> sudo make install {% endcodeblock %}
Now you should have script/console working.
