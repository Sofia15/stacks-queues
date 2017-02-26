class Queue #first in first out
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store.push(element)
  end

  def dequeue #unshift/shift
    @store.shift
  end

  def front
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
