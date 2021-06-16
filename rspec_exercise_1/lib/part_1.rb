def average(num_1, num_2)
  (num_1 + num_2) / 2.0
end

def average_array(arr)
  arr.sum / arr.length.to_f
end

def repeat(str, num)
  str * num 
end

def yell(string)
  string.upcase + "!"
end

def alternating_case(str)
  alternated =str.split.map!.with_index do |word, i|
    if i.even? 
      word.upcase
    else
      word.downcase
    end
  end
  alternated.join(" ")
end
