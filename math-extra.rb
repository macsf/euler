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

require 'prime'

class Integer
  def factors
    return nil if self < 2

    primes, powers = prime_division.transpose
    exponents = powers.map { |i| (0..i).to_a }
    divisors = exponents.shift.product(*exponents).map do |pows|
      primes.zip(pows).map { |prime, power| prime**power }.inject(:*)
    end

    divisors.sort.map { |div| [div, self / div] }
  end

  def prime_factorization(n)
    def factor_generator(n)
      for prime_candidate in Prime::Generator23.new
        break if prime_candidate > n
        begin
          div, mod = n.divmod(prime_candidate)
          if mod == 0
            yield prime_candidate
            n = div
          end
        end while mod == 0
      end
    end

    to_enum(:factor_generator, n).to_a
  end
end
