class User < ApplicationRecord

    has_secure_password
    belongs_to :role

    has_many :accounts

    validates :firstName, presence: true
    validates :lastName, presence: true
    validates :email, presence: true
    validates :password, presence: true, length: { is: 4 }, confirmation: true

    
end
