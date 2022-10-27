module Api
    module V1
      module Account
        class Logout
          include Peafowl
  
          attribute :email, ::String
  
          validates :email, presence: true
  
          def call
            ActiveRecord::Base.transaction do
                ::UserRepository::User.destroy_seesions(@email)
            end
          end
        end
      end
    end
  end