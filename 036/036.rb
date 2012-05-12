#!/usr/bin/env ruby -w

=begin

Problem 036 ()

Find the sum of all numbers less than one million, which are palindromic in base 10 and base 2.

---

The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)

---

Answer:

1 1
3 11
5 101
7 111
9 1001
33  100001
99  1100011
313 100111001
585 1001001001
717 1011001101
7447  1110100010111
9009  10001100110001
15351 11101111110111
32223 111110111011111
39993 1001110000111001
53235 1100111111110011
53835 1101001001001011
73737 10010000000001001
585585  10001110111101110001

Sum of all palindromic: 872187

2012-05-12

=end

t = Time.now

LIMIT = 10**6

palindrome = Array.new

(1..LIMIT).each do |dec|

  if dec.to_s == dec.to_s.reverse

    bin = dec.to_s(2)

    if bin == bin.reverse

      palindrome << dec

      puts "#{dec}\t#{bin}"

    end

  end

end

puts "\nSum of all palindromic: #{palindrome.inject(:+)}"

puts "\nTook: #{(Time.now - t)} secs."
