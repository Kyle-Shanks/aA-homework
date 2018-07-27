class Stack
  attr_reader :stack

  def initialize(stack = [])
    @stack = stack
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end
end
