class ISBN13CheckDigitCalculator
  MULTIPLIER_MAP = {true => 1, false => 3}.freeze

  def self.perform(isbn)
    calculator = ISBN13CheckDigitCalculator.new
    calculator.perform(isbn)
  end

  def perform(isbn)
    check_digit = 10 - (sum_product_from_mappings(isbn.to_s) % 10)
    "#{isbn}#{check_digit}"
  end

  private

  def sum_product_from_mappings(isbn)
    isbn.each_char.with_index.inject(0) do |initial, (char, index)|
      initial + multipy_mapping(char.to_i, index)
    end
  end

  def multipy_mapping(digit, index)
    digit * MULTIPLIER_MAP[index.even?]
  end
end
