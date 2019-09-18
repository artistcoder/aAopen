class CatRentalRequest < ApplicationRecord
    STATUS = ['PENDING','APPROVED','DENIED']
    validates :cat_id, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :status, inclusion: { in: STATUS, message: "%{value} is not a valid status" }

    belongs_to :cat,
    class_name: :Cat,
    foreign_key: :cat_id,
    primary_key: :id
    
end
