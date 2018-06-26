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
  end
  
  def size
  end
  
  def first
  end
  
  def last
  end
  
  def item_at(index)
    
  end

  def mark_done_at(index)
    
  end

  def mark_undone_at(index)
    
  end

  def remove_at(index)
    
  end
  
  def shift
  end
  
  def pop
  end
  
  def to_s
  end
  
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
begin
  list.add(1)                   # raises TypeError with message "Can only add Todo objects"
  puts false
rescue TypeError => e
  puts "#{e.message}"
  puts true
end

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
list.size                       # returns 3

# first
list.first                      # returns todo1, which is the first item in the list

# last
list.last                       # returns todo3, which is the last item in the list

# ---- Retrieving an item in the list ----

# item_at
begin
  list.item_at                  # raises ArgumentError
  puts false
rescue ArgumentError => e
  puts "#{e.message}"
  puts true
end

list.item_at(1)                 # returns 2nd item in list (zero based index)
begin
  list.item_at(100)             # raises IndexError
  puts false
rescue IndexError => e
  puts "#{e.message}"
  puts true
end


# ---- Marking items in the list -----

# mark_done_at
begin
  list.mark_done_at             # raises ArgumentError
  puts false
rescue ArgumentError => e
  puts "#{e.message}"
  puts true
end

list.mark_done_at(1)            # marks the 2nd item as done
begin
  list.mark_done_at(100)        # raises IndexError
  puts false
rescue IndexError => e
  puts "#{e.message}"
  puts true
end

# mark_undone_at
begin
  list.mark_undone_at            # raises ArgumentError
  puts false
rescue ArgumentError => e
  puts "#{e.message}"
  puts true
end

list.mark_undone_at(1)          # marks the 2nd item as not done,
begin
  list.mark_undone_at(100)      # raises IndexError
  puts false
rescue IndexError => e
  puts "#{e.message}"
  puts true
end

# ---- Deleting from the the list -----

# shift
list.shift                      # removes and returns the first item in list

# pop
list.pop                        # removes and returns the last item in list

# remove_at
begin
  list.remove_at                # raises ArgumentError
  puts false
rescue ArgumentError => e
  puts "#{e.message}"
  puts true
end

list.remove_at(1)               # removes and returns the 2nd item
begin
  list.remove_at(100)           # raises IndexError
  puts false
rescue IndexError => e
  puts "#{e.message}"
  puts true
end

# ---- Outputting the list -----

# to_s
list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym