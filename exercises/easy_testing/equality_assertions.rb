require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EqualityTest < MiniTest::Test

  def test_equality
    value = 'ABC'
    assert_equal('xyz', value.downcase)
  end

end
