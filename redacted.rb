puts "Enter a pharse"
text = gets.chomp

puts "What needs to be redacted?"
redact = gets.chomp

words  = text.split(" ")

words.each do |word|
  if word.downcase == redact.downcase
    print "REDACTED "
  else 
    print word + " "
  end
end