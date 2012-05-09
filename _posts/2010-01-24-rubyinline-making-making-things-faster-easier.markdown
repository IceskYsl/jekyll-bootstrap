--- 
layout: post
comments: true
title: RubyInline, Making Making Things Faster Easier
date: 2010-1-24
link: false
categories: life
---
发现一篇好文，讲的是如何使用RubyInline，在Ruby中直接嵌入C并运行，相比之前些lib，要方便的多，由于这个文章在墙外，就转了一份过来，可以翻墙的可以去看原文
<a href="http://on-ruby.blogspot.com/2006/07/rubyinline-making-making-things-faster.html">http://on-ruby.blogspot.com/2006/07/rubyinline-making-making-things-faster.html</a>

Today on ruby-talk, I caught a thread called "For Performance, Write it in C". I'd like to present a slight amendment to that thesis. Let me explain.

It all started with an email at work. Someone was passing around a bunch of prime number printers in various languages (C, Java, C#, Perl, and Python). They all used the same (ugly) algorithm, and were supposed to show just how 'performant the languages were. Since I'm the local Ruby evangelist, I was asked to write a Ruby version. Here's what I came up with (warning, ugly algorithm ahead):

#!/usr/bin/ruby

for num in 1..10_000 do
is_prime = 1
for x in 2..(num - 1) do
if (num % x == 0)
is_prime = x
break
end
end
if is_prime == 1
puts "#{num} is a prime number"
else
puts "#{num} equals #{is_prime} * #{num/is_prime}"
end
end
How fast is it? Well, time says:

$ time ./primes.rb &gt; /dev/null

real    0m2.905s
user    0m2.716s
sys     0m0.004s
$

Certainly, nothing to write home about, but not too far from Perl or Python either.
Wanting to improve it, and not being able to touch the algorithm (we want to be comparing apples to quinces after all, not apples to oranges). I know my only hope is to find the bottleneck(s) and rewrite it (them?) in C. My first step is to grab Ruby's profiler and see what it says (oh, by the way, I reduced the value of num to 100 so that this would complete in my lifetime ... the profiler is slow).

$ ruby -rprofile primes.rb &gt; /dev/null
%   cumulative   self              self     total
time   seconds   seconds    calls  ms/call  ms/call  name
63.64     0.14      0.14      101     1.39     3.56  Range#each
13.64     0.17      0.03     1133     0.03     0.03  Fixnum#%
9.09     0.19      0.02     1233     0.02     0.02  Fixnum#==
4.55     0.20      0.01      100     0.10     0.20  Kernel.puts
4.55     0.21      0.01      200     0.05     0.05  IO#write
4.55     0.22      0.01      248     0.04     0.04  Fixnum#to_s
0.00     0.22      0.00       74     0.00     0.00  Fixnum#/
0.00     0.22      0.00      100     0.00     0.00  Fixnum#-
0.00     0.22      0.00        1     0.00   220.00  #toplevel
$

Which tells me that most of my time is spent in each (well, it's actually spent in the block I sent to each. It's taking a whopping 1.39 msec per call, compared to .0X msec for everything else. What would happen if I rewrote just that block?
Enter RubyInline (A great tool written by zenspider and Eric Hodel). I'm not a C wiz by any stretch of the imagination, but this stuff is pretty easy to bang out. My new code looks like this:

#!/usr/bin/ruby

require "rubygems"
require "inline"

class Primes
inline do |builder|
builder.c '
int prime(int num) {
int x;
for (x = 2; x &lt; (num - 1) ; x++) {         if (num == 2) {           return 1;         }         if (num % x == 0) {           return x;         }       }       return 1;     }'   end end p = Primes.new for num in 2..10_000 do   is_prime = p.prime(num)   if is_prime == 1     puts "#{num} is a prime number"   else     puts "#{num} equals #{is_prime} * #{num/is_prime}"   end end Not too ugly. At least I can still see what's happening. The main loop being in Ruby helps a lot too (especially if this were a much bigger program). How much of a difference does it make? time says: $ time ./cprimes.rb &gt; /dev/null

real    0m0.328s
user    0m0.288s
sys     0m0.020s

An order of magnitude improvement. Not too shabby.
What's the lesson here? Optimize what you need to (and only what you need to), profile find out what that is (it may be slow, but profiling is your friend), and use the right tools (rewriting a bit of code with RubyInline is way better than rewriting the whole app in C).
