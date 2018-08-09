class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    @number.digits.each_with_index.map do |digit, index|
      new_digit = digit
      if index.odd?
        new_digit *= 2
        new_digit -= 9 unless new_digit < 10
      end
      new_digit
    end.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    new_number = number * 10
    luhn_number = new(new_number)
    if luhn_number.valid?
      new_number
    else
      last_digit_checksum = luhn_number.checksum % 10
      new_number + (10 - last_digit_checksum)
    end
  end
end
