=begin
- triangle = [[1]]
- For each row (row_index)
  - row = []
  - Add triangle[row_index-1].first to row
  - Iterate with index through (1...row_index)
     - Add triangle[row_index-1][index-1] + triangle[row_index-1][index] to row
  - Add triangle[row_index-1].last to row
  - Add row to triangle
=end

class Triangle
  attr_reader :rows

  def initialize(nb_rows)
    @nb_rows = nb_rows
    @rows = [[1]]
    compute_pascal_triangle(@nb_rows)
  end

  private

  def compute_pascal_triangle(nb_rows)
    1.upto(nb_rows - 1) do |row_index|
      row = []

      # Access previous row
      previous_row = @rows[row_index - 1]

      # Add first element (always 1)
      row << previous_row.first

      # Add middle elements
      1.upto(row_index - 1) do |index|
        row << previous_row[index - 1, 2].sum
      end

      # Add last element (always 1)
      row << previous_row.last

      # Add row to Pascal Triangle
      @rows << row
    end
  end
end
