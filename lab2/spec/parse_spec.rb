# frozen_string_literal: true

require 'rspec'
require_relative '../lib/csv_parse'

RSpec.describe CSVparse do
  describe '.csv calculate' do
    let(:csv) { CSVparse.new('spec/test.csv') }
    context 'Вычисляем минимальное значение' do
      it { expect(csv.csv_min(2)).to be == 12 }
    end

    context 'Вычисляем максимальое значение' do
      it { expect(csv.csv_max(2)).to be == 120 }
    end

    context 'Вычисляем среднее значение' do
      it { expect(csv.csv_average(2)).to be == 57 }
    end

    context 'Вычисляем исправленную выборочную дисперсию' do
      it { expect(csv.sample_variance(2) - 5336.333333333333).to be < 0.0001 }
    end
  end
end
