# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
  factors_1 = factors(num_1)
  factors_2 = factors(num_2)
  
  count = factors_1.select { |num| factors_2.include?(num)}

  if count.length > 1
    return false
  end
  true
end


def factors(num)
  factors = (1..num).select do |divisor|
    if num % divisor == 0 
      divisor
    end
  end
  factors
end


p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
