class House
  def pieces_paragraph(index)
    pieces[-index..-1]
  end

  def pieces_size
    pieces.size
  end

  def self.recite
    rhyme = ''
    house = House.new

    1.upto(house.pieces_size) do |index|
      paragraph_pieces = house.pieces_paragraph(index)

      rhyme += 'This is '
      (0...paragraph_pieces.size).to_a.each do |line|
        rhyme += paragraph_pieces[line].join("\n")
        rhyme += ' '
      end

      rhyme = rhyme.chop + ".\n\n"
    end

    rhyme.chop # remove extra '\n'
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
