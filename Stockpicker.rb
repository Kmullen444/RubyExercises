# Given an array find the best day to buy stocks (smallest number that can be found
# before the sell day)
# Find the largest number that come before the buy day that will be the sell day

def stock_picker(arr)
  profit = 0
  bestdays = []

  arr.each_with_index do |buyp, buyi|
    arr.each_with_index do |sellp, selli|
      next unless buyi < selli && (sellp - buyp) > profit

      profit = sellp - buyp
      bestdays[0] = buyi
      bestdays[1] = selli
    end
  end
  puts "#{bestdays[0]} and #{bestdays[1]}"
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
