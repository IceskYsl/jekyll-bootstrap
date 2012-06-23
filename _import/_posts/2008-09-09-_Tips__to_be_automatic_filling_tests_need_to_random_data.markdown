---
layout: post
title: ! '[Tips]自动填充测试需要的随机数据'
date: '2008-9-9'
comments: true
categories: Ruby&Rails
link: true
---
经常遇到一些新功能开发完了，需要测试一些指标，比如性能测试等等，这个时候如果人工填充数据会非常囧的，你可以写rake来自己构造填充数据，你需要处理随机产生等情况，现在不必费心了，使用<a href="http://faker.rubyforge.org/rdoc/">Faker</a> Gem和<a href="http://github.com/ryanb/populator/tree/master">populator</a>可以快速的构造需要的数据。

<strong>Faker</strong>
A port of Perl‘s Data::Faker library that generates fake data.

<strong>Populator</strong>
Populate an Active Record database with mass insert.

<strong>安装需要的gem：</strong>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>gem install populator  </span></span></li>
	<li><span>gem install faker  </span></li>
	<li class="alt"><span>rake db<span class="symbol">:populate</span><span>  </span></span></li>
</ol>
</div>
写rake代码：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="comment"># lib/tasks/populate.rake</span><span>  </span></span></li>
	<li><span>namespace <span class="symbol">:db</span><span> </span><span class="keyword">do</span><span>  </span></span></li>
	<li class="alt"><span>  desc <span class="string">"Erase and fill database"</span><span>  </span></span></li>
	<li><span>  task <span class="symbol">:populate</span><span> =&gt; </span><span class="symbol">:environment</span><span> </span><span class="keyword">do</span><span>  </span></span></li>
	<li class="alt"><span>    require <span class="string">'populator'</span><span>  </span></span></li>
	<li><span>    require <span class="string">'faker'</span><span>  </span></span></li>
	<li class="alt"><span>      </span></li>
	<li><span>    [Category, Product, Person].<span class="keyword">each</span><span>(&amp;</span><span class="symbol">:delete_all</span><span>)  </span></span></li>
	<li class="alt"><span>      </span></li>
	<li><span>    Category.populate 20 <span class="keyword">do</span><span> |category|  </span></span></li>
	<li class="alt"><span>      category.name = Populator.words(1..3).titleize  </span></li>
	<li><span>      Product.populate 10..100 <span class="keyword">do</span><span> |product|  </span></span></li>
	<li class="alt"><span>        product.category_id = category.id  </span></li>
	<li><span>        product.name = Populator.words(1..5).titleize  </span></li>
	<li class="alt"><span>        product.description = Populator.sentences(2..10)  </span></li>
	<li><span>        product.price = [4.99, 19.95, 100]  </span></li>
	<li class="alt"><span>        product.created_at = 2.years.ago..<span class="builtin">Time</span><span>.now  </span></span></li>
	<li><span>      <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>    <span class="keyword">end</span><span>  </span></span></li>
	<li><span>      </span></li>
	<li class="alt"><span>    Person.populate 100 <span class="keyword">do</span><span> |person|  </span></span></li>
	<li><span>      person.name    = Faker::Name.name  </span></li>
	<li class="alt"><span>      person.company = Faker::Company.name  </span></li>
	<li><span>      person.email   = Faker::Internet.email  </span></li>
	<li class="alt"><span>      person.phone   = Faker::PhoneNumber.phone_number  </span></li>
	<li><span>      person.street  = Faker::Address.street_address  </span></li>
	<li class="alt"><span>      person.city    = Faker::Address.city  </span></li>
	<li><span>      person.state   = Faker::Address.us_state_abbr  </span></li>
	<li class="alt"><span>      person.zip     = Faker::Address.zip_code  </span></li>
	<li><span>    <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
参考：

<a href="http://github.com/ryanb/populator/tree/master">http://github.com/ryanb/populator/tree/master</a>

<a href="http://faker.rubyforge.org/rdoc/">http://faker.rubyforge.org/rdoc/</a>

<a href="http://railscasts.com/episodes/126-populating-a-database">http://railscasts.com/episodes/126-populating-a-database</a>
