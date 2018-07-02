# Write a method that takes an optional block.
# If the block is specified, the method should execute it,
# and return the value returned by the block.
# If no block is specified, the method should simply return the String
# 'Does not compute.'.

def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def compute_further(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

p compute_further(2) { |num| 5 + 3 + num } == 10
p compute_further('c') { |char| 'a' + 'b' + char } == 'abc'
p compute_further(3) == 'Does not compute.'
