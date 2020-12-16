def caesar_cipher(string, shift)
  alp = Array('a'..'z')
  non_caps = Hash[alp.zip(alp.rotate(shift))]

  alp = Array('A'..'Z')
  caps = Hash[alp.zip(alp.rotate(shift))]

  encrypter = non_caps.merge(caps)

  string.chars.map { |c| encrypter.fetch(c, c) }
end

p caesar_cipher('What a string!', 5).join

def decihper(string, shift)
  alp = Array('a'..'z')
  non_caps = Hash[alp.rotate(shift).zip(alp)]

  alp = Array('A'..'Z')
  caps = Hash[alp.rotate(shift).zip(alp)]

  encrypter = non_caps.merge(caps)

  string.chars.map { |c| encrypter.fetch(c, c) }
end


p decihper("Bmfy f xywnsl!", 5).join