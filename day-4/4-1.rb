input_range = 353096..843212

def is_valid?(candidate)
  stringified = candidate.to_s
  has_pair = stringified.split('').map.with_index { |char, idx| !!(idx > 0 && char == stringified[idx - 1]) }.any?
  return false unless has_pair

  non_decreasing = stringified.split('').map.with_index { |char, idx| idx == 0 || char.to_i >= stringified[idx - 1].to_i}.all?
  return false unless non_decreasing

  true
end

puts input_range.select {|x| is_valid?(x)}.size