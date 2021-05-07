# frozen_string_literal: true

require 'transaction'
require 'timecop'

describe Transaction do
  let(:transaction) { Transaction.new(100) }

  before do
    Timecop.freeze(Time.new(2021, 0o5, 0o4))
  end
  after do
    Timecop.return
  end

  it 'stores information of a transaction' do
    expect(transaction.sum).to eq(100)
  end

  it 'stores date information' do
    expect(transaction.date).to eq('04/05/2021')
  end

  it 'creates deposit record' do
    expect(transaction.deposit).to eq({ date: '04/05/2021', credit: 100, debit: 0 })
  end

  it 'creates withdrawal record' do
    expect(transaction.withdrawal).to eq({ date: '04/05/2021', credit: 0, debit: 100 })
  end
end