class WordProblem
  OPERATORS = {
    'plus' => "+",
    'minus' => "-",
    'multiplied' => "*",
    'divided' => "/"
  }

  def initialize(problem)
    @problem = problem
    @stack = []
  end

  def answer
    translate_problem
    compute_stack
  end

  private

  def number?(word)
    word.scan(/^\-*\d+$/).empty? == false
  end

  def operator?(word)
    OPERATORS.key?(word)
  end

  def pop_stack
    value = @stack.pop
    raise ArgumentError unless value

    value
  end

  def stack_empty?
    @stack.empty?
  end

  def translate_problem
    words = @problem.delete('?').split
    words.each do |word|
      @stack.unshift(word) if operator?(word) || number?(word)
    end
  end

  def compute_stack
    # extract first number
    result = pop_stack.to_i

    loop do
      # extract operator and next operand
      operator = OPERATORS[pop_stack]
      next_operand = pop_stack.to_i

      # compute new result
      result = result.send(operator, next_operand)
      break if stack_empty?
    end

    result
  end
end
