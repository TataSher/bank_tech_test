# frozen_string_literal: true

require 'balance'

# Calculates balance
class Balance
  def initialize(transfers, transaction_number)
    @transfers = transfers
    @transaction_number = transaction_number
    @balance = 0
  end

  def show
    if @transaction_number.zero?
      format('%.2f', (@transfers[@transaction_number][:credit]))
    else
      previous_credit = @transfers[@transaction_number - 1][:credit]
      current_credit = @transfers[@transaction_number][:credit]
      current_debit = @transfers[@transaction_number][:debit]
      format('%.2f', (previous_credit - current_debit + current_credit))
    end
  end
end
