module AccountValidation
    class Login < Ivalidation
        def initialize(parameters)
            @parameters = parameters
        end

        def validate
            raise "Validation failed." if !@parameters[:email].present? ||
             !@parameters[:password].present?
        end
    end
end

