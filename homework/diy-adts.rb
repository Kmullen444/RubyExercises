class Stack

  def initialize
    @stack = []
  end

  def push(el)
    el.each { |add_el| @stack += [add_el] }
    @stack
  end

  def pop
    @stack = @stack[0..-2]
  end

  def peek
    @stack.last
  end


end

class Queue

  def initialize
    @queue = []
  end

  def enqueue(op, el)
    case op
    when "push"
      el.each { |to_add| @queue += [to_add] }
      @queue
    when "unshift"
      el.each { |to_add| @queue = [to_add] + @queue}
    end
  end

  def dequeue(op)
    case op
    when "shift"
      @queue = @queue[1..-1]
    when "pop"
      @queue = @queue[0...-1]
    end
  end

  def peek
    @queue.first
  end


end


class Map

  def initialize
    @map = []
  end

  def set(key, value)
    @map << [key, value] if @map.empty?

    @map.each do |sub_arr|
      if sub_arr.include?(key)
        sub_arr[0]  = key
        sub_arr[-1] = value
      else
        @map << [key, value]
      end
    end
    @map
  end

  def get(key)
    @map.select { |sub_arr| sub_arr.first if sub_arr.include?(key) }
    nil
  end

  def delete(key)
    @map.delete_if { |sub_arr| sub_arr.include?(key) }
    nil
  end

  def show
    deep_dup(map)
  end

  private

  attr_reader :map

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el}
  end

end