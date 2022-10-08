# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  NEWLINE = "\n"
  TAB = "\t"

  def row_to_table(headings, row)
    row.map.with_index { |cell, i| [headings[i], cell] }
  end

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    tsv_arr = tsv.split(NEWLINE).map { |line| line.split(TAB) }
    headings = tsv_arr.first
    rows = tsv_arr[1..]
    @data = rows.map { |row| row_to_table(headings, row) }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    headings = @data.first.to_h.keys.join(TAB)
    rows = @data.map { |row| row.to_h.values.join(TAB) }
    headings + NEWLINE + rows.join(NEWLINE) + NEWLINE
  end
end
