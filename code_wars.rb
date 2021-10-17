class Abbreviator

  def self.abbreviate(string)
   shortened_string =  []

    if string.include?("-")
      split_string = string.split("-")
    else
      split_string = string.split
    end

    split_string.each do |word|
     puts word.length
    end

    if string.include?("-")
      shortened_string.join("-")
    else
      shortened_string.join(" ")
    end
  end
end



# p Abbreviator.abbreviate("double-barrel")
# p Abbreviator.abbreviate("banana")
p Abbreviator.abbreviate("You, and I, should speak.")
