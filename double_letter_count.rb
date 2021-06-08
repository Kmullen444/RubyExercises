def double_letter_count(sent)
  count = 0
  
  sent.each_char.with_index do |char, idx|
    if char == sent[idx + 1]
      count += 1
    end
  end
  return count
end



puts double_letter_count("The jeep rolled down the hill")
puts double_letter_count("bootcamp")