class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase
  end

  def word_count
    delimiters = /'?[^0-9a-z']+'?/
    @phrase.split(delimiters).each_with_object(Hash.new(0)) do |word, result|
      result[word] += 1
    end
  end
end
