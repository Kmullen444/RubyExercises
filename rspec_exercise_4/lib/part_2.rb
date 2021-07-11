def proper_factors(num)
  (1...num).select { |factor| num % factor == 0}
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  aliquot_sum(num) == num ? true : false
end

def ideal_numbers(n)
  count = 1
  nums = []
  while nums.length < n
    nums << count if perfect_number?(count)
    count += 1
  end
  nums
end