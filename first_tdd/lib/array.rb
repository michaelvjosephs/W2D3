require 'byebug'

class Array
  def my_uniq
    output = []
    self.each do |el|
      output << el unless output.include?(el)
    end

    output
  end

  def two_sum
    output = []
    (0...length).each do |idx1|
      (idx1 + 1...length).each do |idx2|
        sum = self[idx1] + self[idx2]
        output << [idx1, idx2] if sum == 0
      end
    end

    output
  end

  def my_transpose
    transposed = Array.new(self.length) { Array.new(self.length) }
    self.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        transposed[col_idx][row_idx] = el
      end
    end
    transposed
  end

  def stock_picker
    indices = nil
    largest_profit = 0

    self[0...-1].each_with_index do |el1, idx1|
      self[idx1 + 1..-1].each_with_index do |el2, idx2|
        if el2 - el1 > largest_profit
          indices = [idx1, idx2 + idx1 + 1]
          largest_profit = el2 - el1
        end
      end
    end

    indices

  end

end
