class Stack  #last in first out
  def initialize
    @store = Array.new
  end

  def push(element)
    #@store.unshift(element) #push = <<
    @store.push(element)
  end

  def pop
    @store.pop
  end

  def top
    @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return @store.empty?
    #return size == 0
  end

  def to_s
    return @store.to_s
  end
end

#implement - create a class / last solar system /using invoking - solartsystem.new
