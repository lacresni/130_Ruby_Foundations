def select(array)
  selection = []
  counter = 0
  while counter < array.size do
    selection << array[counter] if yield(array[counter])
    counter += 1
  end

  selection
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
selected = select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

p array == selected
p array.equal?(selected)

puts "======================================"
puts "        Solution 2"
puts "======================================"

def select2(array)
  selection = []

  array.size.times do |index|
    selection << array[index] if yield(array[index])
  end

  selection
end

p select2(array) { |num| num.odd? }      # => [1, 3, 5]
p select2(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
selected = select2(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

p array == selected
p array.equal?(selected)

puts "======================================"
puts "        Solution 3"
puts "======================================"

def select3(array)
  selection = []

  array.each do |item|
    selection << item if yield(item)
  end

  selection
end

p select3(array) { |num| num.odd? }      # => [1, 3, 5]
p select3(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
selected = select3(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

p array == selected
p array.equal?(selected)
