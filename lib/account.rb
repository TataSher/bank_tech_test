# frozen_string_literal: true

require 'transaction'
require 'statement'

# Account will allow users to make deposits/withdrawals and see statements
class Account
  attr_reader :transfers

  def initialize
    @transfers = []
  end

  def make_deposit(sum)
    @sum = sum
    @transaction = Transaction.new(@sum)
    @transfers << @transaction.deposit
    deposit_message
  end

  def make_withdrawal(sum)
    @sum = sum
    no_funds_message

    @transaction = Transaction.new(@sum)
    @transfers << @transaction.withdrawal
    withdrawal_message
  end

  def statement
    @statement = Statement.new(@transfers)
    @statement.show
  end

  def print_statement
    puts statement
  end

  private

  def deposit_message
    "Deposit #{@transaction.date}: £#{format('%.2f', @transaction.sum)}"
  end

  def withdrawal_message
    "Withdrawal #{@transaction.date}: £#{format('%.2f', @transaction.sum)}"
  end

  def no_funds_message
    balance = Balance.new(@transfers, @transfers.length - 1).show
    raise 'Insufficient Funds' if @sum > balance.to_f
  end
end
