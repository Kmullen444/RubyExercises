# def perfect_square?(num)
#   if greatest_factor(num) * greatest_factor(num) != num
#     return false
#   end
#   return true
# end

# def greatest_factor(num)
#   (1...num).reverse_each do |i|
#     if num % i == 0
#       return i 
#     end
#   end
# end

def perfect_square?(num)
  (1..num).each do |factor|
    if factor * factor == num
      return true
    end
  end
  return false
end

puts perfect_square?(5)
puts perfect_square?(12)
puts perfect_square?(30)
puts perfect_square?(9)
puts perfect_square?(25)