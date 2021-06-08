# def greatest_factor_array(arr)
#   new_arr = []

#   arr.each do |num|
#     if num % 2 == 0 
#       new_arr << factor(num)
#     else
#       new_arr << num
#     end
#   end
#   return new_arr
# end

# def factor(num)
#   facts = (1...num).select { |divisor| num % divisor == 0}
#   return facts[-1]
# end


def greatest_factor_array(arr)
  new_arr = arr.map do |num|
    if num % 2 == 0 
      greatest_factor(num)
    else
      num
    end
  end
  return new_arr
end

def greatest_factor(num)
  (1...num).reverse_each do |i|
    if num % i == 0
      return i
    end
  end
end

print greatest_factor_array([16,7,9,14])
puts
print greatest_factor_array([30, 3, 24, 21, 10])
puts 