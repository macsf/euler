#!/usr/bin/env ruby -w

=begin

Problem 056 (07 November 2003)

Considering natural numbers of the form, a^b, finding the maximum digital sum.

---

A googol (10100) is a massive number: one followed by one-hundred zeros;
100100 is almost unimaginably large: one followed by two-hundred zeros.
Despite their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, ab, where a, b 100, what is the
maximum digital sum?

---

Answer:

972

Took: 0.834704 secs.

2012-05-23

=end

t = Time.now

a_max = 100
b_max = 100
max = 0

(1..a_max).each do |a|
  (1..b_max).each do |b|
    sum_digit = (a ** b).to_s.split('').map(&:to_i).inject(:+)
    max = sum_digit unless max > sum_digit
  end
end

puts max

puts "\nTook: #{(Time.now - t)} secs."
