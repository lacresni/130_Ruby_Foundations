# - Store Word by calling downcase on it
# - Initialize empty array result = []
# - For each element in Array of Strings:
#   - Downcase
#   - Compare string lenght with Word lenght
#      - If not, next
#   - Compare if string == Word
#      - If not, next
#   - Compare string.sort with Word.sort
#      - If true, it is an anagram so store element into result[] array

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    word.downcase.chars.sort == @word.chars.sort &&
      word.downcase != @word
  end
end
