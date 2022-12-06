class Role < ApplicationRecord

    has_many :users

    validates :permissions, presence: true

end
