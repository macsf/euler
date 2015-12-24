# find fib until max
def list_fibs(max)
  fib_nums = []
  fn = 0
  n1 = 0
  n2 = 1

  fib_nums.push(1)
  loop do
    fn = n1 + n2
    n1 = n2
    n2 = fn
    fib_nums.push(fn) if fn <= max
    break if fn > max
  end

  fib_nums
end
