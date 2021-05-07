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
    expect(transaction.time).to eq('04/05/2021')
  end

end