--- 
layout: post
comments: true
title: Facebooker error UnableToLoadAdapter
date: "2009-11-26"
link: false
categories: life
---
If you see an error that looks like
<blockquote>/home/brickfactor/facebooker_tutorial/vendor/plugins/facebooker/lib/facebooker
/adapters/adapter_base.rb:43:in `load_adapter': Facebooker::AdapterBase::UnableToLoadAdapter (Facebooker::AdapterBase::UnableToLoadAdapter)
/RAILS_APP/vendor/plugins/facebooker/lib/facebooker/adapters/adapter_base.rb:43:in `load_adapter': Facebooker::AdapterBase::UnableToLoadAdapter (Facebooker::AdapterBase::UnableToLoadAdapter)
from /RAILS_APP/vendor/plugins/facebooker/lib/facebooker.rb:121:in `load_adapter'
from /RAILS_APP/vendor/plugins/facebooker/lib/facebooker.rb:65:in `apply_configuration'
from /RAILS_APP/vendor/plugins/facebooker/lib/facebooker.rb:45:in `load_configuration'
from /RAILS_APP/vendor/plugins/facebooker/rails/../init.rb:6</blockquote>
Its because you haven’t configured config/facebooker.yml file correctly, or at all. (Most tutorials etc. have you creating and editing this file after you install facebooker)
