---
layout: post
title: Creating_Small_Unique_Tokens_In_Ruby
date: '2010-9-20'
comments: true
categories: Ruby&Rails
link: true
---
<div id="_mcePaste">require "rubygems"</div>
<div id="_mcePaste">require 'active_support'</div>
<div id="_mcePaste">require 'digest'</div>
<div id="_mcePaste">#http://blog.logeek.fr/2009/7/2/creating-small-unique-tokens-in-ruby</div>
<div id="_mcePaste">puts "rand=&gt; " + rand(36**8).to_s(36)</div>
<div id="_mcePaste">puts "Digest::SHA1=&gt; "+Digest::SHA1.hexdigest("some-random-string")[8..16]</div>
<div id="_mcePaste">puts "ActiveSupport::SecureRandom=&gt;    "+ ActiveSupport::SecureRandom.base64(8).gsub("/","_").gsub(/=+$/,"")</div>
<div id="_mcePaste">puts ActiveSupport::SecureRandom::hex(8)</div>
<div id="_mcePaste">puts Array.new(4) { rand(256) }.pack('C*').unpack('H*').first</div>
require "rubygems"require 'active_support'require 'digest'
#http://blog.logeek.fr/2009/7/2/creating-small-unique-tokens-in-rubyputs "rand=&gt; " + rand(36**8).to_s(36)
puts "Digest::SHA1=&gt; "+Digest::SHA1.hexdigest("some-random-string")[8..16]puts "ActiveSupport::SecureRandom=&gt;    "+ ActiveSupport::SecureRandom.base64(8).gsub("/","_").gsub(/=+$/,"")
puts ActiveSupport::SecureRandom::hex(8)
puts Array.new(4) { rand(256) }.pack('C*').unpack('H*').first
