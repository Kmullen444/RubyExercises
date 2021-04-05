def solution(roman)
  key = {I:1, V:5, X:10, L:50, C:100, D:500, M:1000}

 answer =  roman.chars.map {|x| key.fetch(x.to_sym)}.reduce{|a,b| a < b ? b - a : a + b}
end