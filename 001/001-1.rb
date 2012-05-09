#!/usr/bin/env ruby

# 234168

# real0m0.072s
# user0m0.064s
# sys0m0.008s

LIMIT = 1000

print (1..LIMIT).to_a.find_all { |i| (i % 3 == 0 || i % 5 == 0) }.inject(:+)
