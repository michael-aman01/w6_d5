class Cat < ApplicationRecord
    CAT_COLORS = ['cream','black','white']
    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: { in: CAT_COLORS}
    validates :gender, inclusion: { in: ['M', 'F']}

    validate :birth_date_cannot_be_future
    

    def birth_date_cannot_be_future
        if birth_date.present? && expiration_date > Date.today
            errors.add(:birth_date, "can't be in the past")
          end
        end
      
    end
end
