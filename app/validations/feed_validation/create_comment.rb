module FeedValidation
    class CreateComment < Ivalidation
        def initialize(parameters)
            @parameters = parameters
        end

        def validate
            raise "Validation failed." unless @parameters[:description].present?
        end
    end
end