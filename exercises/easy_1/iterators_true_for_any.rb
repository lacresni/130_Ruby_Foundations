def any?(collection)
  collection.each do |n|
    return true if yield(n)
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |_| true } == true
p any?([1, 3, 5, 7]) { |_| false } == false
p any?([]) { |_| true } == false
