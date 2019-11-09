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
  attr_reader :head

  def self.from_a(arr)
    linked_list = SimpleLinkedList.new
    arr&.reverse&.each { |value| linked_list.push(value) }
    linked_list
  end

  def empty?
    @head.nil?
  end

  def to_a
    return [] if empty?

    arr = []
    element = @head
    loop do
      arr.push(element.datum)
      break if element.next.nil?

      element = element.next
    end
    arr
  end

  def size
    to_a.size
  end

  def push(value)
    @head = Element.new(value, head)
  end

  def pop
    element = @head
    @head = @head.next
    element.datum
  end

  def peek
    head&.datum
  end

  def reverse
    linked_list = SimpleLinkedList.new
    to_a.each { |value| linked_list.push(value) }
    linked_list
  end
end
