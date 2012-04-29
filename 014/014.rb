#!/usr/bin/env ruby

=begin

Problem 014 (05 April 2002)

Find the longest sequence using a starting number under one million.

---

The following iterative sequence is defined for the set of positive
integers:

n n/2 (n is even)
n 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following
sequence:

13 40 20 10 5 16 8 4 2 1 It can be seen that this sequence (starting at 13
and finishing at 1) contains 10 terms. Although it has not been proved yet
(Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

---

Answer:

837799 produces 525 elements in chain.

Took: 30.451108 secs.

real    0m30.477s
user    0m30.046s
sys     0m0.029s

=end

t = Time.new

LIMIT = 1_000_000
seq = Array.new
ch = 0
max = 0
start_num = 0

1.upto(LIMIT).each do |n|
  seq.clear

  ch = n
  seq.push(ch)
  while ch != 1
    if ch % 2 == 0
      ch /= 2
    else
      ch = (3 * ch) + 1
    end
    seq.push(ch)
  end

  if max < seq.length
    max = seq.length
    start_num = n
  end
end

puts "#{start_num} produces #{max} elements in chain."

puts "\nTook: #{(Time.new - t)} secs."
