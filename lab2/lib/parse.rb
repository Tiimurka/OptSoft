# frozen_string_literal: true

require 'csv'

class CSVcalc
  attr_accessor :data, :cols

  def initialize(path)
    @file = path
    @data = CSV.read(path)
    @cols = @data[0].length - 1
    @rows = @data.length - 1
    @mean = 0.0
  end

  def csv_min(column)
    min = @data[2][column].to_f
    (1..@rows).each do |i|
      min = @data[i][column].to_f if min > @data[i][column].to_f
    end
    min
  end

  def csv_max(column)
    max = 0.0
    (1..@rows).each do |i|
      max = @data[i][column].to_f if max < @data[i][column].to_f
    end
    max
  end

  def csv_average(column)
    max = 0.0
    (1..@rows).each do |i|
      max += @data[i][column].to_f
    end
    @mean = max / @rows
  end

  def sample_variance(column)
    sum = 0.0
    (1..@rows).each do |i|
      sum += (@data[i][column].to_f - @mean)**2.to_f
    end
    average = sum / @rows
    (average * (@rows + 1)) / @rows
  end
end
