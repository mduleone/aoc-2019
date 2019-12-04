input_range = 353096..843212

def is_valid?(candidate)
  arrayed_candidate = candidate.to_s.split('')

  has_pair = arrayed_candidate.map.with_index { |char, idx| !!(idx > 0 && char == arrayed_candidate[idx - 1]) }.any?
  return false unless has_pair

  has_exclusive_pair = (arrayed_candidate[0] == arrayed_candidate[1] && arrayed_candidate[1] != arrayed_candidate[2]) \
    || (arrayed_candidate[0] != arrayed_candidate[1] && arrayed_candidate[1] == arrayed_candidate[2] && arrayed_candidate[2] != arrayed_candidate[3]) \
    || (arrayed_candidate[1] != arrayed_candidate[2] && arrayed_candidate[2] == arrayed_candidate[3] && arrayed_candidate[3] != arrayed_candidate[4]) \
    || (arrayed_candidate[2] != arrayed_candidate[3] && arrayed_candidate[3] == arrayed_candidate[4] && arrayed_candidate[4] != arrayed_candidate[5]) \
    || (arrayed_candidate[3] != arrayed_candidate[4] && arrayed_candidate[4] == arrayed_candidate[5])
  return false unless has_exclusive_pair

  non_decreasing = arrayed_candidate.map.with_index { |char, idx| idx == 0 || char.to_i >= arrayed_candidate[idx - 1].to_i}.all?
  return false unless non_decreasing

  true
end

puts input_range.select {|x| is_valid?(x)}.size
