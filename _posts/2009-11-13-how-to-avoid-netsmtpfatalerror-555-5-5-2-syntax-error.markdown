--- 
layout: post
comments: true
title: how to avoid Net::SMTPFatalError (555 5.5.2 Syntax error.
date: "2009-11-13"
link: false
categories: life
---
i can not get notify email from my ExceptionNotifier in rails project,i notice some useful msg in the production logs:
<blockquote>Net::SMTPFatalError (555 5.5.2 Syntax error. b17sm72261fka.43</blockquote>

 google....
<blockquote>@from = "#{sender}<a...@xxxxxxx>"
 If I submit an email id, It is giving error as
 (Net::SMTPFatalError) "555 5.5.2 Syntax error. d29sm1994943and.38\n"

The from line is the problem. The Net::SMTP library was recently changed
so it adds angle brackets to your sender, so you cannot have any in your
string. Try this as a workaround:
@from = "a...@xxxxxxx"</blockquote>

so,just fix it like this:
ExceptionNotifier.sender_address = %("iceskysl" <iceskysl@eoemobile.com>)
to
ExceptionNotifier.sender_address = %(iceskysl@eoemobile.com)
