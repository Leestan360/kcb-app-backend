class AccountSerializer < ActiveModel::Serializer
  attributes :id, :accountNo, :lastKnownBalance, :accountType, :user_id
  belongs_to :user
  has_many :transactions
end
