class CatRentalRequest < ApplicationRecord
    STATUS = ['PENDING','APPROVED','DENIED']
    validates :cat_id, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :status, inclusion: { in: STATUS, message: "%{value} is not a valid status" }

    validate :does_not_overlap_approved_request

    belongs_to :cat,
    class_name: :Cat,
    foreign_key: :cat_id,
    primary_key: :id
    
    def overlapping_requests
        #same cat, start dates are >= given start date and <= given end date
        same_cat = CatRentalRequest.where('cat_id = ?', self.cat_id)
        same_cat.where.not('id = ? or (start_date >= ? or end_date <= ?)', self.id, self.end_date, self.start_date)
    end

    def overlapping_approved_requests
        overlapping_requests.where('status = ?', "APPROVED")
    end

    def does_not_overlap_approved_request
        unless overlapping_approved_requests.empty?
          errors[:base] <<
            'There is an existing, approved request to rent this cat'
        end
    end

end
