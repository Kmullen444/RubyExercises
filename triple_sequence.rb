# def triple_sequence(start, length)
#   new_arr = [start]
#   i = 1

#   while i < length
#     new_arr << new_arr[i -1] * 3
#     i += 1
#   end
#   return new_arr
# end

def triple_sequence(start, length)
  new_arr = [start]

  while new_arr.length < length
    new_arr << new_arr[-1] * 3
  end
  return new_arr
end


print triple_sequence(2,4)
puts
print triple_sequence(4, 5) 