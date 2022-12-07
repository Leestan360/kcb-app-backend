class RoleSerializer < ActiveModel::Serializer
  attributes :id, :permissions
  has_many :users
end
