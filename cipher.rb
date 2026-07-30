# #################
# Encoding function
# #################
def shift_num(n, shift, min, max)
  n += shift
  range_size = max - min + 1
  while n > max 
    n -= range_size
  end

  while n < min 
    n += range_size
  end
  n
end


def caesar_cipher(text, shift=3)
  text.split("").map do |char|
    char_code = char.ord

    case 
    when char_code >= 97 && char_code <= 122 
      char = shift_num(char_code, shift, 97, 122).chr
    when char_code >= 65 && char_code <= 90 
      char = shift_num(char_code, shift, 65, 90).chr
    else
      char
    end

    char
  end.join("")
end

# #################
# Decoding function
# #################
$freqs = [
  0.082,
  0.015,
  0.028,
  0.043,
  0.127,
  0.022,
  0.020,
  0.061,
  0.07,
  0.0016,
  0.0077,
  0.04,
  0.024,
  0.067,
  0.075,
  0.019,
  0.0012,
  0.06,
  0.063,
  0.091,
  0.028,
  0.0098,
  0.024,
  0.0015,
  0.020,
  0.00074
]
def cos_similarity(a, b)
  dot = 0
  mag_a = 0
  mag_b = 0

  (0...a.length).each do |i|
    dot += (a[i] * b[i])
    mag_a += (a[i]**2)
    mag_b += (b[i] ** 2)
  end

  mag_a = Math.sqrt(mag_a)
  mag_b = Math.sqrt(mag_b)

  return dot / (mag_a * mag_b)
end


def decode(str)
  letters = str.downcase.split("")
    .select {|char| char.match?(/[a-z]/)}
  
  letter_freqs = Array.new(26, 0)

  letters.each do |char|
    index = char.ord - 'a'.ord
    letter_freqs[index] += 1
  end

  similarities = []
  (0..25).each do |shift|
    similarities.push(cos_similarity($freqs, letter_freqs.rotate(shift)))
  end
  # nil
  shift_val = similarities.index(similarities.max)
  caesar_cipher(str, shift_val)
end

# #################
# User code
# #################

original = "Ruby has a vast collection of libraries called gems, supporting everything from web development to data processing. With mature frameworks like Rails and comprehensive toolchains, you can combine excellent existing resources to build high-quality applications quickly without reinventing the wheel.\n"
original += "Ruby has a simple and intuitive syntax that reads like natural language. By eliminating complex symbols and verbose constructs, Ruby's design philosophy allows you to express what you want directly. With minimal boilerplate and high readability, it's friendly to beginners and maintainable for experienced developers."

encoded = caesar_cipher(original, 13)
decoded = decode(encoded)

p (original == decoded)