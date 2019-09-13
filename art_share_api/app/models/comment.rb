class Comment < ApplicationRecord
    belongs_to :author,
    class_name: :User,
    foreign_key: :author_id,
    primary_key: :id

    belongs_to :artwork,
    class_name: :Artwork,
    foreign_key: :artwork_id,
    primary_key: :id
end
