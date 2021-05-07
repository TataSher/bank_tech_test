# frozen_string_literal: true

require './lib/transaction'

# Account will allow users to make deposits/withdrawals and see statements
class Account
  def initialize
    @transfers = []
  end

  def make_deposit(sum)
    @sum = sum
    @transaction = Transaction.new(@sum)
    @transfers << @transaction.deposit
    deposit_message
  end

  def make_withdrawal(sum)
    @sum = sum
    no_funds_message

    @transaction = Transaction.new(@sum)
    @transfers << @transaction.withdrawal
    withdrawal_message
  end

  def statement
    n = 0
    display = ['date       || credit    || debit   || balance']
    while n < @transfers.length
      date = @transfers[n][:date]
      credit = format('%.2f', @transfers[n][:credit])
      debit = format('%.2f', @transfers[n][:debit])
      display << "#{date} || #{credit} || #{debit} || #{balance(n)} "
      n += 1
    end
    display.join("\n")
  end

  def print_statement(statement)
    puts statement
  end

  private

  def balance(row_number)
    if row_number.zero?
      format('%.2f', (@transfers[row_number][:credit]))
    else
      format('%.2f', (@transfers[row_number - 1][:credit] - @transfers[row_number][:debit] + @transfers[row_number][:credit]))
    end
  end
  
  def deposit_message
    "Deposit #{@transaction.date}: £#{format('%.2f', @transaction.sum)}"
  end

  def withdrawal_message
    "Withdrawal #{@transaction.date}: £#{format('%.2f', @transaction.sum)}"
  end

  def no_funds_message
    raise 'Insufficient Funds' if @sum > balance(@transfers.length - 1).to_f
  end
end
