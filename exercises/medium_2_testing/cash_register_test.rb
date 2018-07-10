require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

  def setup
    @cash_register = CashRegister.new(500)
  end

  def test_accept_money
    transaction = Transaction.new(100)
    transaction.amount_paid = 100
    previous_amount = @cash_register.total_money
    new_amount = @cash_register.accept_money(transaction)
    assert_equal(previous_amount + 100, new_amount)
  end

  def test_change_money
    transaction = Transaction.new(100)
    transaction.amount_paid = 120

    assert_equal(20, @cash_register.change(transaction))
  end

  def test_give_receipt
    transaction = Transaction.new(100)

    assert_output("You've paid $100.\n") { @cash_register.give_receipt(transaction) }
  end

end
