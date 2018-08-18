

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    clear
    @size = size
  end

  def read
    raise BufferEmptyException if @buffer.empty?

    @buffer.shift
  end

  def write(item)
    raise BufferFullException unless @buffer.size < @size

    @buffer.push(item) unless item.nil?
  end

  def write!(item)
    return if item.nil?

    read unless @buffer.size < @size
    write(item)
  end

  def clear
    @buffer = []
  end
end
