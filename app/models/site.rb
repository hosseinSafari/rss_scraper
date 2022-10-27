class Site < ApplicationRecord
    # Relational
    has_many :user_sites, dependent: :destroy
    has_many :users, through: :user_sites
    has_many :feeds, dependent: :destroy

    # Validations
    validates :url, presence: true, uniqueness: true
end
