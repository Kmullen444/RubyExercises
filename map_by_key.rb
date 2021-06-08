def map_by_key(arr, key)
  return arr.map { |hash| hash[key]}
end

locations = [
  {"city"=>"New York", "state"=>"New York", "coast"=>"East"},
  {"city"=>"San Franciso", "state"=>"California", "coast"=>"West"},
  {"city"=>"Portland", "state"=>"Oregon", "coast"=>"West"}
]

puts map_by_key(locations, "state") #=> ["New York", "California", "Oregon"]