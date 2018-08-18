class School
  def initialize
    # @roster = {}
    @roster = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(name, grade)
    @roster[grade] << name
  end

  def grade(grade)
    @roster[grade]
  end

  def to_h
    @roster.keys.sort.each_with_object({}) do |grade, sorted|
      sorted[grade] = @roster[grade].sort
    end
  end
end
