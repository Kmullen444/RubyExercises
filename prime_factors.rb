def prime_factor(num)
  return sorted = (1..num).select { |factor| num % factor == 0 && prime?(factor)}
end


# def prime_factor(num)
#   prime_facts = []

#   (1..num).each do |i|
#     if num % i == 0 && prime?(i)
#       prime_facts << i
#     end
#   end
#   prime_facts
# end

def prime?(num)
  if num < 2
    return false
  end

  (2...num).each do |divisor|
    if num % divisor == 0
      return false
    end
  end

  return true
end

print prime_factor(24)
puts
print prime_factor(60)
puts 
