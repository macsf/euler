#!/usr/bin/env ruby -w

=begin

Problem 120 (21 April 2006)

Finding the maximum remainder when (a - 1)^n + (a + 1)^n is divided by a^2

---

Let r be the remainder when (a-1)^n + (a+1)^n is divided by a^2.

For example, if a = 7 and n = 3, then r = 42: 6^3 + 8^3 = 728, 42 mod 49.
And as n varies, so too will r, but for a = 7 it turns out that r(max) = 42.

For a >= 3, a <= 1000, find sum(r(max))

---

Answer:

Sum r(max) = 333082500
Took: 0.019291 secs.

* conincidentally found out that the remainders are the product of a and i,
where i = 2, 2, 4, 4, 6, 6, 8, 8, ....
* probably not the right way to come up with the answer, but it works.

06/02/2012

=end

t = Time.now

sum = 0

# def find_remainder(a)
#   max_rem = 0

#   (1..100).each do |n|
#     rem = ((((a - 1) ** n) + ((a + 1) ** n)) % a**2)
#     max_rem = rem unless max_rem > rem
#     # puts "a=#{a} n=#{n} rem=#{rem}"
#   end

#   max_rem
# end

# (3..1000).each do |a|
#   # sum += find_remainder(a)
#   max_rem = find_remainder(a)
#   sum += max_rem
#   puts "#{a} max_rem = #{max_rem} / #{max_rem/a}"
# end

n = 1
i = 2
(3..1000).each do |a|
  rem = a * i
  sum += rem
  puts "#{a} #{i} #{rem}"
  i += 2 if a % 2 == 0
end

puts "\nSum r(max) = #{sum}\n"

puts "Took: #{(Time.now - t)} secs."
