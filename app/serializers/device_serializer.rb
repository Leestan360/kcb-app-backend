class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :uid, :deviceType, :lastSeen
end
