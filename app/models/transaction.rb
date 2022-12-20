class Transaction < ApplicationRecord
  belongs_to :account

  before_create :set_unique_reference

  validates :uniqueReference, uniqueness: true
  validates :account_number, presence: true, length: {is: 8}
  validates :amount, presence: true
  validates :status, presence: true
  validates :transactionType, presence: true

  enum :status, [ :sent, :received, :reversed, :pending, :completed]

  private

  def set_unique_reference
    self.uniqueReference = [*'A'..'Z', *0..9, ].shuffle[0...8].join
  end

end
