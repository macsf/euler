#!/usr/bin/env ruby -w

=begin

Problem 124 (14 July 2006)

Determining the kth element of the sorted radical function.

---

The radical of n, rad(n), is the product of distinct prime factors of n.
For example, 504 = 2^3 x 3^2 x 7, so rad(504) = 2 x 3 x 7 = 42.

Let E(k) be the kth element in the sorted n column; for example, E(4) = 8
and E(6) = 9.

If rad(n) is sorted for 1 <= n <= 100000, find E(10000).

---

Answer:

k = 9996   n = 3892,   rad(n) = 1946
k = 9997   n = 64251,  rad(n) = 1947
k = 9998   n = 1947,   rad(n) = 1947
k = 9999   n = 5841,   rad(n) = 1947
k = 10000  n = 21417,  rad(n) = 1947
k = 10001  n = 17523,  rad(n) = 1947
k = 10002  n = 52569,  rad(n) = 1947

Took: 5.687557 secs.

06/03/2012

=end

t = Time.now

require 'mathn'

rad = Hash.new

(1..100000).each do |n|
  # rad[n] = n.prime_division.flatten.uniq.sort.slice!(0).inject(:+)
  rad[n] = n.prime_division.map{|x,y| x}.inject(:*)
end

rad[1] = 1
rad_n = rad.sort_by{|k,v| v}

for i in 9995..10001
  # being an array (beginning with 0), +1 to get right index.
  puts "k = #{i+1}\t n = #{rad_n[i][0]},\t rad(n) = #{rad_n[i][1]}"
end

puts "Took: #{(Time.now - t)} secs."
