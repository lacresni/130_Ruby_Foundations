require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  def hire; end
end

class ExceptionTest < MiniTest::Test

  def test_exception_assertion
    # Write a minitest assertion that will fail unless employee.hire raises
    # a NoExperienceError exception.
    employee = Employee.new
    
    assert_raises(NoExperienceError) { employee.hire }
  end

end
