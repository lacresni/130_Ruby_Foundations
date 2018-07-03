def all?(collection)
  collection.each do |item|
    return false unless yield(item)
  end
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |_| true } == true
p all?([1, 3, 5, 7]) { |_| false } == false
p all?([]) { |_| false } == true
