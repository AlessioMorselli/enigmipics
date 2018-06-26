class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true

    has_many :pictures
    has_many :boards
    has_many :saved_pictures, through: :boards
    has_many :votes
end
