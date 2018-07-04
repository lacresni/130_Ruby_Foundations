def map(collection)
  collection.each_with_object([]) do |val, result|
    result << yield(val)
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |_| true } == []
p map(['a', 'b', 'c', 'd']) { |_| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map(['a', 'b', 'c', 'd'], &:upcase) == ['A', 'B', 'C', 'D'] # please Rubocop
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

p map({ a: 2, b: 3, c: 4 }) { |_, val| val**2 }

def map_with_reduce(collection)
  collection.reduce([]) do |result, val|
    result << yield(val)
  end
end

p map_with_reduce([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map_with_reduce({ a: 2, b: 3, c: 4 }) { |_, val| val**2 }
