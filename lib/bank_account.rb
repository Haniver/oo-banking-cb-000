class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    self.balance
  end

  def valid?(account)
    return false if account.balance <= 0
    return false if account.status == "open"
    true
  end

  def close_account
    self.status = "closed"
  end
end
