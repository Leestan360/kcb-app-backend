class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :uniqueReference, :account_number, :amount, :status, :transactionType
  belongs_to :account
end
