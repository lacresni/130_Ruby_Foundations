require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludedObjectTest < MiniTest::Test

  def test_included_object_assertion
    list = [1, 2, 3]
    assert_includes(list, 'xyz')
  end

end
