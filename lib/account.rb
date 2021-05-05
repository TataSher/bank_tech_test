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
    display = ["date       || credit    || debit   || balance"]
    while n < @transfers.length
      display << "#{@transfers[n][:date]} || #{format('%.2f', @transfers[n][:credit])} || #{format('%.2f', @transfers[n][:debit])} || #{balance(n)} "
      n += 1
    end
    display = display.join("\n")
  end
  
  private

  def balance(n)
    if n == 0
      format('%.2f',(@transfers[n][:credit]))
    else
      format('%.2f',(@transfers[n-1][:credit] - @transfers[n][:debit] + @transfers[n][:credit]))   
    end
  end
end


# print "#{@transfers[n][:date]} || #{format('%.2f', @transfers[n][:credit])} || #{format('%.2f', @transfers[n][:debit])} ||#{balance(n)}"