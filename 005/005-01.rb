require 'prime'

running = 1
finished = false

n = 20 # max number in range

prime_in_range = (1..n).to_a.keep_if(&:prime?)

until finished
  if prime_in_range.take_while { |p| running % p == 0 }.length == prime_in_range.length

    if (1..n).to_a.take_while { |i| running % i == 0 }.length == n
      # that_num = running
      finished = true
      break
    end
  end

  running += 1
end

p running
