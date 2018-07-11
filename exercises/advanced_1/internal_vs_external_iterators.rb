factorial = Enumerator.new do |yielder|
  accumulator = number = 1
  loop do
    yielder << accumulator
    accumulator, number = accumulator * number, number + 1
  end
end

# Use iterator as an external iterator
7.times { puts factorial.next }

puts "Rewind iterator"
factorial.rewind

# Use iterator as an internal iterator
factorial.each_with_index do |value, index|
  puts value
  break if index == 6 # avoid infinite loop
  index += 1
end
