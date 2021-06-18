def partition(arr, num)
  less = []
  more = []

  arr.each do |ele|
    if ele >= num
      more << ele
    else
      less << ele
    end
  end
  answer = [less, more]
end

def merge(hash_1, hash_2)
  new_hash = {}

  hash_1.each_pair {|k,v| new_hash[k] = hash_1[k]}
  hash_2.each_pair {|k,v| new_hash[k] = hash_2[k]}
  new_hash
end

def censor(string, arr) 

  censored = string.split.map do |word|
    if arr.include?(word.downcase)
      vowel_remove(word)
    else
      word
    end
  end
    censored.join(" ")
end

def vowel_remove(word)
  vowels = "aeiou"
  new_word = ""

  word.each_char do |char|
    if vowels.include?(char.downcase)
      new_word += "*"
    else
      new_word += char
    end
  end
  new_word
end

def power_of_two?(number)
  product = 1

  while product < number
    product *= 2
  end
  
  product == number
end