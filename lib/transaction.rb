# frozen_string_literal: true

# Transaction stores the transaction information

class Transaction
  
  def initialize
    @deposit = 0
    @withdrawal = 0
    @time = Time.now
  end
  
  def add_funds(sum)
    @deposit = 100
  end
end
