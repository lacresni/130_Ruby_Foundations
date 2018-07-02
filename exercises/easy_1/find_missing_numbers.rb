# Write a method that takes a sorted array of integers as an argument,
# and returns an array that includes all of the missing integers (in order)
# between the first and last elements of the argument.

def missing(sorted_array)
  range = (sorted_array.first...sorted_array.last)
  range.to_a.each_with_object([]) do |int, arr|
    arr << int unless sorted_array.include?(int)
  end
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

def missing_ls(sorted_array)
  result = []
  # Ex: each_cons(2) => [[-3, -2], [-2, 1], [1, 5]]
  sorted_array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

p missing_ls([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing_ls([1, 2, 3, 4]) == []
p missing_ls([1, 5]) == [2, 3, 4]
p missing_ls([6]) == []

def missing_further(sorted_array)
  counter = sorted_array.first + 1
  result = []

  while counter < sorted_array.last
    result << counter unless sorted_array.include?(counter)
    counter += 1
  end

  result
end

p missing_further([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing_further([1, 2, 3, 4]) == []
p missing_further([1, 5]) == [2, 3, 4]
p missing_further([6]) == []
