def caesar_chiper(str, num)
  shifted = ""
  alp = "abcdefghijklmnopqrstuvwxyz"

  str.each_char do |char|
    old_idx = alp.index(char)
    new_idx = old_idx + num
    new_char = alp[new_idx % 26]
    shifted += new_char
  
  end
  return shifted
end


puts caesar_chiper("apple", 1)
puts caesar_chiper("testing", 14)
puts caesar_chiper("bootcamp", 2)
puts caesar_chiper("zebra", 4)

