---
layout: post
title: Get_XML_or_YAML_output_of_your_data_quickly
date: '2007-5-21'
comments: true
categories: Ruby&Rails
link: true
---
It's not necessary to create a Builder .rxml template to export data as XML. ActiveRecord has a to_xml method that will output the object or result set in XML format. It works with simple objects, to complete tables with includes. Examples:User.find(:all).to_xmlPost.find(:all, :include =&gt; [:comments]).to_xmlYAML is also supported, by using to_yaml instead.
