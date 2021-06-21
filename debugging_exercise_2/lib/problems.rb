# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
def largest_prime_factor(num)
  factors = (1..num).select { |factor| num % factor == 0}
  large_prime = factors.reverse.select { |i| return i if prime?(i)}
end

def largest_prime_factor(num)
  num.downto(2) { |factor| return factor if num % factor == 0 && prime?(num)}
end

def prime?(num)
  (2...num).each do |i|
    if num % i == 0
      return false
    end
  end
  true
end


def unique_chars?(word)
  chars = Hash.new(0)
  word.each_char { |char| chars[char] += 1}
  unique = chars.each_value { |v| return false if v > 1}
  true
end

def unique_chars?(word)
  seen = []

  word.each_char do |char|
    return false if seen.include?(char)
    seen << char
  end
  true
end

def dupe_indices(array)
  indices = {}
  array.each do |ele_1|

    index = []

    array.each_with_index do  |ele_2, i|
      if ele_1 == ele_2
        index << i
      end
    end

    indices[ele_1] = index if index.length > 1
  end
  indices
end

def dupe_indices(arr)
  indices = Hash.new { |h,k| h[k] = []}
  arr.each_with_index { |ele, i| indices[ele] << i}
  indices.select { |ele, arr|  arr.length > 1}
end

def ana_array(arr_1, arr_2)
  hash_maker(arr_1) == hash_maker(arr_2)
end

def hash_maker(arr)
  ele_count = Hash.new(0)
  arr.map { |ele| ele_count[ele] += 1}
  ele_count
end

