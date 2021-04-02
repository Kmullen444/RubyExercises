def alphabetize(arr, rev=false)
  arr.sort!

  if rev == true
    arr.reverse!
  else
    arr
  end
end

numbers = [8,2,4,5,1,9,3,6]

puts alphabetize(numbers)