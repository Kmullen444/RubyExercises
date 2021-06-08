def summation_sequence(start,length)
  arr = [start]

  while arr.length < length
    arr << summation(arr[-1])
  end
  return arr
end


def summation(num)
  sum = 0

  (1..num).each do |i|
    sum += i
  end
  return sum 
end

print summation_sequence(3, 4)
puts
print summation_sequence(5, 3)
puts