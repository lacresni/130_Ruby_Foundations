# Use arrays to avoid use of case and if statements

class BeerSong
  FIRST_LINE = ['No more bottles', '1 bottle']
  SECOND_LINE = [
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n",
    "Take it down and pass it around, no more bottles of beer on the wall.\n",
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  ]

  def verse(num)
    first_line = FIRST_LINE.fetch(num, "#{num} bottles")
    default_second_line = "Take one down and pass it around, " \
      "#{num - 1} bottles of beer on the wall.\n"
    second_line = SECOND_LINE.fetch(num, default_second_line)

    "#{first_line} of beer on the wall, #{first_line.downcase} of beer.\n" +
      second_line
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
