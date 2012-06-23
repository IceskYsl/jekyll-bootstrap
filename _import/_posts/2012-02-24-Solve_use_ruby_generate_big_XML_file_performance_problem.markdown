---
layout: post
title: 解决用ruby生成大xml文件的性能问题
date: '2012-2-24'
comments: true
categories: Ruby&Rails
link: true
---
近日遇到一个需求是定期生成一个很大的xml文件，可能会10多w个item，过程中需要查询数据库，需要一些运算，遇到了性能问题，开始使用nokogiri，但是很慢很慢，大概的代码如下：
{% codeblock %}
require 'rubygems'
require 'nokogiri'
a = Time.now
builder = Nokogiri::XML::Builder.new do |xml|
  xml.root {
    (1..500000).each do |k|
    xml.products {
      xml.widget {
        xml.id_ k
        xml.name "Awesome iceskysl widget"
      }
    }
    end
  }
end
o = File.new("test_noko.xml", "w")
o.write(builder.to_xml)
o.close
puts (Time.now-a).to_s
{% endcodeblock %}

这个代码有2个主要的问题：
1. 慢
2. 耗内存

于是我们有两个解决方案，分别是：
<!--more-->

<strong>1.用libxml-ruby替代nokogiri，因为nokogiri优势是读取的快，写的花一般，用libxml-ruby可以这样</strong>
{% codeblock %}
require 'rubygems'
require 'xml'
doc = XML::Document.new()
doc.root = XML::Node.new('root_node')
root = doc.root

500000.times do |k|
  root << elem1 = XML::Node.new('products')
  elem1 << elem2 = XML::Node.new('widget')
  elem2['id'] = k.to_s
  elem2['name'] = 'Awesome widget'
end

doc.save('foo.xml', :indent => false, :encoding => XML::Encoding::UTF_8)
{% endcodeblock %}
执行的结构类似
ice@mac:/source/labs/xml > time ruby test_xml2.rb 
real	0m50.065s
user	0m4.594s
sys	0m0.509s

<strong>2. 直接写，示范代码如下</strong>
f = File.open("foo.xml", "w")
f.puts("<?xml version=\"1.0\" encoding=\"gbk\"?>")
f.puts('<doc>')
500000.times do |k|
  f.puts "<product><widget id=\"#{k} name=\"Awesome widget\" /></product>"
end
f.puts('</doc>')
f.close

运行结构类似这样的：
ice@mac:/source/labs/xml > time ruby test_xml.rb 
real	0m0.974s
user	0m0.813s
sys	0m0.063s

从上面可以看到，效率差别还是蛮大的，回到我自己的case里来，原来需要6个小时的job现在不要30分钟就搞定了（自然还有一些其他的优化，就不细说了）～～
