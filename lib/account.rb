class Account
  def make_deposit(amount)
    @amount = amount.to_f
    "You made a deposit of £#{'%.2f' % @amount}"
  end
end