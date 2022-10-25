require 'jwt'

class JwtAuthorization < Iauthorization

    ALGORITHM = 'HS256'

    def initialize
        @algorithm = ALGORITHM
    end

    def encode(payload)
        JWT.encode(payload, auth_secret, ALGORITHM)
    end

    def decode(token)
        return {} if token.nil?

        JWT.decode(token, auth_secret, true, algorithm: @algorithm)&.first
    end

    def auth_secret
        ENV['SECRET_KEY_BASE']
    end
end
