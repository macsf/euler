#!/usr/bin/env ruby -w

require 'mathn'

n = 4

def prime_sum(n)
  d = 0
  primes_with_most_repeating_digits(n, d)
end

def primes_with_most_repeating_digits(n, d)
  m = n - 1
  primes = Array.new

  while primes.size == 0
    break if m < 2          # anything < 2 is not repeating
    primes = repeating_digit_primes(n, d, m)
    m -= 1
  end
end

def repeating_digit_primes(n, d, m)
  num = Array.new(n, d)

  puts "Check #{m} repeating digits."
  for i in 0..(n - m - 1)
    num = make_num(num, n - m - 1, i)
  end



  return []
end

def make_num(init, rep, count)

  for p in 0+count..init.size-1+count
    break if p > init.size-1
    temp = Array.new(init)
    (0..9).each do |j|
      temp[p] = j
      a = temp.join.to_i
      nums << a
      print "#{temp.inspect} #{a}"
      puts ''
    end
  end

  nums

end

sum = prime_sum(n)

puts sum
