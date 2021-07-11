def my_reject(arr, &prc)
  arr.select { |ele| !prc.call(ele)}
end

def my_one?(arr, &prc)
  count = 0
  arr.each { |ele| count += 1 if prc.call(ele)}
  count == 1 ? true : false
end

def hash_select(hash, &prc)
  new_hash = {}
  hash.each { |k,v| new_hash[k] = v if prc.call(k,v)}
  new_hash
end

def xor_select(arr, prc_1, prc_2)
  arr.select do |ele|
    if prc_1.call(ele) && !prc_2.call(ele) || prc_2.call(ele) && !prc_1.call(ele)
      ele
    end
  end
end

def proc_count(value, arr)
  arr.count { |prc| prc.call(value) }
end