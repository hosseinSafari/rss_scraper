class User < ApplicationRecord
  has_secure_password

  # Relational
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :sessions, dependent: :destroy
  has_many :user_sites, dependent: :destroy
  has_many :sites, through: :user_sites
  has_many :user_feeds, dependent: :destroy
  has_many :feeds, through: :user_feeds
  has_many :comment, dependent: :destroy
  has_many :feeds, through: :comment

  # Validations
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true

  # Before Actions
  before_save :downcase_email

  # Methodes
  def downcase_email
    self.email.downcase!
  end

  def generate_token
    ::JwtAuthorization.encode({email: self.email, exp: (Time.zone.now + 1.hour).to_i})
  end
end
