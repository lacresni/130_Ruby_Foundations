# Group 1 : Procs
puts "Group 1: Procs"
=begin
Calling a Proc object without the right number of argument is similar to block
behavior (no exception raised and argument replaced by nil if missing)
=end
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')
my_proc.call('cat', 'dog')

# Group 2 : Lambdas
=begin
  - A lambda is not a class (Lambda does not exist)
  - A lambda is a Proc object
  - Can be defined in 2 different ways:
    * lambda + block
    * = -> (arg) + block
  - Raise an ArgumentError exception when called with wrong number of arguments
  - Argument passed in implicitely between call and the block
=end
puts "\nGroup 2: Lambdas"
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

# Group 3
puts "\nGroup 3: Blocks"
=begin
 - Block is mandatory when yield method is called (otherwise use block_given? method)
 - Argument must be passed explicitely to the block through yield method
=end
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# Group 4
puts "\nGroup 4: Blocks"
=begin
 - Block is mandatory when yield method is called
 - Argument must be passed explicitely to the block through yield method
 - If an argument is not passed to the block, then it is considered as nil
 - Block cannot access method local variable unless they are passed in as
   a parameter
=end
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# block_method_2('turtle') { puts "This is a #{animal}."}
