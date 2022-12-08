class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :uniqueReference, :amount, :status, :transactionType
  belongs_to :account
end
