# frozen_string_literal: true

# Transaction stores the transaction information

class Transaction
  attr_reader :sum, :date
  
  def initialize(sum)
    @sum = sum
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def deposit
    {date: @date, credit: @sum, debit: 0}
  end 

  def withdrawal
    {date: @date, credit: 0, debit: @sum}
  end 
end
