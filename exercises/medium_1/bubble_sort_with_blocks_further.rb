def swap_array_values!(array, index1, index2)
  array[index1], array[index2] = array[index2], array[index1]
end

def bubble_sort!(arr)
  size = arr.size

  loop do
    swap = false
    1.upto(arr.size - 1) do |index|
      first = arr[index - 1]
      second = arr[index]

      result = block_given? ? yield(first) <= yield(second) : first <= second
      next if result
      swap_array_values!(arr, index - 1, index)
      swap = true
    end
    size -= 1 # last element is now sorted, can be skipped for next iteration
    break unless swap
  end
  nil
end

array = %w[sue Pete alice Tyler rachel Kim bonnie]
bubble_sort!(array)
p array == %w[Kim Pete Tyler alice bonnie rachel sue]

array = %w[sue Pete alice Tyler rachel Kim bonnie]
bubble_sort!(array) { |value| value.downcase }
p array == %w[alice bonnie Kim Pete rachel sue Tyler]
