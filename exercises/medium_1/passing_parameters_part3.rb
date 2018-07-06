items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the
# corresponding output shown in numbers 1-4 listed below:
gather(items) do |*group, wheat|
  puts group.join(', ')
  puts wheat
end

# 1.
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!
puts

gather(items) do |apples, *group, wheat|
  puts apples
  puts group.join(', ')
  puts wheat
end

# 2.
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

puts

gather(items) do |apples, *group|
  puts apples
  puts group.join(', ')
end

# 3.
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

puts

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
