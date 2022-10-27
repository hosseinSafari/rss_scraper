module UserFeedRepository
    class UserFeed < Irepository
  
      def self.find(id)
        ::UserFeed.find(id)
      end
  
      def self.create(parameters)
        ::UserFeed.create!(parameters)
      end
    end
end