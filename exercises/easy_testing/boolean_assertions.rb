require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class BooleanTest < MiniTest::Test

  def test_assertion
    # Write a minitest assertion that will fail if the value.odd? is not true.
    value = 2
    assert_equal(true, value.odd?)
  end

end
