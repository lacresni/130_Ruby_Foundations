def max_by(array)
  return nil if array.empty?

  max_value = yield(array[0])
  max_item = array.first

  index = 1
  while index < array.size
    block_ret = yield(array[index])
    if block_ret > max_value
      max_value = block_ret
      max_item = array[index]
    end
    index += 1
  end
  max_item
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([[1, 2], [3, 4, 5], [6]], &:size) == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil
p max_by([]) { |value| value + 5 }.nil?
