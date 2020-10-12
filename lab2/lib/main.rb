# frozen_string_literal: true

require_relative 'parse'

class Main
  def self.file_name_handler(str)
    # puts str
    puts str.scan(/\..../)
    return 0 if str.end_with?('.csv')

    puts 'Не тот формат файла, должен быть .csv'
    -1
  end

  def self.init_file
    puts 'Введите название файла (он должен быть в формате .csv!):'
    filepath = gets.chomp
    return -1 if file_name_handler(filepath) == -1

    CSVParse.new(filepath)
  end

  def self.ch_cols(data, cols)
    count = 1
    (1..cols).each do |i|
      puts "#{count}"'. '"#{(data[0][i])}"
      count += 1
    end
    gets.chomp.to_i
  end

  def self.begin
    csv_data = init_file
    return if csv_data == -1

    puts 'Введите номер столбца для осуществления вычислений'
    col = ch_cols(csv_data.data, csv_data.cols)
    puts 'Минимальное значение = '"#{csv_data.csv_min(col)}"
    puts 'Максимальное значение = '"#{csv_data.csv_max(col)}"
    puts 'Среднее значение = '"#{csv_data.csv_average(col)}"
    puts 'Исправленная выборочная дисперсия = '"#{csv_data.sample_variance(col)}"
  end
end

Main.begin
