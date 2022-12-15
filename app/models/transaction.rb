class Transaction < ApplicationRecord
  belongs_to :account

  validates :uniqueReference, presence: true, uniqueness: true, length: {is: 8}
  validates :account_number, presence: true, length: {is: 8}
  validates :amount, presence: true
  validates :status, presence: true
  validates :transactionType, presence: true

  enum :status, [ :sent, :received, :reversed, :pending, :completed]
  
end
