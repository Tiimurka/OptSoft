# frozen_string_literal: true

require_relative 'temp'

class Main
  def self.val_reader
    numbers = gets.chomp
    if numbers.to_f.to_i.to_s == numbers
      numbers.to_i
    else
      -1
    end
  end

  def self.scale_reader
    scale = gets.chomp
    if (scale != 'F') && (scale != 'C') && (scale != 'K')
      -1
    else
      scale.to_s
    end
  end

  def self.val_handler(val)
    return 0 unless val == -1
    puts 'Некорректное значение, температура в градусах вводится цифрами'
    -1
  end

  def self.scale1_handler(scale)
    return 0 unless scale == -1
    puts 'Некорректное значение, тип шкалы ввводится латинскими буквами \
    C, F или К'
    -1
  end

  def self.repeat_err_handler(first, second)
    return 0 unless first == second
    puts 'Некорректное значение, требуемый тип градусной шкалы должен \
    отличаться от исходного'
    -1
  end

  def self.scale2_handler(from, to)
    return -1 if scale1_handler(to) == -1 || repeat_err_handler(from, to) == -1
  end

  def self.begin
    puts 'Введите тип исходной градусной шкалы  (C, F, K)'
    from = scale_reader
    return if scale1_handler(from) == -1
    puts 'Введите температуру в градусах'
    val = val_reader
    return if val_handler(val) == -1
    puts 'Введите требуемый тип градусной шкалы  (C, F, K)'
    to = scale_reader
    return if scale2_handler(from, to) == -1
    puts 'Результат: ', TempConverter.convert(val, from, to)
  end
end

Main.begin
