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

[2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 97, 113, 131, 197, 199, 311, 337, 373, 719, 733, 919, 971, 991, 1193, 1931, 3119, 3779, 7793, 7937, 9311, 9377, 11939, 19391, 19937, 37199, 39119, 71993, 91193, 93719, 93911, 99371, 193939, 199933, 319993, 331999, 391939, 393919, 919393, 933199, 939193, 939391, 993319, 999331]

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
