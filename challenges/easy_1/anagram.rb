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

  def match(candidates)
    candidates.select { |candidate| anagram?(candidate.downcase) }
  end

  private

  def anagram?(candidate)
    candidate.size == @word.size &&
      candidate != @word &&
      candidate.chars.sort == @word.chars.sort
  end
end
