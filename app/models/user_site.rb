class UserSite < ApplicationRecord
    # Relational
    belongs_to :user
    belongs_to :site

    # Validations
    validates :user, uniqueness: { scope: :site }

end
