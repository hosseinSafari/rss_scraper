class UserRole < ApplicationRecord
  # Relational
  belongs_to :role
  belongs_to :user
end
