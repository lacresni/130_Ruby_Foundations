require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NilTest < MiniTest::Test

  def test_nil_assertion
    value = 'ABC'
    assert_nil(value)
  end

end
