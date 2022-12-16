class User < ApplicationRecord

    has_secure_password

    belongs_to :role

    has_many :accounts

    validates :firstName, presence: true
    validates :lastName, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { is: 4 }
    validates_confirmation_of :password

    
end
