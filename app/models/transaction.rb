class Transaction < ApplicationRecord
  belongs_to :account

  validates :uniqueReference, presence: true
  validates :amount, presence: true
  validates :status, presence: true
  validates :transactionType, presence: true

  def transact
    
  end
  
end
