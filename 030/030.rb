#!/usr/bin/env ruby -w

=begin

Problem 030 (08 November 2002)

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

---



---

Answer:

4150 = 4150
4151 = 4151
54748 = 54748
92727 = 92727
93084 = 93084
194979 = 194979

Sum: 443839

Took: 11.574974414 secs.

2012-05-12

=end

t = Time.now

LIMIT = 200_000                 # largest num = 194979
expo = 5

surprised = Array.new

(1..LIMIT).each do |n|
  sum = n.to_s.split('').map(&:to_i).collect{ |i| i ** expo }.inject(:+)

  if n > 1 && sum == n
    surprised << n
    puts "#{n} = #{sum}"
  end
end

puts "Sum: #{surprised.inject(:+)}"

puts "\nTook: #{(Time.now - t)} secs."
