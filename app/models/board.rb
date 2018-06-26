class Board < ApplicationRecord
    validates :name, presence: true

    has_many :saved_pictures
    has_many :pictures, through: :saved_pictures

    belongs_to :user
end
