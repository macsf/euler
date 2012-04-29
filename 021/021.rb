#!/usr/bin/env ruby -w

=begin

Problem 021 (05 July 2002)

Evaluate the sum of all amicable pairs under 10000.

---

Let d(n) be defined as the sum of proper divisors of n (numbers less than n
which divide evenly into n).

If d(a) = b and d(b) = a, where a b, then a and b are an amicable pair and
each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.

---

Answer:

220      284     <->     284     220
284      220     <->     220     284
1184     1210    <->     1210    1184
1210     1184    <->     1184    1210
2620     2924    <->     2924    2620
5020     5564    <->     5564    5020
5564     5020    <->     5020    5564
6232     6368    <->     6368    6232
6368     6232    <->     6232    6368

[220, 284, 1184, 1210, 2620, 2924, 5020, 5564, 6232, 6368]

31626

Took: 11.508659 secs.

real    0m11.555s
user    0m11.180s
sys     0m0.026s

=end

require '../math-extra.rb'

t = Time.now

LIMIT = 10_000

num = Hash.new
amicable = Array.new

(1..LIMIT).each do |n|
  num[n] = n.factors.take_while{ |i| i != n }.inject(:+)
end

(1..LIMIT).each do |k|
  value_at_key = num[k]
  key_with_value = num.key(k)
  value_at_second_key = num[key_with_value]

  if value_at_key == key_with_value
    unless k == value_at_key

      # puts "#{k}\t #{value_at_key}\t <->\t #{key_with_value}\t #{value_at_second_key}"

      amicable.push(k)
      amicable.push(key_with_value)
    end
  end
end

puts amicable.uniq.inject(:+)

puts "\nTook: #{(Time.now - t)} secs."
