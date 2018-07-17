class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def to(number)
    sum_of_multiples(number, @multiples)
  end

  def self.to(number)
    SumOfMultiples.new.to(number)
  end

  private

  def sum_of_multiples(number, list)
    # First solution below
    # range = (1...number).to_a
    # range.select! do |num|
    #   list.any? { |multiple| num % multiple == 0 }
    # end
    # range.empty? ? 0 : range.reduce(&:+)

    # After code refactoring
    (1...number).to_a.reduce(0) do |sum, num|
      multiple = list.any? { |mult| num % mult == 0 }
      multiple ? num + sum : sum
    end
  end
end
