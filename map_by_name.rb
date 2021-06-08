def map_by_name(arr)
  return arr.map { |hash| hash["name"]}
end


pets = [
  {"type" => "dog", "name" => "Rolo"},
  {"type" => "cat", "name" => "Sunny"},
  {"type" => "rat", "name" => "Saki"},
  {"type" => "dog", "name" => "Finn"},
  {"type" => "cat", "name" => "Buffy"},
]

print map_by_name(pets) #=> ["Rolo", "Sunny", "Saki", "Finn", "Buffy"]