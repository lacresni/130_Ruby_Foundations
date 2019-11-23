class Diamond
  A_ORD = 'A'.ord

  def self.make_diamond(letter)
    return "A\n" if letter == 'A'

    height = (letter.ord - A_ORD) * 2 + 1

    top_part = top(letter, height)
    middle_part = middle(letter, height)
    bottom_part = top_part.split("\n").reverse.join("\n") + "\n"

    top_part + middle_part + bottom_part
  end

  def self.top(letter, height)
    mid_index = letter.ord - A_ORD

    top_part = first_line(height)

    1.upto(mid_index - 1) do |line|
      left_part = ' ' * (mid_index - line) +
                  (A_ORD + line).chr +
                  ' ' * (line - 1)
      top_part += left_part + ' ' + left_part.reverse + "\n"
    end

    top_part
  end

  def self.middle(letter, height)
    letter + ' ' * (height - 2) + letter + "\n"
  end

  def self.first_line(height)
    'A'.center(height) + "\n"
  end

  private_class_method :top
  private_class_method :middle
  private_class_method :first_line
end
