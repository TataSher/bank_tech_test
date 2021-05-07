# frozen_string_literal: true

require 'transaction'
require 'timecop'

describe Transaction do
  let(:transaction) { Transaction.new }
  
  before do
    Timecop.freeze(Time.new(2021, 0o5, 0o4))
  end
  after do
    Timecop.return
  end

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

  it 'stores information of a deposit' do
    transaction.withdraw_funds(100)
    expect(transaction.withdrawal).to eq(100)
  end

  it 'stores date information' do
    expect(transaction.time).to eq('04/05/2021')
  end

end