class BeerSong
  def initialize
    @verses = []
    @verses << Verse0.new
    @verses << Verse1.new
    @verses << Verse2.new
    (3..99).each { |num| @verses << Verse.new(num) }
  end

  def verse(num)
    @verses[num].first_line + @verses[num].second_line
  end

  def verses(start, last)
    song = ''

    start.downto(last) do |current_verse|
      song += verse(current_verse) + "\n"
    end

    song.chop
  end

  def lyrics
    verses(99, 0)
  end
end

class Verse
  def initialize(num)
    @num = num
  end

  def first_line
    "#{@num} bottles of beer on the wall, #{@num} bottles of beer.\n"
  end

  def second_line
    "Take one down and pass it around, " \
      "#{@num - 1} bottles of beer on the wall.\n"
  end
end

class Verse2 < Verse
  def initialize
    super(2)
  end

  def second_line
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end

class Verse1 < Verse
  def initialize
    super(1)
  end

  def first_line
    "#{@num} bottle of beer on the wall, #{@num} bottle of beer.\n"
  end

  def second_line
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class Verse0 < Verse
  def initialize
    super(0)
  end

  def first_line
    "No more bottles of beer on the wall, no more bottles of beer.\n"
  end

  def second_line
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end
