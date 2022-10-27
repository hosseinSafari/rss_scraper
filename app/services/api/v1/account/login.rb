module Api
    module V1
      module Account
        class Login
          include Peafowl
  
          attribute :email, ::String
          attribute :password, ::String
  
          validates :email, presence: true
          validates :password, presence: true
  
          def call
            
            @user = ::UserRepository::User.find_user_by_email(@email)
            return add_error!("Invalid email or password.") unless is_password_valid?

            ActiveRecord::Base.transaction do
                @token = @user&.generate_token
                ::SessionRepository::Session.create({user: @user, token: @token})
            end
  
            context[:token] = @token
          end

          private

          def is_password_valid?
            @user.try(:authenticate, @password)
          end

        end
      end
    end
  end