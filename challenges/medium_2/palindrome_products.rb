class PalindromesProducts
  attr_accessor :value, :factors

  def initialize(init)
    @value = init
    @factors = []
  end

  def <<(factor)
    @factors << factor.sort
    @factors.uniq!
  end
end

class Palindromes
  attr_reader :smallest, :largest

  def initialize(min_factor: 1, max_factor: 1)
    @min_factor = min_factor
    @max_factor = max_factor

    @smallest = PalindromesProducts.new(@min_factor * @max_factor)
    @largest = PalindromesProducts.new(@min_factor)
  end

  def generate
    factors_range = (@min_factor..@max_factor).to_a
    # factors_list = factors_range.product(factors_range)
    factors_list = factors_range.repeated_combination(2).to_a

    factors_list.each do |factors|
      product = factors.first * factors.last
      if palindrome?(product)
        manage_smallest(product, factors)
        manage_largest(product, factors)
      end
    end
  end

  private

  def palindrome?(number)
    number.to_s.reverse == number.to_s
  end

  def manage_smallest(product, factors)
    @smallest = PalindromesProducts.new(product) if product < @smallest.value
    (@smallest << factors) if product <= @smallest.value
  end

  def manage_largest(product, factors)
    @largest = PalindromesProducts.new(product) if product > @largest.value
    (@largest << factors) if product >= @largest.value
  end
end
