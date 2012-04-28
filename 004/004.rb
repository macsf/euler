#!/usr/bin/env ruby

=begin

Problem 004 (16 November 2001)

Find the largest palindrome made from the product of two 3-digit numbers.

A palindromic number reads the same both ways. The largest palindrome made
from the product of two 2-digit numbers is 9009 = 91 99.

Find the largest palindrome made from the product of two 3-digit numbers.

Answer:

906609

Took: 0.705672 secs.

real    0m0.730s
user    0m0.721s
sys     0m0.007s

4/25/2012

=end

t = Time.now

max = 0
999.downto(100).each do |num1|
  999.downto(100).each do |num2|
    test = num1 * num2
    max = [max, test].max if test.to_s == test.to_s.reverse
  end
end

puts max

puts "\nTook: #{(Time.now - t)} secs."
