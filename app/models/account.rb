class Account < ApplicationRecord
  require 'securerandom'
  belongs_to :user
  has_many :transactions

  before_create :set_account_number
  before_create :set_lastKnownBalance

  validates :accountNo, uniqueness: true
  # validates :lastKnownBalance, numericality: { greater_than_or_equal_to: 0 }
  validates :accountType, presence: true

  # def update_with_transaction(transaction)
  #   return unless self.transactions.include? transaction
  #   if (transaction.status == "sent" or transaction.status == "reversed") and self.lastKnownBalance >= transaction.amount
  #     self.lastKnownBalance -= transaction.amount
  #   elsif transaction.status == "received"
  #     self.lastKnownBalance += transaction.amount
  #   end
  #   save
  # end

  def update_with_transaction(transaction)
    return unless self.transactions.include? transaction
    if (transaction.status.eql? "sent") or (transaction.status.eql? "reversed")
      self.lastKnownBalance -= transaction.amount
    elsif transaction.status.eql? "received"
      self.lastKnownBalance += transaction.amount
    # elsif transaction.status.eql? "reversed"
    #   self.lastKnownBalance -= transaction.amount
    end
    save
  end

  private

  def set_account_number
    self.accountNo = SecureRandom.rand(1_000_000_000_000..9_999_999_999_999)
  end

  def set_lastKnownBalance
    self.lastKnownBalance = 0
  end

end