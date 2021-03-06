#!/usr/bin/env ruby

=begin

Problem 012 (08 March 2002)

What is the value of the first triangle number to have over five hundred
divisors?

---

The sequence of triangle numbers is generated by adding the natural
numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 =
28. The first ten terms would be:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:

 1: 1 3: 1,3 6: 1,2,3,6 10: 1,2,5,10 15: 1,3,5,15 21: 1,3,7,21 28:
 1,2,4,7,14,28

We can see that 28 is the first triangle number to have over five divisors.

What is the value of the first triangle number to have over five hundred
divisors?

---

Answer:

Took: 5.63825 secs.

real    0m5.681s
user    0m5.613s
sys     0m0.015s

(Cheated: factors_of())

=end

require 'mathn'

t = Time.now

LIMIT = 500

n = 1
sum = 0
fac = Array.new

def factors_of(num)
  divisors = Array.new

  if num == 1
    divisors.push(1)
  else
    primes, powers = num.prime_division.transpose
    exponents = powers.map { |i| (0..i).to_a }
    divisors = exponents.shift.product(*exponents).map do |powers|
      primes.zip(powers).map { |prime, power| prime ** power }.inject(:*)
    end

    divisors.sort.map { |div| [div, num / div] }
  end
end

while fac.length < LIMIT
  sum += n
  fac = factors_of(sum).flatten.uniq.sort
  n += 1
end

puts "#{sum}"

puts "\nTook: #{(Time.now - t)} secs."
