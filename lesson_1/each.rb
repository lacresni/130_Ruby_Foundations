def each(array)
  counter = 0
  while counter < array.size do
    yield(array[counter])
    counter += 1
  end

  array
end

a = [1, 2, 3]

b = each(a) { |x| puts "#{x + 1}" }

# Verify that #each returns the original collection
p a.equal?(b)
