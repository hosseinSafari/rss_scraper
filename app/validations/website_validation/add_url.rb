module WebsiteValidation
    class AddUrl < Ivalidation
        def initialize(parameters)
            @parameters = parameters
        end

        def validate
            raise "Validation failed." unless @parameters[:url].present?
        end
    end
end

