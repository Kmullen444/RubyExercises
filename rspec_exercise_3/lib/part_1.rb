def is_prime?(num)
  return false if num < 2
  (2...num).none? { |factor| num % factor == 0}
end

def nth_prime(num)
  count = 0 
  prime_count = 0
  n = 0

  while prime_count < num
    if is_prime?(count)
      prime_count += 1
      n = count
    end
    count += 1
  end
  n
end

def prime_range(min, max)
  (min..max).select { |factor| is_prime?(factor)}
end
