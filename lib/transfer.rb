class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if !self.valid?
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
      self.execute_transaction.freeze
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
end
