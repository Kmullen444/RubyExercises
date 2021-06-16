def hipsterfy(word)
  vowels = "aeiou"
  i = word.length - 1

  while i >= 0
    if vowels.include?(word[i])
      return word[0...i] + word[i+1..-1]
    end
    i -= 1
  end
  word
end

def vowel_counts(str)
  vowels = "aeiou"
  counted = Hash.new(0)
  str.downcase.each_char do |char|
    if vowels.include?(char)
      counted[char] += 1
    end
  end
  counted
end


def caesar_cipher(str, num)
  alp = "abcdefghijklmnopqrstuvwxyz"
  shifted = ""

  str.each_char do |char|
    if alp.include?(char)
      old_index = alp.index(char)
      new_index = (old_index + num) % alp.length
      shifted += alp[new_index]
    else
      shifted += char
    end
  end
  shifted
end
