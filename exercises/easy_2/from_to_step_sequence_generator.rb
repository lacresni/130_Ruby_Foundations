def step(start_val, end_val, step_val)
  index = start_val
  while index <= end_val
    yield(index)
    index += step_val
  end
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
