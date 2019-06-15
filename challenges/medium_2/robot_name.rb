class Robot
  @@names = []

  attr_reader :name

  def initialize
    reset
  end

  def reset
    generate_unique_name
  end

  private

  def generate_unique_name
    @name = random_name
    while @@names.include? name
      @name = random_name
    end
    @@names << name
  end

  def random_name
    @name = ''
    2.times { @name += ('A'..'Z').to_a.sample }
    3.times { @name += (0..9).to_a.sample.to_s }
    name
  end
end
