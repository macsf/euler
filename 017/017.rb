#!/usr/bin/env ruby -w

=begin

Problem 17
Number letter counts

---

If the numbers 1 to 5 are written out in words: one, two, three, four, five,
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in
words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
letters. The use of "and" when writing out numbers is in compliance with
British usage.

---

Answer:

21124
Took: 0.048875 secs.

number_to_words() doesn't really work since it works correctly up to
certain number (< 2000?)

We could also use humanize gem instead of number_to_words

06/29/2015

=end

class Fixnum

  def number_to_words
    words = {
      0 => 'zero',
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      10 => 'ten',
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen',
      20 => 'twenty',
      30 => 'thirty',
      40 => 'forty',
      50 => 'fifty',
      60 => 'sixty',
      70 => 'seventy',
      80 => 'eighty',
      90 => 'ninety',
      100 => 'hundred',
      1000 => 'thousand'
    }

    num = self
    output = ''

    if num < 20
      output = words[num]
    else
      thousands = num / 1000
      num = num % 1000
      hundreds = num / 100
      num = num % 100
      if num < 20
        tens = num
        num = 0
      else
        tens = (num / 10) * 10
        num = num % 10
      end

      output += "#{words[thousands]} thousand " unless thousands.zero?
      output += "#{words[hundreds]} hundred " unless hundreds.zero?

      output += 'and ' if output != '' && (tens > 0 || num > 0)

      output += "#{words[tens]} " unless tens.zero?
      output += "#{words[num]}" unless num.zero?
    end

    output.strip
  end

end

t = Time.now

sum = 0
(1..1000).each do |n|
  sum += n.number_to_words.gsub(/ /, '').length
end

puts sum # 21124

puts "Took: #{(Time.now - t)} secs."

# puts 34985.number_to_words # not working

# require 'set'
#
# def rand_n(n, max)
#   randoms = Set.new
#
#   loop do
#     randoms << rand(max)
#     return randoms.to_a if randoms.size >= n
#   end
# end
#
# # tests = rand_n(10, 1000)
# tests = (1..3000).to_a.sort { rand() - 0.5 }.take(20).shuffle
#
# tests.each do |n|
#   p "#{n} : #{n.number_to_words}"
# end
#
