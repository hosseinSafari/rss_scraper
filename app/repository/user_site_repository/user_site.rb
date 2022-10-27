module UserSiteRepository
    class UserSite < Irepository
  
      def self.find(id)
        ::UserSite.find(id)
      end
  
      def self.create(parameters)
        ::UserSite.create!(parameters)
      end
    end
end