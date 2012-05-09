--- 
layout: post
comments: true
title: !binary |
  5ZyocmFpbHPpobnnm65hbmRyb2lkLWdyb3Vw5Lit6ZuG5oiQQWtpc21ldA==

date: 2012-1-2
link: false
categories: life
---
前面一篇文章《<a href="http://iceskysl.1sters.com/?p=860" target="_blank">防范垃圾利器Akismet使用体验和原理分析</a>》讲到Akismet的原理，其中说到看谁有兴趣给dz加个类似的功能，我是懒得写php的code，写写rails的还有点兴趣，于是在<a href="https://github.com/IceskYsl/android-group" target="_blank">android-group</a>这个项目里添加了下，android-group是直接fork的<a href="https://github.com/huacnlee/ruby-china" target="_blank">ruby-china</a>，把大概过程说下：

<strong>1. 加插件ruby-akismet</strong>
已经有人写了akismet的ruby插件https://github.com/joshfrench/rakismet，有有人封装了一次https://github.com/ysbaddaden/ruby-akismet，就很好使用了。
<pre lang="ruby" line="1">
＃Add this gem to your Gemfile:
gem 'ruby-akismet', :require =&gt; 'akismet'
{% endcodeblock %}


＃Create an initializer file like config/initializers/akismet.rb with your configuration:
<pre lang="ruby" line="1">
Akismet.key = '123456789'
Akismet.blog = 'http://example.com'
Akismet.logger = Rails.logger
{% endcodeblock %}
<!--more-->
<strong>2. 修改代码</strong>
<strong>＃修改Reply.rb，添加</strong>
<pre lang="ruby" line="1">
field :spam, :type =&gt; Boolean, :default =&gt; false
{% endcodeblock %}
<strong>＃修改RepliesController</strong>
<pre lang="ruby" line="1">
# coding: utf-8
class RepliesController &lt; ApplicationController{% endcodeblock %}

load_and_authorize_resource :reply

before_filter :find_topic
def create

@reply = @topic.replies.build(params[:reply])

@reply.user_id = current_user.id
@reply.spam = Akismet.spam?(akismet_attributes, request)
logger.info("akismet_attributes:#{akismet_attributes}")
logger.info("@reply.spam:#{@reply.spam}")
if @reply.save
current_user.read_topic(@topic)
@msg = t("topics.reply_success")
else
@msg = @reply.errors.full_messages.join("
")
end
end

def edit
@reply = current_user.replies.find(params[:id])
drop_breadcrumb(t("menu.topics"), topics_path)
drop_breadcrumb t("reply.edit_reply")
end

def update
@reply = current_user.replies.find(params[:id])

if @reply.update_attributes(params[:reply])
redirect_to(topic_path(@reply.topic_id), :notice =&gt; '回帖更新成功.')
else
render :action =&gt; "edit"
end
end

protected

def akismet_attributes
{
:comment_author =&gt; @reply.user.login,
:comment_author_url =&gt; user_url(@reply.user.login),
:comment_author_email =&gt; @reply.user.email,
:comment_content =&gt; @reply.body,
:permalink =&gt; topic_url(@reply.topic_id)
}
end

def find_topic
@topic = Topic.find(params[:topic_id])
end

end

{% endcodeblock %}

＃修改Cpanel::RepliesController，增加如下两个方法
<pre lang="ruby" line="1">
def spam
@reply = Reply.find(params[:id])
@reply.update_attribute(:spam, true)
Akismet.submit_spam(akismet_attributes)
redirect_to(cpanel_replies_path)
end

def ham
@reply = Reply.find(params[:id])
@reply.update_attribute(:spam, true)
Akismet.submit_ham(akismet_attributes)
redirect_to(cpanel_replies_path)
end
{% endcodeblock %}

＃修改routes文件
<pre lang="ruby" line="1">
resources :replies do
member do
post :spam
post :ham
end
end
{% endcodeblock %}

#再修改下view和locales文件就可以了，具体的就不贴了，可以在github上看到
https://github.com/IceskYsl/android-group/commit/79fabb06b12fd776b301fed2c7c10aee744c5974

也可以参考：
http://rubydoc.info/github/ysbaddaden/ruby-akismet/master/frames

项目地址：
https://github.com/huacnlee/ruby-china
https://github.com/IceskYsl/android-group
