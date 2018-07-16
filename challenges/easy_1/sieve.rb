class Sieve
  PRIME = true
  NOT_PRIME = false

  def initialize(limit)
    @range = (2..limit).to_a
    @limit = limit
    # Note: Index 0 and 1 won't be used in @prime_marker array
    @prime_marker = Array.new(limit + 1, PRIME)
  end

  def primes
    @range.each_with_object([]) do |number, prime_list|
      if @prime_marker[number] == PRIME
        prime_list << number
        mark_multiples(number)
      end
    end
  end

  private

  def mark_multiples(number)
    1.upto(@limit / number) do |counter|
      @prime_marker[number * counter] = NOT_PRIME
    end
  end
end
