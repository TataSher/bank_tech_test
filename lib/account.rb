# Account will allow users to make deposits/withdrawals and see statements
class Account
  @time = Time.now
  def make_deposit(deposit)
    @deposit = deposit
    "Deposit #{@time.strftime("%d/%m/%Y")}: £#{format('%.2f', @deposit)}"
  end

  def make_withdrawal(withdrawal)
    @withdrawal = withdrawal
    "Withdrawal: £#{format('%.2f', @withdrawal)}"
  end
end
