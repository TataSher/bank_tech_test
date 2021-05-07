# frozen_string_literal: true

require 'balance'

# Statement collates and displays statement
class Statement
  def initialize(transfers)
    @transfers = transfers
  end

  def show
    n = 0
    display = ['date || credit || debit || balance']
    while n < @transfers.length
      balance = Balance.new(@transfers, n)
      display << "#{date(n)} || #{credit(n)} || #{debit(n)} || #{balance.show}"
      n += 1
    end
    display.join("\n")
  end

  private

  def date(num)
    @transfers[num][:date]
  end

  def credit(num)
    format('%.2f', @transfers[num][:credit])
  end

  def debit(num)
    format('%.2f', @transfers[num][:debit])
  end
end
