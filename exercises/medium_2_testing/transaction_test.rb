require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require 'stringio'

require_relative 'transaction'

class TransactionTest < MiniTest::Test

  def test_prompt_for_payment
    # test successful case
    transaction1 = Transaction.new(100)

    test1_io = StringIO.new("120")
    assert_output("You owe $100.\nHow much are you paying?\n") { transaction1.prompt_for_payment(input: test1_io) }
    assert_equal(120, transaction1.amount_paid)

    # test insufficient payment first
    transaction2 = Transaction.new(100)

    test2_io = StringIO.new("80\n120")
    test2_output = "You owe $100.\nHow much are you paying?\n" \
    "That is not the correct amount. Please make sure to pay the full cost.\n" \
    "You owe $100.\nHow much are you paying?\n"
    assert_output(test2_output) { transaction2.prompt_for_payment(input: test2_io) }
    assert_equal(120, transaction2.amount_paid)

    # test invalid payment first
    transaction3 = Transaction.new(100)

    test3_io = StringIO.new("0\n100")
    test3_output = "You owe $100.\nHow much are you paying?\n" \
    "That is not the correct amount. Please make sure to pay the full cost.\n" \
    "You owe $100.\nHow much are you paying?\n"
    assert_output(test3_output) { transaction3.prompt_for_payment(input: test3_io) }
    assert_equal(100, transaction3.amount_paid)

    # test invalid payment first, then insufficient payment, then valid payment
    transaction4 = Transaction.new(100)

    test4_io = StringIO.new("0\n50\n100")
    test4_output = "You owe $100.\nHow much are you paying?\n" \
    "That is not the correct amount. Please make sure to pay the full cost.\n" \
    "You owe $100.\nHow much are you paying?\n" \
    "That is not the correct amount. Please make sure to pay the full cost.\n" \
    "You owe $100.\nHow much are you paying?\n"
    assert_output(test4_output) { transaction4.prompt_for_payment(input: test4_io) }
    assert_equal(100, transaction4.amount_paid)

  end

end
