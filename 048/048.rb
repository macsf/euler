#!/usr/bin/env ruby -w

=begin

Problem 048 (18 July 2003)

Find the last ten digits of 1^1 + 2^2 + ... + 1000^1000.

---

The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

---

Answer:

9110846700

Took: 0.025657 secs.

2012-05-13

=end

t = Time.now

puts [*1..1000].reduce(0){|sum, n| sum + n**n}.to_s[-10..-1]


puts "\nTook: #{(Time.now - t)} secs."
