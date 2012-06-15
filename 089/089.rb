#!/usr/bin/env ruby -w

=begin

Problem 089 (18 February 2005)

Develop a method to express Roman numerals in minimal form.

---

The rules for writing Roman numerals allow for many ways of writing each number (see About Roman Numerals...). However, there is always a "best" way of writing a particular number.

For example, the following represent all of the legitimate ways of writing the number sixteen:

IIIIIIIIIIIIIIII
VIIIIIIIIIII
VVIIIIII
XIIIIII
VVVI
XVI

The last example being considered the most efficient, as it uses the least number of numerals.

The 11K text file, roman.txt (right click and 'Save Link/Target As...'), contains one thousand numbers written in valid, but not necessarily minimal, Roman numerals; that is, they are arranged in descending units and obey the subtractive pair rule (see About Roman Numerals... for the definitive rules for this problem).

Find the number of characters saved by writing each of these in their minimal form.

Note: You can assume that all the Roman numerals in the file contain no more than four consecutive identical units.

---

Answer:

(easy string replacement)

Diff: -743
Took: 0.000564 secs.

06/15/2012

=end

t = Time.now

romans = File.open('./roman.txt').read

init_length = romans.size

romans.gsub!('VIIII', 'IX')     # 9
romans.gsub!('LXXXX', 'XC')     # 90
romans.gsub!('DCCCC', 'CM')     # 900
romans.gsub!('IIII', 'IV')      # 4
romans.gsub!('XXXX', 'XL')      # 40
romans.gsub!('CCCC', 'CD')      # 400

puts "Diff: #{romans.size - init_length}"
puts "Took: #{(Time.now - t)} secs."
