class Transaction < ApplicationRecord
  belongs_to :account

  validates :uniqueReference, presence: true, length: { is: 10 }
  validates :amount, presence: true
  validates :status, presence: true
  validates :transactionType, presence: true

  enum :status, [ :sent, :received, :reversed, :pending, :completed]
  
end
