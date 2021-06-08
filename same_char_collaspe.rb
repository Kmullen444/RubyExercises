def same_char_collapse(str)
  reduce = true

  while reduce
    chars = str.split("")
    reduce = false
    
    chars.each.with_index do |char, i|
      if chars[i] == chars[i + 1]
        chars[i] = ""
        chars[i + 1] = ""
        reduce = true
      end
    end
    str = chars.join("")
  end 
  return str
end



puts same_char_collapse("zzzxaaxy") #=> "zy" 
puts same_char_collapse("uqrssrqvtt") #=> "uv"