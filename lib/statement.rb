# frozen_string_literal: true

# Statement collates and displays statement

class Statement

  def initialize(transfers)
    @transfers = transfers
  end

  def show
    'date || credit || debit || balance'
  end
end