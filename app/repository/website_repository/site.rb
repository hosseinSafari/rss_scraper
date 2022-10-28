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

      def self.fetch_all
        ::Site.all
      end

      def self.current_site_users(id)
        ::Site.find(id)&.users
      end
    end
end