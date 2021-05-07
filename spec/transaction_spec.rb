# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new }

  it 'can add funds' do
    expect(transaction.add_funds(500)).to eq(500)
  end


end