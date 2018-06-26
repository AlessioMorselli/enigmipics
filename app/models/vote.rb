class VoteStarsValidator < ActiveModel::Validator
    def validate(record)
        if record.stars.blank?
            record.errors[:stars] << "can't be blank"
        elsif record.stars < 0 || record.stars > 5
            record.errors[:stars] << "must be between 0 and 5"
        end
    end
end

class Vote < ApplicationRecord
    validates_with VoteStarsValidator

    belongs_to :user
    belongs_to :picture
end
