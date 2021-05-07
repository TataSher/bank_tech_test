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
    it 'prints a statement with balance substracting withdrawal' do
      account.make_deposit(500.00)
      account.make_withdrawal(100)
      expect(account.statement).to include('400.00')
    end

    it 'prints a statement with balance adding to deposit ' do
      account.make_deposit(500.00)
      account.make_deposit(100)
      expect(account.statement).to include('600.00')
    end

    it 'prints the head of the table' do
      account.make_deposit(500.00)
      account.make_deposit(100)
      expect(account.statement).to include('date || credit || debit || balance')
    end

    it 'prints the date in the table' do
      account.make_deposit(500.00)
      account.make_deposit(100)
      expect(account.statement).to include('04/05/2021')
    end

    it 'prints the credit in the table' do
      account.make_deposit(500.00)
      account.make_deposit(100)
      expect(account.statement).to include('500.00')
    end

    it 'prints the credit in the table' do
      account.make_deposit(500.00)
      account.make_withdrawal(100)
      expect(account.statement).to include('100.00')
    end
  end

  describe '#print_statement' do
    it 'prints statement' do
      account.make_deposit(500.00)
      account.make_withdrawal(100)
      expect { account.print_statement(account.statement) }.to output(STATEMENT_EXAMPLE).to_stdout
    end
  end
end

STATEMENT_EXAMPLE = "date || credit || debit || balance
04/05/2021 || 500.00 || 0.00 || 500.00 \n04/05/2021 || 0.00 || 100.00 || 400.00 \n"
