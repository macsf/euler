#!/usr/bin/env ruby -w

=begin

Problem 2 (19 October 2001)

By considering the terms in the Fibonacci sequence whose values do not
exceed four million, find the sum of the even-valued terms.

---

Each new term in the Fibonacci sequence is generated by adding the previous
two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not
exceed four million, find the sum of the even-valued terms.

---

Answer:

4613732

Took: 0.018102 secs.

real    0m0.046s
user    0m0.034s
sys     0m0.010s

4/25/2012

=end

t = Time.now

require '../math-extra.rb'

LIMIT = 4_000_000
fib_num = 0
num_a = 0
num_b = 1
sum = 0

while fib_num <= LIMIT
  fib_num = num_a + num_b
  num_a = num_b
  num_b = fib_num

  if fib_num % 2 == 0
    sum += fib_num
  end
end

puts sum

puts "\nTook: #{(Time.now - t)} secs."