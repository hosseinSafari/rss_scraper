module AccountValidation
    class Register < Ivalidation
        def initialize(parameters)
            @parameters = parameters
        end

        def validate
            raise "Validation failed." if !@parameters[:email].present? ||
             !@parameters[:password_confirmation].present? ||
              !@parameters[:password].present?

            raise "Not match your password with password confirmation." if @parameters[:password_confirmation] != @parameters[:password]
        end
    end
end

