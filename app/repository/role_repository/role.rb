module RoleRepository
    class Role < Irepository

        def self.find(id)
            ::Role.find(id)
        end

        def self.create(parameters)
            ::Role.create!(parameters)
        end

        def self.find_by_name(name)
            ::Role.find_by(name: name)
        end
    end
end