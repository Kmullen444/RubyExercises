movies = {
  avengers: 10,
  spider_man: 9
}

puts "Inputs:
Add: adds a movie
Update: update the rating for a movie
Display: display your movies and ratings
Delete: delete a movie from your collection"
choice = gets.downcase.chomp

case choice
when 'add'
  puts 'Enter the Title of a movie'
  title = gets.downcase.chomp
  puts 'Enter a rating for the movie'
  rating = gets.chomp
  if movies[title.to_sym].nil?
    movies[title.to_sym] = rating.to_i
    puts 'Movies Updated!'
  else
    puts 'That movie already exists'
  end
when 'update'
  puts 'Enter a movie title to update'
  title = gets.downcase.chomp
  if movies[title.to_sym].nil?
    puts "I'm sorry Dave, I don't see that one"
  else
    puts 'Enter a new rating'
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts 'Rating updated!'
  end
when 'display'
  movies.each do |movie, rating|
    puts "#{movie.capitalize}: #{rating}"
  end
when 'delete'
  puts 'Enter a title to delete'
  title = gets.downcase.chomp
  if movies[title.to_sym].nil?
    puts "I'm sorry Dave, I can't do that"
  else
    movies.delete(title.to_sym)
    puts 'Movie deleted!'
  end
else
  puts 'Error!'
end
