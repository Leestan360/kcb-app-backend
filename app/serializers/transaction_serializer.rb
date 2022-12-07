class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :uniqueReference, :amount, :status, :transactionType, :account_id
  belongs_to :account
end
