class Feed < ApplicationRecord
    # Relational
    has_many :user_feeds, dependent: :destroy
    has_many :users, through: :user_feeds
    belongs_to :site
    has_many :comments, dependent: :destroy
    has_many :users, through: :comments

    # Validations
    validates :url, presence: true, uniqueness: true
    validates :title, presence: true
end
