#!/usr/bin/env ruby

# Use list_fibs(n) function
require '../math-extra.rb'

# find fib until max
# def list_fibs(max)
#   fib_nums = Array.new
#   fn = 0
#   n1 = 0
#   n2 = 1

#   fib_nums.push(1)
#   loop do
#     fn = n1 + n2
#     n1 = n2
#     n2 = fn
#     fib_nums.push(fn) if fn <= max
#     break if fn > max
#   end

#   return fib_nums
# end

t = Time.now

LIMIT = 4_000_000

puts list_fibs(LIMIT).select{ |n| n.even? }.inject(:+)

puts "\nTook: #{(Time.now - t)} secs."
