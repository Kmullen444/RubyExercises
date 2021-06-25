class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    random_word = DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(guess)
    indices = []
    @secret_word.each_char.with_index { |char, i| indices << i if guess == char}
    indices
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)

    if !already_attempted?(char)
      match_indices = get_matching_indices(char)
      @attempted_chars << char

      if match_indices.empty?
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, match_indices)
      end

      true
    else
      puts "That's already been attempted"
      false
    end
  end

  def ask_user_for_guess
    puts "Enter a char: "
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "WIN"
      return true
    end
    false
  end

  def lose?
    if remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    end
    false
  end
end
