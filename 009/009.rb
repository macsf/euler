#/usr/bin/env ruby

=begin

Problem 009 (25 January 2002)

Find the only Pythagorean triplet, {a, b, c}, for which a + b + c = 1000.

---

A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

---

Answer:

triples:         375, 200, 425
sum:             1000
product:         31875000

Took: 0.005827 secs.

real    0m0.031s
user    0m0.023s
sys     0m0.007s

4/27/2012

=end

t = Time.now

LIMIT = 100

def sqr (x)
  s = x * x
end

(1..LIMIT).each do |m|
  (1..LIMIT).each do |n|
    a = sqr(m) - sqr(n)

    if a > 0
      b = 2 * m * n
      c = sqr(m) + sqr(n)

      sum = a + b + c

      if sum == 1000
        puts "triples:\t #{a}, #{b}, #{c}"
        # puts "squares:\t #{sqr(a)}, #{sqr(b)}, #{sqr(c)} (#{sqr(a) + sqr(b)})"
        puts "sum:\t\t #{a + b + c}"
        puts "product:\t #{a * b * c}"
      end
    end
  end
end

puts "\nTook: #{(Time.now - t)} secs."
