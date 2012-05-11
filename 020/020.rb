#!/usr/bin/env ruby -w

=begin

Problem 020 (21 June 2002)

Find the sum of digits in 100!

---

n! means n  (n  1)  ...  3  2  1

For example, 10! = 10  9  ...  3  2  1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!

---

Answer:

648

Took: 0.00034 secs.

real    0m0.045s
user    0m0.034s
sys     0m0.010s

4/29/2012

=end

require '../math-extra.rb'

t = Time.now

LIMIT = 100

puts LIMIT.factorial.to_s.split('').map(&:to_i).inject(:+)

puts "\nTook: #{(Time.now - t)} secs."
