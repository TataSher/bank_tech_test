# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new }

  it 'can add funds to deposit record' do
    expect(transaction.add_funds(500)).to eq(500)
  end

  it 'can add funds to withdrawal record' do
    expect(transaction.withdraw_funds(100)).to eq(100)
  end

  it 'stores information of a deposit' do
    transaction.add_funds(500)
    expect(transaction.deposit).to eq(500)
  end

end