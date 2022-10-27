class Session < ApplicationRecord
    # Relational
    belongs_to :user

    # Validations
    validates :token, presence: true
end
