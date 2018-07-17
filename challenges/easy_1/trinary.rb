class Trinary
  def initialize(trinary_str)
    validity = !!trinary_str.match(/\A[0-2]+\z/)
    @trinary_digits = validity ? trinary_str.chars.map(&:to_i).reverse : []
  end

  def to_decimal
    @trinary_digits.each_with_index.reduce(0) do |decimal, (digit, index)|
      decimal + digit * 3**index
    end
  end
end
