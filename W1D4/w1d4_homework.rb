class Stack

  def initialize
    @arr = []
  end

  def add(el)
    arr.push(el)
  end

  def remove
    arr.pop
  end

  def show
    arr.dup
  end
end

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
    @queue
  end

  def show
    @queue.dup
  end
end

class Map

  def initialize
    @my_map = []
  end

  def assign(key, value)
    @my_map.push([key, value]) if @my_map.all? {|k,v| k != key}
    @my_map.each do |ki|
      ki[1] = value if ki[0] == key
    end
    @my_map
  end

  def lookup(key)
    @my_map.each do |x|
      if x[0] == key
        return x[1]
      end
    end
  end

  def remove(key)
    @my_map = @my_map.select {|x| x[0] != key}
    nil
  end

  def show
    deep_dup(@my_map)
  end

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
