class UserFeed < ApplicationRecord
    # Relational
    belongs_to :user
    belongs_to :feed
end
