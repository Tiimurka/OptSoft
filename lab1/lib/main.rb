# frozen_string_literal: true

require_relative 'temp'

class Main
  def self.number_reader
    numbers = gets.chomp
    if numbers.to_f.to_i.to_s == numbers
      numbers.to_i
    else
      -1
    end
  end

  def self.start
    puts 'Введите температуру в градусах'
    value = number_reader
    if value == -1
      puts 'Некорректное значение, температура в градусах вводится цифрами'
    else
      puts 'Введите тип исходной градусной шкалы(C, F, K)'
      from = gets.chomp
      puts 'Введите требуемый тип градусной шкалы(C, F, K)'
      to = gets.chomp
      puts 'Результат', TempConverter.convert(value, from, to)
    end
  end
end

Main.start