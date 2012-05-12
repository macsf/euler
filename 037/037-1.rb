#!/usr/bin/env ruby -w

=begin

Problem 037 (14 February 2003)

Find the sum of all eleven primes that are both truncatable from left to right and right to left.

---

The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

---

Answer:

[23, 37, 53, 73, 313, 317, 373, 797, 3137, 3797, 739397]

Sum: 748317

Took: 24.509269 secs.

* New algorithm. Total gain: 6 seconds.

2012-05-12

=end

require 'mathn'

t = Time.now

LIMIT = 800_000                 # max at 739_397
END_DIGITS = 11                 # cheat, end at 11 primes

being_prime = Array.new

(1..LIMIT).each do |n|


  if n.prime?
    temp = n.to_s.split('')

    if temp.length > 1
      x = Array.new(temp)
      y = Array.new(temp)
      all_prime = true

      for i in 1..temp.length - 1
        x.shift
        y.pop

        all_prime &&= x.join.to_i.prime? && y.join.to_i.prime?
        break if all_prime == false
      end

      being_prime << n if all_prime
    end
  end

  break if being_prime.length == END_DIGITS
end

puts "#{being_prime.inspect}\n\nSum: #{being_prime.inject(:+)}"

puts "\nTook: #{(Time.now - t)} secs."
