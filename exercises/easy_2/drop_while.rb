def drop_while(collection)
  result = []
  collection.each do |val|
    result << val unless yield(val) && result.empty?
  end
  result
end

# p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6], &:odd?) == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6], &:even?) == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |_| true } == []
p drop_while([1, 3, 5, 6]) { |_| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |_| true } == []
