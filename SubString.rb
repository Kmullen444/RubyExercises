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


def substring(string, arr)
  count = Hash.new(0)

  string.each_char.with_index do |char, i|
    arr.each do |word|
      count[word] += 1 if string[i..-1] == word
    end
  end
  count
end

p substring("below", dictionary)
