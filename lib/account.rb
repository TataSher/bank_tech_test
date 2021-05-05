# Account will allow users to make deposits/withdrawals and see statements
class Account
  
  def make_deposit(deposit)
    @time = Time.now
    @deposit = deposit
    "Deposit #{@time.strftime("%d/%m/%Y")}: £#{format('%.2f', @deposit)}"
  end

  def make_withdrawal(withdrawal)
    @time = Time.now
    @withdrawal = withdrawal
    "Withdrawal: £#{format('%.2f', @withdrawal)}"
  end
end
