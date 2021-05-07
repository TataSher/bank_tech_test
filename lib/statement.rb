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
      date = @transfers[n][:date]
      credit = format('%.2f', @transfers[n][:credit])
      debit = format('%.2f', @transfers[n][:debit])
      balance = Balance.new(@transfers, n)
      display << "#{date} || #{credit} || #{debit} || #{balance.show}"
      n += 1
    end
    display.join("\n")
  end
end