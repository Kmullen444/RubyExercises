def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject { |hash| hash["age"] < 3}
end

def count_positive_subarrays(arr)
  arr.count { |sub_arr| sub_arr.sum > 0}
end


def aba_translate(word)
  new_word = ""

  word.each_char do |char|
    if "aeiou".include?(char)
      new_word += char + "b" + char
    else
      new_word += char
    end
  end
  new_word
end

def aba_array(arr)
  translated = arr.map { |word| aba_translate(word)}
end