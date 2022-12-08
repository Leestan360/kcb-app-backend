class AccountSerializer < ActiveModel::Serializer
  attributes :id, :accountNo, :lastKnownBalance, :accountType
  belongs_to :user
  has_many :transactions
end
