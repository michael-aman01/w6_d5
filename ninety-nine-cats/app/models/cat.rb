require "action_view"


class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CAT_COLORS = ['cream','black','white']
    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: { in: CAT_COLORS}
    validates :sex, inclusion: { in: ['M', 'F']}

    validate :birth_date_cannot_be_future
    

    def birth_date_cannot_be_future
        if birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "can't be in the past")
        end
      
    end
end
