#!/usr/bin/env ruby

=begin

Problem 015 (19 April 2002)

Starting in the top left corner in a 20 by 20 grid, how many routes are
there to the bottom right corner?

---

Starting in the top left corner of a 22 grid, there are 6 routes (without
backtracking) to the bottom right corner.

How many routes are there through a 2020 grid?

---

Answer:

137846528820

Took: 0.00019 secs. (fact())
Took: 0.000113 secs. (binom())

real    0m0.026s
user    0m0.018s
sys     0m0.006s

(Cheated: functions)

=end

t = Time.now

ROWS, COLS = 20, 20

class Integer
  def fact_1
    zero? ? 1 : (1..self).inject { |m, o| m * o }
  end

  def fact
    (1..self).reduce(1, :*)
  end

  def binom(k)
    self.fact / (k.fact * (self - k).fact)
  end
end

# pascal triangle
def pascal n
  # calc field width
  width = (n - 1).binom(n / 2).to_s.length

  # keep only one row in memory
  row = [1]

  1.upto(n) do |i|
    # print row
    space = ' ' * width * (n-i)
    puts space + row.collect { |x| x.to_s.center(2*width) }.join

    # generate next row
    row = row.inject([0]) { |m, o| m[0...-1] << (m[-1] + o) << o }
  end
end

puts (ROWS + COLS).fact / (ROWS.fact * COLS.fact)
#puts (ROWS + COLS).binom(ROWS)

puts "\nTook: #{(Time.now - t)} secs."
