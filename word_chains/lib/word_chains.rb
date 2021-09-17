require "set"
require "byebug"

class WordChains
  def self.from_file(file_name)
    dictionary = Set.new
    File.readlines(file_name).map do |word|
      dictionary << word.chomp
    end
    dictionary
  end

  attr_reader :dictionary

  def initialize
    @dictionary = WordChains.from_file("dictionary.txt")
  end

  #loop through the index of the word and in the inner loop, loop through
  #the letters of the alp.

  #check if the letter @word[i] is the same as new_letter, if it is
  #we don't want to use it, if it isn't then we can dup the word and
  #replace the letter @new_word[i] with the new letter

  # then we want to check if that word is included in our dictionary

  def adjacent_words(word)
    dupped_word = ""
    adjacent_words = []

    for i in 0...word.length
      ("a".."z").each do |new_letter|

        next if word[i] == new_letter

          new_word = word.dup
          new_word[i] = new_letter

        adjacent_words << new_word if dictionary.include?(new_word)
      end

    end
    adjacent_words
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = { source => nil }

    until @current_words.empty? || @all_seen_words.include?(target)
      explore_current_words
    end

    build_path(target)

  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|    
      adjacent_words(current_word).each do |ad_word|
        next if @all_seen_words.key?(ad_word)

        new_current_words << ad_word
        @all_seen_words[ad_word] = current_word
        
      end

    end
    @current_words = new_current_words
  end

  def build_path(target)
    path = []
    current_word = target
    
    until current_word.nil?
      path << current_word
      current_word = @all_seen_words[current_word]
    end
    path.reverse
  end


end


WordChains.new