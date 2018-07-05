require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TypeTest < MiniTest::Test

  def test_type_assertion
    # Write a minitest assertion that will fail if value is not an instance
    # of the Numeric class exactly.
    # value may not be an instance of one of Numeric's superclasses.
    value = 1
    assert_instance_of(Numeric, value)
  end

end
