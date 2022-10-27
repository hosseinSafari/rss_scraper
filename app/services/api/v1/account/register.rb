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
          ActiveRecord::Base.transaction do
              @user = ::UserRepository::User.create(user_params)
              @user_role = ::UserRoleRepository::UserRole.create(user_role_params)
          end

          token = @user&.generate_token
          ::SessionRepository::Session.create({token: token})
          context[:token] = token
        end

        private 

        def user_params
          { email: email, password: password, password_confirmation: password_confirmation }
        end

        def user_role_params
          { user: @user, role: @role }
        end
      end
    end
  end
end