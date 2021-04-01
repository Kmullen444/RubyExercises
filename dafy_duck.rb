print "Please enter a pharse! "
user_input = gets.chomp
user_input.downcase!

if user_input.include?"s"
  user_input.gsub!(/s/, "th")
else
  print "That pharse is 's' free!"
end

puts "#{user_input.capitalize}"