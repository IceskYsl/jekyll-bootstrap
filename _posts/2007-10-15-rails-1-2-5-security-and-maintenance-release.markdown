--- 
layout: post
comments: true
title: "Rails 1.2.5: Security and maintenance release"
date: "2007-10-15"
link: false
categories: life
---
<p>This release closes a <span class="caps">JSON XSS</span> vulnerability, fixes a couple of minor regressions introduced in 1.2.4, and backports a handful of features and fixes from the 2.0 preview release.</p>
<p>All users of Rails 1.2.4 or earlier are advised to upgrade to 1.2.5, though it isn&rsquo;t strictly necessary if you aren&rsquo;t working with <span class="caps">JSON</span>. For more information the <span class="caps">JSON</span> vulnerability, see <span class="caps">CVE</span>-2007-3227.</p>
<p>Summary of changes:</p>
<ul>
    <li>acts_as_list: fixed an edge case where removing an item from the list then destroying the item leads to incorrect item positioning</li>
    <li>deprecated calling .create on has_many associations with an unsaved owner (like post = Post.new; post.comments.create)</li>
    <li>backport array and hash query parameters</li>
    <li>fix in place editor&rsquo;s setter action with non-string fields</li>
    <li>updated config/boot.rb to correctly recognize <span class="caps">RAILS</span>_GEM_VERSION</li>
</ul>
<p>To upgrade, `gem install rails`, set <span class="caps">RAILS</span>_GEM_VERSION to &lsquo;1.2.5&rsquo; in config/environment.rb, and `rake rails:update:configs`.</p>
