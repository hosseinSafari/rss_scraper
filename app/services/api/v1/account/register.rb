module Api
  module V1
    module Account
      class Register
        include Peafowl

        attribute :email, ::String
        attribute :password, ::String
        attribute :password_confirmation, ::String

        validates :email, presence: true
        validates :password, presence: true
        validates :password_confirmation, presence: true

        def call

        end
      end
    end
  end
end