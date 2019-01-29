=begin
  - Verify possible input formats with regex
    - '(123) 456-7890' => regex /\([0-9]{3}\) [0-9]{3}-[0-9]{4}/
    - '456.123.7890' => regex /[0-9]{3}\.[0-9]{3}\.[0-9]{4}/
    - 10 digits => regex /[0-9]{10,11}/
      - if 11 digits, check number starts with a '1' such as '19876543210'
        - returns last 10 digits
  - Substitute non digit chars with '' to remove all characters except digits
    - "(123) 456-7890".gsub(/[^0-9]/, '')
  - Check size
    - if size = 10, ok return number
    - if size = 11
        - check if first digit = 1, ok return number
    - else return '0000000000'
=end

class PhoneNumber
  INVALID_NUMBER = '0000000000'

  attr_reader :number

  def initialize(number)
    @number = INVALID_NUMBER
    return unless input_number_valid?(number)

    stripped_number = number.gsub(/[^0-9]/, '')
    case stripped_number.size
    when 10
      @number = stripped_number
    when 11
      @number = stripped_number[1..-1] if stripped_number.start_with?('1')
    end
  end

  def area_code
    @number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..9]}"
  end

  private

  def input_number_valid?(number)
    # Check valid phone number formats:
    # - '(123) 456-7890'
    # - '456.123.7890'
    # - 10/11 digits
    if number.match(/\([0-9]{3}\) [0-9]{3}-[0-9]{4}/) ||
       number.match(/[0-9]{3}\.[0-9]{3}\.[0-9]{4}/) ||
       number.match(/[0-9]{10,11}/)
      true
    else
      false
    end
  end
end
