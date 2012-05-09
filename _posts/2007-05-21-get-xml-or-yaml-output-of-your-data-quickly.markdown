--- 
layout: post
comments: true
title: Get XML or YAML output of your data quickly
date: 2007-5-21
link: false
categories: life
---
It's not necessary to create a Builder .rxml template to export data as XML. ActiveRecord has a to_xml method that will output the object or result set in XML format. It works with simple objects, to complete tables with includes. Examples:User.find(:all).to_xmlPost.find(:all, :include =&gt; [:comments]).to_xmlYAML is also supported, by using to_yaml instead.
