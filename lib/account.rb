# frozen_string_literal: true

# Account will allow users to make deposits/withdrawals and see statements

require './lib/transaction'

class Account

  def initialize
    @transfers = []
  end

  def make_deposit(sum)
    @sum = sum
    @transaction = Transaction.new(@sum)
    @transfers << @transaction.deposit
    "Deposit #{@transaction.date}: £#{format('%.2f', @sum)}"
  end

  def make_withdrawal(withdrawal)
    raise 'Insufficient Funds' if withdrawal > balance(@transfers.length - 1).to_f
   
    @time = Time.now
    @withdrawal = withdrawal
    @transfers << { date: @time.strftime('%d/%m/%Y'), credit: 0, debit: @withdrawal }
    "Withdrawal #{@time.strftime('%d/%m/%Y')}: £#{format('%.2f', @withdrawal)}"
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
end
