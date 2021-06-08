def all_else_equal(arr)
  sum_arr = arr_sum(arr)
  
  arr.each do |num|
    if num == sum_arr / 2.0
      return num
    end
  end
  return nil
end

def arr_sum(arr)
  sum = 0
  arr.each { |num| sum += num }
  return sum 
end

p all_else_equal([2,4,3,10,1]) #=> 10
p all_else_equal([6,3,5,-9,1]) #=> 3
p all_else_equal([1,2,3,4]) #=> nil