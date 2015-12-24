#!/usr/bin/env ruby

# File: generate_codes.rb
# Created: 2015-12-24T17:47:58+0700
# Maintainer: Sutthichok Wongthavorn <sutthichok@gmail.com>

master = '4590218'
keyfile = 'keylog_1.txt'

codes = []
code_digits = 3

(0..50).each do
  rands = []
  s = []

  digit = 0
  while digit < code_digits
    random = rand(master.length)
    if rands.include?(random)
      next
    else
      rands.push(random)
      digit += 1
    end
  end
  rands.sort!

  rands.each { |n| s.push(master[n]) }
  codes.push(s.join)
end

# puts codes
File.new(keyfile, 'w').write(codes.join("\n"))

# vim: set ts=2 sw=2 sts=2 et
