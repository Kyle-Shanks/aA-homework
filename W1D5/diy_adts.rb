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

class Queue
  attr_reader :queue

  def initialize(queue = [])
    @queue = queue
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def peek
    @queue.last
  end
end

class Map
  attr_reader :map

  def initialize(map = [])
    @map = map
  end

  def set(key,val)
    delete(key)
    @map << [key,val]
  end

  def get(key)
    arr = @map.find { |el| el[0] == key }
    arr ? arr[1] : arr
  end

  def delete(key)
    @map.reject! {|el| el[0] == key}
  end

  def show
    @map
  end
end
