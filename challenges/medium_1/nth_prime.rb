class Prime
  class << self # metaclass definition => allows adding methods to an object
    def nth(position)
      raise ArgumentError if position <= 0

      primes = []
      until primes[position - 1]
        primes << next_prime(primes)
      end
      primes[position - 1]
    end

    private

    def next_prime(primes_list)
      start_nb = primes_list.last.nil? ? 2 : primes_list.last + 1
      until prime?(start_nb, primes_list)
        start_nb += 1
      end
      start_nb
    end

    def prime?(number, primes_list)
      limit = Math.sqrt(number).to_i
      primes_list.each do |prime|
        break if prime > limit
        return false if number % prime == 0
      end
      true
    end
  end
end
