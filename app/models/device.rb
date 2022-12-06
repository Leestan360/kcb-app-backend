class Device < ApplicationRecord

  validates :uid, presence: true
  validates :deviceType, presence: true
  validates :lastSeen, presence: true

end
