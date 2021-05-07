require 'statement'

describe Statement do
  describe '#show' do
    it 'shows transaction date, debit and credit in console' do
      transfers = [{:date=>"04/05/2021", :credit=>500, :debit=>0}]
      statement = Statement.new(transfers)
      expect(statement.show).to eq('date || credit || debit || balance')
    end
  end
end