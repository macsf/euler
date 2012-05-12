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

Took: 30.78058 secs.

2012-05-12

=end

require 'mathn'

t = Time.now

LIMIT = 800_000                 # max at 739_397

being_prime = Array.new
left_to_right = Array.new
right_to_left = Array.new

(1..LIMIT).each do |n|


  if n.prime?
    being_prime.clear
    temp = n.to_s.split('')

    if temp.length > 1

      # finding left-to-right primes
      for i in 1..temp.length
        temp.shift
        break unless temp.join.to_i.prime?
        being_prime << temp.join.to_i
      end

      being_prime.unshift(n)

      if being_prime.length == n.to_s.split('').length
        left_to_right << n
        # puts "#{n} - #{being_prime.inspect}\t >> L"
      end

      being_prime.clear
      temp = n.to_s.split('')

      # finding right-to-left primes
      for i in 1..temp.length
        temp.pop
        break unless temp.join.to_i.prime?
        being_prime << temp.join.to_i
      end

      being_prime.unshift(n)

      if being_prime.length == n.to_s.split('').length
        right_to_left << n
        # puts "#{n} - #{being_prime.reverse.inspect}\t << R"
      end
    end

  end
end

# finding intersection of L2R and R2L
both_direction = left_to_right & right_to_left

puts "#{both_direction}\n\nSum: #{both_direction.inject(:+)}"



puts "\nTook: #{(Time.now - t)} secs."
