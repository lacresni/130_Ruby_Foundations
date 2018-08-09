class PigLatin
  AY_SOUND = 'ay'

  def self.translate(phrase)
    phrase.split(' ').map do |word|
      if begin_with_vowel_sound?(word)
        word + AY_SOUND
      else
        sound, rest_of_word = parse_for_consonants(word)
        rest_of_word + sound + AY_SOUND
      end
    end.join(' ')
  end

  def self.begin_with_vowel_sound?(word)
    word.match(/\A([aeiou]|[xy][^aeiou])/)
  end

  def self.parse_for_consonants(word)
    consonant_split = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)
    [consonant_split[1], consonant_split[2]]
  end
end
