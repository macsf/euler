#!/usr/bin/env ruby -w

=begin

Problem 022 (19 July 2002)

What is the total of all the name scores in the file of first names?

---

Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
containing over five-thousand first names, begin by sorting it into
alphabetical order. Then working out the alphabetical value for each name,
multiply this value by its alphabetical position in the list to obtain a
name score.

For example, when the list is sorted into alphabetical order, COLIN, which
is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So,
COLIN would obtain a score of 938 53 = 49714.

What is the total of all the name scores in the file?

---

Answer:

871198282

Took: 0.076788 secs.

real    0m0.102s
user    0m0.093s
sys     0m0.007s

(4/30/2012)

=end

t = Time.now

class String
  def char_pos
    self.ord - 64
  end
end

FILE = 'names.txt'

sum = 0

File.open(FILE).gets.gsub('"', '').split(',').sort.each_with_index do |n, i|
  sum += (i + 1) * n.split('').map(&:char_pos).inject(:+)
end

puts sum

puts "\nTook: #{(Time.now - t)} secs."
