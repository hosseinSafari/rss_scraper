class User < ApplicationRecord
  enum name: { normal: 1, admin: 2}

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
end
