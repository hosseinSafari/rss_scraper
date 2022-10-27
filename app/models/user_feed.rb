class UserFeed < ApplicationRecord
    # Relational
    belongs_to :user
    belongs_to :feed

    # Validations
    validates :user, uniqueness: { scope: :feed }
end
