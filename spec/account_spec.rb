# frozen_string_literal: true

require 'account'
require 'timecop'
require 'transaction'

describe Account do
  let(:account) { Account.new }
  let(:transaction_deposit) { double :transation, date: '04/05/2021', sum: 500 }
  let(:transaction_withdrawal) { double :transation, date: '04/05/2021', sum: 100 }
  before do
    Timecop.freeze(Time.new(2021, 0o5, 0o4))
  end
  after do
    Timecop.return
  end

  describe '#make_deposit' do
    it 'shows a date and sum when deposit is made' do
      allow(transaction_deposit).to receive(:deposit).and_return({ date: '04/05/2021', credit: 500, debit: 0 })
      account.make_deposit(500.00)
      expect(account.make_deposit(500)).to eq('Deposit 04/05/2021: £500.00')
    end
  end
  describe '#make_withdrawal' do
    it 'shows a date and sum when withdrawal is made' do
      allow(transaction_deposit).to receive(:deposit).and_return({ date: '04/05/2021', credit: 0, debit: 100 })
      account.make_deposit(500.00)
      expect(account.make_withdrawal(100)).to eq('Withdrawal 04/05/2021: £100.00')
    end
    it 'throws error if withdrawing more than in account' do
      account.make_deposit(500.00)
      expect { account.make_withdrawal(600) }.to raise_error('Insufficient Funds')
    end
  end
  describe '#statement' do
    it 'shows transaction date, debit, credit abd balance' do
      account.make_deposit(500.00)
      account.make_withdrawal(100)
      expect(account.statement).to eq(STATEMENT_EXAMPLE_2)
    end
  end

  describe '#print_statement' do
    it 'prints statement' do
      account.make_deposit(500.00)
      account.make_withdrawal(100)
      expect { account.print_statement }.to output(STATEMENT_EXAMPLE_1).to_stdout
    end
  end
end

STATEMENT_EXAMPLE_1 = "date || credit || debit || balance
04/05/2021 || 500.00 || 0.00 || 500.00\n04/05/2021 || 0.00 || 100.00 || 400.00\n"

STATEMENT_EXAMPLE_2 = "date || credit || debit || balance
04/05/2021 || 500.00 || 0.00 || 500.00\n04/05/2021 || 0.00 || 100.00 || 400.00"
