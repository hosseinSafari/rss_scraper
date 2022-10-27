module FeedRepository
    class Feed < Irepository
  
      def self.find(id)
        ::Feed.find(id)
      end
  
      def self.create(parameters)
        ::Feed.create!(parameters)
      end
    end
end