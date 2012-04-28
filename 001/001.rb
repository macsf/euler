#!/usr/bin/env ruby -w

=begin

Problem 1 (05 October 2001)

Add all the natural numbers below one thousand that are multiples of 3 or 5.

---

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

---

Answer:

233168

real    0m0.025s
user    0m0.017s
sys     0m0.006s

4/25/2012

=end

LIMIT = 1000

sum = 0
(1..LIMIT).each do |num|
  if (num.to_i % 3 == 0 || num.to_i % 5 == 0)
    sum += num
  end
end

puts sum
