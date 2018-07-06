def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
result1 = [8,10,12,14,16,33].map(&base8_proc)

p result1 == [10, 12, 14, 16, 20, 41]

# above line is equivalent to the following code with a block
result2 = [8,10,12,14,16,33].map do |n|
  convert_to_base_8(n)
end

p result2 == result1
