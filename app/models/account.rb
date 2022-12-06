class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :accountNo, presence: true, length: { is: 8 }
  validates :lastKnownBalance, presence: true
  validates :accountType, presence: true
  
end
