class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :email, :role_id
  belongs_to :role
  has_many :accounts
end
