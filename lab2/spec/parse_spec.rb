# frozen_string_literal: true

require 'rspec'
require_relative '../lib/parse'

RSpec.describe CSVcalc do
  describe '.csv calculate' do
    let(:csv) { CSVcalc.new('spec/test.csv') }
    context 'Вычисляем минимальное значение' do
      it { expect(csv.csv_min(2)) == (-1) }
    end

    context 'Вычисляем максимальое значение' do
      it { expect(csv.csv_max(2)) == 124 }
    end

    context 'Вычисляем среднее значение' do
      it { expect(csv.csv_average(2)) == 65.33.to_d }
    end

    context 'Вычисляем исправленную выборочную дисперсию' do
      it { expect(csv.sample_variance(2)) == 3261.89.to_d }
    end
  end
end
