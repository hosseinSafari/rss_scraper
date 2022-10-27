module UserRoleRepository
    class UserRole < Irepository
  
      def self.find(id)
        ::UserRole.find(id)
      end
  
      def self.create(parameters)
        ::UserRole.create!(parameters)
      end
    end
  end