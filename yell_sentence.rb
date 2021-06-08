def yell_sentence(sent)
  words.split
  yelled = words.map { |word| word.upcase + "!"}
  return yelled.join(" ")
end

puts yell_sentence("I have a bad feeling about this") #=> "I! HAVE! A! BAD! FEELING! ABOUT! THIS!"