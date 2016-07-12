
def to_roman(num)
  legend = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1].zip(
    %w('M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I'))
  ######  legend == [[1000, 'M'], [900, 'CM'], [500, 'D'], ...]

  # Input Validation
  return nil unless ((num.is_a? Integer) || (num.is_a? Float)) && num >= 0
  num = num.round

  # Solving
  result = ''
  legend.each do |arabic, roman|
    while (num >= arabic)
      result += roman
      num -= arabic
    end
  end
  result
end

def to_arabic(numeral_string)
  legend = %w('M', 'D', 'C', 'L', 'X', 'V', 'I').zip(
    [1000, 500, 100, 50, 10, 5, 4, 1])
  ######  legend = [['M', 1000], ['CM', 900], ['D', 500], ...]
  legend_hash = Hash[legend]
  ######  legend_hash = {'M' => 1000, 'CM' => 900, ...}

  # Input Validation
  return nil unless numeral_string.is_a? String # Not a string
  return nil if numeral_string =~ /(
    (.)\2{3}                # More than three of any character
    |[^MDCLXVI]                           # Illegal characters
    |I[^XVI]|V[^I]|X[^CLXVI]|L[^XVI]       # Illegal sequences
    |C[^MDCLXVI]|D[^MCLXVI]|M[^MDCLXVI]
  )/x

  # Solving
  nums = numeral_string.chars.map { |char| legend_hash[char] }
  nums.map.with_index do |num, i|
    num *= -1 if (i < nums.length - 1) && num < nums[i + 1]
    num
  end.reduce(:+)
end
