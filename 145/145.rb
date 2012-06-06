#!/usr/bin/env ruby -w

=begin

Problem 145 (16 March 2007)

How many reversible numbers are there below one-billion?

---

Some positive integers n have the property that the sum [ n + reverse(n) ]
consists entirely of odd (decimal) digits. For instance, 36 + 63 = 99 and
409 + 904 = 1313. We will call such numbers reversible; so 36, 63, 409, and
904 are reversible. Leading zeroes are not allowed in either n or
reverse(n).

There are 120 reversible numbers below one-thousand.

How many reversible numbers are there below one-billion (109)?

---

Answer:

** Code seems to be correct. But too slow.

There are 120 reversible numbers below 1000.
Took: 0.006253 secs.

There are 608720 reversible numbers below 1000000000.
Took: so long it doesn't really matter. (approx. 40143.0839 secs or 11 hours 3 minutes)

06/05/2012

=end

t = Time.now

class Integer
  def reverse
    temp = self.to_s.reverse
    temp.to_i if self.to_s.length == temp.to_i.to_s.length
  end

  def all_odd?
    !self.to_s.split('').map(&:to_i).map(&:odd?).include?(false)
  end
end

LIMIT = 10**9

count = 1
checkpoint = 0

(1..LIMIT).each do |n|
  checkpoint += 1
  puts "#{checkpoint} #{Time.now - t}" if (checkpoint % 1000000) == 0
  next if n % 10 == 0           # leading zero, no use
  next if n.even?               # check only odd numbers, even + even = even
  # then double the result for actual answer
  nrev= n.reverse
  unless nrev.nil?
    sum = n + nrev

    count += 1 if sum.all_odd?
    # if sum.all_odd?
    #   puts "#{count} -- #{n} + #{n.reverse.inspect} = #{sum} #{sum.all_odd?}"
    #   count += 1
    # end
  end
end

puts "\nThere are #{(count-1)*2} reversible numbers below #{LIMIT}."

puts "Took: #{(Time.now - t)} secs."
