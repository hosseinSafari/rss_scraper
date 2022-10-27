class UserSite < ApplicationRecord
    # Relational
    belongs_to :user
    belongs_to :site
end
