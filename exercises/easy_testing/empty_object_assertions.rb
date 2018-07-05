require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EmptyObjectTest < MiniTest::Test

  def test_empty_object_assertion
    list = [1, 2, 3]
    assert_empty(list)
  end

end
