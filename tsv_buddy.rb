# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format

  def take_tsv(tsv)
    # The following code is copy from the Week 4 handout
    rows = tsv.split("\n").map { |line| line.split("\t") }
    headers = rows.first
    @data = rows[1..]
    @data = @data.map do |row|
      row.map.with_index { |cell, i| [headers[i], cell] }.to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format

  def to_tsv
    headers = @data[0].each_key.map { |key| key }
    tsv = headers.join("\t")
    tsv.concat("\n")
    @data.each do |ceils|
      tsv.concat(ceils.values.join("\t"))
      tsv.concat("\n")
    end
    tsv
  end
end
