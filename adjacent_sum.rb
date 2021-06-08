# def adjacent_sum(arr)
#   sum = []
#   i = 0

#   while i < arr.length-1
#     sum << arr[i] + arr[i + 1]
#     i += 1
#   end
#   return sum 
# end


def adjacent_sum(arr)
  sum = []

  arr.each_with_index do |num, i|
    if i != arr.length - 1 
      sum << num + arr[i + 1]
    end
  end
  return sum 
end

print adjacent_sum([3, 7, 2, 11]) #=> [10, 9, 13]
puts
print adjacent_sum([2,5,1,9,2,4])# => [7,6,10,11,6]
puts