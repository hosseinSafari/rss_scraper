class Comment < ApplicationRecord
    # Relational
    belongs_to :user
    belongs_to :feed

    # Validations
    validates :description, presence: true
end
