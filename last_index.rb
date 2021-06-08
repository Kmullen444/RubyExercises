def last_index(str, char)
  i = str.length-1

  while i >= 0 
    if str[i] == char
      return I
    end
    i -= 1
  end
end

puts last_index("abca", "a") #=> 3