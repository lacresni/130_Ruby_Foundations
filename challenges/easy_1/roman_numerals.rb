class Integer
  THOUSANDS = { one: 'M', five: '', nine: '' }
  HUNDREDS = { one: 'C', five: 'D', nine: 'CM' }
  TENS = { one: 'X', five: 'L', nine: 'XC' }
  ONES = { one: 'I', five: 'V', nine: 'IX' }

  def to_roman
    roman = ''
    digits.each_with_index do |digit, index|
      case index
      when 3 then roman.prepend(digit_to_roman(digit, THOUSANDS))
      when 2 then roman.prepend(digit_to_roman(digit, HUNDREDS))
      when 1 then roman.prepend(digit_to_roman(digit, TENS))
      when 0 then roman.prepend(digit_to_roman(digit, ONES))
      end
    end
    roman
  end

  private

  def digit_to_roman(digit, roman_units)
    case digit
    when (0..3) then roman_units[:one] * digit
    when 4 then roman_units[:one] + roman_units[:five]
    when 5 then roman_units[:five]
    when (6..8) then roman_units[:five] + roman_units[:one] * (digit - 5)
    when 9 then roman_units[:nine]
    end
  end
end
