dictionary = %w[below down go going horn how howdy it
                i low own part partner sit]

def substring(string, arr)
  count = Hash.new(0)

  arr.map do |word|
    count[word] = string.scan(word).count if string.downcase.include?(word)
  end

  puts count
end

substring('below', dictionary)
