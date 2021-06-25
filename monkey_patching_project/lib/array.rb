# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

  def span
    return nil if self.empty?
    self.max - self.min
  end
  
  def average
    return nil if self.empty?
    sum = 0
    self.each { |ele| sum += ele }
    sum / (self.length * 1.0)
  end

  def median
    return nil if self.empty?
    sorted = self.sort
    mid_index = sorted.length / 2
    if self.length.odd?
      sorted[mid_index]
    else
      first_ele = sorted[mid_index]
      last_ele  = sorted[mid_index - 1]
      return (first_ele + last_ele) / 2.0
    end
  end

  def counts
    counted = Hash.new(0)
    self.each { |ele| counted[ele] += 1}
    counted
  end

  def my_count(value)
    count = 0
    self.each { |ele| count += 1 if ele == value}
    count
  end

  def my_index(value)
    i = 0 
    while i < self.length
      return i if self[i] == value
      i += 1
    end
    nil
  end

  def my_uniq
    uniq_arr = []

    self.each do |ele|
      if !uniq_arr.include?(ele)
        uniq_arr << ele
      end
    end
    uniq_arr
  end

  def my_transpose
    new_arr = []

    (0...self.length).each do |row|
      new_row  = []

      (0...self.length).each do |col|
        new_row << self[col][row]
      end

      new_arr << new_row
    end

    new_arr
  end
end

