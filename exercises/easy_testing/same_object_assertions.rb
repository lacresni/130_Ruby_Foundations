require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class List
  def process
    List.new
  end
end

class SameObjectTest < MiniTest::Test

  def test_same_object_assertion
    # Write a unit test that will fail if list and the return value of
    # list.process are different objects.
    list = List.new
    assert_same(list, list.process)
  end

end
