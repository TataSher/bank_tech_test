# frozen_string_literal: true

require 'account'

describe Account do
  it 'can make a deposit' do
    account = Account.new
    expect(account.make_deposit(500.00)).to eq('You made a deposit of £500.00')
  end
end
