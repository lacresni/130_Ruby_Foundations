class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand)
    # @strand.chars.each_with_index.reduce(0) do |distance, (value, index)|
    #   strand[index] && value != strand[index] ? distance + 1 : distance
    # end
    @strand.chars.each_index.reduce(0) do |distance, index|
      strand[index] && @strand[index] != strand[index] ? distance + 1 : distance
    end
  end
end
