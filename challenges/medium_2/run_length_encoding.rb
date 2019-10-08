class RunLengthEncoding
  def self.encode(input)
    encoded = ""
    index = 0

    while input[index]
      current_letter = input[index]
      # extract serie of letters starting from index
      serie = input[index..-1].scan(/^#{current_letter}+/)
      nb_letters = serie.first.size
      encoded << nb_letters.to_s if nb_letters > 1
      encoded << current_letter
      index += nb_letters
    end

    encoded
  end

  def self.decode(input)
    decoded = ""
    codes = input.scan(/\d*./) # extract (number, letter) couples (ex: 12D)
    codes.each do |code|
      letter = code[-1] # last char is always a letter
      nb_letters = code[0..-2].to_i # extract number
      nb_letters = 1 if nb_letters == 0 # number is 0 if no number
      decoded << letter * nb_letters
    end
    decoded
  end
end
