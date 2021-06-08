def vowel_cipher(str)
  vowels = "aeiou"
  new_str = ""

  new_char = str.split("").map do |char|
    if vowels.include?(char)
      old_idx = vowels.index(char)
      new_idx = old_idx + 1
      vowels[new_idx % vowels.length]
    else
      char
    end
  end
  return new_char.join("")
end

# def vowel_cipher(str)
#   change = {
#     "a" => "e",
#     "e" => "i",
#     "i" => "o",
#     "o" => "u",
#     "u" => "a"
#   }

#   vowels = "aeiou"

#   new_str = str.split("").map do |char|
#     if vowels.include?(char)
#       change[char]
#     else
#       char
#     end
#   end
#   return new_str.join("")
# end

# def vowel_cipher(str)
#   new_str = ""
#   vowels = "aeiou"

#   str.each_char do |char|
#     if vowels.include?(char)
#       new_str += vowel_shift(char)
#     else
#       new_str += char
#     end
#   end
#   return new_str
# end

# def vowel_shift(char)
#   vowels = "aeiou"

#   old_idx = vowels.index(char)
#   new_idx = old_idx + 1
#   return new_vowel = vowels[new_idx % vowels.length]
# end

puts vowel_cipher("bootcamp")
puts vowel_cipher("paper cup")