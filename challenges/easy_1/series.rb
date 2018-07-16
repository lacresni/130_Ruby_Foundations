class Series
  def initialize(serie)
    @serie = serie.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError, 'Requested size too long' if size > @serie.size

    index_list = 0.upto(@serie.size - size).to_a
    index_list.each_with_object([]) do |index, result|
      result << @serie[index, size] # use Array#slice method
    end

    # Most concise solution using Enumerable#each_cons method
    # @serie.each_cons(size).to_a
  end
end
