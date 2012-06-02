#!/usr/bin/env ruby -w

=begin

Problem 119 (07 April 2006)

Investigating the numbers which are equal to sum of their digits raised to
some power.

---

The number 512 is interesting because it is equal to the sum of its digits
raised to some power: 5 + 1 + 2 = 8, and 83 = 512. Another example of a
number with this property is 614656 = 284.

We shall define an to be the nth term of this sequence and insist that a
number must contain at least two digits to have a sum.

You are given that a2 = 512 and a10 = 614656.

Find a30.

---

Answer:

a(30) = 248155780267521

Took: 0.074985636 secs.

6/2/2012

=end

t = Time.now

max = 30
result = Array.new

(2..100).each do |i|
  (2..10).each do |e|
    a = i**e
    b = a.to_s.split('').map(&:to_i).inject(:+)
    result << a if b == i
    # if b == i
    #   puts "#{i}^#{e}\t = #{a}"
    #   result << a
    # end
  end
end

result.sort!                            # must sort to get correct order
puts "\na(30)\t = #{result[max-1]}\n\n" # array starts at 0, must rewind

puts "Took: #{(Time.now - t)} secs."
