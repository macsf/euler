#!/usr/bin/env ruby -w

=begin

Problem 035 (17 January 2003)

How many circular primes are there below one million?

---

The number, 197, is called a circular prime because all rotations of the
digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37,
71, 73, 79, and 97.

How many circular primes are there below one million?

---

Answer:

There are 55 circular primes below 1000000.

[2, 3, 5, 7, 11, 31, 71, 13, 73, 17, 37, 97, 79, 311, 113, 719, 919, 131, 733, 337, 971, 373, 991, 197, 199, 3119, 1193, 9311, 9377, 3779, 7793, 1931, 7937, 91193, 11939, 71993, 93719, 93911, 37199, 39119, 99371, 19391, 19937, 919393, 319993, 331999, 933199, 939193, 939391, 391939, 993319, 393919, 193939, 999331, 199933]

Took: 39.765566 secs.

=end

require 'mathn'

t = Time.now

LIMIT = 10**6

new_num = Array.new
num_combo = Array.new
circ_primes = Array.new

(1..LIMIT).each do |n|

  num_combo.clear

  if n.prime?

    num = n.to_s.split('')
    num_length = num.length

    for d in (1..num_length - 1)
      new_num = (num <<= num.shift).join.to_i
      break unless new_num.prime?
      num_combo << new_num
    end

    num_combo << n

    if num_combo.length == num.length
      circ_primes << num.join.to_i
      # puts "#{n} #{num_combo.inspect} #{num_combo.length}"
    end

  end

end

puts "There are #{circ_primes.length} circular primes below #{LIMIT}.\n\n"
puts circ_primes.inspect

puts "\nTook: #{(Time.now - t)} secs."
