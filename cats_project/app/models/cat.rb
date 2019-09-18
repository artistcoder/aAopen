
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    COLORS = ["brown", "white", "black", "calico"].sort


    validates :color, inclusion: { in: COLORS, message: "%{value} is not a valid color" }
    validates :sex, inclusion: { in: ["M", "F"], message: "%{value} is not a valid sex" }
    validates :birth_date, presence: true
    validates :name, presence: true

    has_many :cat_rental_requests,
    class_name: :CatRentalRequest,
    foreign_key: :cat_id,
    primary_key: :id,
    dependent: :destroy

    def age
        time_ago_in_words(birth_date)
    end

end
