#!/Users/sutthichok/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

require 'mathn'

t = Time.now

n = 4 # digits
LOWER = 1 * 10**(n-1)
UPPER = 1 * 10**n - 1
P_UPPER = 10**(n / 2) + 1
sum = 0

the_primes = Array.new

class Array
  def to_i
    self.join.to_i
  end
end

d = 0

def make_num(digit, length, max_repeat = nil)
  num = Array.new
  rep_nums = Array.new

  max_repeat = length-1 if max_repeat.nil?
  inc = 0
  
  puts max_repeat
  
  for i in 0..length-1
    num.fill(digit, 0..length-1)
    for k in 0..9
      num[i] = k
      #next if num[0] == 0
      # for p in 1..length-max_repeat
        # num[p] = k
        # next if num[0] == 0
        a = num.join.to_i
        print "#{num} #{a} i = #{i}, p = #{p}, k = #{k}"

        if a.prime?
          rep_nums << a
          print " <-- p"
        end
        puts ''
      # end

    end
  end

rep_nums.clear
  rep_nums.sort
end

def make_repeating_digits_num(digit, length)
  dec = 1
  rep_nums = Array.new

  while rep_nums.count == 0
    break if length - dec < 2
    rep_nums = make_num(digit, length, length - dec)
    dec += 1
  end

  rep_nums
end


# (0..9).each do |d|
primes = make_repeating_digits_num(d, n)
puts "N(#{n}, #{d}) = #{primes.count}\t S(#{n}, #{d}) = #{primes.inject(:+)}"
the_primes << primes
# end

sum = the_primes.flatten.inject(:+)
puts the_primes.inspect

puts "Sum of primes with repating digits: #{sum}"
puts "Diff: #{612407567715 - sum}"
puts "Took: #{(Time.now - t)} secs."
