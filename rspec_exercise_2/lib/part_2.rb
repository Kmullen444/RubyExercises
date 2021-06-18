def palindrome?(str)
  reversed = ""

  str.each_char { |char| reversed = char + reversed}
  return false if reversed != str
  true
end

def substrings(str)
  subbed = []
  (0...str.length).each do |start_idx|
    (start_idx...str.length).each do |end_idx|
       subbed << str[start_idx..end_idx]
    end
  end
  subbed
end 


def palindrome_substrings(string)
  substrings(string).select { |substr| palindrome?(substr) && substr.length > 1}
end