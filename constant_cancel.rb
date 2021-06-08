def constant_cancel(str)
  return new_str = str.split.map { |word| vowel_first(word)}.join(" ")
  
  end
  
  def vowel_first(word)
    new_word = ""
    vowels = "aeiou"
  
    word.each_char.with_index do |char, i|
      if vowels.include?(char)
       return new_word += word[i..-1]
      end
    end
  end
  
  # puts vowel_first("rabbit") #=> "abbit"
  
  puts constant_cancel("down the rabbit hole") #=> "own e abbit ole"
  puts constant_cancel("writing code is challenging") #=> "itiing ode is allenging"
  