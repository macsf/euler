#!/usr/bin/env ruby -w

=begin

Problem 034 (03 January 2003)

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

---

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.

---

Answer:

145 - [1, 24, 120] - 145
40585 - [24, 1, 120, 40320, 120] - 40585

Sum: 40730

Took: 4.344723204 secs.

2012-05-12

=end

require '../math-extra'

t = Time.now

LIMIT = 50000                   # largest is 40585

curious = Array.new

(3..LIMIT).each do |n|

  each_fact = n.to_s.split('').map(&:to_i).collect{ |i| i.factorial }

  if each_fact.inject(:+) == n
    curious << n
    puts "#{n} - #{each_fact} - #{each_fact.inject(:+)}"
  end

end

puts curious.inject(:+)

puts "\nTook: #{(Time.now - t)} secs."
