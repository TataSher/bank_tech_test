require 'balance'

describe Balance do
  it 'shows the original credit for the first balance calculation' do
    transfers = [{:date=>"04/05/2021", :credit=>500, :debit=>0}]
    statement = Balance.new(transfers, 0)
    expect(statement.balance).to eq("500.00")
  end

  it 'original balance is zero' do
    transfers = [{:date=>"04/05/2021", :credit=>500, :debit=>0},
                  {:date=>"04/05/2021", :credit=>0, :debit=>100}]
    statement = Balance.new(transfers, 1)
    expect(statement.balance).to eq("400.00")
  end
end