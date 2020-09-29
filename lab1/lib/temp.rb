# frozen_string_literal: true

# this class converting value from one degree scale to another
class TempConverter
  def self.convert(val, from, to)
    case from
    when 'C'
      convert_celsius(val, to)
    when 'K'
      convert_kelvin(val, to)
    when 'F'
      convert_fahrenheit(val, to)
    end
  end

  def self.convert_celsius(val, to)
    case to
    when 'F'
      (val * 9 / 5) + 32
    when 'K'
      val + 273
    end
  end

  def self.convert_kelvin(val, to)
    case to
    when 'C'
      val - 273
    when 'F'
      (val * 9 / 5) - 459
    end
  end

  def self.convert_fahrenheit(val, to)
    case to
    when 'C'
      (val - 32) * 5 / 9
    when 'K'
      val + 459 * 5 / 9
    end
  end
end
