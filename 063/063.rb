#!/usr/bin/env ruby

# File: 063.rb
# Created: 2015-12-24T16:38:29+0700
# Maintainer: Sutthichok Wongthavorn <sutthichok@gmail.com>

count = 0
(1..10).each do |b|
  (1..100).each do |e|
    n = b**e
    if n.to_s.length == e
      print "(#{b}, #{e}) "
      count += 1
    end
  end
end

puts "\n\n"
puts count

# vim: set ts=2 sw=2 sts=2 et
