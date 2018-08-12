class Scrabble
  SCORING_VALUES = {
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
  }

  def initialize(word)
    @word = word.nil? ? '' : word
  end

  def score
    @word.upcase.chars.reduce(0) do |score, char|
      SCORING_VALUES.each do |key, value|
        score += value if key.include?(char)
      end
      score
    end
  end

  def self.score(word)
    new(word).score
  end
end
