module RoleRepository
    class Role < Irepository

        def self.find(id)
        ::Role.find(id)
        end

        def self.create(parameters)
        ::Role.create(parameters)
        end
    end
end