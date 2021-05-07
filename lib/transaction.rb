# frozen_string_literal: true

# Transaction stores the transaction information

class Transaction
  attr_reader :deposit, :withdrawal, :time
  
  def initialize
    @deposit = 0
    @withdrawal = 0
    @time = Time.now
  end
  
  def add_funds(sum)
    @deposit = sum
  end

  def withdraw_funds(sum)
    @withdrawal = sum
  end
end
