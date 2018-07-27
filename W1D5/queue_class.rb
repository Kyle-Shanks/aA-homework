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
