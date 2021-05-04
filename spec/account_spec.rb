# frozen_string_literal: true

require 'account'

describe Account do
  it 'can make a deposit' do
    account = Account.new
    expect(account.make_deposit(500.00)).to eq('Deposit: £500.00')
  end
  it 'can make a withdrawal' do
    account = Account.new
    account.make_deposit(500.00)
    expect(account.make_withdrawal(100.00)).to eq('Withdrawal: £100.00')
  end
end
