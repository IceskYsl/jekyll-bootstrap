---
layout: post
title: Making_rhtml_better
date: '2007-5-19'
comments: true
categories: Ruby&Rails Security
link: true
---
It’s even easier like this:in app/views/layouts/application.rhtml:&lt;%= xhtml_doctype :strict %&gt;&lt;%= html_tag :lang =&gt; Globalize::Locale.active.language.iso_639_1 %&gt;&lt;%= @content_for_layout %&gt;&lt;%= end_html_tag %&gt;and in app/helpers/application_helper.rb:module ApplicationHelper  # Renders an xhtml doctype declaration for the document's prolog. Defaults to xhtml transitional.  # &lt;tt&gt;xhtml_doctype :strict&lt;/tt&gt;  def xhtml_doctype( doctype=:transitional )    doctype = :transitional unless [:transitional, :strict, :frameset].include? doctype    case doctype    when :transitional      '&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;'    when :strict      '&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Strict//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd&quot;&gt;'    when :frameset      '&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Frameset//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd&quot;&gt;'    end  end  # Displays an html tag, complete with xhtml namespace and language. Accepts language as an option, but defaults to English.  # &lt;tt&gt;html_tag :lang =&gt; 'de'&lt;/tt&gt;  def html_tag( options={} )    options[:lang] ||= 'en'    lang = options.delete( :lang )    &quot;&lt;html xmlns=\&quot;http://www.w3.org/1999/xhtml\&quot; lang=\&quot;#{lang}\&quot; xml:lang=\&quot;#{lang}\&quot; #{options.map { |k,v| &quot;#{k}=\&quot;#{v}\&quot;&quot; }.join( ' ' )}&gt;&quot;   end  # End html tag.  def end_html_tag; &quot;&lt;/html&gt;&quot; endend
