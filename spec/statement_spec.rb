# frozen_string_literal: true

require 'statement'

describe Statement do
  describe '#show' do
    it 'shows table head' do
      transfers = [{ date: '04/05/2021', credit: 500, debit: 0 }]
      statement = Statement.new(transfers)
      expect(statement.show).to include('date || credit || debit || balance')
    end
    it 'shows transaction date, debit, credit abd balance' do
      transfers = [{ date: '04/05/2021', credit: 500, debit: 0 }]
      statement = Statement.new(transfers)
      expect(statement.show).to eq('date || credit || debit || balance
04/05/2021 || 500.00 || 0.00 || 500.00')
    end
  end
end
