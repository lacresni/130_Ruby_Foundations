require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class RefutationTest < MiniTest::Test

  def test_refutation
    # Write a unit test that will fail if 'xyz' is one of the elements in
    # the Array list

    list = ['abc', 'efg', 'xyz']
    refute_includes(list, 'xyz')
  end

end
