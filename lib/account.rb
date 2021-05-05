# Account will allow users to make deposits/withdrawals and see statements
class Account
  def initialize
    @time = Time.now
    @statement = []
  end
  
  def make_deposit(deposit)
    @deposit = deposit
    @statement << {credit: @deposit, debit: 0, date: @time.strftime('%d/%m/%Y')}
    "Deposit #{@time.strftime('%d/%m/%Y')}: £#{format('%.2f', @deposit)}"
  end

  def make_withdrawal(withdrawal)
    @time = Time.now
    @withdrawal = withdrawal
    @statement << {credit: 0, debit: -@withdrawal, date: @time.strftime('%d/%m/%Y')}
    "Withdrawal #{@time.strftime('%d/%m/%Y')}: £#{format('%.2f', @withdrawal)}"
  end

  def print_statement
   format('%.2f',(@statement[0][:credit] + @statement[1][:debit] + @statement[1][:credit]))
  end
end
