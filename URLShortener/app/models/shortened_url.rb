require 'securerandom'


class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true
    validates :user_id, presence: true
    validates :short_url, uniqueness: true

    belongs_to(:submitter, class_name: :User, foreign_key: :user_id, primary_key: :id)
    has_many(:visitors, through: :visits, source: :users)

    def self.random_code
        code = SecureRandom.urlsafe_base64
        while ShortenedUrl.exists?(short_url: code)
            code = SecureRandom.urlsafe_base64
        end
        code
    end


  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(
      user_id: user.id,
      long_url: long_url,
      short_url: ShortenedUrl.random_code
    )
  end

end
