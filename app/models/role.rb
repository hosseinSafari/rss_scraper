class Role < ApplicationRecord
  enum name: { normal: 0, admin: 1}

  # Relational
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  validates :name, presence: true
end
