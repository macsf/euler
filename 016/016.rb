#!/usr/bin/env ruby

=begin

Problem 016 (03 May 2002)

What is the sum of the digits of the number 2^1000?

---

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?

---

Answer:

1366

Took: 0.000431 secs.

real    0m0.026s
user    0m0.018s
sys     0m0.007s

=end

t = Time.now

EXPO = 1000
BASE = 2

puts (BASE ** EXPO).to_s.split('').map(&:to_i).inject(:+)

puts "\nTook: #{(Time.now - t)} secs."
