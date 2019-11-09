class Element
  attr_accessor :next
  attr_reader :datum

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def self.from_a(arr)
    linked_list = SimpleLinkedList.new
    arr&.reverse&.each { |value| linked_list.push(value) }
    linked_list
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def head
    @list[0]
  end

  def peek
    return nil if empty?

    element = head
    element.datum
  end

  def push(value)
    element = Element.new(value, head)
    @list.unshift(element)
  end

  def pop
    element = @list.shift
    element.datum
  end

  def to_a
    @list.each_with_object([]) { |element, arr| arr.push(element.datum) }
  end

  def reverse
    linked_list = SimpleLinkedList.new
    @list&.each { |element| linked_list.push(element.datum) }
    linked_list
  end
end
