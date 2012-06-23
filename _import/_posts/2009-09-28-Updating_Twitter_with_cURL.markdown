---
layout: post
title: Updating_Twitter_with_cURL
date: '2009-9-28'
comments: true
categories: 技术归总 Mac&*UNIX
tags: cURL twitter
link: true
---
<blockquote>curl -u email:passw -d status="text" http://twitter.com/statuses/update.xml</blockquote>
cURL figures out which protocol to use from the URL you provide, and when "http:" is specified will, unless otherwise instructed (using -0), default to using HTTP 1.1. The first argument, -u, instructs cURL to use the next two parameters (separated by a colon) as the account name and password for basic authentication. The next argument, -d, specifies the data (maximum 140 characters) to be sent via a POST request.

Of course what cURL expects is a response to the POST request so the result will be the requested page (update.xml) sent to stdout. This page will be encoded according to the file type used in the request, thus as we just requested update.xml we’ll get XML-formatted data. The alternatives are JSON (JavaScript Object Notation), RSS and Atom formats.

from:
http://www.networkworld.com/columnists/2008/052108-gearhead.html?page=2
