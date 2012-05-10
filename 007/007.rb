#!/usr/bin/env ruby -w

=begin

Problem 007 (28 December 2001)

Find the 10001st prime.

---

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?

---

Answer:

104743

Took: 1.063616521 secs.

2012-05-10

=end

require 'mathn'

t = Time.now

puts Prime.take(10001).reverse.first

puts "\nTook: #{(Time.now - t)} secs."
