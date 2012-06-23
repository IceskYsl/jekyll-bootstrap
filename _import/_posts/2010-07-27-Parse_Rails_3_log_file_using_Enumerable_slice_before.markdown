---
layout: post
title: Parse_Rails_3_log_file_using_Enumerable_slice_before
date: '2010-7-27'
comments: true
categories: Ruby&Rails
tags: log rails3 slice_before
link: true
---
{% codeblock %}def parse_rails_log_file(file)
  # Remove all empty lines
  lines = file.each_line.map(&amp;:strip).reject(&amp;:empty?)

  # Use +Enumerable#slice_before+ to slice log file into sections for each request
  lines.slice_before(/Started (GET|POST|PUT|DELETE)/).each_with_object({}) do |request_log, totals|
    # Only include successfully finished actions in report
    if duration = request_log.last[/Completed 200 OK in (?&lt;duration&gt;\d+)ms/, :duration]
      action_name = request_log.first[/Started (GET|POST|PUT|DELETE) "(?&lt;action&gt;.+?)" for/, :action]
      totals[action_name] ||= 0
      totals[action_name] += duration.to_i
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  require "pp"
  puts "Parsing Rails 3 log file (extracting cumulative running time per request path):"
  puts "================="

  log_file = &lt;&lt;-LOG_FILE
  Started GET "/index" for 192.168.74.1 at 2010-03-09 11:37:40
    Processing by UpdatesController#index as HTML
    Update Load (0.5ms)  SELECT `updates`.* FROM `updates` ORDER BY created_at DESC
  Rendered updates/index.html.erb (16.7ms)
  Completed 200 OK in 71ms (Views: 44.3ms | ActiveRecord: 0.5ms)

  Started POST "/updates" for 192.168.74.1 at 2010-03-09 11:37:43
    Processing by UpdatesController#create as HTML
    Parameters: {"commit"=&gt;"Save changes"}
    Update Load (0.4ms)  SELECT `updates`.* FROM `updates` ORDER BY created_at DESC
  Rendered updates/index.html.erb (1.3ms)
  Completed 200 OK in 60ms (Views: 32.1ms | ActiveRecord: 0.4ms)

  Started GET "/updates" for 192.168.74.1 at 2010-03-09 11:45:51
    Processing by UpdatesController#index as HTML

  TypeError (exception class/object expected):
    app/controllers/updates_controller.rb:3:in `raise'
    app/controllers/updates_controller.rb:3:in `index'

  Rendered /usr/local/rvm/gems/ruby-1.9.2-head/bundler/gems/rails-16a5e918a06649ffac24fd5873b875daf66212ad-master/actionpack/lib/action_dispatch/middleware/templates/rescues/_trace.erb (1.6ms)
  Rendered /usr/local/rvm/gems/ruby-1.9.2-head/bundler/gems/rails-16a5e918a06649ffac24fd5873b875daf66212ad-master/actionpack/lib/action_dispatch/middleware/templates/rescues/_request_and_response.erb (2.9ms)
  Rendered /usr/local/rvm/gems/ruby-1.9.2-head/bundler/gems/rails-16a5e918a06649ffac24fd5873b875daf66212ad-master/actionpack/lib/action_dispatch/middleware/templates/rescues/diagnostics.erb within /usr/local/rvm/gems/ruby-1.9.2-head/bundler/gems/rails-16a5e918a06649ffac24fd5873b875daf66212ad-master/actionpack/lib/action_dispatch/middleware/templates/rescues/layout.erb (23.9ms)

  Started GET "/updates" for 192.168.74.1 at 2010-03-09 11:45:58
    Processing by UpdatesController#index as HTML
    Update Load (0.3ms)  SELECT `updates`.* FROM `updates` ORDER BY created_at DESC
  Rendered updates/index.html.erb (1.1ms)
  Completed 200 OK in 100ms (Views: 29.3ms | ActiveRecord: 0.3ms)
  LOG_FILE

  pp parse_rails_log_file(log_file) # =&gt; {"/index"=&gt;71, "/updates"=&gt;160}
end{% endcodeblock %}
