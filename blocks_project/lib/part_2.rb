def all_words_capitalized?(words)
  words.all? { |word| word.capitalize == word}
end

def no_valid_url?(sites)
  urls = ['.com', '.net', '.io', '.org']
  sites.none? { |url| urls.include?(url[url.index(".")..-1])}
end

def no_valid_url?(urls)
  valid_endings = [".com", ".net", ".io", ".org"]
  urls.none? do |url|
    valid_endings.any? { |ending| url.end_with?(ending) }
  end
end

def any_passing_students?(students)
  students.any? { |student| student[:grades].sum / student[:grades].length.to_f >= 75}
end