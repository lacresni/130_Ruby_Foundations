class BeerSong
  def verse(num)
    first_line_bottle = case num
                        when 1 then '1 bottle'
                        when 0 then 'No more bottles'
                        else "#{num} bottles"
                        end
    second_line_bottle = case num
                         when 2
                           "Take one down and pass it around, 1 bottle of beer on the wall.\n"
                         when 1
                           "Take it down and pass it around, no more bottles of beer on the wall.\n"
                         when 0
                           "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
                         else
                           "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
                         end

    "#{first_line_bottle} of beer on the wall, #{first_line_bottle.downcase} of beer.\n" +
    second_line_bottle
  end

  def verses(start, last)
    song = ''

    current_verse = start
    nb_verses = start - last + 1

    while nb_verses > 0 do
      song += verse(current_verse)

      nb_verses -= 1
      current_verse -= 1

      song += "\n" if nb_verses > 0
    end

    song
  end

  def lyrics
    verses(99, 0)
  end
end
