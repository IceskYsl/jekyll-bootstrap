--- 
layout: post
comments: true
title: "Border-radius: create rounded corners with CSS!"
date: 2010-3-5
link: false
categories: life
---
W3C has offered some new options for borders in CSS3, of which one is border-radius. Both Mozila/Firefox and Safari 3 have implemented this function, which allows you to create round corners on box-items. This is an example:

Mozilla/Firefox and Safari 3 users should see a nicely rounded box, with a nicely rounded border.
The code for this example above is actually quite simple:
<blockquote></blockquote>
These different corners can also each be handled on their own, Mozilla has other names for the feature than the spec says it should have though, as it has f.i. -moz-border-radius-topright as opposed to -webkit-border-top-right-radius:

Mozilla/Firefox and Safari 3 users should see a box with a rounded left upper corner.
Mozilla/Firefox and Safari 3 users should see a box with a rounded right upper corner.
Mozilla/Firefox and Safari 3 users should see a box with a rounded left lower corner.
Mozilla/Firefox and Safari 3 users should see a box with a rounded right lower corner.
These are handled by / should be handled by:

{% codeblock %}-moz-border-radius-topleft / -webkit-border-top-left-radius
-moz-border-radius-topright / -webkit-border-top-right-radius
-moz-border-radius-bottomleft / -webkit-border-bottom-left-radius
-moz-border-radius-bottomright / -webkit-border-bottom-right-radius{% endcodeblock %}
