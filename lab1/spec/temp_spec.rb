# frozen_string_literal: true

require_relative '../lib/temp'
require 'rspec'

RSpec.describe TempConverter do
  describe '.converter' do
    context 'From C to F' do
      it { expect(TempConverter.convert(10, 'C', 'F')).to be == 50 }
    end

    context 'From C to K' do
      it { expect(TempConverter.convert(10, 'C', 'K')).to be == 283 }
    end

    context 'From F to C' do
      it { expect(TempConverter.convert(10, 'F', 'C')).to be == (-13) }
    end

    context 'From F to K' do
      it { expect(TempConverter.convert(10, 'F', 'K')).to be == 265 }
    end

    context 'From K to C' do
      it { expect(TempConverter.convert(10, 'K', 'C')).to be == (-263) }
    end

    context 'From K to F' do
      it { expect(TempConverter.convert(210, 'K', 'F')).to be == (-81) }
    end
  end
end
