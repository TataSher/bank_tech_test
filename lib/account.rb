# Account will allow users to make deposits/withdrawals and see statements
class Account
  def make_deposit(deposit)
    @deposit = deposit
    "Deposit: £#{format('%.2f', @deposit)}"
  end

  def make_withdrawal(withdrawal)
    @withdrawal = withdrawal
    "Withdrawal: £#{format('%.2f', @withdrawal)}"
  end
end
