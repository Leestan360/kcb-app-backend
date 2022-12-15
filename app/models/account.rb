class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :accountNo, presence: true, length: { is: 8 }, uniqueness: true
  validates :lastKnownBalance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :accountType, presence: true

  def update_with_transaction(transaction)
    return unless self.transactions.include? transaction
    if transaction.status == "sent" or transaction.status == "reversed"
      self.lastKnownBalance -= transaction.amount
    elsif transaction.status == "received"
      self.lastKnownBalance += transaction.amount
    end
    save
  end

end
