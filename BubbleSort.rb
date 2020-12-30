def bubble_sort(arr)
  index = 0

  while index < arr.length - 1 do
    if arr[index] > arr[index+1]
      arr[index], arr[index+1] = arr[index+1], arr[index]
      index = 0
    else
      index += 1
    end
  end
  print arr
end



bubble_sort([4,3,78,2,0,2])