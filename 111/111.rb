#!/usr/bin/env ruby -w

=begin

Problem 111 (16 December 2005)

Search for 10-digit primes containing the maximum number of repeated digits.

---

Considering 4-digit primes containing repeated digits it is clear that they cannot all be the same: 1111 is divisible by 11, 2222 is divisible by 22, and so on. But there are nine 4-digit primes containing three ones:

1117, 1151, 1171, 1181, 1511, 1811, 2111, 4111, 8111

We shall say that M(n, d) represents the maximum number of repeated digits for an n-digit prime where d is the repeated digit, N(n, d) represents the number of such primes, and S(n, d) represents the sum of these primes.

d = 0, M(4, d) = 2,  N(4, d) = 13,   S(4, d) = 67061
d = 1, M(4, d) = 3,  N(4, d) = 9,    S(4, d) = 22275
d = 2, M(4, d) = 3,  N(4, d) = 1,    S(4, d) = 2221
d = 3, M(4, d) = 3,  N(4, d) = 12,   S(4, d) = 46214
d = 4, M(4, d) = 3,  N(4, d) = 2,    S(4, d) = 8888
d = 5, M(4, d) = 3,  N(4, d) = 1,    S(4, d) = 5557
d = 6, M(4, d) = 3,  N(4, d) = 1,    S(4, d) = 6661
d = 7, M(4, d) = 3,  N(4, d) = 9,    S(4, d) = 57863
d = 8, M(4, d) = 3,  N(4, d) = 1,    S(4, d) = 8887
d = 9, M(4, d) = 3,  N(4, d) = 7,    S(4, d) = 48073

Sum of 4-digit primes with most repeating digits = 273700.
Took: 0.025275 secs.

So M(4, 1) = 3 is the maximum number of repeated digits for a 4-digit prime where one is the repeated digit, there are N(4, 1) = 9 such primes, and the sum of these primes is S(4, 1) = 22275. It turns out that for d = 0, it is only possible to have M(4, 0) = 2 repeated digits, but there are N(4, 0) = 13 such cases.

---

Answer:

d = 0, M(10, d) = 8,   N(10, d) = 8,   S(10, d) = 38000000042
d = 1, M(10, d) = 9,   N(10, d) = 11,  S(10, d) = 12882626601
d = 2, M(10, d) = 8,   N(10, d) = 39,  S(10, d) = 97447914665
d = 3, M(10, d) = 9,   N(10, d) = 7,   S(10, d) = 23234122821
d = 4, M(10, d) = 9,   N(10, d) = 1,   S(10, d) = 4444444447
d = 5, M(10, d) = 9,   N(10, d) = 1,   S(10, d) = 5555555557
d = 6, M(10, d) = 9,   N(10, d) = 1,   S(10, d) = 6666666661
d = 7, M(10, d) = 9,   N(10, d) = 9,   S(10, d) = 59950904793
d = 8, M(10, d) = 8,   N(10, d) = 32,  S(10, d) = 285769942206
d = 9, M(10, d) = 9,   N(10, d) = 8,   S(10, d) = 78455389922

Sum of 10-digit primes with most repeating digits = 612407567715.
Took: 32.954932 secs.

* Very crude. Will come back if a better solution arise.

6/2/2012

=end

require 'mathn'

t = Time.now

def prime_sum(n)
  sum = 0

  (0..9).each do |d|            # find sum of primes of each digit (0-9)
    sum += S(n, d)
  end

  sum
end

def S(n, d)
  primes = Array.new
  m = n - 1

  while primes.size == 0        # keep going until find primes
    break if n - m > 2
    primes = make_num(n, d, n - m)
    m -= 1
  end

  sum = primes.inject(:+)
  puts "d = #{d}, M(#{n}, d) = #{m+1},\t N(#{n}, d) = #{primes.count},\t S(#{n}, d) = #{sum}\n"
  sum
end

def make_num(n, d, iter)
  if iter == 2
    primes = make_num2(n, d)
  else
    init = Array.new(n, d)
    num = Array.new
    primes = Array.new

    for p in 0..n-1
      num = Array.new(init)     # resetting the initial array
      (0..9).each do |j|
        next if j == d          # no need to loop the same digit
        num[p] = j
        next if num[0] == 0     # skipping num beginning with 0
        a = num.join.to_i
        next if a % 2 == 0
        primes << a if a.prime? # take only the primes
      end
    end
  end
  primes
end

### THIS WORK ONLY "TWICE"
def make_num2(n, d)
  init = Array.new(n, d)
  num = Array.new
  primes = Array.new

  for p in 0..n-1               # --try first digit
    num = Array.new(init)       # resetting the initial array
    (0..9).each do |j|
      next if j == d            # no need to loop the same digit
      num[p] = j
      next if num[0] == 0       # skipping num beginning with 0
      for q in 1..n-1           # --try second digit
        num2 = Array.new(num)
        if q != p
          (0..9).each do |k|
            next if k == d      # no need to loop the same digit
            num2[q] = k
            next if num2[0] == 0 # skipping num beginning with 0
            a = num2.join.to_i
            next if a % 2 == 0
            primes << a if a.prime? # take only the primes
            # puts "#{num.inspect} #{num2.inspect} #{a} p=#{p} q=#{q} j=#{j} k=#{k} #{a.prime?}"
          end
        end
      end
    end
  end
  primes.uniq                   # possibility of duplicates, take only once
end

n = 4

puts "\nSum of #{n}-digit primes with most repeating digits = #{prime_sum(n)}."

puts "Took: #{Time.now - t} secs."
