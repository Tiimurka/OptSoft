# frozen_string_literal: true

require 'csv'

class CSVparse
  attr_accessor :data, :cols

  def initialize(path)
    @file = path
    @data = CSV.read(path)
    @cols = @data[0].length - 1
    @rows = @data.length - 1
    @average = 0.0
    @arr = @data.transpose
  end

  def csv_min(column)
    # min = @data[2][column].to_f
    # (1..@rows).each do |i|
    #  min = @data[i][column].to_f if min > @data[i][column].to_f
    # end
    # min
    @arr[column][0] = 99_999_999_999_999_999
    @arr[column].min { |a, b| a.to_f <=> b.to_f }.to_f
  end

  def csv_max(column)
    # max = 0.0
    # (1..@rows).each do |i|
    #  max = @data[i][column].to_f if max < @data[i][column].to_f
    # end
    # max
    @arr[column][0] = 0
    @arr[column].max { |a, b| a.to_f <=> b.to_f }.to_f
  end

  def csv_average(column)
    # max = 0.0
    # (1..@rows).each do |i|
    #  max += @data[i][column].to_f
    # end
    # @average = max / @rows
    @arr[column][0] = 0
    sum = @arr[column].inject { |s, n| s.to_f + n.to_f }
    @average = sum / @rows
  end

  def sample_variance(column)
    # sum = 0.0
    # (1..@rows).each do |i|
    #  sum += (@data[i][column].to_f - @average)**2.to_f
    # end
    @arr[column][0] = 0
    sum = @arr[column].inject { |s, n| s.to_f + (n.to_f - @average)**2.to_f }

    average = sum / @rows
    (average * (@rows + 1)) / @rows
  end
end
