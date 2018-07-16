class Series
  def initialize(serie)
    @serie = serie.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError if size > @serie.size

    (0..(@serie.size - size)).to_a.each_with_object([]) do |index, result|
      inner_arr = []
      size.times do |inner_index|
        inner_arr << @serie[index + inner_index]
      end
      result << inner_arr
    end
  end
end
