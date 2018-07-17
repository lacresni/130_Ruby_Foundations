class Octal
  def initialize(octal_str)
    validity = !!octal_str.match(/\A[0-7]+\z/)
    @octal_digits = validity ? octal_str.chars.map(&:to_i).reverse : []
  end

  def to_decimal
    @octal_digits.each_with_index.reduce(0) do |decimal_value, (digit, power)|
      decimal_value + digit * 8**power
    end
  end
end
