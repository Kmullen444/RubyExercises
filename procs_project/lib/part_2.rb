require "byebug"

def reverser(str, &prc)
  reversed = str.reverse
  prc.call(reversed)
end

def word_changer(sentence, &prc)
  changed = sentence.split.map { |word| prc.call(word) }
  changed.join(" ")
end

def greater_proc_value(num, proc_1, proc_2)
  result_1 = proc_1.call(num)
  result_2 = proc_2.call(num)
  return result_1 if result_1 > result_2
  result_2
end

def and_selector(arr,prc_1, prc_2)
  return selected = arr.select { |ele| prc_1.call(ele) && prc_2.call(ele)}
end

def alternating_mapper(arr, prc_1, prc_2)
  mapped = []
  arr.each_with_index do |ele, i|
    if i.even?
      mapped << prc_1.call(ele)
    else
      mapped << prc_2.call(ele)
    end
  end
  mapped
end

def alternating_mapper(arr, prc_1, prc_2)
  mapped = arr.map.with_index do |ele, i|
    if i.even?
      prc_1.call(ele)
    else
      prc_2.call(ele)
    end
  end
end