require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class KindTest < MiniTest::Test

  def test_kind_assertion
    # Write a minitest assertion that will fail if the class of value is not
    # Numeric or one of Numeric's subclasses (e.g., Integer, Fixnum, Float, etc).
    value = 'abc'
    assert_kind_of(Numeric, value)
  end

end
