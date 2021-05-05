# frozen_string_literal: true

# Account will allow users to make deposits/withdrawals and see statements
class Account
  def initialize
    @time = Time.now
    @transfers = []
  end

  def make_deposit(deposit)
    @deposit = deposit
    @transfers << { date: @time.strftime('%d/%m/%Y'), credit: @deposit, debit: 0 }
    "Deposit #{@time.strftime('%d/%m/%Y')}: £#{format('%.2f', @deposit)}"
  end

  def make_withdrawal(withdrawal)
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

  def balance(row)
    if row.zero?
      format('%.2f', (@transfers[row][:credit]))
    else
      format('%.2f', (@transfers[row - 1][:credit] - @transfers[row][:debit] + @transfers[row][:credit]))
    end
  end
end
