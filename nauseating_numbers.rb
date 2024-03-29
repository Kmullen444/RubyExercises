require "byebug"



def strange_sums(arr)
  count = 0 
  arr.each_with_index do |num_1, idx_1|
    arr.each_with_index do |num_2, idx_2|
      count += 1 if num_1 + num_2 == 0 && idx_2 > idx_1
    end
  end
  count
end

# strange_sums([2, -3, 3, 4, -2])     # 2
# strange_sums([42, 3, -1, -42])      # 1
# strange_sums([-5, 5])               # 1
# strange_sums([19, 6, -3, -20])      # 0
# strange_sums([9])                   # 0


def pair_product(arr, product)
  arr.each_with_index do |num_1, idx_1|
    arr.each_with_index do |num_2, idx_2|
      return true if num_1 * num_2 == product && idx_2 > idx_1
    end
  end
  false
end

# pair_product([4, 2, 5, 8], 16)    # true
# pair_product([8, 1, 9, 3], 8)     # true
# pair_product([3, 4], 12)          # true
# pair_product([3, 4, 6, 2, 5], 12) # true
# pair_product([4, 2, 5, 7], 16)    # false
# pair_product([8, 4, 9, 3], 8)     # false
# pair_product([3], 12)             # false


def rampant_repeats(str, hash)
  new_str = ""

  str.each_char do |char|
    if hash.has_key?(char)
      new_str += char * hash[char]
    else
      new_str += char
    end
  end
  new_str
end

# rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm


def perfect_square(num)
  return true if num == 1
  (0...num).any? do |factors|
    num / (factors * 1.0) == factors
  end

end

# perfect_square(1)     # true
# perfect_square(4)     # true
# perfect_square(64)    # true
# perfect_square(100)   # true
# perfect_square(169)   # true
# perfect_square(2)     # false
# perfect_square(40)    # false
# perfect_square(32)    # false
# perfect_square(50)    # false

def anti_prime?(num)
  anti_factors = factors(num)
  (1...num).none? { |i| anti_factors.length < factors(i).length }
end

def factors(num)
  (1..num).select { |factor| factor if  num % factor == 0 }
end

# anti_prime?(24)   # true
# anti_prime?(36)   # true
# anti_prime?(48)   # true
# anti_prime?(360)  # true
# anti_prime?(1260) # true
# anti_prime?(27)   # false
# anti_prime?(5)    # false
# anti_prime?(100)  # false
# anti_prime?(136)  # false
# anti_prime?(1024) # false

def matrix_addition(matrix_1 , matrix_2)
  i = 0
  sum = []

  while sum.length < matrix_1.length
    arr_1 = matrix_1[i]
    arr_2 = matrix_2[i]

    sum << matrix_plus(arr_1, arr_2)

    i += 1

  end
  sum
end


def matrix_plus(arr_1, arr_2)
  (0...arr_1.length).map do |i|
    arr_1[i] + arr_2[i]
  end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]


def mutual_factors(*nums)
  m_factors = []
  counted = Hash.new(0)

  factors = nums.map { |num| factors(num)}
  factors.flatten.each { |ele| counted[ele] += 1}
  counted.each { |k,v| m_factors << k if v >= nums.length }

  m_factors
  
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]


def tribonacci_number(length)
  return 1 if length == 1 || length == 2
  return 2 if length == 2 

  tri = [1,1,2]

  while tri.length < length
    tri << tri[-1] + tri[-2] + tri[-3]
  end
  tri.last
end


# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrixs)
  # matrixs.each { |matrix| return nil if matrixs.first.length != matrix.length}
  # first_matrix = matrixs.first
  # matrix_sum = []
  # i = 0

  # while matrix_sum.length < first_matrix.length do 
  #   sum =  0 
  #   sum += matrixs[i][i][i]
  #   matrix_sum << sum

  # end
  # matrix_sum

  matrix = matrixs.first
  height = matrix.length
  width  = matrix[0].length
  matrix_sum = Array.new(height) { [0] * width}

  matrixs.inject(matrix_sum) do |m1, m2|
    return nil if m2.length != height || m2[0].length != width
    matrix_addition(m1, m2)

  end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil


def squarocol?(matrix)
  return true if matrix.any? { |row| row.uniq.length == 1}
  return true if matrix.transpose.any? { |col| col.uniq.length == 1}
  false
end


# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false


def squaragonal?(grid)
  right = []
  left  = []
  grid_reverse = grid.reverse

  (0...grid.length).each do |i|
    right << grid[i][i]
    left  << grid_reverse[i][i]
  end

  return true if right.uniq.length == 1 || left.uniq.length == 1
  false
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def pascals_triangle(num)
  triangle = [[1]]

  while triangle.length < num
    above = triangle.last
    next_level = [1]
    next_level += adjacent_sums(above)
    next_level << 1
    triangle << next_level
  end
  triangle
end

def adjacent_sums(arr)
  sums = []

  (0...arr.length-1).each do |i|
    sums << arr[i] + arr[i + 1]
  end
  sums
end



# p pascals_triangle(5)
# p pascals_triangle(7)

def prime?(num) 
  return false if num < 2
  (2...num).none? { |factor| num % factor == 0}
end

def mersenne_prime(num)
  count = 0
  x = 0

  while count < num
    x += 1
    possible = 2 ** x - 1
    count += 1 if prime?(possible)
  end
  2 ** x - 1 
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071


def triangular_nums(num)
  seq = []
  x = 1
  
  while seq.length <= num
    seq << (x * (x + 1)) / 2
    x += 1
  end
  seq
end



def triangular_word?(word)
  alpha = ("a".."z").to_a
  chars = word
            .split('')
            .map { |char| alpha.index(char) + 1}
            .sum

  triangular_nums(chars).include?(chars)
end


# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false


def consecutive(arr)

  (0...arr.length - 1).each do |i|
    if arr[i] + 1 == arr[i + 1] || arr[i] == arr[i + 1] + 1
      return arr[0...i] + arr[i + 2..-1]
    end
  end
  arr
end

def consecutive_collapse(arr)
  arr.each { arr = consecutive(arr)}
  arr
end


# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def next_prime(num, i)
  step = 1
  if i.negative?
    i = -(i)
    step = -(step)
  end

  prime_count = 0
  while prime_count < i
    return nil if num < 0
    num += step
    prime_count += 1 if prime?(num)
  end
  num
end

next_prime(4, 2)
next_prime(4, -2)
next_prime(4, -1)



def pretentious_primes(arr, n)
  arr.map { |num| next_prime(num, n)}
end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]