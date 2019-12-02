input = [
  1,
  0,
  0,
  3,
  1,
  1,
  2,
  3,
  1,
  3,
  4,
  3,
  1,
  5,
  0,
  3,
  2,
  13,
  1,
  19,
  1,
  6,
  19,
  23,
  2,
  23,
  6,
  27,
  1,
  5,
  27,
  31,
  1,
  10,
  31,
  35,
  2,
  6,
  35,
  39,
  1,
  39,
  13,
  43,
  1,
  43,
  9,
  47,
  2,
  47,
  10,
  51,
  1,
  5,
  51,
  55,
  1,
  55,
  10,
  59,
  2,
  59,
  6,
  63,
  2,
  6,
  63,
  67,
  1,
  5,
  67,
  71,
  2,
  9,
  71,
  75,
  1,
  75,
  6,
  79,
  1,
  6,
  79,
  83,
  2,
  83,
  9,
  87,
  2,
  87,
  13,
  91,
  1,
  10,
  91,
  95,
  1,
  95,
  13,
  99,
  2,
  13,
  99,
  103,
  1,
  103,
  10,
  107,
  2,
  107,
  10,
  111,
  1,
  111,
  9,
  115,
  1,
  115,
  2,
  119,
  1,
  9,
  119,
  0,
  99,
  2,
  0,
  14,
  0
]

valid_opcodes = [1, 2, 99]

updated_input = input.map.with_index do |ele, idx|
  if idx == 1
    12
  elsif idx == 2
    2
  else
    ele
  end
end

operating_input = updated_input.map { |ele| ele }

position = 0

while operating_input[position] != 99
  raise unless valid_opcodes.include? operating_input[position]
  opcode = operating_input[position]
  op_1 = operating_input[position + 1]
  op_2 = operating_input[position + 2]
  storage = operating_input[position + 3]

  if opcode == 1
    operating_input[storage] = operating_input[op_1] + operating_input[op_2]
  end

  if opcode == 2
    operating_input[storage] = operating_input[op_1] * operating_input[op_2]
  end

  position += 4
end

puts operating_input[0]
