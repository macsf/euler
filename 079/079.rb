#!/usr/bin/env ruby

# File: 079.rb
# Created: 2015-12-24T14:46:48+0700
# Maintainer: Sutthichok Wongthavorn <sutthichok@gmail.com>

code = []

File.new(File.dirname(__FILE__) + '/keylog.txt').each do |line|
  if code.length == 0
    code = line.chomp.split('')
  else
    prev_pos = nil

    line.chomp.split('').each do |n|
      pos = code.index(n)

      if pos.nil?
        code.push(n)
      else
        if !prev_pos.nil? && prev_pos > pos
          code.delete_at(code.index(n))
          code.insert(prev_pos, n)
        end
        prev_pos = pos
      end
    end
  end
end

puts code.join

# vim: set ts=2 sw=2 sts=2 et
