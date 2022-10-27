module WebsiteRepository
    class Site < Irepository
  
      def self.find(id)
        ::Site.find(id)
      end
  
      def self.create(parameters)
        ::Site.create!(parameters)
      end

      def self.find_or_create(parameters)
        ::Site.find_or_create_by!(parameters)
      end
    end
end