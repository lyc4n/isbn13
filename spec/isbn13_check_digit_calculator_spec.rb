require 'spec_helper'
require './lib/isbn13_check_digit_calculator'

describe ISBN13CheckDigitCalculator do

  describe '.perform' do
    it 'initializes a ISBN13CheckDigitCalculator and calls perform with the isbn' do
      calculator = double(:calculator)
      allow(calculator).to receive(:perform)
      allow(ISBN13CheckDigitCalculator).to receive(:new).and_return(calculator)
      ISBN13CheckDigitCalculator.perform('978014300723')
      expect(calculator).to have_received(:perform).with('978014300723')
    end
  end

  describe '#perform' do
    it 'returns the complete isbn13' do
      result_1 = ISBN13CheckDigitCalculator.perform('978014300723')
      expect(result_1).to eq('9780143007234')

      result_2 = ISBN13CheckDigitCalculator.perform('978186197876')
      expect(result_2).to eq('9781861978769')

      result_3 = ISBN13CheckDigitCalculator.perform('978929505502')
      expect(result_3).to eq('9789295055025')
    end
  end
end
