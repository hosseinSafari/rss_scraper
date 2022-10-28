module UserRepository
  class User < Irepository

    def self.find(id)
      ::User.find(id)
    end

    def self.create(parameters)
      ::User.create!(parameters)
    end

    def self.find_user_by_email(email)
      ::User.find_by(email: email)
    end

    def self.sessions(email)
      ::User.find_by(email: email)&.sessions
    end

    def self.destroy_seesions(email)
      ::User.find_by(email: email)&.sessions&.destroy_all
    end
  end
end