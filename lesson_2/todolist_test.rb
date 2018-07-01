require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    @todo1.done!
    @todo2.done!
    assert_equal(false, @list.done?)
    @todo3.done!
    assert_equal(true, @list.done?)
  end

  def test_raise_add_object
    assert_raises(TypeError) { @list.add(3) }
    assert_raises(TypeError) { @list.add('hello') }
  end

  def test_shovel
    todo4 = Todo.new("Todo4")
    @list << todo4
    @todos << todo4
    assert_equal(4, @list.size)
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    todo4 = Todo.new("Todo4")
    @list.add(todo4)
    @todos << todo4
    assert_equal(4, @list.size)
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) do
      @list.item_at(10)
    end
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_equal(@todo3, @list.item_at(2))
  end

  def test_mark_done_at
    assert_raises(IndexError) do
      @list.mark_done_at(10)
    end

    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) do
      @list.mark_undone_at(10)
    end

    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_remove_at
    assert_raises(IndexError) do
      @list.remove_at(10)
    end

    @list.remove_at(1)
    assert_equal(2, @list.size)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    description = "Test each method"
    @list.each do |todo|
      todo.description = description
    end

    assert_equal(description, @todo1.description)
    assert_equal(description, @todo2.description)
    assert_equal(description, @todo3.description)
  end

  def test_each_return_value
    result = @list.each do |todo|
      nil
    end

    assert_same(@list, result)
  end

  def test_select
    @todo1.done!

    result = @list.select do |todo|
      todo.done?
    end

    assert_equal(1, result.size)
    assert_equal(@todo1, result.first)
    assert_equal(false, @list.equal?(result))
    assert_equal(@list.title, result.title)
  end

  def test_find_by_title
    assert_nil(@list.find_by_title('Go to bed'))
    assert_equal(@todo1, @list.find_by_title('Buy milk'))
    assert_equal(@todo1, @list.find_by_title('BUY milk'))
  end

  def test_all_done
    result = @list.all_done
    assert_equal([], result.to_a)

    @todo2.done!
    @todo3.done!
    result = @list.all_done
    assert_equal([@todo2, @todo3], result.to_a)
  end

  def test_all_not_done
    result = @list.all_not_done
    assert_equal([@todo1, @todo2, @todo3], result.to_a)

    @todo2.done!
    @todo3.done!
    result = @list.all_not_done
    assert_equal([@todo1], result.to_a)
  end

  def test_mark_done_title
    assert_nil(@list.mark_done("Go to bed"))
    assert_equal([], @list.all_done.to_a)

    assert_equal(true, @list.mark_done("Clean Room"))
    assert_equal([@todo2], @list.all_done.to_a)
  end

  def test_mark_all_done
    assert_equal([], @list.all_done.to_a)

    assert_equal(@list, @list.mark_all_done)
    assert_equal([@todo1, @todo2, @todo3], @list.all_done.to_a)
  end

  def test_mark_all_undone
    @list.mark_all_done
    assert_equal([@todo1, @todo2, @todo3], @list.all_done.to_a)

    assert_equal(@list, @list.mark_all_undone)
    assert_equal([], @list.all_done.to_a)
  end

end
