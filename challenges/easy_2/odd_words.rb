class OddWords
  def self.reverse_odd_words(string)
    raise ArgumentError unless valid?(string)

    words = string.split(/[ \.]+/).each_with_index.map do |word, index|
      index.odd? ? word.reverse : word
    end
    words.join(' ') + '.'
  end

  def self.valid?(string)
    string.match(/\A(\b[a-z]{1,20}\b *)+\.\z/)
  end
end
