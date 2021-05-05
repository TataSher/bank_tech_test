# frozen_string_literal: true

require 'account'

describe Account do
    before do
      allow(Time).to receive(:now).and_return(@time_now)
      allow(@time_now).to receive(:strftime).and_return('04/05/2021')
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
end
