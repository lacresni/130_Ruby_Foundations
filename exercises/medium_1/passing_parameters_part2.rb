# The method should yield the contents of the array to a block,
# which should assign your block variables in such a way that it ignores the
# first two elements, and groups all remaining elements as a raptors array.

def group(array)
  yield(array)
end

group(%w(raven finch hawk eagle)) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(", ")}."
end
