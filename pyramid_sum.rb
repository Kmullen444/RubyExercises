def pyramid_sum(arr)
  pyramid = [arr]
  

  while pyramid.length < arr.length
    prev_level = pyramid[0]
    next_level = sum(prev_level)
    pyramid.unshift(next_level)
  end

  return pyramid
end

def sum(arr)
  new_arr = []

  arr.each_with_index do |num, i|
    if i != arr.length - 1
      new_arr << num + arr[i + 1]
    end
  end
  return new_arr
end


print pyramid_sum([1,4,6]) #=> [[15], [5,10], [1,4,6]]
puts 