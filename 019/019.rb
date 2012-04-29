#!/usr/bin/env ruby -w

=begin

Problem 019 (14 June 2002)

How many Sundays fell on the first of the month during the twentieth century?

---

You are given the following information, but you may prefer to do some
research for yourself.

1 Jan 1900 was a Monday.

Thirty days has September,

April, June and November.

All the rest have thirty-one,

Saving February alone,

Which has twenty-eight, rain or shine.

And on leap years, twenty-nine.

A leap year occurs on any year evenly divisible by 4, but not on a century
unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth
  century (1 Jan 1901 to 31 Dec 2000)?

---

Answer:

171 Sundays.

Took: 0.001045 secs.

real    0m0.027s
user    0m0.019s
sys     0m0.007s

=end

require 'date'

t = Time.now

BEG_YEAR = 1901
END_YEAR = 2000

sunday_counter = 0

(BEG_YEAR..END_YEAR).each do |y|
  (1..12).each do |m|
    sunday_counter += 1 if Date.new(y, m, 1).sunday?
  end
end

puts "#{sunday_counter} Sundays."

puts "\nTook: #{(Time.now - t)} secs."
