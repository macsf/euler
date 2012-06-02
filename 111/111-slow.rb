#!/usr/bin/env ruby -w

=begin

Problem 111 (16 December 2005)

Search for 10-digit primes containing the maximum number of repeated digits.

---

Considering 4-digit primes containing repeated digits it is clear that they cannot all be the same: 1111 is divisible by 11, 2222 is divisible by 22, and so on. But there are nine 4-digit primes containing three ones:

1117, 1151, 1171, 1181, 1511, 1811, 2111, 4111, 8111

We shall say that M(n, d) represents the maximum number of repeated digits for an n-digit prime where d is the repeated digit, N(n, d) represents the number of such primes, and S(n, d) represents the sum of these primes.

So M(4, 1) = 3 is the maximum number of repeated digits for a 4-digit prime where one is the repeated digit, there are N(4, 1) = 9 such primes, and the sum of these primes is S(4, 1) = 22275. It turns out that for d = 0, it is only possible to have M(4, 0) = 2 repeated digits, but there are N(4, 0) = 13 such cases.

---

Answer:


=end

t = Time.now

require '../euler-helper'

DIGITS = 4
LOWER = (1.0 * 10**(DIGITS-1)).to_i
UPPER = (9.999999999 * 10**(DIGITS-1)).to_i

sum = 0

rp = range_prime_sieve(LOWER, UPPER).keep_if{|n| n.to_s.split('').uniq.count < DIGITS}

[*0..9].each do |i|
  if i == 0
    max_digits = DIGITS - 2
  else
    max_digits = DIGITS - 1
  end

  rp_max_digits = rp.select{|n| n.to_s.scan(/#{i}/).size == max_digits} # M(n,d)

  unless rp_max_digits.empty?
    sum += rp_max_digits.inject(:+) # S(n,d)
  end
end

puts sum

puts "Took: #{(Time.now - t)} secs."
