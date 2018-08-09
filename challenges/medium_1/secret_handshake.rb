class SecretHandshake
  def initialize(number)
    @binary_digits = to_binary_digits(number)
  end

  def commands
    @binary_digits.each_index.each_with_object([]) do |index, result|
      if index < 4
        result << SECRET_EVENTS[index] if @binary_digits[index] == 1
      elsif index == 4
        result.reverse! if @binary_digits[index] == 1
      end
    end
  end

  private

  SECRET_EVENTS = ['wink', 'double blink', 'close your eyes', 'jump']

  def to_binary_digits(number)
    binary = 0
    if number.instance_of? Integer
      binary = number
    elsif number.instance_of? String
      binary = number.to_i(2) if valid_binary_string?(number)
    end
    binary.digits(2)
  end

  def valid_binary_string?(string)
    string.match(/\A[01]+\z/)
  end
end
