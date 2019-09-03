class Visit < ApplicationRecord
    validates :short_url, presence: true
    validates :user_id, presence: true

    belongs_to (:visitor,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
    )
    belongs_to (:visited_urls,
    class_name: :ShortenedUrl,
    foreign_key: :shortenedurl_id,
    primary_key: :id
    )

    def self.record_visit!(user, shortened_url) 
        Visit.create!(
            user_id: user.id,
            short_url: shortened_url.short_url
          )
    end

end
