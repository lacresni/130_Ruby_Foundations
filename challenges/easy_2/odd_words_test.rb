require 'minitest/autorun'
require_relative 'odd_words'

# - Test input string validity
#   - Contains only valid character set
#   - Ends with a point
#   - No words bigger than 20 letters


class OddWordsTest < Minitest::Test
  def test_string_without_ending_point
    assert_raises(ArgumentError) do
      OddWords.reverse_odd_words('no ending point')
    end
  end

  def test_string_with_invalid_character
    assert_raises(ArgumentError) do
      OddWords.reverse_odd_words('these chars ,!§:;#@ are not allowed.')
    end
  end

  def test_string_with_word_bigger_than_20_bytes
    assert_raises(ArgumentError) do
      OddWords.reverse_odd_words('thisbigwordisnotallowed.')
    end
  end

  def test_string_with_no_word
    assert_raises(ArgumentError) do
      OddWords.reverse_odd_words('.')
    end
  end

  def test_string_valid_string
    assert_equal 'whats eht matter htiw kansas.',
       OddWords.reverse_odd_words('whats the matter with kansas.')
  end

  def test_string_valid_string_with_one_word
    assert_equal 'kansas.', OddWords.reverse_odd_words('kansas.')
  end

  def test_string_valid_string_with_two_words
    assert_equal 'love sasnak.', OddWords.reverse_odd_words('love kansas.')
  end

  def test_string_with_more_than_one_space
    assert_equal 'whats eht matter htiw kansas.',
       OddWords.reverse_odd_words('whats    the   matter      with  kansas       .')
  end

end
