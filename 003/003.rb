#!/usr/bin/env ruby -w

=begin

Problem 3 (02 November 2001)

Find the largest prime factor of a composite number.

---

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

---

Answer:

6857

Took: 0.020021 secs.

real    0m0.048s
user    0m0.035s
sys     0m0.009s

4/27/2012

=end

t = Time.now

require 'mathn'

NUM = 600_851_475_143

puts NUM.prime_division.flatten.uniq.sort.last

puts "\nTook: #{(Time.now - t)} secs."
