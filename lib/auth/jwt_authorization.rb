require 'jwt'

class JwtAuthorization < Iauthorization

    ALGORITHM = ENV.fetch("JWT_ALGORITHM", "")
    def self.encode(payload)
        JWT.encode(payload, auth_secret, ALGORITHM)
    end

    def self.decode(token)
        return {} if token.nil?

        JWT.decode(token, auth_secret, true, algorithm: ALGORITHM)&.first
    end

    def self.auth_secret
        ENV['SECRET_KEY_BASE']
    end
end
