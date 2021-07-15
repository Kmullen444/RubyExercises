require "byebug"

def zip(*arr)
  (0...arr[0].length).map do |i|
    arr.map { |array| array[i] }
  end
end

def prizz_proc(arr, prc_1, prc_2)
  arr.select do |ele|
    prc_1.call(ele) && !prc_2.call(ele) || !prc_1.call(ele) && prc_2.call(ele)
  end
end

def zany_zip(*arr)
  (0...arr.length + 1).map do |i|
    arr.map do |array|
      array[i].nil? ? array[i] = nil : array[i]
    end
  end

end

def maximum(arr, &prc)
  max = arr[0]

  arr.each do |ele|
    max = ele if prc.call(ele) >= prc.call(max)
  end 
  max
end

def my_group_by(arr, &prc)
  new_hash = Hash.new { |hash, k| hash[k] = []}
  arr.each { |ele| new_hash[prc.call(ele)] << ele}
  new_hash
end

def max_tie_breaker(arr, block, &prc)
  max = arr[0]
  
  arr.each do |ele|
    result_max = prc.call(max)
    result_ele = prc.call(ele)

    if result_ele > result_max
      max = ele 
    elsif result_ele == result_max && block.call(ele) > block.call(max)
      max = ele
    end
  end
  max

end

def silly_syllables(str)
  no_vowels = []

  str.split.each do |word|
    indices = vowel_count(word)
    if indices.length < 2
      no_vowels << word
    else
       no_vowels << word[indices[0]..indices[-1]]
    end
  end
  no_vowels.join(" ")

end

def vowel_count(word)
  vowel_indices = []
  vowels = "aeiou"

  word.each_char.with_index do |char, idx|
    vowel_indices << idx if vowels.include?(char)
  end
  vowel_indices
end 
