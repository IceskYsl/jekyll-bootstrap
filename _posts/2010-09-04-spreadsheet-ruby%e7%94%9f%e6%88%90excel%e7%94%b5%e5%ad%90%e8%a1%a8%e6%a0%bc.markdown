--- 
layout: post
comments: true
title: !binary |
  c3ByZWFkc2hlZXQsIHJ1YnnnlJ/miJBFeGNlbOeUteWtkOihqOagvA==

date: 2010-9-4
link: false
categories: life
---
<span style="font-size: 13.2px;"><strong>安装gem：</strong></span>
<div>[root@iceskysl]# gem install spreadsheet --no-ri --no-rdoc</div>
<div id="_mcePaste">Successfully installed ruby-ole-1.2.10.1</div>
<div id="_mcePaste">Successfully installed spreadsheet-0.6.4.1</div>
<div id="_mcePaste">2 gems installed</div>
[root@iceskysl]# gem install spreadsheet --no-ri --no-rdocSuccessfully installed ruby-ole-1.2.10.1Successfully installed spreadsheet-0.6.4.12 gems installed

<strong>使用：</strong>

require 'rubygems'

require 'spreadsheet/excel'

SUM_SPREADSHEET = 'test.xls'

workbook = Spreadsheet::Excel.new(SUM_SPREADSHEET)

worksheet = workbook.add_worksheet('Random numbers and their sum.')

# sum = 0

# random_numbers = (0..9).collect { rand(100) }

#

# puts "random_numbers=#{random_numbers.size}"

# worksheet.write_column(0, 0, random_numbers)

# worksheet.write_column(0, 1, random_numbers)

worksheet.update_row 4, 'Hannes Wyss', 'Switzerland', 'Author'

row = worksheet.row(1)

row.push 'Creator of Ruby'

row.unshift 'Yukihiro Matsumoto'

# format = workbook.add_format(:bold =&gt; true)

# worksheet.write(10, 0, "Sum:", format)

# worksheet.write(10, 1, random_numbers.inject(0) { |sum, x| sum + x })

workbook.close

参考：

http://sg552.javaeye.com/blog/701428

http://sunfengcheng.javaeye.com/blog/240130
