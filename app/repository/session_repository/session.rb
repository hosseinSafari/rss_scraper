module SessionRepository
  class Session < Irepository

    def self.find(id)
      ::Session.find(id)
    end

    def self.create(parameters)
      ::Session.create!(parameters)
    end
  end
end