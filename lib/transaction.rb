# frozen_string_literal: true

# Transaction stores the transaction information

class Transaction
  attr_reader :sum, :time
  
  def initialize(sum)
    @sum = sum
    @time = Time.now.strftime('%d/%m/%Y')
  end
end
