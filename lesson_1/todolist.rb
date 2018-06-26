# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation
  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.instance_of?(Todo)

    @todos << todo
  end

  def <<(todo)
    add(todo)
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def to_s
    str = "---- #{title} ----\n\r"
    @todos.each { |todo| str += "#{todo}\n\r" }
    str
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

puts "---- Adding to the list -----"

# add
p list.add(todo1)                 # adds todo1 to end of list, returns list
p list.add(todo2)                 # adds todo2 to end of list, returns list
p list.add(todo3)                 # adds todo3 to end of list, returns list
begin
  list.add(1) # raises TypeError with message "Can only add Todo objects"
  puts false
rescue TypeError
  puts true
end

# <<
# same behavior as add

puts "---- Interrogating the list -----"

# size
p list.size == 3 # returns 3

# first
p list.first.equal?(todo1) # returns todo1, which is the first item in the list

# last
p list.last.equal?(todo3) # returns todo3, which is the last item in the list

puts "---- Retrieving an item in the list ----"

# item_at
begin
  list.item_at                  # raises ArgumentError
  puts false
rescue ArgumentError
  puts true
end

p list.item_at(1)               # returns 2nd item in list (zero based index)
begin
  list.item_at(100)             # raises IndexError
  puts false
rescue IndexError
  puts true
end

puts "---- Marking items in the list -----"

puts "mark_done_at"
begin
  list.mark_done_at             # raises ArgumentError
  puts false
rescue ArgumentError
  puts true
end

p list.mark_done_at(1)          # marks the 2nd item as done
begin
  list.mark_done_at(100)        # raises IndexError
  puts false
rescue IndexError
  puts true
end

puts "mark_undone_at"
begin
  list.mark_undone_at           # raises ArgumentError
  puts false
rescue ArgumentError
  puts true
end

p list.mark_undone_at(1) == false   # marks the 2nd item as not done,
begin
  list.mark_undone_at(100)          # raises IndexError
  puts false
rescue IndexError
  puts true
end

puts "---- Outputting the list -----"

# to_s
puts list # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym

puts "---- Deleting from the the list -----"

puts "remove_at"
begin
  list.remove_at                  # raises ArgumentError
  puts false
rescue ArgumentError
  puts true
end

p list.remove_at(1)               # removes and returns the 2nd item
begin
  list.remove_at(100)             # raises IndexError
  puts false
rescue IndexError
  puts true
end

puts "shift"
p list.shift                      # removes and returns the first item in list

puts "pop"
p list.pop                        # removes and returns the last item in list
