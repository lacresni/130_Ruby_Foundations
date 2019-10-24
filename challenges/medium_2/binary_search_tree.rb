class Bst
  attr_reader :data, :left, :right

  def initialize(number)
    @data = number
    @left = nil
    @right = nil
  end

  def insert(number)
    if number <= data
      @left = insert_node!(@left, number)
    else
      @right = insert_node!(@right, number)
    end
  end

  def each(&block)
    # return an iterator if no block given
    return to_enum(:each) unless block_given?

    @left&.each(&block)
    yield data
    @right&.each(&block)
  end

  private

  def insert_node!(node, number)
    if node
      node.insert(number)
    else
      node = Bst.new(number)
    end
    node
  end
end
