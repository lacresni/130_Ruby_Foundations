def count(*arg)
  arg.reduce(0) do |counter, val|
    yield(val) ? counter + 1 : counter
  end
end

# p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6, &:odd?) == 2
# p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6, &:even?) == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |_| true } == 3
p count() { |_| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
