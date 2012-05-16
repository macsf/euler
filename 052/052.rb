#!/usr/bin/env ruby -w

=begin

Problem 052 (12 September 2003)

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits in some order.

---

It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

---

Answer:

142857 * 1 - 142857
142857 * 2 - 285714
142857 * 3 - 428571
142857 * 4 - 571428
142857 * 5 - 714285
142857 * 6 - 857142

Took: 5.366394532 secs.

2012-05-16

=end

t = Time.now

LIMIT = 6
num = 0

loop do
  num += 9                      # jumping the list, 9 items at a time
  break if (1..LIMIT).map{|multiplier| multiplier * num}.map(&:to_s).map{|s| s.split('').sort.join}.uniq.size == 1
end

(1..LIMIT).each { |m| puts "#{num} * #{m} - #{num * m}" }

puts "\nTook: #{(Time.now - t)} secs."
