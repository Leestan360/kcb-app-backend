class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :email
  has_many :accounts
end
