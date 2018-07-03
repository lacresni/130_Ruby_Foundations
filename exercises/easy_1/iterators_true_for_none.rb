def any?(collection)
  collection.each do |n|
    return true if yield(n)
  end
  false
end

def none_further?(collection, &block)
  !any?(collection, &block)
end

def none?(collection)
  collection.each do |item|
    return false if yield(item)
  end
  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |_| true } == false
p none?([1, 3, 5, 7]) { |_| false } == true
p none?([]) { |_| true } == true

p none_further?([2, 4, 6, 8]) { |value| value.odd? } == true
