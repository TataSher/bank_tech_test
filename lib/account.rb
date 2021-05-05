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
    @transfers << { date: @time.strftime('%d/%m/%Y'), credit: 0, debit: -@withdrawal }
    "Withdrawal #{@time.strftime('%d/%m/%Y')}: £#{format('%.2f', @withdrawal)}"
  end

  def statement
    n = 0
    "date       || credit    || debit   || balance
    #{balance(n)}"
  end
  
  private

  def balance(n)
    format('%.2f',(@transfers[n][:credit] + @transfers[n+1][:debit] + @transfers[n+1][:credit]))
  end
end
