# frozen_string_literal: true

require 'account'
require 'timecop'

describe Account do
  before do
    account = Account.new
    Timecop.freeze(Time.new(2021, 05, 04))
  end
  after do
    Timecop.return
  end

  it 'can make a deposit' do
    account = Account.new
    expect(account.make_deposit(500.00)).to include('£500.00')
  end
  it 'can make a withdrawal' do
    account = Account.new
    account.make_deposit(500.00)
    expect(account.make_withdrawal(100.00)).to include('£100.00')
  end

  it 'shows a date when deposit is made' do
    account = Account.new
    account.make_deposit(500.00)
    expect(account.make_deposit(500)).to eq('Deposit 04/05/2021: £500.00')
  end

  it 'shows a date when withdrawal is made' do
    account = Account.new
    account.make_deposit(500.00)
    expect(account.make_withdrawal(100)).to eq('Withdrawal 04/05/2021: £100.00')
  end

  it 'prints a statement with balance substracting withdrawal' do
    account = Account.new
    account.make_deposit(500.00)
    account.make_withdrawal(100)
    expect(account.statement).to include('400.00')
  end

  it 'prints a statement with balance adding to deposit ' do
    account = Account.new
    account.make_deposit(500.00)
    account.make_deposit(100)
    expect(account.statement).to include('600.00')
  end

   it 'prints the head of the table' do
     account = Account.new
     account.make_deposit(500.00)
     account.make_deposit(100)
     expect(account.statement).to include('date       || credit    || debit   || balance')
   end

   it 'prints the date in the table' do
    account = Account.new
    account.make_deposit(500.00)
    account.make_deposit(100)
    expect(account.statement).to include('04/05/2021')
  end

  it 'prints the credit in the table' do
    account = Account.new
    account.make_deposit(500.00)
    account.make_deposit(100)
    expect(account.statement).to include('500.00')
  end

  it 'prints the credit in the table' do
    account = Account.new
    account.make_deposit(500.00)
    account.make_withdrawal(100)
    expect(account.statement).to include('100.00')
  end

  describe '#print_statement' do
    it 'prints statement' do
      account = Account.new
      account.make_deposit(500.00)
      account.make_withdrawal(100)
      expect{ account.print_statement(account.statement) }.to output(STATEMENT_EXAMPLE).to_stdout
    end
  end
  STATEMENT_EXAMPLE = "date       || credit    || debit   || balance
04/05/2021 || 500.00 || 0.00 || 500.00 \n04/05/2021 || 0.00 || 100.00 || 400.00 \n"

end

# "date       || credit    || debit   || balance\n04/05/2021 || 500.00 || 0.00 || 500.00\n04/05/2021 || 0.00 || 100.00 || 400.00 \n"
# "date       || credit    || debit   || balance\n04/05/2021 || 500.00 || 0.00 || 500.00 \n04/05/2021 || 0.00 || 100.00 || 400.00 \n"