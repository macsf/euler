#!/usr/bin/env ruby -w

=begin

Problem 095 (13 May 2005)

Find the smallest member of the longest amicable chain with no element
exceeding one million.

---

The proper divisors of a number are all the divisors excluding the number itself. For example, the proper divisors of 28 are 1, 2, 4, 7, and 14. As the sum of these divisors is equal to 28, we call it a perfect number.

Interestingly the sum of the proper divisors of 220 is 284 and the sum of
the proper divisors of 284 is 220, forming a chain of two numbers. For this
reason, 220 and 284 are called an amicable pair.

Perhaps less well known are longer chains. For example, starting with
12496, we form a chain of five numbers:

12496 ->  14288 ->  15472 ->  14536 ->  14264 (-> 12496 -> ...)

Since this chain returns to its starting point, it is called an amicable
chain.

Find the smallest member of the longest amicable chain with no element
exceeding one million.

---

Answer:

6 1 *
220 2 *
12496 5 *
14316 28 *
14316 has the longest amicable chain of 28 items.

Took: 25.119089 secs.

2012-05-25

=end

t = Time.now

require '../euler-helper'

UPPER = 15_000                              # first tried at 50_000, 15_000 is enough
LIMIT = 1_000_000                           # no element shall go over 1M

finished = false
n = 2                                       # ignoring the obvious

all_sum_divisors = Array.new                # using array to keep track of things
longest_chain = Array.new
longest_chain_count = 0

loop do
  all_sum_divisors.clear
  finished = false

  unless n.prime?
    # sum_divisors is Fixnum.factors.clip.inject(:+)
    sd = sum_divisors(n)

    loop do

      # stop if current sum is the same number as the first number
      if sd == n
        all_sum_divisors = (all_sum_divisors.reverse << n).reverse
        finished = true

        if longest_chain_count < all_sum_divisors.count
          longest_chain = n
          longest_chain_count = all_sum_divisors.count
          puts"#{n} #{all_sum_divisors.count} *"
        end
        break
      end

      # push the sum into an array and get the next sum
      all_sum_divisors << sd
      sd = sum_divisors(sd)

      break if !sd.to_i.nonzero? || sd.prime? || sd == sum_divisors(sd) || all_sum_divisors.include?(sd) || sd > LIMIT || finished
    end

  end

  break if n >= UPPER # || sd.to_i > LIMIT
  n += 1
end

puts "#{longest_chain} has the longest amicable chain of #{longest_chain_count} items."

puts "\nTook: #{(Time.now - t)} secs."
