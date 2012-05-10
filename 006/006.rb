#!/usr/bin/env ruby -w

=begin

Problem 006 (14 December 2001)

What is the difference between the sum of the squares and the square of the sums?

---

The sum of the squares of the first ten natural numbers is,

1^2 + 2^2 + ... + 10^2 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)^2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

---

Answer:

25164150

Took: 0.000402985 secs.

real0m0.072s
user0m0.064s
sys0m0.012s

2012-05-10

=end

def sqr(x)
  return x * x
end

t = Time.now

LIMIT = 100

nums = (1..LIMIT)
puts sqr(nums.inject(:+)) - nums.map{ |n| sqr(n) }.inject(:+)

puts "\nTook: #{(Time.now - t)} secs."
