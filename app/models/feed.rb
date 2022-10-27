class Feed < ApplicationRecord
    # Relational
    has_many :user_feeds, dependent: :destroy
    has_many :users, through: :user_feeds
    belongs_to :site
    has_many :comment, dependent: :destroy
    has_many :users, through: :comment

    # Validations
    validates :url, presence: true, uniqueness: true
    validates :title, presence: true
end
