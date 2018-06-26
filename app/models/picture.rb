class Picture < ApplicationRecord
    validates :name, presence: true
    validates :url, presence: true

    has_many :saved_pictures
    has_many :votes

    belongs_to :user, optional: true

    has_many :boards, through: :saved_pictures
    has_many :users, through: :boards

    def rating
            if votes.empty?
                INVALID_RATING
            else
                votes.inject(0) {|s,r| s += r.stars } / votes.count.to_f
            end
        end
end
