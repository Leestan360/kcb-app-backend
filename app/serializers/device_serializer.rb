class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :uid, :deviceType, :lastSeen, :user_id
end
