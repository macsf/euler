# actual conversion

# Saved: 743
# Took: 0.032177


class String
  def roman_to_int_elem
    int = 0

    case self
    when 'CM'
      int = 900
    when 'CD'
      int = 400
    when 'XC'
      int = 90
    when 'XL'
      int = 40
    when 'IX'
      int = 9
    when 'IV'
      int = 4
    when 'M'
      int = 1000
    when 'D'
      int = 500
    when 'C'
      int = 100
    when 'L'
      int = 50
    when 'X'
      int = 10
    when 'V'
      int = 5
    when 'I'
      int = 1
    end

    int
  end

  def roman_to_int
    self.split(/(CM)|(CD)|(XC)|(XL)|(IX)|(IV)|(M)|(D)|(C)|(L)|(X)|(V)|(I)/).delete_if{|e| e == ''}.map(&:roman_to_int_elem).inject(:+)
  end
end

class Integer
  def int_to_roman
    int = self

    roman = ''
    roman += 'M' * (int / 1000)
    int %= 1000

    if int / 100 == 9
      roman += 'CM'
    elsif int / 100 > 5
      roman += 'D' + 'C' * ((int / 100) - 5)
    elsif int / 100 == 5
      roman += 'D'
    elsif int / 100 == 4
      roman += 'CD'
    else
      roman += 'C' * (int / 100)
    end
    int %= 100

    if int / 10 == 9
      roman += 'XC'
    elsif int / 10 > 5
      roman += 'L' + 'X' * ((int / 10) - 5)
    elsif int / 10 == 5
      roman += 'L'
    elsif int / 10 == 4
      roman += 'XL'
    else
      roman += 'X' * (int / 10)
    end
    int %= 10

    if int == 9
      roman += 'IX'
    elsif int > 5
      roman += 'V' + 'I' * (int - 5)
    elsif int == 5
      roman += 'V'
    elsif int == 4
      roman += 'IV'
    else
      roman += 'I' * int
    end

    roman
  end
end

t = Time.new

init_char_count = 0
new_char_count = 0

File.open('./roman.txt').read.split("\r\n").each do |r|
  # int = r.roman_to_int
  # rom = int.int_to_roman
  # puts "#{r}\t #{int}\t #{rom}\t #{rom.roman_to_int} #{r == rom}"
  init_char_count += r.length
  new_char_count += r.roman_to_int.int_to_roman.length
end

puts "Saved: #{init_char_count - new_char_count}"
puts "Took: #{Time.new - t}"
