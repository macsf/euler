#!/usr/bin/env ruby -w

=begin

Problem 041 (11 April 2003)

What is the largest n-digit pandigital prime that exists?

---

We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?

---

Answer:

7652413

Took: 0.028766 secs.

2012-05-13

=end

require 'mathn'

t = Time.now

digits = [*1..7]                # tested, only 7-digits needed
max = 0

digits.permutation(digits.length).to_a.map(&:join).map(&:to_i).sort.reverse.each do |dp|

  if dp.prime?
    puts dp
    break
  end

end

# puts max

puts "\nTook: #{(Time.now - t)} secs."
