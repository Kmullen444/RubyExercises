def fib_sequence(length)
  if length == 0
    return []
  elsif length == 1
    return [1]
  end

  fib = [1,1]

  while fib.length < length
    last = fib[-1]
    second_last = fib[-2]
    sum = last + second_last
    fib << sum
  end
  return fib
end


print fib_sequence(0)
puts
print fib_sequence(1)
puts
print fib_sequence(6)
puts
print fib_sequence(8)
puts