#/usr/bin/env ruby -w

=begin

Problem 010 (08 February 2002)

Calculate the sum of all the primes below two million.

---

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.

---

Answer:

142913828922

Took: 8.713912 secs.

real    0m8.776s
user    0m8.711s
sys     0m0.022s

4/27/2012

=end

require 'mathn'

t = Time.now

curr = 0
sum = 0
LIMIT = 2_000_000

Prime.each do |p|
  if p < LIMIT
    sum += p
  else
    puts sum
    puts "\nTook: #{(Time.now - t)} secs."
    exit
  end
end
