# frozen_string_literal: true

require 'account'
require 'timecop'

describe Account do
  let(:account) { Account.new }
  before do
    Timecop.freeze(Time.new(2021, 0o5, 0o4))
  end
  after do
    Timecop.return
  end

  describe '#make_deposit' do
    it 'can make a deposit' do
      expect(account.make_deposit(500.00)).to include('£500.00')
    end
    it 'shows a date when deposit is made' do
      account.make_deposit(500.00)
      expect(account.make_deposit(500)).to eq('Deposit 04/05/2021: £500.00')
    end
  end
  describe '#make_withdrawal' do
    it 'can make a withdrawal' do
      account.make_deposit(500.00)
      expect(account.make_withdrawal(100.00)).to include('£100.00')
    end
    it 'shows a date when withdrawal is made' do
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
      expect(account.statement).to include('date       || credit    || debit   || balance')
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

STATEMENT_EXAMPLE = "date       || credit    || debit   || balance
04/05/2021 || 500.00 || 0.00 || 500.00 \n04/05/2021 || 0.00 || 100.00 || 400.00 \n"
