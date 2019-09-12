class User < ApplicationRecord
    validates :username, presence: true
    validates_uniqueness_of :username, :case_sensitive => false

    has_many :artworks,
    class_name: :Artwork,
    foreign_key: :artist_id,
    primary_key: :id

    has_many :shared_artworks,
    class_name: :ArtworkShare,
    foreign_key: :viewer_id,
    primary_key: :id

end
