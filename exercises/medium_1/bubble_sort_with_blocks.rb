def bubble_sort!(arr)
  size = arr.size

  loop do
    swap = false
    1.upto(size - 1) do |index|
      first = arr[index - 1]
      second = arr[index]
      result = block_given? ? yield(first, second) : first <= second
      next if result
      arr[index - 1], arr[index] = arr[index], arr[index - 1]
      swap = true
    end
    size -= 1 # last element is now sorted, can be skipped for next iteration
    break unless swap
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w[sue Pete alice Tyler rachel Kim bonnie]
bubble_sort!(array)
p array == %w[Kim Pete Tyler alice bonnie rachel sue]

array = %w[sue Pete alice Tyler rachel Kim bonnie]
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w[alice bonnie Kim Pete rachel sue Tyler]
