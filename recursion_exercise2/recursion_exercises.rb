require "byebug"

def range(start, finish)
  return [start] if finish == start
  
  range(start, finish - 1) << finish
end

def recursion_sum_of(arr)
  return [] if arr.empty?
  return arr.first if arr.length == 1

  arr.first + recursion_sum_of(arr[1..-1])

end

# p recursion_sum_of([1,2,3,4,5])
# p recursion_sum_of([20,19,10])

def iterative_sum_of(arr)
  arr.inject { |acc, num| acc += num }
end

# p iterative_sum_of([1,2,3,4,5])
# p iterative_sum_of([20,19,10])

def recurison_exp1(base, power)
  return 1 if power == 0

  smaller_exponent = power - 1
  result_of_smaller_exponent = recurison_exp1(base, smaller_exponent)

  base * result_of_smaller_exponent

end

def recurison_exp2(base, power)
  return 1 if power.zero?
  return base if power == 1
  p power

  if power.even?
    smaller_exponent_even = power / 2
    value = recurison_exp2(base, smaller_exponent_even)
    value * value
  else
    smaller_exponent_odd = (power - 1) / 2
    value = recurison_exp2(base, smaller_exponent_odd)
    base * ( value * value )
  end


end

# p recurison_exp1(2,2)
# p recurison_exp1(10, 20)
# p recurison_exp1(4,3)
# p "---------------"
# p recurison_exp2(2,2)
# p recurison_exp2(10, 20)
# p recurison_exp2(4,3)

class Array

  def deep_dup(arr = self)
    new_arr = []

    arr.each do |sub_arr|
      if sub_arr.is_a?(Array)
        new_arr << deep_dup(sub_arr)
      else
        new_arr << sub_arr
      end
    end
    new_arr
  end

  def merge_sort
    return self if self.length <= 1

    mid = self.length / 2
    left_side = self.take(mid).merge_sort
    right_side = self.drop(mid).merge_sort

    merge(left_side, right_side)

  end

  def merge(left_arr, right_arr)
    sorted = []

    p "left: #{left_arr}"
    p "right: #{right_arr}"

    while !left_arr.empty? && !right_arr.empty? do

      if left_arr[0] < right_arr[0]
        sorted << left_arr.shift
        p "Sorted if left < right: #{sorted}"
      else
        sorted << right_arr.shift
        p "Sorted if right< left: #{sorted}" 
      end

    end
    sorted + left_arr + right_arr
  end

end

def fib_recursive(n)
  return [0,1] if n == 1
  seq = fib_recursive(n - 1)

  seq << seq[-1] + seq[-2]

end

def fib_iterative(n)
  arr = [0,1]
  (2..n).each do |i|
    arr << arr[-1] + arr[-2]
  end
  arr
end

def bsearch(arr, target)
  return nil if arr.empty?

  mid = ((arr.length - 1) / 2)
  left_side = arr[0...mid]
  right_side = arr[(mid+1)..-1]
  
  return mid if target == arr[mid]

  if arr[mid] < target
    return arr.index(target) if bsearch(right_side, target)
  else
    return arr.index(target) if bsearch(left_side, target)
  end

end


# bsearch([1, 2, 3], 1) # => 0
# bsearch([2, 3, 4, 5], 3) # => 1
# bsearch([2, 4, 6, 8, 10], 6) # => 2
# bsearch([1, 3, 4, 5, 9], 5) # => 3
# bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# bsearch([1, 2, 3, 4, 5, 7], 6) # => nil



def subsets(arr)
  return [[]] if arr.empty?

  subs = subsets(arr[0...-1])

  subs + subs.map { |sub| sub + [arr.last]}

end


def permutations(arr)
  return [arr] if arr.length <= 1

  first = arr.shift

  perms = permutations(arr)
  # p perms

  total_perm = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_perm << perm[0...i] + [first] + perm[i..-1]
    end

  end
  total_perm

end

def make_change(amount, coins = [25,10,5,1])

  return [] if amount == 0
  return nil if coins.none? { |coin| coin <= amount }

  coins = coins.sort.reverse

  best_change = nil

  coins.each_with_index do |coin, idx|
    next if coin > amount

    smaller_amount = amount - coin

    best_remainder = make_change(smaller_amount, coins.drop(idx))

    next if best_remainder.nil?

    this_change = [coin] + best_remainder

    if best_change.nil? || (this_change.count < best_change.count)
      best_change = this_change
    end


  end
  best_change
end


