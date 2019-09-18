
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    COLORS = ["brown", "white", "black", "calico"]


    validates :color, inclusion: { in: COLORS, message: "%{value} is not a valid color" }
    validates :sex, inclusion: { in: ["M", "F"], message: "%{value} is not a valid sex" }
    validates :birth_date, presence: true
    validates :name, presence: true


    def age
        time_ago_in_words(birth_date)
    end

end
