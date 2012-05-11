#!/usr/bin/env ruby -w

=begin

Problem 025 (30 August 2002)

What is the first term in the Fibonacci sequence to contain 1000 digits?

---

The Fibonacci sequence is defined by the recurrence relation:

Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.
Hence the first 12 terms will be:

F1 = 1
F2 = 1
F3 = 2
F4 = 3
F5 = 5
F6 = 8
F7 = 13
F8 = 21
F9 = 34
F10 = 55
F11 = 89
F12 = 144
The 12th term, F12, is the first term to contain three digits.

What is the first term in the Fibonacci sequence to contain 1000 digits?

---

Answer:

4782

Took: 0.019783 secs.

=end


t = Time.now

LIMIT = 10**999                 # first 1K-digits num
fibs = [1,1]                    # first two fibs
i = 0

while fibs[-1] < LIMIT
  fibs.push(fibs[i] + fibs[i+=1])
end

puts fibs.size

puts "\nTook: #{(Time.now - t)} secs."
