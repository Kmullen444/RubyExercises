require "byebug"

class Array

  def my_each(&prc) 
    count = 0
    while count < self.length do 
      element = self[count]
      prc.call(element)
      count += 1
    end
    self
  end

  def my_select(&prc)
    new_arr = Array.new
    self.my_each { |ele| new_arr << ele if prc.call(ele) }
    new_arr
  end

  def my_reject(&prc)
    new_arr = []
    self.my_each { |ele| new_arr << ele if !prc.call(ele) }
    new_arr
  end

  def my_any?(&prc)
    self.my_each { |ele| return true if prc.call(ele) }
    false
  end

  def my_all?(&prc)
    self.count { |ele| prc.call(ele) } == self.length
  end

  def my_flatten
    flattened = []
    self.my_each { |ele| ele.is_a?(Array)? flattened.concat(ele.my_flatten) : flattened << ele }
    flattened
  end

  def my_zip(*arrays)
    zipped = []
    count = 0

    while zipped.length < self.length 
      subarr = [self[count]]
      arrays.my_each { |arr| subarr << arr[count]}
      zipped << subarr
      count += 1
    end
    zipped
  end

  def my_rotate(num = 1)
    rotated = self.dup
    count = 0

    while count < num.abs
      if num > 0
        shifted = rotated.shift
        rotated << shifted
      else
        popped = rotated.pop
        rotated.unshift(popped)
      end
      count += 1
    end
    rotated
  end

  def my_join(sym_to_join = nil)
    new_string = ""

    self.my_each do |ele|
      if sym_to_join.nil?
        new_string += ele
      else
        new_string += "#{ele}#{sym_to_join}"
      end
    end
    new_string
  end

  def my_reverse
    reversed = []
    count = 1

    while count < self.length + 1
      reversed << self[-(count)]
      count += 1
    end
    reversed

  end

end